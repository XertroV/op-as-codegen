module Mixins.DefaultCons where

import Prelude

import CodeLines (comment, mkClsConstructor, mkClsProp, toPropFields)
import Data.Maybe (Maybe(..))
import Mixins.AllMixins (_MX_DEFAULT_CONS_NAME)
import Mixins.Types (Mixin)
import Types (JsonObj(..))

mxDefaultCons :: Mixin
mxDefaultCons =
  { name: _MX_DEFAULT_CONS_NAME
  , requires: []
  , comprisingRequires: []
  , methods: Just $ \(JsonObj name fields) -> mkClsConstructor name fields
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing
  }
