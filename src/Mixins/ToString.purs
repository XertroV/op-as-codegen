module Mixins.ToString (mxToString, jValSimpleStr) where

import Prelude

import AsTypes (jTyToAsTy, jTyToFuncArg)
import CodeLines (fnCall, forLoopArray, indent, ln, wrapForLoop, wrapFunction, wrapFunction', wrapTestFn)
import Data.Array (catMaybes, intercalate)
import Data.Array as A
import Data.Maybe (Maybe(..), isJust)
import Data.String (Pattern(..), Replacement(..), replace)
import Data.Traversable (sequence)
import Mixins (mixinTestFnName)
import Mixins.AllMixins (_MX_OP_EQ_NAME)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Getters (mxGetters)
import Mixins.Testing.Gen (genTests)
import Mixins.Types (Mixin, TestGenerators, TestGenerator)
import Partial.Unsafe (unsafeCrashWith)
import Types (AsFunction, JField(..), JFields, JType(..), JsonObj(..), Lines, uniqueArrayTypes)

_name = "ToString"

mxToString :: Mixin
mxToString =
  { name: _name
  , requires: [ mxDefaultProps.name ]
  , comprisingRequires: [ _name ]
  , methods: Just toStringMethods
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing -- Just $ genTests toStringTests
  }

toStringMethods :: JsonObj -> Lines
toStringMethods (JsonObj name fields) = intercalate ln $ [ toStringFn.decl ] <> allArrayTsFuncs fields
  where
  toStringFn =
    wrapFunction "const string" "ToString" []
      $ [ "return '" <> name <> "('" ]
          <> indent 1 ([ "+ string" <> ns <> "Join({" <> intercalate ", " (fieldToStringEl <$> fields) <> "}, ', ')" ] <> [ "+ ')';" ])

  ns = "::"

  fieldToStringEl (JField n t) = "'" <> n <> "=' + " <> jValSimpleStr t n

jValSimpleStr :: JType -> String -> String
jValSimpleStr jf var = case jf of
  JNull -> "'null'"
  JInt -> fnCall "tostring" [ var ]
  JUint -> fnCall "tostring" [ var ]
  JNumber -> fnCall "tostring" [ var ]
  JBool -> fnCall "tostring" [ var ]
  JVec3 -> var <> ".ToString()"
  (JEnum _n) -> "tostring(" <> var <> ")"
  JString -> var
  JArray t -> (ts_arrayFn t).callRaw [ var ]
  JObject _ -> var <> ".ToString()"
  JDict _ -> unsafeCrashWith "jValSimpleStr unimplemented: JDict"
  JMaybe _ -> var <> ".ToString()"
  JJson -> "Json::Write(" <> var <> ")"

-- ts_wrapStringFn :: AsFunction
-- ts_wrapStringFn =
--   wrapFunction "private const string" "TRS_WrapString" [ JField "s" JString ]
--     $ [ "return '(' + s.Length + ':' + s + ')';" ]
ts_arrayFn :: JType -> AsFunction
ts_arrayFn arrTy =
  mkFunction
    $ [ "string ret = '{';" ]
        <>
          ( wrapForLoop "uint i = 0; i < arr.Length; i++"
              [ "if (i > 0) ret += ', ';"
              , "ret += " <> jValSimpleStr arrTy "arr[i]" <> ";"
              ]
          )
        <> [ "return ret + '}';" ]
  where
  mkFunction = wrapFunction' "private const string" (ts_arrayFnName arrTy) [ "const array<" <> jTyToFuncArg arrTy <> "> &in arr" ]

ts_arrayFnName :: JType -> String
ts_arrayFnName arrTy = "TS_Array_" <> replace (Pattern "@") (Replacement "") (jTyToAsTy arrTy)

allArrayTsFuncs :: JFields -> Array Lines
allArrayTsFuncs =
  uniqueArrayTypes
    >>> allDecls
    >>> A.filter (\ls -> A.length ls > 0)
  -- A.filter (\ls -> A.length ls > 0) <<< map arrTsIfArr -- <<< uniqueArrayTypes
  where
  allDecls :: Array JType -> Array Lines
  allDecls tys = map (\t -> (ts_arrayFn t).decl) tys

-- uniqueArrayTypes :: Array JType -> Array JType
-- uniqueArrayTypes = A.foldl (\tys t -> if A.elem t tys then tys else A.snoc tys t) []

-- justArrayTypes :: JFields -> Maybe (Array JType)
-- justArrayTypes = sequence <<< A.filter isJust <<< map getArrayType

-- getArrayType (JField _ (JArray t)) = Just t
-- getArrayType _ = Nothing

-- toStringTests :: TestGenerators
-- toStringTests = [ testToString ]
-- testToString :: TestGenerator
-- testToString ms o@(JsonObj name fs) = {fnName, ls}
--   fnName = mixinTestFnName "ToString" name
--   checkerFn = wrapTestFn "ToString_Check" fs
--     [ objTy <> " o1 = " <> fnCall objName args <> ";"
--     , objTy <> " o2 = " <> fnCall objName args <> ";"
--     , "assert(o1 == o2, 'ToString_Check fail for obj: ' + o1.ToString());"
--     , "return true;"
--     ]
--   objTy = jTyToAsTy (JObject o)
--   args = fields <#> getFName
