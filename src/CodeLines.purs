module CodeLines where

import AsTypes
import Prelude
import Types
import Data.Array (intercalate, replicate, zip)
import Data.String (joinWith)
import Data.String.Utils (startsWith)
import Data.Tuple (Tuple(..))

ln ∷ Lines
ln = [ "" ]

clsStart ∷ String → Lines
clsStart name = [ "class " <> name <> " {" ]

clsEnd ∷ Lines
clsEnd = [ "}" ]

-- | make a comment line
comment ∷ String → Lines
comment s = [ "/* " <> s <> " */" ]

{-|
    Make a private class property.
|-}
mkClsProp :: JField -> String
mkClsProp (JField n t) = "private " <> jTyToAsTy t <> " " <> n <> ";"

-- | turn a JField into an AngelScript function argument
jfieldToAsArg ∷ JField → String
jfieldToAsArg (JField n t) = jTyToFuncArg t <> " " <> n

-- | turn a [JField] into an AngelScript function arguments
fieldsToAsArgs ∷ Array JField → String
fieldsToAsArgs = intercalate ", " <<< map jfieldToAsArg

{-|
    Make a class constructor that sets all properties.
|-}
mkClsConstructor :: String -> Array JField -> Lines
mkClsConstructor name fields = [ start ] <> body <> [ end ]
  where
  start = name <> "(" <> fieldsToAsArgs fields <> ") {"

  end = "}"

  propFields = toPropFields fields

  body = indent 1 $ setProps

  setProps = setProp <$> zip propFields fields

  setProp (Tuple (JField n1 _) (JField n2 _)) = "this." <> n1 <> " = " <> n2 <> ";"

-- | indent all lines by some number of rpeated double-spaces (i.e., `  `)
indent :: Int -> Lines -> Lines
indent n lines = (\l -> if startsWith "#" l then l else _whitespace <> l) <$> lines
  where
  _whitespace = joinWith "" $ replicate n "  "

fieldPrepend :: String -> JField -> JField
fieldPrepend s (JField n t) = JField (s <> n) t

toPropFields :: Array JField -> Array JField
toPropFields fields = fieldPrepend "_" <$> fields

{-

  WRAPPERS FOR BLOCKS, e.g., namespaces, classes, ifs, while/for loops, etc.

-}
-- | wrap a block in compiler flags for 1 if statement only
-- | note: we don't indent this block (unlike the others)
wrapCompilerIf :: String -> Lines -> Lines
wrapCompilerIf flag ls = [ "#if " <> flag ] <> ls <> [ "#endif" ]

wrapNamespace :: String -> CodeBlocks -> Lines
wrapNamespace nsName lines = [ "namespace " <> nsName <> " {" ] <> (indent 1 $ intercalate ln lines) <> [ "}" ]

wrapInitedScope :: String -> Lines -> Lines
wrapInitedScope preScopeInit lines = [ preScopeInit <> " {" ] <> indent 1 lines <> [ "}" ]

wrapFunction :: String -> String -> Lines -> Lines -> Lines
wrapFunction ret name args = wrapInitedScope (ret <> " " <> name <> "(" <> joinWith ", " args <> ")")

wrapForLoop ∷ String → Lines → Lines
wrapForLoop p = wrapInitedScope ("for (" <> p <> ")")

wrapWhileLoop ∷ String → Lines → Lines
wrapWhileLoop p = wrapInitedScope ("while (" <> p <> ")")

wrapIf ∷ String → Lines → Lines
wrapIf c = wrapInitedScope ("if (" <> c <> ")")

wrapTwoScopes ∷ String → String → Lines → Lines → Lines
wrapTwoScopes pre mid s1 s2 = [ pre <> " {" ] <> indent 1 s1 <> [ "} " <> mid <> " {" ] <> indent 1 s2 <> [ "}" ]

wrapTryCatch :: Lines -> Lines -> Lines
wrapTryCatch = wrapTwoScopes "try" "catch"

-- | A nicer for loop api
forLoopArray :: String -> String -> Lines -> Lines
forLoopArray ixName arrName = wrapForLoop ("uint " <> ixName <> " = 0; " <> ixName <> " < " <> arrName <> ".Length; " <> ixName <> "++")
