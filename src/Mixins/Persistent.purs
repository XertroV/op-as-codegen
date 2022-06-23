module Mixins.Persistent where

import Prelude
import CodeLines (comment, ln, logBenchmark, setV, toPropField, toPropFields, wrapConstructor, wrapFunction, wrapMainTest, wrapTestFn)
import CommonGlobalClasses (storageLoc)
import Data.Array (intercalate)
import Data.Maybe (Maybe(..))
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultCons (mxDefaultCons, mxEmptyConsWDefaults)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Testing.Gen (genTests)
import Mixins.ToFromBuffer (mxToFromBuffer, rfb_getNext')
import Mixins.Types (Mixin, RunTestGenerators, TestGenerator)
import Types (JField(..), JType(..), JsonObj(..), Lines)
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
    $ [ constructorFn.decl, persistFn.decl ]
    <> (fieldToSetter <$> fs)
  where
  propFs = toPropFields fs

  storageLocF = JField "storageLoc" (JObject storageLoc.obj)

  constructorFn =
    wrapConstructor n [ storageLocF ]
      $ [ "uint start = Time::Now;"
        , initPersistFn.call [ storageLocF ] <> ";"
        , "IO::File f(_path, IO::FileMode::Read);"
        , "Buffer@ buf = Buffer(f.Read(f.Size()));"
        , "f.Close();"
        ]
      <> (intercalate [] $ (rfb_getNext' setV) <$> propFs)
      <> [ logBenchmark n "loaded" "1" "_path" "Time::Now - start" ]

  initPersistFn =
    wrapFunction "void" "InitPersist" [ storageLocF ]
      [ "if (_doPersist) throw('Persistence already initialized.');"
      , "_path = storageLoc.Path;"
      , "_doPersist = true;"
      ]

  persistFn =
    wrapFunction "private void" "Persist" []
      [ "auto start = Time::Now;"
      , "Buffer@ buf = Buffer();"
      , "WriteToBuffer(buf);"
      , "buf.Seek(0);"
      , "IO::File f(_path, IO::FileMode::Write);"
      , "f.Write(buf._buf);"
      , "f.Close();"
      , logBenchmark n "saved" "1" "_path" "Time::Now - start"
      ]

mknamespace :: JsonObj -> Lines
mknamespace (JsonObj n fs) = []

mktests :: RunTestGenerators
mktests = genTests [ persistTest ]

persistTest :: TestGenerator
persistTest ms this@(JsonObj objName fs) = { fnName, ls }
  where
  fnName = "UnitTest_" <> noSpaces ms.currMixin <> "_" <> objName

  ls = intercalate ln [ checkerFn.decl, mainFn.decl ]

  mainFn = wrapMainTest fnName []

  checkerFn =
    wrapTestFn ("Check_Persistent_" <> objName) []
      []

--(JsonObj n fs) = []
