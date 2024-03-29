module Mixins.Testing.Gen where

import Prelude
import AsTypes (jTyPascalCase, jTyToAsTy)
import CodeLines (indent, ln, wrapFunction, wrapInitedScope)
import Consts (nTestsToRun)
import Control.Monad.Rec.Class (Step(..), tailRec)
import Control.Monad.Trans.Class (lift)
import Data.Array (concat, foldl, intercalate, range)
import Data.Array as A
import Data.Array.NonEmpty as NEA
import Data.DateTime.Instant (unInstant)
import Data.Int (decimal, round, toStringAs)
import Data.Newtype (unwrap)
import Data.Number.Format (toString)
import Data.String (Pattern(..), Replacement(..), joinWith)
import Data.String as S
import Data.String.Base64 as B64
import Data.String.Utils (stripChars)
import Data.Traversable (sequence)
import Data.Tuple (Tuple(..))
import Effect.Now (now)
import Effect.Unsafe (unsafePerformEffect)
import Mixins.Types (RunTestGenerators, TestGenerators)
import Partial.Unsafe (unsafeCrashWith)
import Random.LCG (mkSeed)
import Test.QuickCheck (arbitrary)
import Test.QuickCheck.Gen (Gen, GenState, chooseInt, frequency, runGen, suchThat, vectorOf)
import Types (JField(..), JFields, JType(..), JsonObj(..), Lines)
import Utils (noSpaces, intToStr, floatToStr)

-- for the moment use a deterministic seed so that we know what inputs we get
-- initSeed = round $ (unsafePerformEffect $ (unwrap <<< unInstant) <$> now)
-- initSeed ∷ Int
-- initSeed = 1
--
genTests :: TestGenerators -> RunTestGenerators
genTests allTestGenerators ms obj@(JsonObj name _) = allTestsFunctions <> ln <> testResult
  where
  allTestsInfo = allTestGenerators <*> [ ms ] <*> [ obj ]

  allTestsFunctions = intercalate ln $ [ registerAll.decl ] <> ((\r -> r.ls) <$> allTestsInfo)

  allTestsNames = allTestsInfo <#> \r -> r.fnName

  uniqNameForTest = name <> "_" <> noSpaces ms.currMixin

  registerAll =
    wrapFunction "void" ("Tests_RegisterAll_" <> uniqNameForTest) []
      $ (allTestsNames <#> \fnName -> "RegisterUnitTest('" <> fnName <> "', " <> fnName <> ");")

  testResult = [ "bool unitTestResults_" <> uniqNameForTest <> " = runAsync(" <> registerAll.name <> ");" ]

-- | each mixin calling genTestArgs should choose a different initSeed Int.
-- | Smash the numpad or use the current unix time if you need a suggestion.
genTestArgs :: Int -> JFields -> Array (Array String)
genTestArgs initSeed fields = tailRec (genTestArgLoop nTestsToRun fields) { gs: { newSeed: mkSeed initSeed, size: 10 }, out: [] }

type GenTestArgLoopState = { gs :: GenState, out :: Array (Array String) }

genTestArgLoop :: Int -> JFields -> GenTestArgLoopState -> Step GenTestArgLoopState (Array Lines)
genTestArgLoop nTimes fields { gs, out }
  | A.length out >= nTimes = Done out
  | otherwise = Loop { gs: gs { newSeed = s.newSeed }, out: out <> [ val ] }
      where
      (Tuple val s) = (flip runGen gs) $ arbitraryFromFields fields

arbitraryFromFields :: JFields -> Gen (Array String)
arbitraryFromFields fields = sequence $ arbitraryFromJType <$> (\(JField _n t) -> t) <$> fields

arbitraryFromJType :: JType -> Gen String
arbitraryFromJType JInt = (arbitrary :: Gen Int) <#> intToStr

arbitraryFromJType JUint = (arbitrary :: Gen Int) `suchThat` (_ >= 0) <#> intToStr

arbitraryFromJType JNumber = (arbitrary :: Gen Number) <#> floatToStr

arbitraryFromJType JNull = (arbitrary :: Gen Unit) <#> (\_ -> "NULL")

arbitraryFromJType JBool = (arbitrary :: Gen Boolean) <#> (\b -> if b then "true" else "false")

arbitraryFromJType (JEnum n) = (arbitrary :: Gen Int) `suchThat` (_ >= 0) <#> (intToStr >>> \i -> n <> "(" <> i <> ")")

arbitraryFromJType JVec3 = do
  x <- someVal
  y <- someVal
  z <- someVal
  pure $ "vec3(" <> joinWith ", " [ x, y, z ] <> ")"
  where
  someVal = (arbitrary :: Gen Number) <#> floatToStr

-- helpful to add for debug mb: <#> B64.encode
arbitraryFromJType JString = (stripChars "\"\n\r\x0b\x0c\x1c\x1d\x1e\x85\x2028\x2029\\" <$> arbitrary :: Gen String) `suchThat` (S.contains (Pattern "\"") >>> not) <#> (\s -> "\"" <> s <> "\"")

arbitraryFromJType (JArray t) = genIntRarelyZero >>= (\i -> vectorOf i (arbitraryFromJType t)) <#> (\vs -> "{" <> joinWith ", " vs <> "}")

arbitraryFromJType (JObject (JsonObj name fields)) = gens <#> (\fs -> name <> "(" <> joinWith ", " fs <> ")")
  where
  gens = arbitraryFromFields fields

arbitraryFromJType JJson = pure "Json::Value()"

arbitraryFromJType (JDict t) = do -- pure "dictionary()" -- unsafeCrashWith "un impl" -- (arbitraryFromJType t) -- todo
  dLen <- genIntRarelyZero
  (kvs :: Array (Tuple String String)) <-
    sequence -- $ if dLen <= 0 then

      --     pure unit
      --   else
      do
        _ <- range 0 (dLen - 1)
        pure
          $ do
              k <- arbitraryFromJType JString
              v <- arbitraryFromJType t
              pure $ Tuple k v
  pure $ "{" <> printDictKvPairs kvs <> "}"
  where
  printDictKvPairs :: Array (Tuple String String) -> String
  printDictKvPairs kvs = joinWith "," $ concat $ (\(Tuple k v) -> wrapInitedScope "" $ [ k <> ", " <> v ]) <$> kvs

arbitraryFromJType m@(JMaybe t) =
  frequency
    $ NEA.singleton (Tuple 0.15 $ (arbitrary :: Gen Unit) <#> (\_ -> jTyPascalCase m <> "()"))
        <> NEA.singleton (Tuple 0.85 $ (arbitraryFromJType t <#> (\v -> jTyPascalCase m <> "(" <> v <> ")")))

genIntRarelyZero ∷ Gen Int
genIntRarelyZero =
  frequency
    $ NEA.singleton (Tuple 0.01 $ (arbitrary :: Gen Unit) <#> (\_ -> 0))
        <> NEA.singleton (Tuple 0.99 $ (chooseInt 1 4))
