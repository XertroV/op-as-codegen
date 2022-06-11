module Mixins.Types where

import Prelude
import Data.Maybe (Maybe)
import Types (JsonObj(..))

-- | produce more lines to add to the class
type Mixin
  = { name :: String
    , requires :: Array String -- mixins that are required before this one
    , properties :: Maybe (JsonObj -> Array String)
    , methods :: Maybe (JsonObj -> Array String)
    , namespace :: Maybe (JsonObj -> Array String)
    }
