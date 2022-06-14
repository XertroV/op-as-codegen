module Mixins.DefaultCons where

import Prelude
import AsTypes (jTySetAsRef)
import CodeLines (comment, indent, jFDefaultVal, jfieldToAsArg, mkClsConstructor, mkClsProp, toPropFields)
import Data.Array (zip)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Mixins.AllMixins (_MX_DEFAULT_CONS_NAME, _MX_EMPTY_CONS_NAME)
import Mixins.Types (Mixin)
import Types (JField(..), JsonObj(..))

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

mxEmptyCons :: Mixin
mxEmptyCons =
  { name: _MX_EMPTY_CONS_NAME
  , requires: []
  , comprisingRequires: []
  , methods: Just $ \(JsonObj n _) -> mkClsConstructor n []
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing
  }

mxEmptyConsWDefaults :: Mixin
mxEmptyConsWDefaults =
  { name: _MX_EMPTY_CONS_NAME <> " With Defaults"
  , requires: []
  , comprisingRequires: []
  , methods: Just $ \(JsonObj n fields) -> mkClsConstructorNoArgsDefaults n fields
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing
  }

mkClsConstructorNoArgsDefaults ∷ String → Array JField → Array String
mkClsConstructorNoArgsDefaults name fields = [ start ] <> body <> [ end ]
  where
  start = name <> "() {"

  end = "}"

  propFields = toPropFields fields

  body = indent 1 $ setProps

  setProps = setProp <$> zip propFields (jFDefaultVal <$> propFields)

  setProp (Tuple (JField n1 t1) v) = ref <> n1 <> " = " <> v <> ";"
    where
    ref = if jTySetAsRef t1 then "@" else ""
