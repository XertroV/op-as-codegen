module Mixins.CommonTesting
  ( mxCommonTesting
  , assertFn
  , debugTraceFn
  , countFileLinesFn
  , runAsyncFn
  ) where

import Prelude
import CodeLines (ln, wrapFunction, wrapFunction', wrapIf, wrapMainTest, wrapWhileLoop)
import Data.Array (intercalate)
import Data.Maybe (Maybe(..))
import Mixins.AllMixins (_MX_COMMON_TESTING_NAME)
import Mixins.Testing.Gen (genTests)
import Mixins.Types (Mixin, TestGenerator)
import Types (JField(..), JType(..), AsFunction)

mxCommonTesting :: Mixin
mxCommonTesting =
  { name: _MX_COMMON_TESTING_NAME
  , requires: []
  , comprisingRequires: []
  , methods: Nothing
  , properties: Nothing
  , namespace: Nothing
  , tests: Just $ genTests [ commonTesting ]
  }

commonTesting :: TestGenerator
commonTesting _ _ = { fnName, ls }
  where
  fnName = "UnitTest_Common_Nop"

  ls = intercalate ln [ runAsyncFn.decl, assertFn.decl, debugTraceFn.decl, countFileLinesFn.decl, mainFn.decl ]

  mainFn = wrapMainTest fnName []

runAsyncFn :: AsFunction
runAsyncFn = wrapFunction' "bool" "runAsync" [ "CoroutineFunc@ func" ] [ "startnew(func);", "return true;" ]

assertFn ∷ AsFunction
assertFn =
  wrapFunction "void" "assert" [ JField "condition" JBool, JField "msg" JString ]
    $ wrapIf "!condition" [ "throw('Assert failed: ' + msg);" ]

debugTraceFn ∷ AsFunction
debugTraceFn =
  wrapFunction "void" "debug_trace" [ JField "msg" JString ]
    -- [] -- do nothing
    [ "trace(msg);" ] -- print the trace

countFileLinesFn :: AsFunction
countFileLinesFn =
  wrapFunction "int" "countFileLines" [ JField "path" JString ]
    $ [ "IO::File f(path, IO::FileMode::Read);"
      -- , "int lines = 0;"
      , "string contents = f.ReadToEnd();"
      , "f.Close();"
      , "return contents.Split('\\n').Length - (contents.EndsWith('\\n') ? 1 : 0);"
      ]
