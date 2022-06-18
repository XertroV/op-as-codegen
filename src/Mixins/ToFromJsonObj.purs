module Mixins.ToFromJsonObj (mxToFromJsonObj) where

import Prelude
import AsTypes (jTyIsPrim, jTyPascalCase, jTyToAsTy, setVarOfJTyToVal)
import CodeLines (comment, fnCall, forLoopArray, indent, ln, toPropFields, wrapFunction, wrapMainTest)
import Data.Array (foldl, intercalate, zip)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Macros.Arrays (mapArray_For)
import Mixins.AllMixins (_MX_TO_FROM_JSON_OBJ_NAME)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Testing.Gen (genTestArgs, genTests)
import Mixins.Types (Mixin, TestGenerators, TestGenerator)
import Partial.Unsafe (unsafeCrashWith)
import Types (JField(..), JType(..), JsonObj(..))

mxToFromJsonObj :: Mixin
mxToFromJsonObj =
  { name: _MX_TO_FROM_JSON_OBJ_NAME
  , requires: [ mxDefaultProps.name ]
  , comprisingRequires: [ _MX_TO_FROM_JSON_OBJ_NAME ]
  , methods:
      Just
        $ \(JsonObj name fields) ->
            [ name <> "(const Json::Value &in j) {" ]
              <> indent 1 (fromJsonBody fields)
              <> [ "}" ]
              <> ln
              <> [ "Json::Value ToJson() {" ]
              <> indent 1 (toJsonBody fields)
              <> [ "}" ]
  , properties: Nothing
  , namespace: Nothing
  , tests: Just $ genTests jsonSzTests
  }

{-
  To Json
-}
toJsonBody ∷ Array JField → Array String
toJsonBody fields = [ "Json::Value j = Json::Object();" ] <> (foldl (<>) [] $ toJsonFieldLines <$> zip fields (toPropFields fields)) <> [ "return j;" ]

-- | Tuple of (jsonField, clsPropretyField)
toJsonFieldLines ∷ Tuple JField JField → Array String
toJsonFieldLines tff@(Tuple (JField n (JArray _)) (JField p _)) = toJsonArray tff

toJsonFieldLines (Tuple (JField n (JMaybe _)) (JField p _)) = [ "j" <> getKey n <> " = " <> p <> ".ToJson();" ]

-- todo: safe integers
toJsonFieldLines (Tuple (JField n t) (JField p t2)) = [ "j" <> getKey n <> " = " <> p <> ";" ]

-- toJsonFieldLines jf@(Tuple _ (JField _ (JArray _))) = toJsonArray jf
-- toJsonFieldLines (Tuple (JField p _) (JField n (JObject _))) = [ "this." <> p <> " = " <> n <> "(j" <> getKey n <> ");" ]
-- toJsonFieldLines (Tuple (JField p _) (JField n _)) =
--   [ "this." <> p <> " = j" <> getKey n <> ";"
--   ]
-- todo
toJsonArray :: Tuple JField JField -> Array String
toJsonArray (Tuple (JField n _) (JField p (JArray arrTy))) =
  [ "Json::Value " <> tmpV <> " = Json::Array();"
  ]
    <> mapArray_For { arr: p, el: "v", ix: "i" }
        [ tmpV <> ".Add(" <> jTyToJson arrTy "v" <> ");" ]
    <> [ opIx "j" n <> " = " <> tmpV <> ";" ]
  where
  tmpV = "_tmp_" <> n

  arrDecl (JObject (JsonObj jon _)) = "this." <> p <> " = array<" <> jon <> "@>(" <> tmpV <> ".Length);"

  -- arrDecl (JArray _in) = "this." <> p <> " = array<" <> jon <> "@>(" <> tmpV <> ".Length);"
  arrDecl _ty = "this." <> p <> " = array<" <> jTyToAsTy _ty <> "@>(" <> tmpV <> ".Length);"

toJsonArray _ = comment "! WARNING: Json non-array passed to toJsonArray"

getKey ∷ String → String
getKey n = "[\"" <> n <> "\"]"

opIx ∷ String → String → String
opIx n k = n <> getKey k

