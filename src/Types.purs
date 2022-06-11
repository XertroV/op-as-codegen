module Types where

import Prelude

-- data JsonSpec
--     = Object (Array KVPair)
--     | Array Type
data JsonObj
  = JsonObj String (Array JField)

data JField
  = JField String JType

data JType
  = JInt
  | JUint
  | JString
  | JNull
  | JNumber
  | JArray JType
  | JObject JsonObj

object ∷ String → JsonObj
object name = JsonObj name []

field :: String -> JType -> JsonObj -> JsonObj
field n t (JsonObj jn jf) = JsonObj jn $ jf <> [ JField n t ]
