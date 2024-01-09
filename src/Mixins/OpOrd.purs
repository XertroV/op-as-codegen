module Mixins.OpOrd where

import Prelude
import CodeLines (forLoopArray, indent, ln, wrapFunction, wrapFunction')
import Data.Array (catMaybes, intercalate)
import Data.Maybe (Maybe(..))
import Mixins.AllMixins (_MX_OP_EQ_NAME)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Getters (mxGetters)
import Mixins.Types (Mixin)
import Types (JField(..), JType(..), JsonObj(..), Lines)

mxOpOrd :: JField -> Mixin
mxOpOrd ordProxyProp =
  { name: "Op Ord"
  , requires: [ mxDefaultProps.name, mxGetters.name ]
  , comprisingRequires: []
  , methods: Just $ opOrdMethods ordProxyProp
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing -- handled by getters
  }

opOrdMethods :: JField -> JsonObj -> Lines
opOrdMethods (JField pxN _pxT) (JsonObj name fields) = intercalate ln [ opOrdFn.decl ]
  where
  opOrdFn =
    wrapFunction' "int" "opOrd" [ "const " <> name <> "@ other" ]
      [ "return " <> pxN <> " < " <> pxOther <> " ? -1 : " <> pxN <> " == " <> pxOther <> " ? 0 : 1;" ]

  pxOther = "other." <> pxN

  -- $ declAnyArrayEqs
  -- <> [ "return true" ]
  -- <> indent 1 ((fieldEqLine <$> fields) <> [ ";" ])
  fieldEqLine (JField n t) = case t of
    (JArray arrTy) -> "&& " <> tmpArrEqVar n
    _ -> "&& _" <> n <> " == other." <> n -- assume defualt prop names (prepended with _)

  tmpArrEqVar n = "_tmp_arrEq_" <> n

  declAnyArrayEqs = intercalate [] $ catMaybes $ tmpArrEqFor <$> fields

  tmpArrEqFor (JField n j) = case j of
    (JArray t) ->
      Just
        $
          [ "bool " <> tmpArrEqVar n <> " = true;"
          ]
            <> forLoopArray "i" ("_" <> n)
              [ tmpArrEqVar n <> " = " <> tmpArrEqVar n <> " && (_" <> n <> "[i] == other." <> n <> "[i]);" ]
    _ -> Nothing

-- intercalate ln $ fieldToGetter <$> fields
