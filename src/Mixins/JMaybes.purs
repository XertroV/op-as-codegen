module Mixins.JMaybes (mxJMaybes) where

import Prelude
import AsTypes (castOrWrap, jTyIsPrim, jTySetAsRef, jTyToAsTy, jTyToFuncRes)
import CodeLines (comment, indent, ln, stmt, toPropFields, wrapConstFunction, wrapFunction, wrapFunction', wrapIf, wrapIfElse)
import Data.Array (catMaybes, foldl, intercalate, zip)
import Data.Array as A
import Data.Array.Partial as P
import Data.Maybe (Maybe(..), fromJust)
import Data.String.Utils as S
import Data.Traversable (sequence)
import Data.Tuple (Tuple(..))
import Mixins.AllMixins (_MX_TO_FROM_JSON_OBJ_NAME)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.OpEq (mxOpEq)
import Mixins.RowSz (frs_genNamespace, mxRowSz)
import Mixins.Types (Mixin)
import Partial.Unsafe (unsafeCrashWith, unsafePartial)
import SzAsTypes (jValFromStr, jValToStr)
import Types (CodeBlocks, JField(..), JType(..), JsonObj(..), Lines, AsFunction, getDecl, getFTy)

-- this is to be mixed in with maybes only
mxJMaybes :: Mixin
mxJMaybes =
  { name: "JMaybes"
  , requires: []
  , comprisingRequires: [ mxOpEq.name, mxRowSz.name ]
  , methods: Just genMethods
  , properties: Nothing
  , namespace: Just genNamespace
  , tests: Nothing
  }

genMethods :: JsonObj -> Lines
genMethods (JsonObj name fields) = methods
  where
  methods = case (S.startsWith "MaybeOf" name) of
    false -> unsafeCrashWith $ "mxJMaybes run on a class that wasn't a maybe: " <> name
    true -> do
      intercalate ln $ map getDecl
        $ catMaybes
            [ consJust, consNothing, consJson, opEq, toRowStr, toJson ]
        <> (unsafePartial fromJust) getters

  getValTy = A.head fields <#> getFTy

  consJust = do
    fTy <- getValTy
    let
      setValStmt = stmt $ (if jTySetAsRef fTy then "@" else "") <> "_val = val"
    pure
      $ wrapFunction "" name [ JField "val" fTy ]
          [ "_hasVal = true;", setValStmt ]

  consNothing = do
    pure
      $ wrapFunction "" name []
          [ "_hasVal = false;" ]

  consJson = do
    fTy <- getValTy
    pure $ wrapFunction' "" name [ "const Json::Value &in j" ]
      $ wrapIfElse "j.GetType() % Json::Type::Null == 0"
          [ "_hasVal = false;" ]
          [ "_hasVal = true;", "_val = " <> castOrWrap fTy "j" <> ";" ]

  getters :: Maybe (Array AsFunction)
  getters = do
    fTy <- getValTy
    pure
      $ [ wrapConstFunction (jTyToFuncRes fTy) "get_val" []
            ( wrapIf "!_hasVal" [ "throw('Attempted to access .val of a Nothing');" ]
                <> [ "return _val;" ]
            )
        , wrapFunction (jTyToFuncRes fTy) "GetOr" [ JField "_default" fTy ]
            [ "return _hasVal ? _val : _default;" ]
        , wrapConstFunction "bool" "IsJust" [] [ "return _hasVal;" ]
        , wrapConstFunction "bool" "IsSome" [] [ "return IsJust();" ]
        , wrapConstFunction "bool" "IsNothing" [] [ "return !_hasVal;" ]
        , wrapConstFunction "bool" "IsNone" [] [ "return IsNothing();" ]
        ]

  opEq = do
    pure $ wrapFunction' "bool" "opEquals" [ "const " <> name <> "@ &in other" ]
      $ wrapIf "IsJust()" [ "return other.IsJust() && (_val == other.val);" ]
      <> [ "return other.IsNothing();" ]

  toRowStr = do
    fTy <- getValTy
    pure $ wrapFunction "const string" "ToRowString" []
      $ wrapIf "!_hasVal" [ "return 'null,';" ]
      <> [ "return " <> jValToStr fTy "_val" <> " + ',';" ]

  toJson = do
    fTy <- getValTy
    pure $ wrapFunction "Json::Value" "ToJson" []
      $ wrapIf "IsNothing()" [ "return Json::Value(); // json null" ]
      <> [ if jTyIsPrim fTy then
            "return Json::Value(_val);"
          else
            "return _val.ToJson();"
        ]

genNamespace :: JsonObj -> Lines
genNamespace (JsonObj objName fields) = frs.decl
  where
  fTy = getFTy $ unsafePartial $ P.head fields

  frs =
    wrapFunction' objName "FromRowString" [ "const string &in str" ]
      $ [ "string chunk = '', remainder = str;"
        , "array<string> tmp = array<string>(2);"
        , "uint chunkLen;"
        , "tmp = remainder.Split(',', 2);"
        , "chunk = tmp[0];"
        , "remainder = tmp[1]; // should always be ''"
        -- , "trace('FRS input: \"' + str + '\"');"
        ]
      <> wrapIf "chunk == 'null'" [ "return " <> objName <> "();" ]
      <> [ "return " <> objName <> "(" <> jValFromStr fTy "chunk" <> ");" ]
