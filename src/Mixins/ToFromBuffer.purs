module Mixins.ToFromBuffer
  ( mxToFromBuffer
  , wtbLpStringFn
  , wtb_arrayFn
  , cbb_arrayFn
  , rfbLpStringFn
  , rfbLpStringFnNoShare
  , rfb_getNext
  , rfb_getNext'
  , rfb_arrayFn
  ) where

import Prelude
import AsTypes (jTyToAsTy, jTyToFuncArg)
import CodeLines (comment, declSetV, fnCall, forLoopArray, ln, setV, stmt, toPropFields, wrapFunction, wrapFunction', wrapMainTest)
import Data.Array (intercalate)
import Data.Array as A
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Macros.Arrays (mapArray_For)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.OpEq (mxOpEq)
import Mixins.Testing.Gen (genTestArgs, genTests)
import Mixins.ToString (mxToString)
import Mixins.Types (Mixin, TestGenerator, TestGenerators)
import SzAsTypes (cbb_arrayFnName, jFieldCountBufBytes, jFieldToBuf, jTyFromBuf, rfb_arrayFnName, wtb_arrayFnName)
import Types (AsFunction, CodeBlocks, JField(..), JFields, JType(..), JsonObj(..), Lines, getFName)

mxToFromBuffer :: Mixin
mxToFromBuffer =
  { name: "ToFromBuffer"
  , requires: [ mxDefaultProps.name, mxCommonTesting.name, mxOpEq.name, mxToString.name ]
  , comprisingRequires: [ "ToFromBuffer" ]
  , properties: Nothing
  , methods: Just $ \(JsonObj _objName fields) -> intercalate ln $ [ (writeToBufFn fields).decl, (cbb_Fn fields).decl, wtbLpStringFn.decl ] <> allArrayWtbFuncs fields
  , namespace: Just $ rfb_genNamespace
  , tests: Just $ genTests toFromBufTests
  }

bufArg ∷ String
bufArg = "Buffer@ &in buf"

writeToBufFn :: Array JField -> AsFunction
writeToBufFn fields =
  wrapFunction' "void" "WriteToBuffer" [ bufArg ]
    $ (_writeToBufFrom "buf" <$> propFields)
  where
  propFields = toPropFields fields

_writeToBufFrom :: String -> JField -> String
_writeToBufFrom buf f = stmt $ jFieldToBuf buf f

cbb_Fn :: Array JField -> AsFunction
cbb_Fn fields =
  wrapFunction' "uint" "CountBufBytes" []
    $ [ "uint bytes = 0;" ]
    <> (toPropFields fields <#> \f -> "bytes += " <> jFieldCountBufBytes f <> ";")
    <> [ "return bytes;" ]

-- <> mapArray_For { arr: "arr", el: "el", ix: "ix" }
--     [ stmt $ "bytes += " <> jFieldCountBufBytes [ JField "el" arrTy ] ]
wtb_arrayFn :: JType -> AsFunction
wtb_arrayFn arrTy =
  mkFunction
    $ [ "buf.Write(uint(arr.Length));" ]
    <> mapArray_For { arr: "arr", el: "el", ix: "ix" }
        [ _writeToBufFrom "buf" (JField "el" arrTy) ]
  where
  mkFunction =
    wrapFunction' "void" (wtb_arrayFnName arrTy)
      [ bufArg, "const array<" <> jTyToFuncArg arrTy <> "> &in arr" ]

cbb_arrayFn :: JType -> AsFunction
cbb_arrayFn arrTy =
  wrapFunction' "uint" (cbb_arrayFnName arrTy) [ "const array<" <> jTyToFuncArg arrTy <> "> &in arr" ]
    $ [ "uint bytes = 4;" ]
    <> mapArray_For { arr: "arr", el: "el", ix: "ix" }
        [ stmt $ "bytes += " <> jFieldCountBufBytes (JField "el" arrTy) ]
    <> [ "return bytes;" ]

rfb_arrayFn :: JType -> AsFunction
rfb_arrayFn arrTy =
  wrapFunction' ("shared const " <> arrayTypeAs <> "@") (rfb_arrayFnName arrTy) [ bufArg ]
    $ [ "uint len = buf.ReadUInt32();"
      , arrayTypeAs <> " arr = " <> arrayTypeAs <> "(len);"
      ]
    <> forLoopArray "i" "arr"
        [ setV (JField "arr[i]" arrTy) (jTyFromBuf "buf" arrTy) ]
    <> [ "return arr;" ]
  where
  arrayTypeAs = "array<" <> jTyToAsTy arrTy <> ">"

allArrayWtbFuncs :: JFields -> Array Lines
allArrayWtbFuncs = A.filter (\ls -> A.length ls > 0) <<< map arrTrsIfArr
  where
  arrTrsIfArr (JField _n (JArray t)) = (wtb_arrayFn t).decl <> ln <> (cbb_arrayFn t).decl

  arrTrsIfArr _ = []

rfb_genNamespace :: JsonObj -> Lines
rfb_genNamespace (JsonObj objName fields) = intercalate ln $ [ (readFromBuf objName fields).decl, rfbLpStringFn.decl ] <> allArrayRfbFuncs fields

readFromBuf :: String -> Array JField -> AsFunction
readFromBuf name fields =
  wrapFunction' ("shared " <> name <> "@") "ReadFromBuffer" [ bufArg ]
    $ intercalate [] (rfb_getNext <$> fields)
    <> [ "return " <> name <> "(" <> joinWith ", " fieldVarNames <> ");" ]
  where
  fieldVarNames = fields <#> \(JField n _t) -> n

rfb_getNext' :: _ -> JField -> Lines
rfb_getNext' fn (JField n t) =
  comment ("Parse field: " <> n <> " of type: " <> jTyToAsTy t)
    <> [ fn (JField n t) (jTyFromBuf "buf" t) ]

rfb_getNext :: JField -> Lines
rfb_getNext = rfb_getNext' declSetV

-- comment ("Parse field: " <> n <> " of type: " <> jTyToAsTy t)
--   <> [ declSetV (JField n t) (jTyFromBuf "buf" t) ]
allArrayRfbFuncs :: JFields -> CodeBlocks
allArrayRfbFuncs = A.filter (\ls -> A.length ls > 0) <<< map arrRfbIfArr
  where
  arrRfbIfArr (JField _n (JArray t)) = (rfb_arrayFn t).decl

  arrRfbIfArr _ = []

toFromBufTests :: TestGenerators
toFromBufTests = [ test_ToFromBuffer ]

test_ToFromBuffer :: TestGenerator
test_ToFromBuffer _ms o@(JsonObj objName fields) = { fnName, ls }
  where
  fnName = "UnitTest_ToFromBuffer_" <> objName

  checkerFnName = "Test_ToFromBuffer_Check"

  checkerFn =
    wrapFunction "bool" checkerFnName fields
      $ [ objTy <> " tmp = " <> fnCall objName args <> ";"
        , "Buffer@ buf = Buffer();"
        , "tmp.WriteToBuffer(buf);"
        , "buf.Seek(0, 0);"
        , "assert(tmp == " <> fnCall ("_" <> objName <> ns <> "ReadFromBuffer") [ "buf" ] <> ", 'ToFromBuffer fail: ' + tmp.ToString());"
        , "return true;"
        ]

  ns = "::"

  objTy = jTyToAsTy (JObject o)

  args = fields <#> getFName

  allTestArgs = genTestArgs 349867 fields

  mainFn =
    wrapMainTest fnName
      $ (\testArgs -> checkerFn.callRaw testArgs <> ";")
      <$> allTestArgs

  ls = intercalate ln [ checkerFn.decl, mainFn.decl ]

{-|

global namespace

|-}
wtbLpStringFn :: AsFunction
wtbLpStringFn =
  wrapFunction' "void" "WTB_LP_String" [ bufArg, "const string &in s" ]
    [ "buf.Write(uint(s.Length));"
    , "buf.Write(s);"
    ]

rfbLpStringFn :: AsFunction
rfbLpStringFn =
  wrapFunction' "shared const string" "RFB_LP_String" [ bufArg ]
    [ "uint len = buf.ReadUInt32();"
    , "return buf.ReadString(len);"
    ]

rfbLpStringFnNoShare :: AsFunction
rfbLpStringFnNoShare =
  wrapFunction' "const string" "RFB_LP_String" [ bufArg ]
    [ "uint len = buf.ReadUInt32();"
    , "return buf.ReadString(len);"
    ]
