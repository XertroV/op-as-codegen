module Main where

import Prelude
import DBTest (challengeCls, codecChallengeDbCls)
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  log challengeCls
  log codecChallengeDbCls
