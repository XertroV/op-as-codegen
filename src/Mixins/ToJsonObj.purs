module Mixins.ToJsonObj where

import Prelude
import AsTypes (jTyToAsTy)
import CodeLines (comment, indent, toPropFields)
import Data.Array (foldl, zip)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Mixins.AllMixins (_MX_TO_JSON_OBJ_NAME)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Types (Mixin)
import Types (JField(..), JType(..), JsonObj(..))

mxToJsonObj :: Mixin
mxToJsonObj =
  { name: _MX_TO_JSON_OBJ_NAME
  , requires: [ mxDefaultProps.name ]
  , comprisingRequires: []
  , methods:
      Just
        $ \(JsonObj name fields) ->
            [ "Json::Value ToJson() {" ]
              <> indent 1 (toJsonBody fields)
              <> [ "}" ]
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing
  }

toJsonBody ∷ Array JField → Array String
toJsonBody fields = [ "Json::Value j = Json::Object();" ] <> (foldl (<>) [] $ toJsonFieldLines <$> zip fields (toPropFields fields)) <> [ "return j;" ]

-- | Tuple of (jsonField, clsPropretyField)
toJsonFieldLines ∷ Tuple JField JField → Array String
toJsonFieldLines (Tuple (JField n (JArray _)) (JField p _)) = []

-- todo: safe integers
toJsonFieldLines (Tuple (JField n t) (JField p t2)) = [ "j" <> getKey n <> " = " <> p <> ";" ]

-- toJsonFieldLines jf@(Tuple _ (JField _ (JArray _))) = toJsonArray jf
-- toJsonFieldLines (Tuple (JField p _) (JField n (JObject _))) = [ "this." <> p <> " = " <> n <> "(j" <> getKey n <> ");" ]
-- toJsonFieldLines (Tuple (JField p _) (JField n _)) =
--   [ "this." <> p <> " = j" <> getKey n <> ";"
--   ]
toJsonArray :: Tuple JField JField -> Array String
toJsonArray (Tuple (JField p _) (JField n (JArray arrTy))) =
  [ "Json::Value " <> tmpV <> " = j" <> getKey n <> ";"
  , arrDecl arrTy
  , "j" <> getKey n <> ";"
  ]
  where
  tmpV = "_tmp_" <> n

  arrDecl (JObject (JsonObj jon _)) = "this." <> p <> " = array<" <> jon <> "@>(" <> tmpV <> ".Length);"

  -- arrDecl (JArray _in) = "this." <> p <> " = array<" <> jon <> "@>(" <> tmpV <> ".Length);"
  arrDecl _ty = "this." <> p <> " = array<" <> jTyToAsTy _ty <> "@>(" <> tmpV <> ".Length);"

toJsonArray _ = comment "! WARNING: Json non-array passed to toJsonArray"

getKey ∷ String → String
getKey n = "[\"" <> n <> "\"]"
