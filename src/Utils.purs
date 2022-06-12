module Utils where

import Prelude
import Data.String (Pattern(..), Replacement(..))
import Data.String as S
import Data.Int (decimal, toStringAs)
import Data.Number.Format (toString)

noSpaces ∷ String → String
noSpaces = S.replaceAll (Pattern " ") (Replacement "")

intToStr ∷ Int → String
intToStr = toStringAs decimal

floatToStr ∷ Number → String
floatToStr = toString
