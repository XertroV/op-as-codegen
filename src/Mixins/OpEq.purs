module Mixins.OpEq where

import Prelude
import AsTypes (jTyToAsTy)
import CodeLines (fnCall, forLoopArray, indent, ln, wrapFunction, wrapFunction', wrapIf, wrapMainTest, wrapTestFn)
import Data.Array (catMaybes, intercalate)
import Data.Maybe (Maybe(..))
import Mixins (mixinTestFnName)
import Mixins.AllMixins (_MX_OP_EQ_NAME)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Getters (mxGetters)
import Mixins.Testing.Gen (genTestArgs, genTests)
import Mixins.ToString (mxToString)
import Mixins.Types (Mixin, TestGenerators, TestGenerator)
import Types (JField(..), JType(..), JsonObj(..), Lines, getFName)

mxOpEq :: Mixin
mxOpEq =
  { name: _MX_OP_EQ_NAME
  , requires: [ mxDefaultProps.name, mxGetters.name, mxToString.name ]
  , comprisingRequires: []
  , methods: Just opEqMethods
  , properties: Nothing
  , namespace: Nothing
  , tests: Just $ genTests opEqTests
  }

opEqMethods :: JsonObj -> Lines
opEqMethods (JsonObj name fields) = intercalate ln [ opEqFn.decl ]
  where
  opEqFn =
    wrapFunction' "bool" "opEquals" [ "const " <> name <> "@ &in other" ]
      $ wrapIf "other is null" [ "return false; // this obj can never be null." ]
      <> declAnyArrayEqs
      <> [ "return true" ]
      <> indent 1 ((fieldEqLine <$> fields) <> [ ";" ])

  fieldEqLine (JField n t) = case t of
    (JArray arrTy) -> "&& " <> tmpArrEqVar n
    _ -> "&& _" <> n <> " == other." <> n -- assume defualt prop names (prepended with _)

  tmpArrEqVar n = "_tmp_arrEq_" <> n

  declAnyArrayEqs = intercalate [] $ catMaybes $ tmpArrEqFor <$> fields

  tmpArrEqFor (JField n j) = case j of
    (JArray t) ->
      Just
        $ [ "bool " <> tmpArrEqVar n <> " = _" <> n <> ".Length == other." <> n <> ".Length;"
          ]
        <> forLoopArray "i" ("_" <> n)
            ( wrapIf ("!" <> tmpArrEqVar n) [ "break;" ]
                <> [ tmpArrEqVar n <> " = " <> tmpArrEqVar n <> " && (_" <> n <> "[i] == other." <> n <> "[i]);" ]
            )
    _ -> Nothing

-- intercalate ln $ fieldToGetter <$> fields
opEqTests :: TestGenerators
opEqTests = [ testOpEqSimple ]

testOpEqSimple :: TestGenerator
testOpEqSimple ms o@(JsonObj name fs) = { fnName, ls }
  where
  fnName = mixinTestFnName "OpEqSimple" name

  checkerFn =
    wrapTestFn "OpEqSimple_Check" fs
      [ objTy <> " o1 = " <> fnCall name args <> ";"
      , objTy <> " o2 = " <> fnCall name args <> ";"
      , "assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());"
      , "assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');"
      , "@lastChecked = o1;"
      , "return true;"
      ]

  objTy = jTyToAsTy (JObject o)

  args = fs <#> getFName

  allTestArgs = genTestArgs 3547756 fs

  mainFn =
    wrapMainTest fnName
      $ (\testArgs -> checkerFn.callRaw testArgs <> ";")
      <$> allTestArgs

  props = [ objTy <> " lastChecked = null;" ]

  ls = intercalate ln [ props, checkerFn.decl, mainFn.decl ]
