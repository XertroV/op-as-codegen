module Mixins.RowSz
  ( mxRowSz
  , trs_arrayFn
  , frs_genNamespace
  , trs_wrapStringFn
  , frs_getNext
  , frs_AssertDefn
  ) where

import Prelude
import AsTypes (jTyToAsTy, jTyToFuncArg)
import CodeLines (comment, fnCall, indent, jfieldToAsArg, ln, toPropFields, wrapForLoop, wrapFunction, wrapFunction', wrapIf, wrapMainTest, wrapTryCatch, wrapWhileLoop)
import Data.Array (intercalate, intersperse)
import Data.Array as A
import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), Replacement(..), joinWith, replace)
import Mixins.AllMixins (_MX_ROW_SZ_NAME)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.OpEq (mxOpEq)
import Mixins.Testing.Gen (genTestArgs, genTests)
import Mixins.Types (Mixin, TestGenerator, TestGenerators)
import Partial.Unsafe (unsafeCrashWith)
import SzAsTypes (frs_arrayFnName, isJTypeStrWrapped, jValFromStr, jValToStr, trs_arrayFnName)
import Types (AsFunction, CodeBlocks, JField(..), JFields, JType(..), JsonObj(..), Lines, getFName)

{-|
  The idea is to serialize (sz) into a value-safe format that omits keys and is suitable for an append only DB.

  other goals:
  - avoid escaping stuff: PITA and complexifies code
  - unambiguous, simple, reasonably compact format
  - quick, performant, simple sz and un-sz
  - minimal code so it can be in-lined instead of requiring helper functions and things

  idea: length prefixing
  only some values require it; values like integers, numbers, and booleans won't have commas so don't need a length prefix.
  strings can be length prefixed then recorded directly.
  objects and arrays might need them too
  actually, what if objects and arrays are first stringified (via the same method) and then just treated as strings (i.e., we reuse that code)

  sz of values:
  - string values:
    - template: "({str.Length}:{str})" -- parens are just to decrease ambiguety when reading the file manually
  - Arrays and Objects: call .ToRowString(), then treat as string
  - other values: just tostring() them, or like `'' + anInt`

  algorithm for length prefixed sz:
  - for each value:
    - sz value, append to ret, append ','
  - take this value and treat as a string

  unstringifying:
  - take 1 == `(`
  - [len, remainder] = str.split(',', 2)
  - [strVal, remainder] = remainder.split(',', 2)
  - take 2 == `),`
  repeat

  note: when unstringifying we know what values to expect and their types
|-}
mxRowSz :: Mixin
mxRowSz =
  { name: _MX_ROW_SZ_NAME
  , requires: [ mxDefaultProps.name, mxCommonTesting.name, mxOpEq.name ]
  , comprisingRequires: [ _MX_ROW_SZ_NAME ]
  , properties: Nothing
  , methods: Just $ \(JsonObj _objName fields) -> intercalate ln $ [ (toRowString fields).decl, trs_wrapStringFn.decl ] <> allArrayTrsFuncs fields
  , namespace: Just $ frs_genNamespace
  , tests: Just $ genTests rowSzTests
  }

toRowString :: Array JField -> AsFunction
toRowString fields =
  wrapFunction "const string" "ToRowString" []
    $ [ "string ret = \"\";" ]
    <> intercalate ln [ (_ <> " + \",\";") <$> appendRet <$> propFields ]
    <> [ "return ret;" ]
  where
  propFields = toPropFields fields

appendRet :: JField -> String
appendRet (JField n t) = "ret += " <> jValToStr t n

trs_wrapStringFn :: AsFunction
trs_wrapStringFn =
  wrapFunction "private const string" "TRS_WrapString" [ JField "s" JString ]
    $ [ "string _s = s.Replace('\\n', '\\\\n').Replace('\\r', '\\\\r');"
      , "return '(' + _s.Length + ':' + _s + ')';"
      ]

trs_arrayFn :: JType -> AsFunction
trs_arrayFn arrTy =
  mkFunction
    $ [ "string ret = '';" ]
    <> ( wrapForLoop "uint i = 0; i < arr.Length; i++"
          [ "ret += " <> jValToStr arrTy "arr[i]" <> " + ',';" ]
      )
    <> [ "return ret;" ]
  where
  mkFunction = wrapFunction' "private const string" (trs_arrayFnName arrTy) [ "const array<" <> jTyToFuncArg arrTy <> "> &in arr" ]

allArrayTrsFuncs :: JFields -> Array Lines
allArrayTrsFuncs = A.filter (\ls -> A.length ls > 0) <<< map arrTrsIfArr
  where
  arrTrsIfArr (JField _n (JArray t)) = (trs_arrayFn t).decl

  arrTrsIfArr _ = []

