module Mixins where

import Prelude
import CodeLines (comment, ln, wrapCompilerIf, wrapNamespace)
import Data.Array (all, any, catMaybes, elem, foldl, intercalate)
import Data.Array as A
import Data.String (joinWith)
import Mixins.Types (Mixin, MixinState, PriorMixins)
import Partial.Unsafe (unsafeCrashWith)
import Types (JsonObj(..))

initDefaultMixinState :: MixinState
initDefaultMixinState = { out: [], priorMixins: [], currMixin: "" }

-- | add a mixin
addMixinMethods :: JsonObj -> MixinState -> Mixin -> MixinState
addMixinMethods obj@(JsonObj objName _) (ms@{ out, priorMixins }) ({ methods, name, requires }) =
  if all priorsContain requires then
    if not (elem name priorMixins) then res else unsafeCrashWith ("Mixin has already run: " <> name <> " (priors: " <> priorsStr <> ")")
  else
    unsafeCrashWith
      ( "Mixin dependency error for object: "
          <> objName
          <> ". "
          <> name
          <> " Requires ["
          <> joinWith ", " requires
          <> "] -- but only these mixins have run: "
          <> priorsStr
      )
  where
  priorsContain m = elem m priorMixins

  priorsStr = "[" <> joinWith ", " priorMixins <> "]"

  res =
    ms
      { out = out <> [ methods <#> \f -> comment ("Methods // Mixin: " <> name) <> f obj ]
      , priorMixins = priorMixins <> [ name ]
      }

runMixinMethods :: JsonObj -> Array Mixin -> { mixinsRun :: PriorMixins, ls :: Array String }
runMixinMethods obj mixins = { ls: intercalate ln $ catMaybes finalState.out, mixinsRun: finalState.priorMixins }
  where
  finalState = foldl (addMixinMethods obj) initDefaultMixinState mixins

addMixinProperties :: JsonObj -> MixinState -> Mixin -> MixinState
addMixinProperties obj (s@{ out }) ({ properties, name }) = s { out = out <> [ properties <#> \f -> comment ("Properties // Mixin: " <> name) <> f obj ] }

runMixinProperties :: JsonObj -> Array Mixin -> Array String
runMixinProperties obj mixins = intercalate ln $ catMaybes (foldl (addMixinProperties obj) initDefaultMixinState mixins).out

addMixinNamespaces :: JsonObj -> MixinState -> Mixin -> MixinState
addMixinNamespaces obj (s@{ out }) ({ namespace, name }) = s { out = out <> [ namespace <#> \f -> comment ("Namespace // Mixin: " <> name) <> f obj ] }

runMixinNamespaces :: JsonObj -> Array Mixin -> Array String
runMixinNamespaces obj@(JsonObj objName _) mixins = wrapNS $ catMaybes (foldl (addMixinNamespaces obj) initDefaultMixinState mixins).out
  where
  wrapNS ls = if A.length ls > 0 then wrapNamespace objName ls else []

addMixinTests :: JsonObj -> MixinState -> Mixin -> MixinState
addMixinTests obj (s@{ out }) ({ tests, name }) = s { out = out <> [ tests <#> \f -> comment ("Test // Mixin: " <> name) <> f (s { currMixin = name }) obj ] }

-- addMixinNamespaces _ s ({ namespace: Nothing }) = s
runMixinTests :: PriorMixins -> JsonObj -> Array Mixin -> Array String
runMixinTests priorMixins obj@(JsonObj n _) mixins = wrapCompilerIf "UNIT_TEST" $ wrapNamespace ("Test_" <> n) $ catMaybes (foldl (addMixinTests obj) (initDefaultMixinState { priorMixins = priorMixins }) mixins).out

-- | make a name for a primary mixin test function
mixinTestFnName ∷ String → String → String
mixinTestFnName desc objName = intercalate "_" [ "UnitTest", desc, objName ]
