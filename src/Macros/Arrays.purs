module Macros.Arrays where

import Prelude
import CodeLines (forLoopArray, jfieldToAsArg, jfieldToAsVar, wrapForLoop)
import Types (JField(..), Lines, getFName)

type ArrayMapInfo
  = { ix :: String, el :: String, arr :: String }

mapArray_For :: ArrayMapInfo -> Lines -> Lines
mapArray_For { ix, el, arr } lines =
  -- [ jfieldToAsVar el <> ";" ] <>
  forLoopArray ix arr -- wrapForLoop ("uint " <> ix <> " = 0; " <> ix <> " < " <> arr <> ".Length; " <> ix <> "++")
    ([ "auto " <> el <> " = " <> arr <> "[" <> ix <> "];" ] <> lines)
