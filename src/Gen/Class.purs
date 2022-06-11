module Gen.Class where

import CodeLines
import Prelude
import Data.Array (foldl, intercalate)
import Mixins
import Mixins.Types (Mixin)
import Types (JsonObj(..))

jsonObjToClass :: JsonObj -> (Array Mixin) -> String
jsonObjToClass obj@(JsonObj name fields) mixins = rootStr
  where
  rootStr = intercalate "\n" $ clsStart name <> clsBody <> clsEnd <> ln <> mixinNamespaces

  clsBody = indent 1 (bodyLines :: Array String)

  bodyLines =
    comment "Properties" <> clsProps <> mixinProps <> ln
      <> comment "Constructor"
      <> clsConstructor
      <> ln
      <> mixinMethods

  -- intercalate ln (foldl (addMixinMethods obj) { out: [], priorMixins: [] } mixins).out
  mixinMethods = runMixinMethods obj mixins

  mixinProps = runMixinProperties obj mixins

  mixinNamespaces = runMixinNamespaces obj mixins

  propFields = toPropFields fields

  clsProps = mkClsProp <$> propFields

  clsConstructor = mkClsConstructor name fields
