module Main where

import Prelude
import CommonGlobalClasses (getCommonClasses)
import DBTest (challengeCls, everything)
import Data.Array (intercalate)
import Data.String (joinWith)
import Data.String.Utils (endsWith)
import Data.Traversable (sequence)
import Effect (Effect)
import Effect.Console (log)
import Gen.Class (AsClass)
import Node.Encoding (Encoding(..))
import Node.FS.Perms as P
import Node.FS.Sync (mkdir', writeTextFile, rm')
import Node.FS.Sync as F

main :: Effect Unit
main = do
  let
    baseName = "CotdObjects"

    mkPlugin pluginName = generateScaffoldProject { dir: "codegen" <> "/" <> pluginName, pluginName, cs: everything }
  mkPlugin baseName
  mkPlugin $ baseName <> "Test"

type ScaffoldProps
  = { cs :: Array AsClass, dir :: String, pluginName :: String }

generateScaffoldProject :: ScaffoldProps -> Effect Unit
generateScaffoldProject { cs, dir, pluginName } = do
  let
    testDir = dir <> "/Test"
  log $ "Initializing " <> pluginName <> " in " <> dir
  _exists <- F.exists dir
  if _exists then rm' dir { force: false, maxRetries: 1, recursive: true, retryDelay: 0 } else pure unit
  mkdir' testDir { mode: P.mkPerms P.all P.all P.none, recursive: true }
  log $ "Initialized " <> dir
  log "Writing class files"
  filesWritten <- sequence $ writeClass <$> (cs <> getCommonClasses cs)
  log "Writing info.toml"
  genInfoToml dir pluginName (if endsWith "Test" pluginName then "UNIT_TEST" else "RELEASE") filesWritten
  log "Scaffold project generated"
  pure unit
  where
  writeClass cls = do
    let
      mainPath = dir <> "/" <> cls.name <> ".as"

      testPath = dir <> "/Test/" <> cls.name <> ".as"
    writeTextFile UTF8 mainPath $ intercalate "\n" cls.mainFile
    writeTextFile UTF8 testPath $ intercalate "\n" cls.testFile
    log $ "Wrote class files w/ main file: " <> mainPath
    pure $ cls.name <> ".as"

genInfoToml ∷ String → String -> String -> Array String → Effect Unit
genInfoToml dir name envDefine exports = do
  writeTextFile UTF8 (dir <> "/info.toml") (infoTomlContents name envDefine exports)

infoTomlContents ∷ String → String -> Array String -> String
infoTomlContents name envDefine exports =
  joinWith "\n"
    [ "[meta]"
    , "name = \"" <> name <> "\""
    , "author = 'op-as-codegen'"
    , ""
    , "[script]"
    , "defines = [ '" <> envDefine <> "' ]"
    , "shared_exports = [ '" <> joinWith "', '" exports <> "' ]"
    ]