jTyToJson :: JType -> String -> String
jTyToJson ty var =
  if jTyIsPrim ty then
    "Json::Value(" <> var <> ")"
  else case ty of
    JObject (JsonObj n _) -> var <> ".ToJson()"
    mt@(JMaybe _) -> var <> ".ToJson()"
    JArray _ -> unsafeCrashWith "unimpl: recursive jTyToJson for JArray"
    _ -> fnCall "Json::Value" [ var ]

--
-- | From Json
--
-- [ "trace('fromJson constructor parsing: ' + Json::Write(j));" ]
fromJsonBody ∷ Array JField → Array String
fromJsonBody fields = (foldl (<>) [] $ fromJsonFieldLines <$> zip (toPropFields fields) fields)

fromJsonFieldLines ∷ Tuple JField JField → Array String
fromJsonFieldLines jf@(Tuple _ (JField _ (JArray _))) = fromJsonArray jf

fromJsonFieldLines (Tuple (JField p _) (JField n (JObject _))) = [ "@this." <> p <> " = " <> n <> "(j" <> getKey n <> ");" ]

fromJsonFieldLines (Tuple (JField p _) (JField n t@(JMaybe _))) = [ "@this." <> p <> " = " <> jTyPascalCase t <> "(j" <> getKey n <> ");" ]

fromJsonFieldLines (Tuple (JField p t) (JField n _)) =
  [ setVarOfJTyToVal ("this." <> p) t ("j" <> getKey n)
  ]

-- todo
fromJsonArray :: Tuple JField JField -> Array String
fromJsonArray (Tuple (JField p _) (JField n (JArray arrTy))) =
  [ arrDecl arrTy ]
    <> forLoopArray "i" jArr
        [ setVarOfJTyToVal (arrEl "i") arrTy (jTyFromJson arrTy $ jArrEl "i") ]
    <> []
  where
  tmpV = "_tmp_" <> n

  jArr = "j" <> getKey n

  jArrEl ix = jArr <> "[" <> ix <> "]"

  arrName = "this." <> p

  arrEl ix = arrName <> "[" <> ix <> "]"

  arrDecl (JObject (JsonObj jon _)) = arrName <> " = array<" <> jon <> "@>(" <> jArr <> ".Length);"

  -- arrDecl (JArray _in) = "this." <> p <> " = array<" <> jon <> "@>(" <> tmpV <> ".Length);"
  arrDecl _ty = "this." <> p <> " = array<" <> jTyToAsTy _ty <> "@>(" <> tmpV <> ".Length);"

fromJsonArray _ = comment "! WARNING: Json non-array passed to fromJsonArray"

jTyFromJson :: JType -> String -> String
jTyFromJson ty var =
  if jTyIsPrim ty then
    var
  else case ty of
    JObject (JsonObj n _) -> fnCall n [ var ]
    JArray _ -> unsafeCrashWith "unimpl: recursive jTyFromJson for JArray"
    mt@(JMaybe _) -> fnCall (jTyPascalCase mt) [ var ]
    _ -> var

{-
  Test To/From JSON
-}
jsonSzTests :: TestGenerators
jsonSzTests = [ test_ToJsonFromJson ]

test_ToJsonFromJson :: TestGenerator
test_ToJsonFromJson ms o@(JsonObj objName fields) = { fnName, ls }
  where
  fnName = "UnitTest_ToJsonFromJson_" <> objName

  checkerFnName = "Test_ToJsonFromJson_Check"

  checkerFn =
    wrapFunction "bool" checkerFnName fields
      $ [ objTy <> " tmp = " <> fnCall objName args <> ";" ]
      <> [ "assert(tmp == " <> fnCall (objName) [ "tmp.ToJson()" ] <> ", 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));" ]
      <> [ "return true;" ]

  objTy = jTyToAsTy (JObject o)

  args = fields <#> \(JField n _) -> n

  allTestArgs = genTestArgs 5876948 fields

  mainFn =
    wrapMainTest fnName
      $ (\testArgs -> checkerFn.callRaw testArgs <> ";")
      <$> allTestArgs

  ls = intercalate ln [ checkerFn.decl, mainFn.decl ]
