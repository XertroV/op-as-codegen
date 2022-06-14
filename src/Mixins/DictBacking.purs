module Mixins.DictBacking (mxDictBacking, mkDO, DictOpts) where

import Prelude
import AsTypes (castOrWrap, jTySetAsRef, jTyShouldCast, jTyToAsTy, jTyToFuncRes)
import CodeLines (jfieldToAsArg, ln, wrapConstFunction, wrapConstructor, wrapFunction, wrapFunction', wrapMainTest)
import Data.Array (intercalate, mapWithIndex)
import Data.Array as A
import Data.Maybe (Maybe(..))
import Data.String as S
import Mixins.AllMixins (_MX_DICT_BACKING_NAME)
import Mixins.DefaultCons (mxEmptyCons, mxEmptyConsWDefaults)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.RowSz (mxRowSz)
import Mixins.Testing.Gen (genTestArgs, genTests)
import Mixins.Types (Mixin, TestGenerator, TestGenerators, RunTestGenerators)
import Partial.Unsafe (unsafeCrashWith)
import Types (JField(..), JType(..), JsonObj(..), Lines)
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
  , properties: Nothing
  , namespace: Nothing
  , tests: tests opts
  }
  where
  comprisingRequires = [] <> (if opts.writeLog then [ mxRowSz.name ] else [])

genMethods :: DictOpts -> JsonObj -> Lines
genMethods opts@{ dictProp, valType } (JsonObj n fs) =
  intercalate ln
    $ [ constructorFn.decl
      , getFn.decl
      , setFn.decl
      , existsFn.decl
      , getKeysFn.decl
      , opIndexFn.decl
      , getSizeFn.decl
      , delFn.decl
      , delAllFn.decl
      ]
    <> (if opts.writeLog then [ writeOnSetFn.decl ] else [])
  where
  d = "_" <> dictProp -- b/c mxDefaultProps

  constructorFn = wrapConstructor n constructorArgs [ "@_" <> dictProp <> " = dictionary();" ]

  constructorArgs = [] <> (if opts.writeLog then [ JField "logPath" JString ] else [])

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
      $ [ ref <> d <> "[key]" <> " = value;" ]
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

  checkerFn =
    wrapFunction "bool" checkerFnName [ thisF, JField "n" JUint, keyF, valF ]
      [ "testDict.Set(key, value);"
      , "string e = ' for test #' + n + ', k: ' + key;"
      , "assert(value == testDict.Get(key), '.Get' + e);"
      , "assert(value == testDict[key], '.opIndex' + e);"
      , "assert(testDict.Exists(key), '.Exists' + e);"
      , "assert(n == testDict.GetSize(), '.GetSize' + e);"
      , "assert(n == testDict.GetKeys().Length, '.GetKeys.Length' + e);"
      , "assert(0 <= testDict.GetKeys().Find(key), '.GetKeys.Find' + e);"
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

  mainTestObjArgs =
    if opts.writeLog then
      "IO::FromDataFolder('Storage/codegenTest/test/" <> objName <> ".txt')"
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
