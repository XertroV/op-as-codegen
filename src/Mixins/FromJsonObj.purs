module Mixins.FromJsonObj where

import Prelude
import AsTypes (jTyToAsTy)
import CodeLines (comment, indent, toPropFields)
import Data.Array (foldl, zip)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Mixins.Types (Mixin)
import Types (JField(..), JType(..), JsonObj(..))

mxFromJsonObj :: Mixin
mxFromJsonObj =
  { name: "From JSON Object"
  , requires: ["DefaultProps"]
  , methods:
      Just
        $ \(JsonObj name fields) ->
            [ name <> "(Json::Value j) {" ]
              <> indent 1 (fromJsonBody fields)
              <> [ "}" ]
  , properties: Nothing
  , namespace: Nothing
  }

fromJsonBody ∷ Array JField → Array String
fromJsonBody fields = foldl (<>) [] $ fromJsonFieldLines <$> zip (toPropFields fields) fields

fromJsonFieldLines ∷ Tuple JField JField → Array String
fromJsonFieldLines jf@(Tuple _ (JField _ (JArray _))) = fromJsonArray jf

fromJsonFieldLines (Tuple (JField p _) (JField n (JObject _))) = [ "this." <> p <> " = " <> n <> "(j" <> getKey n <> ");" ]

fromJsonFieldLines (Tuple (JField p _) (JField n _)) =
  [ "this." <> p <> " = j" <> getKey n <> ";"
  ]

fromJsonArray :: Tuple JField JField -> Array String
fromJsonArray (Tuple (JField p _) (JField n (JArray arrTy))) =
  [ "Json::Value " <> tmpV <> " = j" <> getKey n <> ";"
  , arrDecl arrTy
  , "j" <> getKey n <> ";"
  ]
  where
  tmpV = "_tmp_" <> n

  arrDecl (JObject (JsonObj jon _)) = "this." <> p <> " = array<" <> jon <> "@>(" <> tmpV <> ".Length);"

  -- arrDecl (JArray _in) = "this." <> p <> " = array<" <> jon <> "@>(" <> tmpV <> ".Length);"
  arrDecl _ty = "this." <> p <> " = array<" <> jTyToAsTy _ty <> "@>(" <> tmpV <> ".Length);"

fromJsonArray _ = comment "! WARNING: Json non-array passed to fromJsonArray"

getKey ∷ String → String
getKey n = "[\"" <> n <> "\"]"
