module Mixins.Setters
  ( mxSetters
  ) where

import Prelude
import AsTypes (jTyToFuncRes, setVarOfJTyToVal)
import CodeLines (ln, setV, wrapFunction)
import Data.Array (intercalate)
import Data.Maybe (Maybe(..))
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Types (Mixin)
import Types (JField(..), JsonObj(..), Lines)

mxSetters :: Mixin
mxSetters =
  { name: "Setters"
  , requires: [ mxDefaultProps.name ]
  , comprisingRequires: []
  , methods:
      Just
        $ \(JsonObj _name fields) -> intercalate ln $ fieldToSetter <$> fields
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing
  }

fieldToSetter :: JField -> Lines
fieldToSetter (JField n t) = fn.decl
  where
  fn =
    wrapFunction "void" ("set_" <> n) [ JField ("new_" <> n) t ]
      [ setV (JField ("this._" <> n) t) ("new_" <> n) ]
