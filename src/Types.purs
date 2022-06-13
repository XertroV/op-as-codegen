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

getFName ∷ JField → String
getFName (JField n _t) = n

getFTy ∷ JField → JType
getFTy (JField _n t) = t

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
  | JBool
  | JNumber
  | JArray JType
  | JObject JsonObj

derive instance eqJType :: Eq JType

isJArray ∷ JType → Boolean
isJArray j = case j of
  (JArray _) -> true
  _ -> false

isJObject ∷ JType → Boolean
isJObject j = case j of
  (JObject _) -> true
  _ -> false

object ∷ String → JsonObj
object name = JsonObj name []

field :: String -> JType -> JsonObj -> JsonObj
field n t (JsonObj jn jf) = JsonObj jn $ jf <> [ JField n t ]

type AsFunction
  = { decl :: Lines
    , call :: JFields -> String
    }
