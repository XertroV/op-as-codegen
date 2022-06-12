module Mixins.Testing.Gen where

import Prelude
import CodeLines (indent, ln)
import Control.Monad.Rec.Class (Step(..), tailRec)
import Data.Array (foldl, intercalate)
import Data.Array as A
import Data.DateTime.Instant (unInstant)
import Data.Int (decimal, round, toStringAs)
import Data.Newtype (unwrap)
import Data.Number.Format (toString)
import Data.String (Pattern(..), Replacement(..), joinWith)
import Data.String as S
import Data.String.Base64 as B64
import Data.Traversable (sequence)
import Data.Tuple (Tuple(..))
import Effect.Now (now)
import Effect.Unsafe (unsafePerformEffect)
import Mixins.Types (RunTestGenerators, TestGenerators)
import Random.LCG (mkSeed)
import Test.QuickCheck (arbitrary)
import Test.QuickCheck.Gen (Gen, GenState, chooseInt, runGen, suchThat, vectorOf)
import Types (JField(..), JFields, JType(..), JsonObj(..), Lines)
import Utils (noSpaces)

nTestsToRun :: Int
nTestsToRun = 20

-- for the moment use a deterministic seed so that we know what inputs we get
-- initSeed = round $ (unsafePerformEffect $ (unwrap <<< unInstant) <$> now)
-- initSeed ∷ Int
-- initSeed = 1
--
genTests :: TestGenerators -> RunTestGenerators
genTests allTestGenerators ms obj@(JsonObj name _) = allTestsFunctions <> ln <> testResult
  where
  allTestsInfo = allTestGenerators <*> [ ms ] <*> [ obj ]

  allTestsFunctions = intercalate ln $ (\r -> r.ls) <$> allTestsInfo

  allTestsNames = allTestsInfo <#> \r -> r.fnName

  testResult =
    [ "bool unitTestResults_" <> name <> "_" <> noSpaces ms.currMixin <> " = true" ]
      <> indent 1 ((allTestsNames <#> \fnName -> "&& " <> fnName <> "()") <> [ ";" ])

-- | each mixin calling genTestArgs should choose a different initSeed Int.
-- | Smash the numpad or use the current unix time if you need a suggestion.
genTestArgs :: Int -> JFields -> Array String
genTestArgs initSeed fields = tailRec (genTestArgLoop nTestsToRun fields) { gs: { newSeed: mkSeed initSeed, size: 10 }, out: [] }

type GenTestArgLoopState
  = { gs :: GenState, out :: Array String }

genTestArgLoop :: Int -> JFields -> GenTestArgLoopState -> Step GenTestArgLoopState Lines
genTestArgLoop nTimes fields { gs, out }
  | A.length out >= nTimes = Done out
  | otherwise = Loop { gs: gs { newSeed = s.newSeed }, out: out <> [ val ] }
    where
    (Tuple val s) = (flip runGen gs) $ arbitraryFromFields fields

arbitraryFromFields :: JFields -> Gen (String)
arbitraryFromFields fields = (joinWith ", ") <$> (sequence $ arbitraryFromJType <$> (\(JField _n t) -> t) <$> fields)

intToStr ∷ Int → String
intToStr = toStringAs decimal

floatToStr ∷ Number → String
floatToStr = toString

arbitraryFromJType :: JType -> Gen String
arbitraryFromJType JInt = (arbitrary :: Gen Int) <#> intToStr

arbitraryFromJType JUint = (arbitrary :: Gen Int) `suchThat` (_ >= 0) <#> intToStr

arbitraryFromJType JNumber = (arbitrary :: Gen Number) <#> floatToStr

arbitraryFromJType JNull = (arbitrary :: Gen Unit) <#> (\_ -> "NULL")

-- helpful to add for debug mb: <#> B64.encode
arbitraryFromJType JString = (arbitrary :: Gen String) `suchThat` (S.contains (Pattern "\"") >>> not) <#> (\s -> "\"" <> s <> "\"")

arbitraryFromJType (JArray t) = (chooseInt 0 10) >>= (\i -> vectorOf i (arbitraryFromJType t)) <#> (\vs -> "{" <> joinWith ", " vs <> "}")

arbitraryFromJType (JObject (JsonObj name fields)) = gens <#> (\fs -> name <> "(" <> fs <> ")")
  where
  gens = arbitraryFromFields fields
