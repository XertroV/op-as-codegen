module Main where

import Prelude
import CommonGlobalClasses (getCommonClasses)
import DBTest (challengeCls, everything)
import Data.Array (intercalate)
import Data.Array as A
import Data.String (joinWith)
import Data.String.Utils (endsWith)
import Data.String.Utils as S
import Data.Traversable (sequence)
import Effect (Effect)
import Effect.Console (log)
import Gen.Class (AsClass)
import Node.Encoding (Encoding(..))
import Node.FS.Perms as P
import Node.FS.Sync (mkdir', rm', writeTextFile)
import Node.FS.Sync as F
import Testing (unitTestSingletonFileLines)
import Types (Lines)

main :: Effect Unit
main = do
  let
    baseName = "TrackmaniaApiObjsAndHelpers"

    mkPlugin pluginName isTest = generateScaffoldProject { pluginName, cs: everything, isTest }
  mkPlugin baseName false
  mkPlugin baseName true

type ScaffoldProps
  = { cs :: Array AsClass, pluginName :: String, isTest :: Boolean }

generateScaffoldProject :: ScaffoldProps -> Effect Unit
generateScaffoldProject { cs, pluginName, isTest } = do
  log $ "Initializing " <> pluginName' <> " in " <> dir
  _exists <- F.exists dir
  if _exists then rm' dir { force: false, maxRetries: 1, recursive: true, retryDelay: 0 } else pure unit
  mkdir' testDir { mode: P.mkPerms P.all P.all P.all, recursive: true }
  log $ "Initialized " <> dir
  log "Writing class files"
  filesWritten <- sequence $ writeClass <$> (cs <> getCommonClasses cs)
  writeTestingSingleton
  log "Writing info.toml"
  genInfoToml dir pluginName' defines filesWritten dependencies
  log "Scaffold project generated"
  pure unit
  where
  pluginName' = if isTest then pluginName <> "Test" else pluginName

  dir = "codegen" <> "/" <> pluginName'

  testDir = dir <> "/Test"

  defines = if isTest then "UNIT_TEST" else "RELEASE"

  dependencies = if isTest then [ pluginName ] else []

  writeTestingSingleton =
    if isTest then do
      log "Writing testing singleton"
      writeTextFile UTF8 (dir <> "/UnitTestMain.as") $ intercalate "\n" unitTestSingletonFileLines
    else
      pure unit

  writeClass cls = do
    let
      mainPath = dir <> "/" <> cls.name <> ".as"

      testPath = dir <> "/Test/" <> cls.name <> ".as"
    if isTest then
      writeTextFile UTF8 testPath $ intercalate "\n" cls.testFile
    else
      writeTextFile UTF8 mainPath $ intercalate "\n" cls.mainFile
    log $ "Wrote class files w/ main file: " <> mainPath
    pure $ cls.name <> ".as"

genInfoToml ∷ String → String -> String -> Array String -> Array String → Effect Unit
genInfoToml dir name envDefine exports deps = do
  writeTextFile UTF8 (dir <> "/info.toml") (infoTomlContents name envDefine exports deps)

infoTomlContents ∷ String → String -> Array String -> Array String -> String
infoTomlContents name envDefine exports deps =
  joinWith "\n"
    [ "[meta]"
    , "name = \"" <> name <> "\""
    , "author = 'op-as-codegen'"
    , ""
    , "[script]"
    , "defines = [ '" <> envDefine <> "' ]"
    , "shared_exports = [ '" <> joinWith "', '" exports <> "' ]"
    , _deps
    ]
  where
  _deps = if A.length deps > 0 then "dependencies = [ '" <> joinWith "', '" deps <> "' ]" else "# No deps"

-- testSingletonScript :: Lines
-- testSingletonScript =
