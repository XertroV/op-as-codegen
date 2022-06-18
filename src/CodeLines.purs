module CodeLines where

import AsTypes
import Prelude
import Types
import Consts (nTestsToRun)
import Control.Alt ((<|>))
import Data.Array (intercalate, replicate, toUnfoldable, zip)
import Data.Array as A
import Data.List (List(..), (:))
import Data.List as L
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Data.String as S
import Data.String.Utils (startsWith)
import Data.Tuple (Tuple(..))
import Partial.Unsafe (unsafeCrashWith)
import Utils (intToStr)

ln ∷ Lines
ln = [ "" ]

stmt :: String -> String
stmt = flip (<>) ";"

clsStart ∷ String → Lines
clsStart name = [ "class " <> name <> " {" ]

clsEnd ∷ Lines
clsEnd = [ "}" ]

clsExportFromNamespace :: String -> String -> String -> Lines
clsExportFromNamespace name ns clsName = [ "class " <> name <> " : " <> ns <> "::" <> clsName <> " {}" ]

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

jfieldToAsVar :: JField -> String
jfieldToAsVar (JField n t) = jTyToAsTy t <> " " <> n

-- | a default value for a JField (mostly relevant for dictionaries, arrays, etc)
jFDefaultVal :: JField -> String
jFDefaultVal = getFTy >>> jTyDefaultVal

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

  setProp (Tuple (JField n1 t) (JField n2 _)) = ref <> "this." <> n1 <> " = " <> n2 <> ";"
    where
    ref = if jTySetAsRef t then "@" else ""

-- | indent all lines by some number of rpeated double-spaces (i.e., `  `)
indent :: Int -> Lines -> Lines
indent n lines = (\l -> if startsWith "#" l then l else _whitespace <> l) <$> lines
  where
  _whitespace = joinWith "" $ replicate n "  "

fieldPrepend :: String -> JField -> JField
fieldPrepend s (JField n t) = JField (s <> n) t

toPropFields :: Array JField -> Array JField
toPropFields fields = fieldPrepend "_" <$> fields

-- | testing helper
printTestSuccess ∷ String -> Int -> String
printTestSuccess fnName nTests = "print('\\\\$2f6Unit Test Success: " <> fnName <> " (" <> intToStr nTests <> " tests)');"

printTestStart ∷ String -> Int -> String
printTestStart fnName nTests = "print('\\\\$26fUnit Test Start: " <> fnName <> " (" <> intToStr nTests <> " tests)');"

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

wrapConstructor :: String -> JFields -> Lines -> AsFunction
wrapConstructor = wrapFunction ""

wrapFunction :: String -> String -> JFields -> Lines -> AsFunction
wrapFunction ret name args lines = wrapFunction'' ret name (Just args) (jfieldToAsArg <$> args) false lines

wrapConstFunction :: String -> String -> JFields -> Lines -> AsFunction
wrapConstFunction ret name args lines = wrapFunction'' ret name (Just args) (jfieldToAsArg <$> args) true lines

wrapFunction' :: String -> String -> Array String -> Lines -> AsFunction
wrapFunction' ret name args lines = wrapFunction'' ret name Nothing args false lines

wrapFunction'' :: String -> String -> Maybe JFields -> Array String -> Boolean -> Lines -> AsFunction
wrapFunction'' ret name fields args isConst lines = { decl, call, callRaw, fields }
  where
  decl = wrapInitedScope (ret' <> name <> "(" <> joinWith ", " args <> ")" <> mConst) lines

  ret' = if S.length ret == 0 then "" else ret <> " "

  call localFields = case (toUnfoldable <$> fields) >>= mismatchingFields (toUnfoldable localFields) of
    (Just _fs) -> unsafeCrashWith $ "Calling function " <> name <> " with incorrect types: " <> (intercalate ", " $ jfieldToAsArg <$> _fs)
    _ -> callRaw (getFName <$> localFields)

  -- callRaw inlineArgs = name <> "(" <> joinWith ", " inlineArgs <> ")"
  callRaw = fnCall name

  mConst = if isConst then " const" else ""

  -- | fs2 should be the expected field
  mismatchingFields :: List JField -> List JField -> Maybe (JFields)
  mismatchingFields (f1 : fs1) (f2 : fs2) = if (getFTy f1 == getFTy f2) then otherMismatch else appendMismatch f1
    where
    otherMismatch = mismatchingFields fs1 fs2

    appendMismatch f = (A.cons f) <$> (otherMismatch <|> Just [])

  mismatchingFields Nil Nil = Nothing

  mismatchingFields Nil fs2 = Just (L.toUnfoldable fs2)

  mismatchingFields fs1 Nil = Just (L.toUnfoldable fs1)

fnCall :: String -> Array String -> String
fnCall name args = name <> "(" <> joinWith ", " args <> ")"

wrapMainTest ∷ String → Array String → AsFunction
wrapMainTest name ls =
  wrapFunction "void" name []
    $ [ printTestStart name nTestsToRun ]
    <> ls
    <> [ printTestSuccess name nTestsToRun, "return;" ]

wrapForLoop ∷ String → Lines → Lines
wrapForLoop p = wrapInitedScope ("for (" <> p <> ")")

wrapWhileLoop ∷ String → Lines → Lines
wrapWhileLoop p = wrapInitedScope ("while (" <> p <> ")")

wrapIf ∷ String → Lines → Lines
wrapIf c = wrapInitedScope ("if (" <> c <> ")")

wrapTwoScopes ∷ String → String → Lines → Lines → Lines
wrapTwoScopes pre mid s1 s2 = [ pre <> " {" ] <> indent 1 s1 <> [ "} " <> mid <> " {" ] <> indent 1 s2 <> [ "}" ]

wrapIfElse :: String -> Lines -> Lines -> Lines
wrapIfElse c = wrapTwoScopes ("if (" <> c <> ")") "else"

wrapTryCatch :: Lines -> Lines -> Lines
wrapTryCatch = wrapTwoScopes "try" "catch"

wrapSQuotes :: String -> String
wrapSQuotes s = "'" <> s <> "'"

wrapDQuotes :: String -> String
wrapDQuotes s = "\"" <> s <> "\""

-- | A nicer for loop api
forLoopArray :: String -> String -> Lines -> Lines
forLoopArray ixName arrName = wrapForLoop ("uint " <> ixName <> " = 0; " <> ixName <> " < " <> arrName <> ".Length; " <> ixName <> "++")

-- | set a variable
setV :: JField -> String -> String
setV (JField n t) v = ref <> n <> " = " <> v <> ";"
  where
  ref = if jTySetAsRef t then "@" else ""
