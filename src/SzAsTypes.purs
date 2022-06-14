module SzAsTypes where

import Prelude
import AsTypes (jTyToAsTy)
import Data.Array as A
import Data.String (Pattern(..), Replacement(..), replace)
import Partial.Unsafe (unsafeCrashWith)
import Types (JType(..), JsonObj(..))

jValToStr :: JType -> String -> String
jValToStr JInt n = "'' + " <> n

jValToStr JUint n = "'' + " <> n

jValToStr JNumber n = "'' + " <> n

jValToStr JBool n = "'' + " <> n

jValToStr JString n = "TRS_WrapString(" <> n <> ")"

jValToStr (JArray t) n = "TRS_WrapString(" <> trs_arrayFnName t <> "(" <> n <> "))"

jValToStr (JObject _) n = "TRS_WrapString(" <> n <> ".ToRowString())"

jValToStr JNull _n = "null"

jValToStr (JDict _) n = unsafeCrashWith "jValToStr JDict not impl"

isJTypeStrWrapped :: JType -> Boolean
isJTypeStrWrapped t = not $ A.elem t [ JNull, JNumber, JUint, JInt ]

jValFromStr :: JType -> String -> String
jValFromStr JString var = var

jValFromStr JInt var = "Text::ParseInt(" <> var <> ")"

jValFromStr JUint var = "Text::ParseInt(" <> var <> ")"

jValFromStr JNumber var = "Text::ParseFloat(" <> var <> ")"

jValFromStr JBool var = "('true' == " <> var <> ".ToLower())"

jValFromStr JNull var = unsafeCrashWith $ "Cannot parse null from text. Var name: " <> var <> ""

jValFromStr (JObject (JsonObj n _)) var = n <> "::FromRowString(" <> var <> ")"

jValFromStr (JArray t) var = frs_arrayFnName t <> "(" <> var <> ")"

jValFromStr (JDict _) n = unsafeCrashWith "jValFromStr JDict not impl"

frs_arrayFnName :: JType -> String
frs_arrayFnName arrTy = "FRS_Array_" <> replace (Pattern "@") (Replacement "") (jTyToAsTy arrTy)

trs_arrayFnName :: JType -> String
trs_arrayFnName arrTy = "TRS_Array_" <> replace (Pattern "@") (Replacement "") (jTyToAsTy arrTy)
