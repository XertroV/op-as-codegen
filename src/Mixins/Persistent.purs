module Mixins.Persistent where

import Prelude
import AsTypes (jTyToAsTy)
import CodeLines (comment, fnCall, ln, logBenchmark, setV, stmt, toPropField, toPropFields, wrapConstructor, wrapFunction, wrapFunction', wrapIf, wrapMainTest, wrapSQuotes, wrapTestFn)
import CommonGlobalClasses (storageLoc)
import Data.Array (intercalate)
import Data.Array as A
import Data.Maybe (Maybe(..), fromMaybe)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultCons (mxDefaultCons, mxEmptyConsWDefaults)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.OpenplanetFuncs (ioDeleteFile, ioFileExists)
import Mixins.Testing.Gen (genTestArgs, genTests)
import Mixins.ToFromBuffer (mxToFromBuffer, rfbLpStringFnNoShare, rfb_getNext')
import Mixins.Types (Mixin, RunTestGenerators, TestGenerator)
import Types (JField(..), JType(..), JsonObj(..), Lines, getFName, getFTy, isJUint)
import Utils (noSpaces)

{-

idea: have setters and persist on any

-}
mxPersistent :: Mixin
mxPersistent =
  { name: "Persistent"
  , requires: [ mxCommonTesting.name, mxDefaultProps.name, mxEmptyConsWDefaults.name, mxToFromBuffer.name ]
  , comprisingRequires: []
  , properties: Just mkprops
  , methods: Just mkmethods
  , namespace: Just mknamespace
  , tests: Just mktests
  }

mkprops :: JsonObj -> Lines
mkprops (JsonObj n fs) =
  [ "private string _path;"
  , "private bool _doPersist = false;"
  , "bool quiet = false;"
  ]

fieldToSetter :: JField -> Lines
fieldToSetter f@(JField n _) = fn.decl
  where
  fn =
    wrapFunction "void" ("set_" <> n) [ f ]
      [ setV (toPropField f) n
      , "if (_doPersist) Persist();"
      ]

mkmethods :: JsonObj -> Lines
mkmethods (JsonObj n fs) =
  intercalate ln
    $ [ constructorFn.decl, initPersistFn.decl, persistFn.decl, reloadFn.decl, rfbLpStringFnNoShare.decl ]
    <> (fieldToSetter <$> fs)
  where
  propFs = toPropFields fs

  storageLocF = JField "storageLoc" (JObject storageLoc.obj)

  constructorFn =
    wrapConstructor n [ storageLocF ]
      $ [ "uint start = Time::Now;"
        , initPersistFn.call [ storageLocF ] <> ";"
        , reloadFn.call [] <> ";"
        ]

  -- <> [ logBenchmark n "loaded" "1" "_path" "(Time::Now - start)" ]
  initPersistFn =
    wrapFunction "void" "InitPersist" [ storageLocF ]
      [ "if (_doPersist) throw('Persistence already initialized.');"
      , "storageLoc.EnsureDirExists();"
      , "_path = storageLoc.Path;"
      , "_doPersist = true;"
      -- , "trace('set persist log to: ' + _path);"
      ]

  reloadFn =
    wrapFunction "void" "ReloadFromDisk" []
      $ [ "IO::File f(_path, IO::FileMode::Read);"
        , "Buffer@ buf = Buffer(f.Read(f.Size()));"
        , "f.Close();"
        ]
      <> (intercalate [] $ (rfb_getNext' setV) <$> propFs)

  persistFn =
    wrapFunction' "void" "Persist" [ "bool _quiet = false" ]
      $ [ "auto start = Time::Now;"
        , "Buffer@ buf = Buffer();"
        , "WriteToBuffer(buf);"
        , "buf.Seek(0);"
        -- , "trace('saving to: ' + _path);"
        , "IO::File f(_path, IO::FileMode::Write);"
        , "f.Write(buf._buf);"
        , "f.Close();"
        ]
      <> wrapIf "!(quiet || _quiet)" [ logBenchmark n "saved" "1" "_path" "(Time::Now - start)" ]

mknamespace :: JsonObj -> Lines
mknamespace (JsonObj n fs) = []

mktests :: RunTestGenerators
mktests = genTests [ persistTest ]

persistTest :: TestGenerator
persistTest ms o@(JsonObj objName fs) = { fnName, ls }
  where
  fnName = "UnitTest_" <> noSpaces ms.currMixin <> "_" <> objName

  ls = intercalate ln [ checkerFn.decl, mainFn.decl ]

  mainFn =
    wrapMainTest fnName
      $ (if firstFsIsInt then [ "trace('" <> fnName <> " running extra for firstFsIsInt');" ] else [])
      <> ((stmt <<< checkerFn.callRaw) <$> allTestArgs)

  checkerFn =
    wrapTestFn ("Check_Persistent_" <> objName) fs
      $ [ objTy <> " tmp = " <> fnCall objName args <> ";"
        , "auto loc = StorageLocation('" <> wlFile <> "');"
        ]
      <> wrapIf (ioFileExists "loc.Path") [ ioDeleteFile "loc.Path" <> ";" ]
      <> [ "tmp.InitPersist(loc);"
        , "tmp.quiet = true;"
        , "tmp.Persist();"
        , "assert(" <> ioFileExists "loc.Path" <> ", 'file should exist after persisting');"
        , "auto tmp2 = " <> fnCall objName [ "loc" ] <> ";"
        , "assert(tmp == tmp2, 'persisted data should match expected');"
        ]
      <> testMutLs
      <> [ "return true;" ]

  firstFsIsInt = A.head fs <#> getFTy <#> isJUint # fromMaybe false

  firstFsName = A.head fs <#> getFName # fromMaybe "UNK"

  testMutLs = case firstFsIsInt of
    false -> []
    _ ->
      [ "tmp." <> firstFsName <> " += 1;"
      , "assert(tmp == " <> fnCall objName [ "loc" ] <> ", 'mutation should have persisted');"
      , "assert(tmp != tmp2, 'ensure tmp and tmp2 differ');"
      , "tmp2.ReloadFromDisk();"
      , "assert(tmp == tmp2, 'ensure tmp and tmp2 do not differ after reload');"
      ]

  args = fs <#> getFName

  allTestArgs = genTestArgs 9586794 fs

  objTy = jTyToAsTy (JObject o)

  wlFile = objName <> ".bin"
