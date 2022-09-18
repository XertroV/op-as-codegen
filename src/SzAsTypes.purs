module SzAsTypes where

import Prelude
import AsTypes (jTyPascalCase, jTyToAsTy)
import CodeLines (fnCall, jfieldToAsVar)
import Data.Array as A
import Data.String (Pattern(..), Replacement(..), joinWith, replace)
import Partial.Unsafe (unsafeCrashWith)
import Types (JField(..), JType(..), JsonObj(..))

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

jValToStr (JMaybe t) n = "TRS_WrapString(" <> n <> ".ToRowString())"

jValToStr ty n = unsafeCrashWith $ "jValToStr not implemented for " <> (jTyToAsTy ty)

isJTypeStrWrapped :: JType -> Boolean
isJTypeStrWrapped t = not $ A.elem t [ JNull, JNumber, JUint, JInt, JBool ]

jValFromStr :: JType -> String -> String
jValFromStr JString var = var

jValFromStr JInt var = "Text::ParseInt(" <> var <> ")"

jValFromStr JUint var = "Text::ParseInt(" <> var <> ")"

jValFromStr JNumber var = "Text::ParseFloat(" <> var <> ")"

jValFromStr JBool var = "('true' == " <> var <> ".ToLower())"

jValFromStr JNull var = unsafeCrashWith $ "Cannot parse null from text. Var name: " <> var <> ""

jValFromStr (JObject (JsonObj n _)) var = "_" <> n <> "::FromRowString(" <> var <> ")"

jValFromStr t'@(JMaybe t) var = "_" <> jTyPascalCase t' <> "::FromRowString(" <> var <> ")"

jValFromStr (JArray t) var = frs_arrayFnName t <> "(" <> var <> ")"

jValFromStr (JDict _) var = unsafeCrashWith "jValFromStr JDict not impl"

jValFromStr ty var = unsafeCrashWith $ "jValFromStr not implemented for " <> (jTyToAsTy ty)

frs_arrayFnName :: JType -> String
frs_arrayFnName arrTy = "FRS_Array_" <> replace (Pattern "@") (Replacement "") (jTyToAsTy arrTy)

trs_arrayFnName :: JType -> String
trs_arrayFnName arrTy = "TRS_Array_" <> replace (Pattern "@") (Replacement "") (jTyToAsTy arrTy)

stripRef ∷ String → String
stripRef = replace (Pattern "@") (Replacement "")

{- buffers -}
wtb_arrayFnName ∷ JType → String
wtb_arrayFnName arrTy = "WTB_Array_" <> stripRef (jTyPascalCase arrTy)

rfb_arrayFnName ∷ JType → String
rfb_arrayFnName arrTy = "RFB_Array_" <> stripRef (jTyPascalCase arrTy)

cbb_arrayFnName :: JType -> String
cbb_arrayFnName arrTy = "CBB_Array_" <> stripRef (jTyPascalCase arrTy)

jFieldToBuf :: String -> JField -> String
jFieldToBuf buf jf@(JField var ty) = case ty of
  JNull -> ""
  JInt -> buf <> ".Write(" <> var <> ")"
  JUint -> buf <> ".Write(" <> var <> ")"
  JNumber -> buf <> ".Write(" <> var <> ")"
  JBool -> buf <> ".Write(uint8(" <> var <> " ? 1 : 0))"
  JString -> "WTB_LP_String(" <> joinWith ", " [ buf, var ] <> ")"
  (JMaybe _) -> var <> ".WriteToBuffer(" <> buf <> ")"
  (JObject _) -> var <> ".WriteToBuffer(" <> buf <> ")"
  (JArray t) -> wtb_arrayFnName t <> "(" <> joinWith ", " [ buf, var ] <> ")"
  (JDict _) -> unsafeCrashWith "jFieldToBuf JDict not impl"
  _ -> unsafeCrashWith $ "jFieldToBuf not implemented for field: " <> (jfieldToAsVar jf)

jFieldCountBufBytes :: JField -> String
jFieldCountBufBytes jf@(JField var ty) = case ty of
  JNull -> "0"
  JInt -> "4"
  JUint -> "4"
  JNumber -> "4"
  JBool -> "1"
  JString -> "4 + " <> var <> ".Length"
  JDict _ -> unsafeCrashWith "jFieldCountBufBytes JDict not impl"
  JObject _ -> var <> ".CountBufBytes()"
  JMaybe _ -> var <> ".CountBufBytes()"
  JArray t -> fnCall (cbb_arrayFnName t) [ var ]
  _ -> unsafeCrashWith $ "jFieldCountBufBytes not implemented for field: " <> (jfieldToAsVar jf)

jTyFromBuf :: String -> JType -> String
jTyFromBuf buf ty = case ty of
  JNull -> ""
  JInt -> buf <> ".ReadInt32()"
  JUint -> buf <> ".ReadUInt32()"
  JNumber -> buf <> ".ReadFloat()"
  JBool -> buf <> ".ReadUInt8() > 0"
  JString -> "RFB_LP_String(" <> buf <> ")"
  (JMaybe _) -> "_" <> jTyPascalCase ty <> "::ReadFromBuffer(" <> buf <> ")"
  (JObject (JsonObj n _)) -> "_" <> n <> "::ReadFromBuffer(" <> buf <> ")"
  (JArray t') -> rfb_arrayFnName t' <> "(" <> buf <> ")"
  (JDict _) -> unsafeCrashWith "jFieldToBuf JDict not impl"
  _ -> unsafeCrashWith $ "jFieldCountBufBytes not implemented for type: " <> (jTyToAsTy ty)
