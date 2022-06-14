module Mixins.CommonTesting
  ( mxCommonTesting
  , assertFn
  , debugTraceFn
  ) where

import Prelude
import CodeLines (ln, wrapFunction, wrapIf)
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

  ls = intercalate ln [ assertFn.decl, debugTraceFn.decl, mainFn.decl ]

  mainFn = wrapFunction "bool" fnName [] [ "return true;" ]

assertFn ∷ AsFunction
assertFn =
  wrapFunction "void" "assert" [ JField "condition" JBool, JField "msg" JString ]
    $ wrapIf "!condition" [ "throw('Assert failed: ' + msg);" ]

debugTraceFn ∷ AsFunction
debugTraceFn =
  wrapFunction "void" "debug_trace" [ JField "msg" JString ]
    -- [] -- do nothing
    [ "trace(msg);" ] -- print the trace
