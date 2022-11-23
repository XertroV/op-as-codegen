module Types where

import Prelude

import Data.Array as Array
import Data.Maybe (Maybe(..))

-- data JsonSpec
--     = Object (Array KVPair)
--     | Array Type
data JsonObj = JsonObj String (Array JField)

derive instance eqJsonObj :: Eq JsonObj

data JField = JField String JType

derive instance eqJField :: Eq JField

getFName ∷ JField → String
getFName (JField n _t) = n

getFTy ∷ JField → JType
getFTy (JField _n t) = t

type JFields = Array JField

type Strings = Array String

type Lines = Array String

type CodeBlocks = Array Lines

data JType
  = JInt
  | JUint
  | JString
  | JNull
  | JBool
  | JNumber
  | JVec3
  | JEnum String -- | basically a uint but wrapped with the name in the string
  | JArray JType
  | JObject JsonObj
  | JDict JType -- | Like a JObject but has unknown keys. All values must have the same type. Keys are always strings.
  | JMaybe JType -- | Nullable json values; either null or JType.
  | JJson -- | Json::Value@

derive instance eqJType :: Eq JType

isJArray ∷ JType → Boolean
isJArray j = case j of
  (JArray _) -> true
  _ -> false

isJObject ∷ JType → Boolean
isJObject j = case j of
  (JObject _) -> true
  _ -> false

isJDict ∷ JType → Boolean
isJDict j = case j of
  (JDict _) -> true
  _ -> false

isJMaybe ∷ JType → Boolean
isJMaybe j = case j of
  (JMaybe _) -> true
  _ -> false

isJUint ∷ JType → Boolean
isJUint j = case j of
  JUint -> true
  _ -> false

isJInt ∷ JType → Boolean
isJInt j = case j of
  JInt -> true
  _ -> false

object ∷ String → JsonObj
object name = JsonObj name []

field :: String -> JType -> JsonObj -> JsonObj
field n t (JsonObj jn jf) = JsonObj jn $ jf <> [ JField n t ]

type AsFunction =
  { decl :: Lines
  , call :: JFields -> String
  , callRaw :: Array String -> String
  , fields :: Maybe JFields
  , name :: String
  }

getDecl :: AsFunction -> Lines
getDecl { decl } = decl

-- | Get a unique list of inner types from all array types in the list of fields
uniqueArrayTypes :: JFields -> Array JType
uniqueArrayTypes = Array.mapMaybe getArrayType >>> unique

  where

  getArrayType (JField _ (JArray t)) = Just t
  getArrayType _ = Nothing

  unique :: Array JType -> Array JType
  unique = Array.foldl (\tys t -> if Array.elem t tys then tys else Array.snoc tys t) []
