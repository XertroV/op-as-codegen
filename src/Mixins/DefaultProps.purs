module Mixins.DefaultProps where

import Prelude
import CodeLines (mkClsProp, toPropFields)
import Data.Maybe (Maybe(..))
import Mixins.AllMixins (_MX_DEFAULT_PROPS_NAME)
import Mixins.Types (Mixin)
import Types (JsonObj(..))

mxDefaultProps :: Mixin
mxDefaultProps =
  { name: _MX_DEFAULT_PROPS_NAME
  , requires: []
  , comprisingRequires: []
  , methods: Nothing
  , properties: Just $ \(JsonObj _n fields) -> mkClsProp <$> toPropFields fields
  , namespace: Nothing
  , tests: Nothing -- implied through Getters tests
  }
