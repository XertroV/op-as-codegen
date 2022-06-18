module CommonGlobalClasses where

import Prelude
import AsTypes (jTyPascalCase)
import Data.Array (catMaybes, intercalate)
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Gen.Class (AsClass, jsonObjToClass)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Getters (mxGetters)
import Mixins.JMaybes (mxJMaybes)
import Mixins.OpEq (mxOpEq)
import Mixins.RowSz (mxRowSz)
import Types (JType(..), JsonObj(..), field, getFTy, object)

getCommonClasses :: Array AsClass -> Array AsClass
getCommonClasses cs = requiredCommonClasses
  where
  requiredCommonClasses =
    []
      <> _getReqJMaybeClasses cs

_getReqJMaybeClasses ∷ Array AsClass → Array AsClass
_getReqJMaybeClasses cs = getMaybeClassFor <$> jMaybeFs
  where
  allFields = cs <#> (\{ obj: JsonObj n fs } -> fs) # intercalate []

  jMaybeFs = allFields <#> (getFTy >>> jMaybeInnerTy) # catMaybes

  jMaybeInnerTy j = case j of
    JMaybe t -> Just t
    _ -> Nothing

getMaybeClassFor :: JType -> AsClass
getMaybeClassFor t = cls
  where
  name = jTyPascalCase (JMaybe t)

  obj =
    object name
      # field "val" t
      # field "hasVal" JBool

  cls = jsonObjToClass obj [] [ mxCommonTesting, mxDefaultProps, mxJMaybes ]

-- kvPair :: JsonObj -> { cls :: AsClass, obj :: JsonObj }
-- kvPair (JsonObj objName fields) = { cls, obj }
--   where
--   valType = case A.head fields of
--     Just (JField _ (JDict t)) -> t
--     _ -> unsafeCrashWith "first field is not a JDict"
--   obj =
--     object kvPairObjName
--       # field "key" JString
--       # field "val" valType
--   cls =
--     jsonObjToClass obj []
--       [ mxCommonTesting
--       , mxDefaultProps
--       , mxDefaultCons
--       , mxGetters
--       , mxOpEq
--       , mxOpOrd keyF
--       , mxRowSz
--       ]
