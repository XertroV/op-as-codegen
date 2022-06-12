module Utils where

import Prelude
import Data.String (Pattern(..), Replacement(..))
import Data.String as S

noSpaces ∷ String → String
noSpaces = S.replaceAll (Pattern " ") (Replacement "")
