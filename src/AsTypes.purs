module AsTypes where

import Prelude
import Types (JType(..))

-- | Angelscript equiv of json types
-- todo: add uint support
jTyToAsTy :: JType -> String
jTyToAsTy JInt = "int"

jTyToAsTy JUint = "uint"

jTyToAsTy JString = "string"

jTyToAsTy JNumber = "float"

jTyToAsTy JNull = "NULL BAD"

jTyToAsTy (JArray _) = "ARRAY TODO"

jTyToAsTy (JObject obj) = "OBJECT TODO"

-- | sometimes we want function arguments to be slightly modified versions of what they'd be otherwise, e.g., const string &in
jTyToFuncArg :: JType -> String
jTyToFuncArg JString = "const string &in"

jTyToFuncArg (JArray ty) = "const " <> jTyToAsTy ty <> "[] &in"

jTyToFuncArg j = jTyToAsTy j

jTyToFuncRes :: JType -> String
jTyToFuncRes JString = "const string"

jTyToFuncRes (JArray ty) = "const " <> jTyToAsTy ty <> "[]@"

jTyToFuncRes j = jTyToAsTy j
