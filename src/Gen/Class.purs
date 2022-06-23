module Gen.Class
  ( AsClass
  , ClsWithObj
  , jsonObjToClass
  ) where

import CodeLines
import Mixins
import Prelude
import Data.Array (all, elem, foldl, intercalate)
import Data.Array as A
import Data.Foldable (and)
import Mixins.JMaybes (mxJMaybes)
import Mixins.Types (Mixin)
import Partial.Unsafe (unsafeCrashWith)
import Types (JFields, JsonObj(..), Lines, getFTy, isJMaybe)

-- can just do AsClass now b/c it includes the orig object
type ClsWithObj
  = { cls :: AsClass, obj :: JsonObj }

type AsClass
  = { mainFile :: Lines, testFile :: Lines, mixins :: Array Mixin, name :: String, obj :: JsonObj }

jsonObjToClass :: JsonObj -> Array AsClass -> (Array Mixin) -> AsClass
jsonObjToClass obj@(JsonObj name _fields) comprisingClasses mixins = retFinal
  where
  retFinal = retCheckComprising

  -- retCheckJNull = if checkJNullMixins _fields mixins then retCheckComprising else unsafeCrashWith "Object contains JMaybe but doesn't have the mxJMaybes mixin"
  retCheckComprising = if mixinsCheckComprising name mixins comprisingClasses then retInitUnsafe else unsafeCrashWith "mixinCheckComprising error (note: it should crash first)"

  retInitUnsafe = { mainFile, testFile, mixins, name, obj }

  -- todo: check that comprisingClasses satisfy requirements of mixins (e.g., OpEq will require that any comprisingClasses implement OpEq)
  mainFile =
    -- wrapNamespace clsNs [ clsStart name, clsBody, clsEnd ]
    --   <> ln
    --   <> clsExportFromNamespace name clsNs name
    intercalate [] [ clsStart name, clsBody, clsEnd ]
      <> ln
      <> mixinNamespaces
    where
    -- clsNs = ("_" <> name)
    clsNs = name

  testFile = mixinTests

  clsBody = indent 1 bodyLines

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

-- deprecated; mxJMaybes not run on classes with maybes now, but on the maybe classes themselves
checkJNullMixins :: JFields -> Array Mixin -> Boolean
checkJNullMixins fields mixins = not hasJMaybes || hasMxJMaybes
  where
  hasJMaybes = A.any (isJMaybe <<< getFTy) fields

  hasMxJMaybes = A.any (\m -> m.name == mxJMaybes.name) mixins
