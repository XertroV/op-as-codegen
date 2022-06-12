module Types where

import Prelude

-- data JsonSpec
--     = Object (Array KVPair)
--     | Array Type
data JsonObj
  = JsonObj String (Array JField)

derive instance eqJsonObj :: Eq JsonObj

data JField
  = JField String JType

derive instance eqJField :: Eq JField

type JFields
  = Array JField

type Strings
  = Array String

type Lines
  = Array String

type CodeBlocks
  = Array Lines

data JType
  = JInt
  | JUint
  | JString
  | JNull
  | JNumber
  | JArray JType
  | JObject JsonObj

derive instance eqJType :: Eq JType

isJArray ∷ JType → Boolean
isJArray j = case j of
  (JArray _) -> true
  _ -> false

isJObject j = case j of
  (JObject _) -> true
  _ -> false

object ∷ String → JsonObj
object name = JsonObj name []

field :: String -> JType -> JsonObj -> JsonObj
field n t (JsonObj jn jf) = JsonObj jn $ jf <> [ JField n t ]
