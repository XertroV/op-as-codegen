module Mixins.Getters
  ( mxGetters
  ) where

import AsTypes
import Mixins.Types
import Prelude
import Types
import CodeLines (fieldsToAsArgs, indent, jfieldToAsArg, ln, wrapFunction, wrapIf, wrapMainTest)
import Data.Array (elem, intercalate)
import Data.Maybe (Maybe(..))
import Data.String (joinWith)
import Mixins.AllMixins (_MX_GETTERS_NAME, _MX_ROW_SZ_NAME)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Testing.Gen (genTestArgs, genTests)
import Mixins.Types (TestGenerators, TestGenerator)
import SzAsTypes (isJTypeStrWrapped)

mxGetters :: Mixin
mxGetters =
  { name: _MX_GETTERS_NAME
  , requires: [ mxDefaultProps.name, mxCommonTesting.name ]
  , comprisingRequires: []
  , methods:
      Just
        $ \(JsonObj _name fields) -> intercalate ln $ fieldToGetter <$> fields
  , properties: Nothing
  , namespace: Nothing
  , tests: Just $ genTests allTestGenerators
  }

fieldToGetter :: JField -> Lines
fieldToGetter (JField n t) =
  [ jTyToFuncRes t <> " get_" <> n <> "() const {"
  , "  return this._" <> n <> ";" -- default props prefix with `_`
  , "}"
  ]

allTestGenerators :: TestGenerators
allTestGenerators = [ test_GettersMatch ]

test_GettersMatch :: TestGenerator
test_GettersMatch ms o@(JsonObj objName fs) = { fnName, ls }
  where
  ls = intercalate ln [ checkerFn.decl, mainTestFn.decl ]

  fnCheckerName = "Test_CheckProps_" <> objName

  fnName = "UnitTest_" <> objName <> "_" <> ms.currMixin

  checkerFn =
    wrapFunction "bool" fnCheckerName fs
      $ [ objTy <> " tmp = " <> objName <> "(" <> joinWith ", " args <> ");" ]
      <> (checkFieldAgainstTmp <$> fs)
      <> [ "return true;" ]

  mainTestFn =
    wrapMainTest fnName
      $ (\testArgs -> checkerFn.callRaw testArgs <> ";")
      <$> allTestArgs

  allTestArgs = genTestArgs 1 fs

  objTy = jTyToAsTy (JObject o)

  args = fs <#> \(JField n _) -> n

  checkFieldAgainstTmp (JField n t) = "assert(" <> n <> " == " <> "tmp." <> n <> ", 'field " <> n <> assertMsgWithValue n t <> "');"

  assertMsgWithValue n t =
    if t == JString || not (isJTypeStrWrapped t) then
      " with value `' + " <> n <> " + '`"
    else if priorsIncludeRowSz && isJObject t then
      " with value `' + " <> n <> ".ToRowString() + '`"
    else
      ""

  priorsIncludeRowSz = elem _MX_ROW_SZ_NAME ms.priorMixins
