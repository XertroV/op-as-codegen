module Main where

import Prelude
import DBTest (challengeCls, codecChallengeDbCls)
import Data.String (joinWith)
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
  log "\n\n🚕\n\n"
  log challengeCls.mainFile
  -- log "\n\n🚕\n\n"
  -- log codecChallengeDbCls.mainFile
  log "\n\n🚕\n\n"
  log challengeCls.testFile
  let
    pluginName = "testCodegen"
  generateScaffoldProject { dir: "codegen" <> "/" <> pluginName, pluginName, cs: [ challengeCls, codecChallengeDbCls ] }

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
  _ <- sequence $ writeClass <$> cs
  log "Writing info.toml"
  genInfoToml dir pluginName
  log "Scaffold project generated"
  pure unit
  where
  writeClass cls = do
    let
      mainPath = dir <> "/" <> cls.name <> ".as"

      testPath = dir <> "/Test/" <> cls.name <> ".as"
    writeTextFile UTF8 mainPath cls.mainFile
    writeTextFile UTF8 testPath cls.testFile
    log $ "Wrote class files w/ main file: " <> mainPath

genInfoToml ∷ String → String → Effect Unit
genInfoToml dir name = do
  writeTextFile UTF8 (dir <> "/info.toml") (infoTomlContents name)

infoTomlContents ∷ String → String
infoTomlContents name =
  joinWith "\n"
    [ "[meta]"
    , "name = \"" <> name <> "\""
    , "author = 'op-as-codegen'"
    , ""
    , "[script]"
    , "defines = [ 'UNIT_TEST' ]"
    ]
