module Mixins.RowSz
  ( mxRowSz
  ) where

import Prelude
import CodeLines (indent, ln, toPropFields)
import Data.Array (intersperse, intercalate)
import Data.Maybe (Maybe(..))
import Mixins.Types (Mixin)
import Types (JField(..), JType(..), JsonObj(..))

mxRowSz :: Mixin
mxRowSz =
  { name: "Row Serializaiton"
  , requires: ["DefaultProps"]
  , properties: Nothing
  , methods: Just $ \(JsonObj objName fields) -> wrapFunction "const string ToRowString()" (toRowString fields)
  , namespace: Just $ \(JsonObj objName fields) -> wrapNamespace objName [ wrapFunction (objName <> " FromRowString(const string &in str)") (fromRowString objName fields) ]
  }

wrapNamespace :: String -> Array (Array String) -> Array String
wrapNamespace nsName lines = [ "namespace " <> nsName <> " {" ] <> (indent 1 $ intercalate ln lines) <> [ "}" ]

wrapFunction :: String -> Array String -> Array String
wrapFunction funcSig lines = [ funcSig <> " {" ] <> indent 1 lines <> [ "}" ]

toRowString :: Array JField -> Array String
toRowString fields =
  [ "string ret = \"\";" ]
    <> intercalate ln [ (_ <> " + \",\";") <$> appendRet <$> propFields ]
    <> [ "return ret;" ]
  where
  propFields = toPropFields fields

appendRet :: JField -> String
appendRet (JField n t) = "ret += " <> jValToStr t n

jValToStr :: JType -> String -> String
jValToStr JInt n = "'' + " <> n

jValToStr JUint n = "'' + " <> n

jValToStr JNumber n = "'' + " <> n

jValToStr JString n = n

jValToStr (JArray _) _n = "todo sz array"

jValToStr (JObject _) n = "todo sz object -- " <> n <> ".ToRowString()"

jValToStr JNull _n = "null"

fromRowString :: String -> _ -> Array String
fromRowString name fields = [ "return " <> name <> "(Json::Object());" ]
