module CodeLines where

import AsTypes
import Prelude
import Types
import Data.Array (intercalate, replicate, zip)
import Data.String (joinWith)
import Data.Tuple (Tuple(..))

ln ∷ Array String
ln = [ "" ]

clsStart ∷ String → Array String
clsStart name = [ "class " <> name <> " {" ]

clsEnd ∷ Array String
clsEnd = [ "}" ]

-- | make a comment line
comment ∷ String → Array String
comment s = [ "/* " <> s <> " */" ]

{-|
    Make a private class property.
|-}
mkClsProp :: JField -> String
mkClsProp (JField n t) = "private " <> jTyToAsTy t <> " " <> n <> ";"

{-|
    Make a class constructor that sets all properties.
|-}
mkClsConstructor :: String -> Array JField -> Array String
mkClsConstructor name fields = [ start ] <> body <> [ end ]
  where
  start = name <> "(" <> intercalate ", " args <> ") {"

  end = "}"

  propFields = toPropFields fields

  args = (\(JField n t) -> jTyToFuncArg t <> " " <> n) <$> fields

  body = indent 1 $ setProps

  setProps = setProp <$> zip propFields fields

  setProp (Tuple (JField n1 _) (JField n2 _)) = "this." <> n1 <> " = " <> n2 <> ";"

-- | indent all lines by some number of rpeated double-spaces (i.e., `  `)
indent :: Int -> Array String -> Array String
indent n lines = (\l -> _whitespace <> l) <$> lines
  where
  _whitespace = joinWith "" $ replicate n "  "

fieldPrepend :: String -> JField -> JField
fieldPrepend s (JField n t) = JField (s <> n) t

toPropFields :: Array JField -> Array JField
toPropFields fields = fieldPrepend "_" <$> fields
