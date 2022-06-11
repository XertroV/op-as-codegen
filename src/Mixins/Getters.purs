module Mixins.Getters where

import AsTypes
import Mixins.Types
import Prelude
import Types
import CodeLines (ln)
import Data.Array (intercalate)
import Data.Maybe (Maybe(..))

mxGetters :: Mixin
mxGetters =
  { name: "Getters"
  , requires: ["DefaultProps"]
  , methods:
      Just
        $ \obj@(JsonObj name fields) -> intercalate ln $ fieldToGetter <$> fields
  , properties: Nothing
  , namespace: Nothing
  }

fieldToGetter :: JField -> Array String
fieldToGetter (JField n t) =
  [ jTyToFuncRes t <> " get_" <> n <> "() {"
  , "  return this." <> n <> ";"
  , "}"
  ]
