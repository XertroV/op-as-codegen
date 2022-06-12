module Mixins.Types where

import Prelude
import Data.Maybe (Maybe)
import Types (JsonObj, Lines)

type PriorMixins
  = Array String

-- | when running mixins this will track output
type MixinState
  = { out :: Array (Maybe (Array String)), priorMixins :: PriorMixins, currMixin :: String }

-- | produce more lines to add to the class
type Mixin
  = { name :: String
    , requires :: Array String -- mixins that are required before this one
    , comprisingRequires :: Array String -- mixins that are required of classes that are properties of the class we're mixin in with
    , properties :: Maybe (JsonObj -> Lines)
    , methods :: Maybe (JsonObj -> Lines)
    , namespace :: Maybe (JsonObj -> Lines)
    , tests :: Maybe RunTestGenerators
    }

-- | types for generating tests
type TestGenOut
  = { fnName :: String, ls :: Lines }

type TestGenerator
  = MixinState -> JsonObj -> TestGenOut

type TestGenerators
  = Array TestGenerator

type RunTestGenerators
  = MixinState -> JsonObj -> Lines