frs_genNamespace :: JsonObj -> Lines
frs_genNamespace (JsonObj objName fields) = intercalate ln $ [ (fromRowString objName fields).decl ] <> allArrayFrsFuncs fields

fromRowString :: String -> Array JField -> AsFunction
fromRowString name fields =
  wrapFunction' ("shared " <> name <> "@") "FromRowString" [ "const string &in str" ]
    $ [ "string chunk = '', remainder = str;"
      , "array<string> tmp = array<string>(2);"
      , "uint chunkLen;"
      -- , "trace('FRS input: \"' + str + '\"');"
      ]
    <> intercalate [] (frs_getNext <$> fields)
    <> [ "return " <> name <> "(" <> joinWith ", " fieldVarNames <> ");" ]
  where
  fieldVarNames = fields <#> \(JField n _t) -> n

frs_getNext :: JField -> Lines
frs_getNext (JField n t) =
  comment ("Parse field: " <> n <> " of type: " <> jTyToAsTy t)
    <> setChunkAndRemainderForTy t
    <> [ jTyToAsTy t <> " " <> n <> " = " <> jValFromStr t "chunk" <> ";" ]

frs_arrayDefn :: JType -> AsFunction
frs_arrayDefn arrTy =
  mkFunction
    $ [ arrayTypeAs <> " ret = " <> arrayTypeAs <> "(0);"
      , "string chunk = '', remainder = str;"
      , "array<string> tmp = array<string>(2);"
      , "uint chunkLen;"
      ]
    <> ( wrapWhileLoop "remainder.Length > 0"
          -- for simple values
          
          $ setChunkAndRemainderForTy arrTy
          <> [ "ret.InsertLast(" <> jValFromStr arrTy "chunk" <> ");" ]
      )
    <> [ "return ret;" ]
  where
  arrayTypeAs = "array<" <> jTyToAsTy arrTy <> ">"

  mkFunction = wrapFunction ("shared const " <> arrayTypeAs <> "@") (frs_arrayFnName arrTy) [ JField "str" JString ]

setChunkAndRemainderForTy :: JType -> Lines
setChunkAndRemainderForTy t = if isJTypeStrWrapped t then setChunkRemUnwrap else setChunkRemSimple

setChunkRemSimple :: Lines
setChunkRemSimple =
  [ "tmp = remainder.Split(',', 2);"
  , "chunk = tmp[0]; remainder = tmp[1];"
  ]

setChunkRemUnwrap :: Lines
setChunkRemUnwrap =
  [ "FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');"
  , "tmp = remainder.SubStr(1).Split(':', 2);"
  , "chunkLen = Text::ParseInt(tmp[0]);"
  , "chunk = tmp[1].SubStr(0, chunkLen);"
  , "FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');"
  , "remainder = tmp[1].SubStr(chunkLen + 2);"
  ]

allArrayFrsFuncs :: JFields -> CodeBlocks
allArrayFrsFuncs = (_ <> [ frs_AssertDefn.decl ]) <<< A.filter (\ls -> A.length ls > 0) <<< map arrFrsIfArr
  where
  arrFrsIfArr (JField _n (JArray t)) = (frs_arrayDefn t).decl

  arrFrsIfArr _ = []

frs_AssertDefn :: AsFunction
frs_AssertDefn =
  wrapFunction' "shared void" "FRS_Assert_String_Eq" [ "const string &in sample", "const string &in expected" ]
    $ wrapIf "sample != expected" [ "throw('[FRS_Assert_String_Eq] expected sample string to equal: \"' + expected + '\" but it was \"' + sample + '\" instead.');" ]

rowSzTests :: TestGenerators
rowSzTests = [ test_SzThenUnSz ]

test_SzThenUnSz :: TestGenerator
test_SzThenUnSz ms o@(JsonObj objName fields) = { fnName, ls }
  where
  fnName = "UnitTest_SzThenUnSz_" <> objName

  checkerFnName = "Test_SzThenUnSz_Check"

  checkerFn =
    wrapFunction "bool" checkerFnName fields
      $ [ objTy <> " tmp = " <> fnCall objName args <> ";" ]
      -- <> wrapTryCatch
      
      -- [ "throw('SzThenUnSz fail for "]
      
      <> [ "assert(tmp == " <> fnCall ("_" <> objName <> ns <> "FromRowString") [ "tmp.ToRowString()" ] <> ", 'SzThenUnSz fail: ' + tmp.ToRowString());" ]
      <> [ "return true;" ]

  ns = "::"

  objTy = jTyToAsTy (JObject o)

  args = fields <#> getFName

  allTestArgs = genTestArgs 2 fields

  mainFn =
    wrapMainTest fnName
      $ (\testArgs -> checkerFn.callRaw testArgs <> ";")
      <$> allTestArgs

  ls = intercalate ln [ checkerFn.decl, mainFn.decl ]
