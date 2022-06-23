module Mixins.DictBacking (mxDictBacking, mkDO, DictOpts) where

import Prelude
import AsTypes (castOrWrap, jTyIsPrim, jTyPascalCase, jTySetAsRef, jTyShouldCast, jTyToAsTy, jTyToFuncRes)
import CodeLines (comment, jfieldToAsArg, ln, logBenchmark, setV, stmt, wrapConstFunction, wrapConstructor, wrapDQuotes, wrapFunction, wrapFunction', wrapIf, wrapIfElse, wrapMainTest, wrapSQuotes, wrapTryCatch, wrapWhileLoop)
import Data.Array (intercalate, mapWithIndex)
import Data.Array as A
import Data.Maybe (Maybe(..), fromMaybe)
import Data.String (joinWith)
import Data.String as S
import Gen.Class (AsClass, jsonObjToClass)
import Macros.Arrays (mapArray_For)
import ManiaColors (c_mid_grey, c_purple)
import Mixins.AllMixins (_MX_DICT_BACKING_NAME)
import Mixins.CommonTesting (assertFn, countFileLinesFn, mxCommonTesting)
import Mixins.DefaultCons (mxDefaultCons, mxEmptyCons, mxEmptyConsWDefaults)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Getters (mxGetters)
import Mixins.OpEq (mxOpEq)
import Mixins.OpOrd (mxOpOrd)
import Mixins.RowSz (mxRowSz)
import Mixins.Testing.Gen (genTestArgs, genTests)
import Mixins.ToFromBuffer (mxToFromBuffer)
import Mixins.ToString (mxToString)
import Mixins.Types (Mixin, TestGenerator, TestGenerators, RunTestGenerators)
import Partial.Unsafe (unsafeCrashWith)
import SzAsTypes (jValFromStr)
import Types (JField(..), JType(..), JsonObj(..), Lines, field, object)
import Utils (intToStr, noSpaces)

type DictOpts
  = { dictProp :: String
    , valType :: JType
    , writeLog :: Boolean
    , extraMixins :: Array Mixin
    , defaultDictVal :: Maybe String
    , keyType :: JType
    }

mkDO :: JType -> DictOpts
mkDO valType = { dictProp: "d", valType, writeLog: false, extraMixins: [], defaultDictVal: Nothing, keyType: JString }

mxDictBacking :: DictOpts -> Mixin
mxDictBacking opts@{ dictProp, valType, keyType } =
  { name: _MX_DICT_BACKING_NAME
  , requires: [ mxDefaultProps.name ]
  , comprisingRequires
  , methods: Just (genMethods opts)
  , properties: Just (genProps opts)
  , namespace: namespace opts
  , tests: tests opts
  }
  where
  comprisingRequires = [] <> (if opts.writeLog then [ mxRowSz.name ] else [])

genProps :: DictOpts -> JsonObj -> Lines
genProps opts@{ writeLog } (JsonObj _n _fs) =
  []
    <> (if writeLog then [ "private string _logPath;", "private bool _initialized = false;" ] else [])

genMethods :: DictOpts -> JsonObj -> Lines
genMethods opts@{ dictProp, valType, defaultDictVal, keyType } (JsonObj n fs) =
  intercalate ln
    $ [ constructorFn.decl
      , keyToStrFn.decl
      , getFn.decl
      , getManyFn.decl
      , (getWDefaultFn <#> \f -> f.decl) # fromMaybe []
      , setFn.decl
      , existsFn.decl
      , countExistsFn.decl
      , getKeysFn.decl
      , getItemFn.decl
      , getItemsFn.decl
      , opIndexFn.decl
      , getSizeFn.decl
      , delFn.decl
      , delAllFn.decl
      ]
    <> ( if opts.writeLog then
          [ comment "Dict Optional: Write Log = True" <> initLogFn.decl
          , loadWriteLogFromDisk.decl
          , getInit.decl
          , awaitInit.decl
          , writeOnSetFn.decl
          , wlOnResetAll.decl
          ]
        else
          []
      )
  where
  d = "_" <> dictProp -- b/c mxDefaultProps

  constructorFn =
    wrapConstructor n constructorArgs
      $ [ "@_" <> dictProp <> " = dictionary();" ]
      <> (if opts.writeLog then [ stmt $ initLogFn.call [ logDir, logFile ] ] else [])

  constructorArgs = [] <> (if opts.writeLog then [ logDir, logFile ] else [])

  keyToStrFn =
    wrapConstFunction "private const string" "K" [ keyF ] case keyF of
      JField _ JString -> [ "return key;" ]
      JField _ t -> if jTyIsPrim t then [ "return '' + key;" ] else [ "return tostring(key);" ]

  getFn =
    wrapConstFunction valAsRetType "Get" [ keyF ]
      [ "return " <> castOrWrap valType (d <> "[K(key)]") <> ";" ]

  getManyFn =
    wrapConstFunction (jTyToFuncRes $ JArray valType) "GetMany" [ JField "keys" (JArray keyType) ]
      $ [ jTyToAsTy (JArray valType) <> " ret = {};" ]
      <> mapArray_For { arr: "keys", ix: "i", el: "key" }
          [ "ret.InsertLast(Get(key));" ]
      <> [ "return ret;" ]

  getWDefaultFn = do
    dv <- defaultDictVal
    pure
      $ wrapFunction valAsRetType "GetOrDefault" [ keyF ]
      $ wrapIf "!Exists(key)" [ "Set(key, " <> dv <> ");" ]
      <> [ "return Get(key);" ]

  existsFn = proxyFnKeyRet "bool" "Exists"

  countExistsFn =
    wrapFunction "uint" "CountExists" [ JField "keys" (JArray keyType) ]
      $ [ "uint ret = 0;" ]
      <> mapArray_For { arr: "keys", ix: "i", el: "key" }
          [ "if (Exists(key)) ret++;" ]
      <> [ "return ret;" ]

  {-
  -- doens't seem to work when valAsRetType is to complex class types like Challenge.
  get2Fn =
    wrapFunction' "bool" "Get" [ jfieldToAsArg keyF, valAsRetType <> " &out value" ]
      [ "return " <> d <> ".Get(key, value);" ]
  -}
  -- setFn = proxyFnKeyValRet "void" "Set"
  setFn =
    wrapFunction "void" "Set" [ keyF, valF ]
      $ [ setV (JField (d <> "[K(key)]") valType) "value" ]
      <> writeOnSetLines

  writeOnSetLines = if opts.writeLog then [ writeOnSetFn.call [ keyF, valF ] <> ";" ] else []

  -- logPath = JField "logPath" JString
  logDir = JField "logDir" JString

  logFile = JField "logFile" JString

  -- todo: mutex for checking only 1 instance
  initLogFn =
    wrapFunction "private void" "InitLog" [ logDir, logFile ]
      $ [ "_logPath = logDir + '/' + logFile;"
        , "trace('" <> n <> " dir: ' + logDir + ' | logFile: ' + logFile);"
        ]
      <> wrapIf "logDir.Length == 0"
          [ "throw('Invalid path: ' + _logPath);" ]
      <> wrapIf "!IO::FolderExists(logDir)"
          [ "IO::CreateFolder(logDir, true);" ]
      <> [ stmt $ loadWriteLogFromDisk.call [] ]

  writeOnSetFn =
    wrapFunction "private void" "WriteOnSet" [ keyF, valF ]
      [ kvPair <> "@ p = " <> mkKvPair "key" "value" <> ";"
      -- , "string s = p.ToRowString();"
      , "Buffer@ buf = Buffer();"
      , "p.WriteToBuffer(buf);"
      , "buf.Seek(0, 0);"
      , "IO::File f(_logPath, IO::FileMode::Append);"
      , "f.Write(buf._buf);"
      , "f.Close();"
      ]

  wlOnResetAll =
    wrapFunction "private void" "WriteLogOnResetAll" []
      [ "IO::File f(_logPath, IO::FileMode::Write);"
      , "f.Write('');"
      , "f.Close();"
      ]

  loadWriteLogFromDisk =
    wrapFunction "private void" "LoadWriteLogFromDisk" []
      $ wrapIfElse "IO::FileExists(_logPath)"
          ( [ "uint start = Time::Now;"
            , "IO::File f(_logPath, IO::FileMode::Read);"
            -- , "Buffer@ fb = Buffer(f.Read(f.Size()).ReadToBase64(f.Size()));"
            , "Buffer@ fb = Buffer(f.Read(f.Size()));"
            , "f.Close();"
            ]
              <> ( wrapWhileLoop -- mapArray_For { arr: "lines", el: "line", ix: "lineNum" } wrapIf "line.Length > 0"
                    "!fb.AtEnd()"
                    $ [ "auto kv = " <> kvPairNs <> "::ReadFromBuffer(fb);"
                      , setV (JField (d <> "[K(kv.key)]") valType) "kv.val"
                      ]
                )
              <> [ logBenchmark n "loaded" "GetSize()" "_logPath" "(Time::Now - start)"
                , "f.Close();"
                ]
          )
          [ "IO::File f(_logPath, IO::FileMode::Write);", "f.Close();" ]
      <> [ "_initialized = true;" ]

  -- loadWriteLogFromDisk =
  --   wrapFunction "private void" "LoadWriteLogFromDisk" []
  --     $ wrapIfElse "IO::FileExists(_logPath)"
  --         ( [ "uint start = Time::Now;"
  --           , "IO::File f(_logPath, IO::FileMode::Read);"
  --           , "Buffer@ fb = Buffer(f.ReadToEnd());"
  --           -- , "print('buffer getsize: ' + fb.GetSize());"
  --           , "f.Close();"
  --           , "uint lineNum = 0;"
  --           , "string line;"
  --           -- , "string allLines = f.ReadToEnd();"
  --           -- , "auto lines = allLines.Split('\\n');"
  --           ]
  --             <> ( wrapWhileLoop -- mapArray_For { arr: "lines", el: "line", ix: "lineNum" } wrapIf "line.Length > 0"
  --                   "!fb.AtEnd()"
  --                   $ [ "uint len = Text::ParseUInt(fb.ReadString(8));"
  --                     -- , "print('reading line of length: ' + len);"
  --                     , "line = fb.ReadString(len);"
  --                     , "lineNum++;"
  --                     , "fb.Seek(1, 1);"
  --                     ]
  --                   <> wrapTryCatch
  --                       [ "auto kv = " <> kvPairNs <> "::FromRowString(line);"
  --                       , setV (JField (d <> "[K(kv.key)]") valType) "kv.val"
  --                       ]
  --                       [ "throw('Error parsing ' + _logPath + ' on line ' + lineNum + ' via saved entry: ' + line + '.\\nException info: ' + getExceptionInfo());" ]
  --               )
  --             <> [ "trace('" <> c_purple <> n <> c_mid_grey <> " loaded " <> c_purple <> "' + GetSize() + '" <> c_mid_grey <> " entries from log file: " <> c_purple <> "' + _logPath + '" <> c_mid_grey <> " in " <> c_purple <> "' + (Time::Now - start) + ' ms" <> c_mid_grey <> ".');"
  --               , "f.Close();"
  --               ]
  --         )
  --         [ "IO::File f(_logPath, IO::FileMode::Write);", "f.Close();" ]
  --     <> [ "_initialized = true;" ]
  getInit = wrapFunction "bool" "get_Initialized" [] [ "return _initialized;" ]

  awaitInit =
    wrapFunction "void" "AwaitInitialized" []
      $ wrapWhileLoop "!_initialized" [ "yield();" ]

  delFn = proxyFnKeyRet "bool" "Delete"

  delAllFn =
    proxyFnRet' "void" "DeleteAll"
      (if opts.writeLog then [ stmt $ wlOnResetAll.call [] ] else [])

  getKeysFn = case keyType of
    JString -> proxyFnConst "array<string>@" "GetKeys"
    t ->
      wrapConstFunction (jTyToFuncRes $ retTy) "GetKeys" []
        $ [ jTyToAsTy retTy <> " ret = {};"
          , "auto _keys = " <> d <> ".GetKeys();"
          ]
        <> mapArray_For { arr: "_keys", ix: "i", el: "_k" }
            [ "ret.InsertLast(" <> jValFromStr keyType "_k" <> ");" ]
        <> [ "return ret;" ]
    where
    retTy = JArray keyType

  getItemFn =
    wrapConstFunction (kvPair <> "@") "GetItem" [ keyF ]
      [ "return " <> kvPair <> "(key, Get(key));" ]

  getItemsFn =
    wrapConstFunction ("array<" <> kvPair <> "@>@") "GetItems" []
      $ [ "array<" <> kvPair <> "@> ret = array<" <> kvPair <> "@>(GetSize());"
        , "array<" <> jTyToAsTy keyType <> "> keys = GetKeys();"
        ]
      <> mapArray_For { arr: "keys", el: "key", ix: "i" }
          [ "@ret[i] = GetItem(key);" ]
      <> [ "return ret;" ]

  kvPair = "_" <> n <> "::KvPair"

  kvPairNs = "_" <> n <> "::_KvPair"

  mkKvPair k v = kvPair <> "(" <> joinWith ", " [ k, v ] <> ")"

  getSizeFn = proxyFnConst "uint" "GetSize"

  opIndexFn =
    wrapFunction valAsRetType "opIndex" [ keyF ]
      [ "return Get(key);" ]

  valF = valFTy valType

  ref = if jTySetAsRef valType then "@" else ""

  proxyFnRet retTy fName = wrapFunction retTy fName [] [ retNotVoid retTy <> d <> "." <> fName <> "();" ]

  proxyFnRet' retTy fName extraLs = wrapFunction retTy fName [] $ extraLs <> [ retNotVoid retTy <> d <> "." <> fName <> "();" ]

  proxyFnKeyRet retTy fName = wrapFunction retTy fName [ keyF ] [ retNotVoid retTy <> d <> "." <> fName <> "(K(key));" ]

  proxyFnKeyValRet retTy fName = wrapFunction retTy fName [ keyF, valF ] [ retNotVoid retTy <> d <> "." <> fName <> "(key, value);" ]

  proxyFnConst retTy fName = wrapConstFunction retTy fName [] [ retNotVoid retTy <> d <> "." <> fName <> "();" ]

  valAsRetType = jTyToFuncRes valType

  retNotVoid retTy = if retTy == "void" then "" else "return "

  keyF :: JField
  keyF = JField "key" keyType

valFTy ∷ JType → JField
valFTy vt = JField "value" vt

tests :: DictOpts -> Maybe RunTestGenerators
tests opts = Just $ genTests [ testSomeProxyFns opts ]

testSomeProxyFns :: DictOpts -> TestGenerator
testSomeProxyFns opts ms this@(JsonObj objName fs) = { fnName, ls }
  where
  fnName = "UnitTest_" <> noSpaces ms.currMixin <> "_" <> objName

  checkerFnName = "Test_ProxyFns_" <> objName

  kvPairName = "_" <> objName <> "::KvPair"

  kvPairVar = "tmpKV"

  keyF = JField "key" opts.keyType

  checkerFn =
    wrapFunction "bool" checkerFnName [ thisF, JField "n" JUint, keyF, valF ]
      [ "testDict.Set(key, value);"
      , kvPairName <> "@ " <> kvPairVar <> " = " <> kvPairName <> "(key, value);"
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
      -- , "assert(0 <= testDict.GetItems().Find(" <> kvPairName <> "(key, value)), '.GetItems.Find' + e);" -- weird error `doesn't have a matching opEquals or opCmp method`
      , "assert(testDict.Delete(key), '.Delete' + e);"
      , "assert(n == testDict.GetSize() + 1, '.GetSize+1' + e);"
      , "assert(!testDict.Exists(key), '!.Exists' + e);"
      , "testDict.Set(key, value);"
      , "yield();"
      , "return true;"
      ]

  mainFn =
    wrapMainTest fnName
      $ []
      <> wrapIf ("IO:" <> ":FileExists(" <> logPath <> ")")
          [ "IO::Delete(" <> logPath <> ");" ]
      <> [ jfieldToAsArg thisF <> " = " <> objName <> "(" <> mainTestObjArgs <> ");" ]
      <> wrapIf "testDict.GetSize() > 0" [ "testDict.DeleteAll();" ]
      <> ( mapWithIndex (\n testArgs -> checkerFn.callRaw ([ "testDict", intToStr (n + 1) ] <> testArgs) <> ";")
            allTestArgs
        )
      -- <> preDeleteAllTestExtra
      
      <> assertIfLoadFromDisk
      <> [ "testDict.DeleteAll();"
        , "assert(0 == testDict.GetSize(), '.DeleteAll');"
        ]

  assertIfLoadFromDisk =
    if opts.writeLog then
      [ "// del testDict; // todo: destroy obj but not data."
      , "auto kvs = testDict.GetItems();"
      , "@testDict = " <> objName <> "(" <> mainTestObjArgs <> ");"
      , "testDict.AwaitInitialized();"
      -- , "sleep(20);"
      , "assert(" <> nTestsStr <> " == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + " <> logPath <> ");"
      ]
        <> mapArray_For { arr: "kvs", ix: "i", el: "kv" }
            [ stmt $ assertFn.callRaw [ "kv.val == testDict.Get(kv.key)", "'Key ' + kv.key + ' did not match expected.'" ] ]
    else
      []

  kvPairClsObj = kvPair opts this

  wlDir = "Storage/codegenTest/test"

  wlFile = objName <> ".txt"

  wlPath = wlDir <> "/" <> wlFile

  absWlPath = "IO::FromDataFolder(" <> wrapSQuotes wlPath <> ")"

  mainTestObjArgs =
    if opts.writeLog then
      joinWith ", "
        [ "IO::FromDataFolder(" <> wrapSQuotes wlDir <> ")"
        , wrapSQuotes wlFile
        ]
    else
      ""

  logPath = "IO::FromDataFolder(" <> wrapSQuotes wlDir <> ") + '/' + " <> wrapSQuotes wlFile

  nTestsStr = intToStr (A.length allTestArgs)

  preDeleteAllTestExtra = case opts.writeLog of
    false -> []
    true ->
      [ stmt
          $ assertFn.callRaw
              [ nTestsStr <> "*2 == " <> countFileLinesFn.callRaw [ absWlPath ]
              , (wrapDQuotes $ "Should have written exactly " <> nTestsStr <> "*2 lines to the log, but wrote: ") <> " + " <> countFileLinesFn.callRaw [ absWlPath ]
              ]
      ]

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

namespace :: DictOpts -> Maybe (JsonObj -> Lines)
namespace opts = Just $ namespace' opts

namespace' :: DictOpts -> JsonObj -> Lines
namespace' opts jo = intercalate ln [ (kvPair opts jo).cls.mainFile ]

kvPairObjName ∷ String
kvPairObjName = "KvPair"

kvPair :: DictOpts -> JsonObj -> { cls :: AsClass, obj :: JsonObj }
kvPair opts (JsonObj objName fields) = { cls, obj }
  where
  valType = case A.head fields of
    Just (JField _ (JDict t)) -> t
    _ -> unsafeCrashWith "first field is not a JDict"

  obj =
    object kvPairObjName
      # field "key" opts.keyType
      # field "val" valType

  keyF = JField "key" opts.keyType

  cls =
    jsonObjToClass obj []
      [ mxCommonTesting
      , mxDefaultProps
      , mxDefaultCons
      , mxGetters
      , mxToString
      , mxOpEq
      -- , mxOpOrd keyF
      , mxRowSz
      , mxToFromBuffer
      ]
