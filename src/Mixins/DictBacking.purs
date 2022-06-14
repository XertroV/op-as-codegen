module Mixins.DictBacking (mxDictBacking, mkDO, DictOpts) where

import Prelude
import AsTypes (castOrWrap, jTySetAsRef, jTyShouldCast, jTyToAsTy, jTyToFuncRes)
import CodeLines (comment, jfieldToAsArg, ln, setV, stmt, wrapConstFunction, wrapConstructor, wrapFunction, wrapFunction', wrapIf, wrapMainTest)
import Data.Array (intercalate, mapWithIndex)
import Data.Array as A
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Data.String as S
import Gen.Class (AsClass, jsonObjToClass)
import Macros.Arrays (mapArray_For)
import Mixins.AllMixins (_MX_DICT_BACKING_NAME)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultCons (mxDefaultCons, mxEmptyCons, mxEmptyConsWDefaults)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Getters (mxGetters)
import Mixins.OpEq (mxOpEq)
import Mixins.OpOrd (mxOpOrd)
import Mixins.RowSz (mxRowSz)
import Mixins.Testing.Gen (genTestArgs, genTests)
import Mixins.Types (Mixin, TestGenerator, TestGenerators, RunTestGenerators)
import Partial.Unsafe (unsafeCrashWith)
import Types (JField(..), JType(..), JsonObj(..), Lines, field, object)
import Utils (intToStr, noSpaces)

type DictOpts
  = { dictProp :: String, valType :: JType, writeLog :: Boolean }

mkDO :: JType -> DictOpts
mkDO valType = { dictProp: "d", valType, writeLog: false }

mxDictBacking :: DictOpts -> Mixin
mxDictBacking opts@{ dictProp, valType } =
  { name: _MX_DICT_BACKING_NAME
  , requires: [ mxDefaultProps.name ]
  , comprisingRequires
  , methods: Just (genMethods opts)
  , properties: Just (genProps opts)
  , namespace
  , tests: tests opts
  }
  where
  comprisingRequires = [] <> (if opts.writeLog then [ mxRowSz.name ] else [])

genProps :: DictOpts -> JsonObj -> Lines
genProps opts@{ writeLog } (JsonObj _n _fs) =
  []
    <> (if writeLog then [ "private string _logPath;" ] else [])

genMethods :: DictOpts -> JsonObj -> Lines
genMethods opts@{ dictProp, valType } (JsonObj n fs) =
  intercalate ln
    $ [ constructorFn.decl
      , getFn.decl
      , setFn.decl
      , existsFn.decl
      , getKeysFn.decl
      , getItemFn.decl
      , getItemsFn.decl
      , opIndexFn.decl
      , getSizeFn.decl
      , delFn.decl
      , delAllFn.decl
      ]
    <> (if opts.writeLog then [ comment "Dict Optional: Write Log = True" <> initLogFn.decl, writeOnSetFn.decl ] else [])
  where
  d = "_" <> dictProp -- b/c mxDefaultProps

  constructorFn =
    wrapConstructor n constructorArgs
      $ [ "@_" <> dictProp <> " = dictionary();" ]
      <> (if opts.writeLog then [ stmt $ initLogFn.call [ logDir, logFile ] ] else [])

  -- logPath = JField "logPath" JString
  logDir = JField "logDir" JString

  logFile = JField "logFile" JString

  initLogFn =
    wrapFunction "private void" "InitLog" [ logDir, logFile ]
      $ [ "_logPath = logDir + '/' + logFile;"
        , "trace('" <> n <> " dir: ' + logDir + ' | logFile: ' + logFile);"
        ]
      <> wrapIf "logDir.Length == 0"
          [ "throw('Invalid path: ' + _logPath);" ]
      <> wrapIf "!IO::FolderExists(logDir)"
          [ "IO::CreateFolder(logDir, true);" ]

  constructorArgs = [] <> (if opts.writeLog then [ logDir, logFile ] else [])

  getFn =
    wrapConstFunction valAsRetType "Get" [ keyF ]
      [ "return " <> castOrWrap valType (d <> "[key]") <> ";" ]

  {-
  -- doens't seem to work when valAsRetType is to complex class types like Challenge.
  get2Fn =
    wrapFunction' "bool" "Get" [ jfieldToAsArg keyF, valAsRetType <> " &out value" ]
      [ "return " <> d <> ".Get(key, value);" ]
  -}
  -- setFn = proxyFnKeyValRet "void" "Set"
  setFn =
    wrapFunction "void" "Set" [ keyF, valF ]
      $ [ setV (JField (d <> "[key]") valType) "value" ]
      <> writeOnSetLines

  writeOnSetLines =
    if not opts.writeLog then
      []
    else
      [ writeOnSetFn.call [ keyF, valF ] <> ";" ]

  writeOnSetFn =
    wrapFunction "private void" "WriteOnSet" [ keyF, valF ]
      [ "" ]

  existsFn = proxyFnKeyRet "bool" "Exists"

  delFn = proxyFnKeyRet "bool" "Delete"

  delAllFn = proxyFnRet "void" "DeleteAll"

  getKeysFn = proxyFnConst "array<string>@" "GetKeys"

  getItemFn =
    wrapConstFunction (kvPair <> "@") "GetItem" [ keyF ]
      [ "return " <> kvPair <> "(key, Get(key));" ]

  getItemsFn =
    wrapConstFunction ("array<" <> kvPair <> "@>@") "GetItems" []
      $ [ "array<" <> kvPair <> "@> ret = array<" <> kvPair <> "@>(GetSize());"
        , "array<string> keys = GetKeys();"
        ]
      <> mapArray_For { arr: "keys", el: keyF, ix: "i" }
          [ "@ret[i] = GetItem(key);" ]
      <> [ "return ret;" ]

  kvPair = n <> "::KvPair"

  getSizeFn = proxyFnConst "uint" "GetSize"

  opIndexFn =
    wrapFunction valAsRetType "opIndex" [ keyF ]
      [ "return Get(key);" ]

  valF = valFTy valType

  ref = if jTySetAsRef valType then "@" else ""

  proxyFnRet retTy fName = wrapFunction retTy fName [] [ retNotVoid retTy <> d <> "." <> fName <> "();" ]

  proxyFnKeyRet retTy fName = wrapFunction retTy fName [ keyF ] [ retNotVoid retTy <> d <> "." <> fName <> "(key);" ]

  proxyFnKeyValRet retTy fName = wrapFunction retTy fName [ keyF, valF ] [ retNotVoid retTy <> d <> "." <> fName <> "(key, value);" ]

  proxyFnConst retTy fName = wrapConstFunction retTy fName [] [ retNotVoid retTy <> d <> "." <> fName <> "();" ]

  valAsRetType = jTyToFuncRes valType

  retNotVoid retTy = if retTy == "void" then "" else "return "

keyF :: JField
keyF = JField "key" JString

valFTy ∷ JType → JField
valFTy vt = JField "value" vt

tests :: DictOpts -> Maybe RunTestGenerators
tests opts = Just $ genTests [ testSomeProxyFns opts ]

testSomeProxyFns :: DictOpts -> TestGenerator
testSomeProxyFns opts ms this@(JsonObj objName fs) = { fnName, ls }
  where
  fnName = "UnitTest_" <> noSpaces ms.currMixin <> "_" <> objName

  checkerFnName = "Test_ProxyFns_" <> objName

  kvPair = objName <> "::KvPair"

  kvPairVar = "tmpKV"

  checkerFn =
    wrapFunction "bool" checkerFnName [ thisF, JField "n" JUint, keyF, valF ]
      [ "testDict.Set(key, value);"
      , kvPair <> "@ " <> kvPairVar <> " = " <> kvPair <> "(key, value);"
      , "string e = ' for test #' + n + ', k: ' + key;"
      , "assert(value == testDict.Get(key), '.Get' + e);"
      , "assert(value == testDict[key], '.opIndex' + e);"
      , "assert(testDict.Exists(key), '.Exists' + e);"
      , "assert(testDict.GetItem(key) == " <> kvPairVar <> ", '.GetItem' + e);"
      , "assert(n == testDict.GetSize(), '.GetSize' + e);"
      , "assert(n == testDict.GetKeys().Length, '.GetKeys.Length' + e);"
      , "assert(n == testDict.GetItems().Length, '.GetItems.Length' + e);"
      -- , "assert(testDict.GetItems()[n-1] == " <> kvPairVar <> ", '.GetItems[n-1]' + e);" -- doesn't work, key order nondeterministic
      , "assert(0 <= testDict.GetKeys().Find(key), '.GetKeys.Find' + e);"
      -- , "assert(0 <= testDict.GetItems().Find(" <> kvPair <> "(key, value)), '.GetItems.Find' + e);" -- weird error `doesn't have a matching opEquals or opCmp method`
      , "assert(testDict.Delete(key), '.Delete' + e);"
      , "assert(n == testDict.GetSize() + 1, '.GetSize+1' + e);"
      , "assert(!testDict.Exists(key), '!.Exists' + e);"
      , "testDict.Set(key, value);"
      , "return true;"
      ]

  mainFn =
    wrapMainTest fnName
      $ [ jfieldToAsArg thisF <> " = " <> objName <> "(" <> mainTestObjArgs <> ");" ]
      <> ( mapWithIndex (\n testArgs -> checkerFn.callRaw ([ "testDict", intToStr (n + 1) ] <> testArgs) <> ";")
            allTestArgs
        )
      <> [ "testDict.DeleteAll();"
        , "assert(0 == testDict.GetSize(), '.DeleteAll');"
        ]

  mainTestObjArgs =
    if opts.writeLog then
      joinWith ", "
        [ "IO::FromDataFolder('Storage/codegenTest/test')"
        , "'" <> objName <> ".txt'"
        ]
    else
      ""

  allTestArgs = A.filter nonemptyKey $ genTestArgs 398452 [ keyF, valF ]

  ls = intercalate ln [ checkerFn.decl, mainFn.decl ]

  valType = case A.head fs of
    Just (JField _ (JDict t)) -> t
    _ -> unsafeCrashWith "first field is not a JDict"

  valF = valFTy valType

  thisTy = JObject this

  thisF = JField "testDict" thisTy

  nonemptyKey ∷ Array String → Boolean
  nonemptyKey [ k, _v ] = S.length k > 2

  nonemptyKey _ = unsafeCrashWith "nonemptyKey expected array of len 2"

namespace :: Maybe (JsonObj -> Lines)
namespace = Just namespace'

namespace' :: JsonObj -> Lines
namespace' (JsonObj objName fields) = kvPair.cls.mainFile
  where
  kvPairObjName = "KvPair"

  valType = case A.head fields of
    Just (JField _ (JDict t)) -> t
    _ -> unsafeCrashWith "first field is not a JDict"

  kvPair :: { cls :: AsClass, obj :: JsonObj }
  kvPair = { cls, obj }
    where
    obj =
      object kvPairObjName
        # field "key" JString
        # field "val" valType

    cls =
      jsonObjToClass obj []
        [ mxCommonTesting
        , mxDefaultProps
        , mxDefaultCons
        , mxGetters
        , mxOpEq
        , mxOpOrd keyF
        , mxRowSz
        ]
