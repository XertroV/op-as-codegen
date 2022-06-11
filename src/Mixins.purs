module Mixins where

import CodeLines
import Prelude
import Types
import Data.Array (catMaybes, foldl, intercalate)
import Data.Maybe (Maybe(..))
import Mixins.Types (Mixin)

type MixinState
  = { out :: Array (Maybe (Array String)), priorMixins :: Array String }

-- | add a mixin
addMixinMethods :: JsonObj -> MixinState -> Mixin -> MixinState
addMixinMethods obj ({ out, priorMixins }) ({ methods, name }) =
  { out: out <> [ methods <#> \f -> comment ("Methods // Mixin: " <> name) <> f obj ]
  , priorMixins: priorMixins <> [ name ]
  }

-- addMixinMethods _ ({ out, priorMixins }) ({ methods: Nothing, name }) = { out, priorMixins: priorMixins <> [ name ] }
runMixinMethods :: JsonObj -> Array Mixin -> Array String
runMixinMethods obj mixins = intercalate ln $ catMaybes (foldl (addMixinMethods obj) { out: [], priorMixins: [] } mixins).out

addMixinProperties :: JsonObj -> MixinState -> Mixin -> MixinState
addMixinProperties obj (s@{ out }) ({ properties, name }) = s { out = out <> [ properties <#> \f -> comment ("Properties // Mixin: " <> name) <> f obj ] }

-- addMixinProperties _ s ({ properties: Nothing }) = s
runMixinProperties :: JsonObj -> Array Mixin -> Array String
runMixinProperties obj mixins = intercalate ln $ catMaybes (foldl (addMixinProperties obj) { out: [], priorMixins: [] } mixins).out

addMixinNamespaces :: JsonObj -> MixinState -> Mixin -> MixinState
addMixinNamespaces obj (s@{ out }) ({ namespace, name }) = s { out = out <> [ namespace <#> \f -> comment ("Namespace // Mixin: " <> name) <> f obj ] }

-- addMixinNamespaces _ s ({ namespace: Nothing }) = s
runMixinNamespaces :: JsonObj -> Array Mixin -> Array String
runMixinNamespaces obj mixins = intercalate ln $ catMaybes (foldl (addMixinNamespaces obj) { out: [], priorMixins: [] } mixins).out
