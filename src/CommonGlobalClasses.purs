module CommonGlobalClasses where

import Prelude
import AsTypes (jTyPascalCase)
import CodeLines (ln, wrapConstructor, wrapConstructor', wrapFunction, wrapFunction', wrapIf, wrapInitedScope)
import Data.Array (catMaybes, init, intercalate, last, nubEq, tail)
import Data.Maybe (Maybe(..), fromJust, fromMaybe)
import Effect (Effect)
import Gen.Class (AsClass, jsonObjToClass)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.Getters (mxGetters)
import Mixins.JMaybes (mxJMaybes)
import Mixins.OpEq (mxOpEq)
import Mixins.OpenplanetFuncs (ioCreateFolder, ioFolderExists)
import Mixins.RowSz (mxRowSz)
import Mixins.ToFromBuffer (rfbLpStringFn, wtbLpStringFn)
import Mixins.ToFromJsonObj (vec3ToJsonFn)
import Types (JField(..), JType(..), JsonObj(..), Lines, field, getFName, getFTy, object)

getCommonClasses :: Array AsClass -> Array AsClass
getCommonClasses cs = requiredCommonClasses
  where
  requiredCommonClasses =
    [ bufferClass, storageLoc ]
      <> _getReqJMaybeClasses cs

{- MAYBES -}
_getReqJMaybeClasses ∷ Array AsClass → Array AsClass
_getReqJMaybeClasses cs = getMaybeClassFor <$> (nubEq jMaybeFs)
  where
  allFields = cs <#> (\{ obj: JsonObj n fs } -> fs) # intercalate []

  jMaybeFs = allFields <#> (getFTy >>> jMaybeInnerTy) # catMaybes

  jMaybeInnerTy j = case j of
    JMaybe t -> Just t
    _ -> Nothing

getMaybeClassFor :: JType -> AsClass
getMaybeClassFor t = cls
  where
  name = jTyPascalCase (JMaybe t)

  obj =
    object name
      # field "val" t
      # field "hasVal" JBool

  cls = jsonObjToClass obj [] [ mxCommonTesting, mxDefaultProps, mxJMaybes ]

{-
 STORAGE LOCATION
-}
storageLoc :: AsClass
storageLoc = { name, mixins, mainFile, testFile: [], obj }
  where
  name = "StorageLocation"

  fileName = JField "fileName" JString

  subDir = JField "subDir" JString

  obj = JsonObj name [ fileName, subDir ]

  mixins = [ mxCommonTesting, mxDefaultProps ]

  mainFile =
    wrapInitedScope ("shared class " <> name)
      $ intercalate ln
          [ [ "private string _path;", "private string _dir;" ]
          , constructorFn.decl
          , getPath.decl
          , getDir.decl
          , ensureDir.decl
          ]

  constructorFn =
    wrapConstructor' name [ "const string &in fileName", "const string &in subDir = ''" ]
      $ [ "string[] dirs = {'Storage', Meta::ExecutingPlugin().ID};" ]
      <> wrapIf "subDir.Length > 0" [ "dirs.InsertLast(subDir);" ]
      <> [ "_dir = IO::FromDataFolder(string::Join(dirs, '/'));"
        , "dirs.InsertLast(fileName);"
        , "_path = IO::FromDataFolder(string::Join(dirs, '/'));"
        ]

  getPath = wrapFunction "const string" "get_Path" [] [ "return _path;" ]

  getDir = wrapFunction "const string" "get_Dir" [] [ "return _dir;" ]

  ensureDir =
    wrapFunction "void" "EnsureDirExists" []
      $ wrapIf ("!" <> ioFolderExists "_dir")
          [ ioCreateFolder "_dir" <> ";" ]

