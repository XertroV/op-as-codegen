module Mixins.ArrayProxy (mxArrayProxy) where

import Prelude
import AsTypes (jTyToFuncRes)
import CodeLines (ln, wrapConstFunction, wrapFunction, wrapFunction')
import Data.Array (intercalate)
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
mxArrayProxy :: Mixin
mxArrayProxy =
  { name: "ArrayProxy"
  , requires: [ mxDefaultProps.name, mxDefaultCons.name ]
  , comprisingRequires: [ mxToFromJsonObj.name ]
  , methods: Just $ methods
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing
  }

methods ∷ JsonObj → Lines
methods (JsonObj n fs) =
  intercalate ln
    [ opIndex.decl
    , getLength.decl
    , isEmpty.decl
    , insertLast.decl
    ]
  where
  (Tuple arrN arrTy) = getArrTy fs

  opIndex =
    wrapConstFunction (jTyToFuncRes arrTy) "opIndex" [ JField "ix" JUint ]
      [ "return _" <> arrN <> "[ix];" ]

  getLength =
    wrapConstFunction "uint" "get_Length" []
      [ "return _" <> arrN <> ".Length;" ]

  isEmpty = wrapConstFunction "bool" "IsEmpty" [] [ "return _" <> arrN <> ".IsEmpty();" ]

  insertLast =
    wrapFunction "void" "InsertLast" [ JField "v" arrTy ]
      [ "_" <> arrN <> ".InsertLast(v);" ]

-- proxyFnKeyRet retTy fName = wrapFunction retTy fName [ keyF ] [ retNotVoid retTy <> d <> "." <> fName <> "(key);" ]
-- proxyFnKeyValRet retTy fName = wrapFunction retTy fName [ keyF, valF ] [ retNotVoid retTy <> d <> "." <> fName <> "(key, value);" ]
getArrTy :: JFields -> Tuple String JType
getArrTy fs = case A.head fs of
  Just (JField n (JArray t)) -> Tuple n t
  _ -> unsafeCrashWith "ArrayProxy requires an object to have exactly 1 field that must be an array."
