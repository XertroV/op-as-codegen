module Mixins.FromGameObj (mxFromGameObj) where

import Prelude
import AsTypes (jTySetAsRef, jTyToFuncRes)
import CodeLines (ln, toPropFields, wrapConstFunction, wrapConstructor, wrapFunction, wrapFunction')
import Data.Array (intercalate, zip)
import Data.Array as A
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Mixins.DefaultCons (mxDefaultCons)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.ToFromJsonObj (mxToFromJsonObj)
import Mixins.Types (Mixin)
import Partial.Unsafe (unsafeCrashWith)
import Types (JField(..), JFields, JType(..), JsonObj(..), Lines)

{-|
  Mixin to fake being an array.
  - [ ] To/FromJson should optimize case where there is only one field and it's an array.
      (easy desz from API)
  - [x] opIndex
  - [x] Length
|-}
mxFromGameObj :: String -> Mixin
mxFromGameObj gameObjName =
  { name: "From Game Object: " <> gameObjName
  , requires: [ mxDefaultProps.name, mxDefaultCons.name ]
  , comprisingRequires: []
  , methods: Just $ methods gameObjName
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing
  }

methods ∷ String -> JsonObj → Lines
methods gameObjName (JsonObj n fs) = constructorFromGameObj.decl
  where
  propFields = toPropFields fs

  constructorFromGameObj =
    wrapConstructor n [ JField "&in gameObj" (JObject (JsonObj gameObjName [])) ]
      (setProp <$> zip propFields fs)

  setProp (Tuple (JField p t1) (JField objProp _)) = ref <> "this." <> p <> " = gameObj." <> objProp <> ";"
    where
    ref = if jTySetAsRef t1 then "@" else ""
