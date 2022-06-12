module Mixins.TEMPLATE where

import Prelude
import Mixins.Types (Mixin)
import Data.Maybe (Maybe(..))

mxTEMPLATE :: Mixin
mxTEMPLATE =
  { name: "TEMPLATE"
  , requires: []
  , comprisingRequires: []
  , methods: Nothing
  , properties: Nothing
  , namespace: Nothing
  , tests: Nothing
  }

{-|

  Writing tests

  Pointers:
  - set Mixin.tests to `Just $ genTests allTestGenerators`
  - `allTestGenerators :: TestGenerators`
  - use `genTestArgs`, `jTyToAsTy`, and other util functions to generate common elements
  - use `wrapMainTest` for the main test function
  - define checker functions that take specific arguments via `genTestArgs fields`

  Example:
  ```purescript
    test_GettersMatch :: TestGenerator
    test_GettersMatch ms o@(JsonObj objName fields) = { fnName, ls }
      where
      ls = intercalate ln [ checkerDecl, mainTestDecl ]

      fnCheckerName = "Test_CheckProps_" <> objName

      fnName = "UnitTest_" <> objName <> "_" <> ms.currMixin

      checkerDecl =
        wrapFunction "bool" fnCheckerName (jfieldToAsArg <$> fields)
          $ [ objTy <> " tmp = " <> objName <> "(" <> joinWith ", " args <> ");" ]
          <> (checkFieldAgainstTmp <$> fields)
          <> [ "return true;" ]

      mainTestDecl =
        wrapMainTest fnName
          $ (\testArgs -> fnCheckerName <> "(" <> testArgs <> ");")
          <$> allTestArgs

      allTestArgs = genTestArgs fields

      objTy = jTyToAsTy (JObject o)

      args = fields <#> \(JField n _) -> n

      checkFieldAgainstTmp (JField n t) = "assert(" <> n <> " == " <> "tmp." <> n <> ", 'field " <> n <> assertMsgWithValue n t <> "');"

      assertMsgWithValue n t =
        if t == JString || not (isJTypeStrWrapped t) then
          " with value `' + " <> n <> " + '`"
        else if priorsIncludeRowSz && isJObject t then
          " with value `' + " <> n <> ".ToRowString() + '`"
        else
          ""

      priorsIncludeRowSz = elem _MX_ROW_SZ_NAME ms.priorMixins
  ```

|-}
