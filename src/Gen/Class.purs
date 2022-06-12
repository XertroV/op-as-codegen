module Gen.Class
  ( AsClass
  , jsonObjToClass
  ) where

import CodeLines
import Mixins
import Prelude
import Data.Array (all, elem, foldl, intercalate)
import Data.Foldable (and)
import Mixins.Types (Mixin)
import Partial.Unsafe (unsafeCrashWith)
import Types (JsonObj(..))

type AsClass
  = { mainFile :: String, testFile :: String, mixins :: Array Mixin, name :: String }

jsonObjToClass :: JsonObj -> Array AsClass -> (Array Mixin) -> AsClass
jsonObjToClass obj@(JsonObj name _fields) comprisingClasses mixins = if mixinsCheckComprising name mixins comprisingClasses then { mainFile, testFile, mixins, name } else unsafeCrashWith "mixinCheckComprising error (note: it should crash first)"
  where
  -- todo: check that comprisingClasses satisfy requirements of mixins (e.g., OpEq will require that any comprisingClasses implement OpEq)
  mainFile = intercalate "\n" $ clsStart name <> clsBody <> clsEnd <> ln <> mixinNamespaces

  testFile = intercalate "\n" mixinTests

  clsBody = indent 1 (bodyLines :: Array String)

  bodyLines =
    mixinProps <> ln
      <> mixinMethods.ls

  mixinMethods = runMixinMethods obj mixins

  mixinProps = runMixinProperties obj mixins

  mixinNamespaces = runMixinNamespaces obj mixins

  mixinTests = runMixinTests mixinMethods.mixinsRun obj mixins

-- | check that comprisingClasses satisfy predicates of mixins
mixinsCheckComprising :: String -> Array Mixin -> Array AsClass -> Boolean
mixinsCheckComprising className mixins comprisingClasses = and $ [ checkMixin ] <*> mixins <*> comprisingClasses
  where
  checkMixin mixin cc = and $ mixin.comprisingRequires <#> (\req -> if elem req ((_.name) <$> cc.mixins) then true else unsafeCrashWith ("Class " <> className <> " uses mixin " <> mixin.name <> " which requires that comprising classes implement the " <> req <> " mixin, " <> cc.name <> " does not."))
