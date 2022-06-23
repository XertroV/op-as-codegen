module Mixins.OpenplanetFuncs where

import Prelude
import CodeLines (fnCall)

ioFolderExists :: String -> String
ioFolderExists p = fnCall "IO::FolderExists" [ p ]

ioCreateFolder :: String -> String
ioCreateFolder p = fnCall "IO::CreateFolder" [ p, "true" ]

ioIndexFolder :: String -> String
ioIndexFolder p = fnCall "IO::IndexFolder" [ p, "false" ]

ioFileExists :: String -> String
ioFileExists p = fnCall "IO::FileExists" [ p ]

ioDeleteFile :: String -> String
ioDeleteFile p = fnCall "IO::Delete" [ p ]

ioDeleteFolder :: String -> String
ioDeleteFolder p = fnCall "IO::DeleteFolder" [ p, "false" ]

ioOpenFileReadStmt :: String -> String -> String
ioOpenFileReadStmt n p = "IO::File " <> fnCall n [ p, "IO::FileMode::Read" ] <> ";"

ioOpenFileWriteStmt :: String -> String -> String
ioOpenFileWriteStmt n p = "IO::File " <> fnCall n [ p, "IO::FileMode::Write" ] <> ";"