{- BUFFER -}
bufferClass :: AsClass
bufferClass = { name, mixins, mainFile, testFile, obj }
  where
  obj = JsonObj "Buffer" []

  name = "Buffer"

  mixins = []

  testFile = []

  mainFile =
    wrapInitedScope ("shared class Buffer")
      $ intercalate ln
          [ props
          , const.decl
          , constFromBuf.decl
          , constFromStr.decl
          , pxGetSize.decl
          , pxAtEnd.decl
          , pxSeek.decl
          , pxResize.decl
          , pxReadU.decl
          , pxReadU8.decl
          , pxReadU16.decl
          , pxReadU64.decl
          , pxReadI.decl
          , pxReadI8.decl
          , pxReadI16.decl
          , pxReadI64.decl
          , pxReadF.decl
          , pxReadD.decl
          , pxReadStr.decl
          , pxWriteU.decl
          , pxWriteU8.decl
          , pxWriteU16.decl
          , pxWriteU64.decl
          , pxWriteI.decl
          , pxWriteI8.decl
          , pxWriteI16.decl
          , pxWriteI64.decl
          , pxWriteF.decl
          , pxWriteD.decl
          , pxWriteStr.decl
          , pxReadToBase64.decl
          , pxWriteFromBase64.decl
          ]

  props = [ "MemoryBuffer _buf = MemoryBuffer(0);" ]

  const = wrapConstructor "Buffer" [] []

  constFromStr =
    wrapConstructor' "Buffer" [ "const string &in str" ]
      [ "_buf.WriteFromBase64(str);"
      , "_buf.Seek(0, 0);"
      ]

  constFromBuf =
    wrapConstructor' "Buffer" [ "MemoryBuffer &in mb" ]
      [ "_buf.WriteFromBase64(mb.ReadToBase64(mb.GetSize()));"
      , "_buf.Seek(0, 0);"
      ]

  pxGetSize = proxyFnRet "uint" "GetSize"

  pxAtEnd = proxyFnRet "bool" "AtEnd"

  pxResize = proxyFn1Ret' "void" "Resize" "uint64 &in v"

  pxSeek =
    wrapFunction' "void" "Seek" [ "uint64 pos", "int dir = 0" ]
      [ "_buf.Seek(pos, dir);" ]

  -- todo seek
  -- todo AtEnd
  pxReadU = proxyFnRet "uint" "ReadUInt32"

  pxReadU8 = proxyFnRet "uint8" "ReadUInt8"

  pxReadU16 = proxyFnRet "uint16" "ReadUInt16"

  pxReadU64 = proxyFnRet "uint64" "ReadUInt64"

  pxReadI = proxyFnRet "int" "ReadInt32"

  pxReadI8 = proxyFnRet "int8" "ReadInt8"

  pxReadI16 = proxyFnRet "int16" "ReadInt16"

  pxReadI64 = proxyFnRet "int64" "ReadInt64"

  pxReadF = proxyFnRet "float" "ReadFloat"

  pxReadD = proxyFnRet "double" "ReadDouble"

  pxReadStr = proxyFn1Ret "const string" "ReadString" (JField "l" JUint)

  pxWriteU = proxyFn1Ret' "void" "Write" "uint &in v"

  pxWriteU8 = proxyFn1Ret' "void" "Write" "uint8 &in v"

  pxWriteU16 = proxyFn1Ret' "void" "Write" "uint16 &in v"

  pxWriteU64 = proxyFn1Ret' "void" "Write" "uint64 &in v"

  pxWriteI = proxyFn1Ret' "void" "Write" "int &in v"

  pxWriteI8 = proxyFn1Ret' "void" "Write" "int8 &in v"

  pxWriteI16 = proxyFn1Ret' "void" "Write" "int16 &in v"

  pxWriteI64 = proxyFn1Ret' "void" "Write" "int64 &in v"

  pxWriteF = proxyFn1Ret' "void" "Write" "float &in v"

  pxWriteD = proxyFn1Ret' "void" "Write" "double &in v"

  pxWriteStr = proxyFn1Ret' "void" "Write" "const string &in v"

  pxReadToBase64 = proxyFn1Ret' "const string" "ReadToBase64" "uint64 v"

  pxWriteFromBase64 = proxyFn1Ret' "void" "WriteFromBase64" "const string &in v"

  d = "_buf"

  proxyFnRet retTy fName = wrapFunction retTy fName [] [ retNotVoid retTy <> d <> "." <> fName <> "();" ]

  proxyFnRet' retTy fName extraLs = wrapFunction retTy fName [] $ extraLs <> [ retNotVoid retTy <> d <> "." <> fName <> "();" ]

  proxyFn1Ret retTy fName f = wrapFunction retTy fName [ f ] [ retNotVoid retTy <> d <> "." <> fName <> "(" <> getFName f <> ");" ]

  -- | arg must have the name "v"
  proxyFn1Ret' retTy fName arg = wrapFunction' retTy fName [ arg ] [ retNotVoid retTy <> d <> "." <> fName <> "(v);" ]

  retNotVoid retTy = if retTy == "void" then "" else "return "

getCommonGlobalFuncs :: Lines
getCommonGlobalFuncs =
  intercalate ln
    $ [ wtbLpStringFn.decl
      , rfbLpStringFn.decl
      , enumSItemTypeDecl
      , vec3ToJsonFn.decl
      ]

enumSItemTypeDecl :: Lines
enumSItemTypeDecl =
  wrapInitedScope "shared enum SItemType"
    $ (\n -> ((_ <> ",") <$> (fromMaybe [] $ init n)) <> [ fromMaybe "Error!:!" $ last n ])
        [ "CarSport", "CharacterPilot", "CustomMesh" ]
