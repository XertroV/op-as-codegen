module AsTypes where

import Prelude
import Data.Array as A
import Data.Maybe (fromMaybe)
import Data.String (toUpper)
import Data.String as S
import Data.String.Utils (charAt)
import Partial.Unsafe (unsafeCrashWith)
import Types (JType(..), JsonObj(..))

-- | Angelscript equiv of json types
-- todo: add uint support
jTyToAsTy :: JType -> String
jTyToAsTy JInt = "int"

jTyToAsTy JUint = "uint"

jTyToAsTy JString = "string"

jTyToAsTy JNumber = "float"

jTyToAsTy JBool = "bool"

jTyToAsTy JNull = unsafeCrashWith "jTyToAsTy NULL BAD"

jTyToAsTy (JArray t) = "array<" <> jTyToAsTy t <> ">"

jTyToAsTy (JObject (JsonObj n _fs)) = n <> "@"

jTyToAsTy (JDict t) = "dictionary@"

-- | sometimes we want function arguments to be slightly modified versions of what they'd be otherwise, e.g., const string &in
jTyToFuncArg :: JType -> String
jTyToFuncArg JString = "const string &in"

jTyToFuncArg (JArray ty) = "const " <> jTyToAsTy ty <> "[] &in"

jTyToFuncArg (JDict _ty) = "const dictionary@"

jTyToFuncArg j = jTyToAsTy j

-- | A JType as a return type.
jTyToFuncRes :: JType -> String
jTyToFuncRes JString = "const string"

jTyToFuncRes (JArray ty) = "const " <> jTyToAsTy ty <> "[]@"

jTyToFuncRes (JDict _ty) = "const dictionary@"

jTyToFuncRes j = jTyToAsTy j

-- | return type names in a way suitable for dynamically injecting into class/function names
jTyPascalCase :: JType -> String
jTyPascalCase ty = case ty of
  (JArray ty') -> "ArrayOf" <> jTyPascalCase ty'
  (JObject (JsonObj n _)) -> n
  _ -> jTyToAsTy ty # \s -> toUpper (charAt 0 s # fromMaybe "") <> fromMaybe "" (S.uncons s <#> \u -> u.tail)

-- | Is this a type that we should reference when setting?
jTySetAsRef :: JType -> Boolean
jTySetAsRef JInt = false

jTySetAsRef JUint = false

jTySetAsRef JString = false

jTySetAsRef JNumber = false

jTySetAsRef JBool = false

jTySetAsRef JNull = false

jTySetAsRef (JArray _) = false

jTySetAsRef _ = true

-- | When casting might be required, should we?
-- | (alternative is to wrap like string(x), int(x), etc)
jTyShouldCast :: JType -> Boolean
jTyShouldCast (JArray _) = true

jTyShouldCast t = jTySetAsRef t

-- | returns either cast<T@> or T --
castOrWrap ∷ JType → String → String
castOrWrap t v = (if jTyShouldCast t then "cast<" <> jTyToAsTy t <> ">" else jTyToAsTy t) <> "(" <> v <> ")"

-- | default values for jtypes
jTyDefaultVal :: JType -> String
jTyDefaultVal JNull = unsafeCrashWith "jTyDefaultVal NULL BAD"

jTyDefaultVal JInt = "0"

jTyDefaultVal JUint = "0"

jTyDefaultVal JNumber = "0"

jTyDefaultVal JBool = "false"

jTyDefaultVal JString = "''"

jTyDefaultVal (JArray t) = "{}" -- "array<" <> <> ">()"

jTyDefaultVal (JObject (JsonObj n fs)) = if A.length fs == 0 then n <> "()" else unsafeCrashWith "unimpl: default value for JObjs"

jTyDefaultVal (JDict t) = "dictionary()"
