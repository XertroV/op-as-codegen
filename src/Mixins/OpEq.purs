module Mixins.OpEq where

import Prelude

import CodeLines (forLoopArray, indent, ln, wrapFunction, wrapFunction')
import Data.Array (catMaybes, intercalate)
import Data.Maybe (Maybe(..))
import Mixins.AllMixins (_MX_OP_EQ_NAME)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Getters (mxGetters)
import Mixins.Types (Mixin)
import Types (JField(..), JType(..), JsonObj(..), Lines)

mxOpEq :: Mixin
mxOpEq =
  { name: _MX_OP_EQ_NAME
  , requires: [ mxDefaultProps.name, mxGetters.name ]
  , comprisingRequires: []
  , methods: Just opEqMethods
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing -- handled by getters
  }

opEqMethods :: JsonObj -> Lines
opEqMethods (JsonObj name fields) = intercalate ln [ opEqFn.decl ]
  where
  opEqFn =
    wrapFunction' "bool" "opEquals" [ "const " <> name <> "@ &in other" ]
      $ declAnyArrayEqs
      <> [ "return true" ]
      <> indent 1 ((fieldEqLine <$> fields) <> [ ";" ])

  fieldEqLine (JField n t) = case t of
    (JArray arrTy) -> "&& " <> tmpArrEqVar n
    _ -> "&& _" <> n <> " == other." <> n -- assume defualt prop names (prepended with _)

  tmpArrEqVar n = "_tmp_arrEq_" <> n

  declAnyArrayEqs = intercalate [] $ catMaybes $ tmpArrEqFor <$> fields

  tmpArrEqFor (JField n j) = case j of
    (JArray t) ->
      Just
        $ [ "bool " <> tmpArrEqVar n <> " = true;"
          ]
        <> forLoopArray "i" ("_" <> n)
            [ tmpArrEqVar n <> " = " <> tmpArrEqVar n <> " && (_" <> n <> "[i] == other." <> n <> "[i]);" ]
    _ -> Nothing

-- intercalate ln $ fieldToGetter <$> fields
