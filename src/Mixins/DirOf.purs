module Mixins.DirOf (mxDirOf) where

import Prelude
import AsTypes (jTyToFuncRes)
import CodeLines (fnCall, ln, stmt, wrapConstructor, wrapFunction, wrapIf, wrapWhileLoop)
import Data.Array as A
import Data.Maybe (Maybe(..), fromMaybe)
import Gen.Class (jsonObjToClass)
import Macros.Arrays (mapArray_For)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.OpenplanetFuncs (ioCreateFolder, ioFileExists, ioFolderExists, ioIndexFolder, ioOpenFileReadStmt, ioOpenFileWriteStmt)
import Mixins.ToFromBuffer (mxToFromBuffer)
import Mixins.Types (Mixin)
import Partial.Unsafe (unsafeCrashWith)
import SzAsTypes (jValFromStr, jValToStr)
import Types (JField(..), JType(..), JsonObj(..), field, getFTy, isJDict, object)

type DirOfOpts = { keyType :: JType }

mxDirOf :: DirOfOpts -> Mixin
mxDirOf opts =
  { name: "DirOf"
  , requires: []
  , comprisingRequires: [ mxToFromBuffer.name ]
  , methods: Nothing
  , properties: Nothing
  , namespace: Just $ do_Namespace opts
  , tests: Nothing
  }

do_Namespace ∷ DirOfOpts → JsonObj → Array String
do_Namespace opts jo = (dirOfObjs opts jo).cls.mainFile

dirOfObjsName ∷ String
dirOfObjsName = "DirOf"

dirOfObjs :: DirOfOpts -> JsonObj -> _
dirOfObjs opts@{ keyType } jo@(JsonObj objName fields) = { cls, obj }
  where
  joTy = JObject jo

  obj =
    object dirOfObjsName
      # field "objs" (JDict joTy)

  cls =
    jsonObjToClass obj []
      [ mxCommonTesting, mxDefaultProps, _mx ]

  objIsDict = A.length fields == 1 && ((A.head fields) <#> (getFTy >>> isJDict) # fromMaybe false)

  _mxName = "DirOf" <> objName

  _mx :: Mixin
  _mx =
    { name: _mxName
    , requires: []
    , comprisingRequires: []
    , methods: Just dodMethods
    , properties: Just dodProps
    , namespace: Nothing
    , tests: Nothing
    }

  dodProps (JsonObj n fs) =
    [ "private string _dir;"
    , "private bool _initialized = false;"
    ]

  dodMethods (JsonObj _n _fs) =
    A.intercalate ln
      [ constructorFn.decl
      , get_initialized.decl
      , awaitInitialized.decl
      , runInit.decl
      , getObjs.decl
      , kFn.decl
      , unKFn.decl
      , getFileNameFn.decl
      , getFilePathFn.decl
      , readFileToObj.decl
      , existsFn.decl
      -- , countExistsFn.decl
      , getFn.decl
      , setFn.decl
      ]
    where
    keyF = JField "key" keyType

    valType = joTy

    valF = JField "val" valType

    ns = "::"

    objHandleTy = objName <> "@"

    constructorFn =
      wrapConstructor "DirOf" [ JField "dir" JString ]
        $
          [ "@_objs = dictionary();"
          , "_dir = dir;"
          ]
            <> wrapIf ("!" <> ioFolderExists "_dir")
              [ ioCreateFolder "_dir" <> ";" ]
            <> [ "RunInit();" ]

    get_initialized = wrapFunction "bool" "get_Initialized" [] [ "return _initialized;" ]

    awaitInitialized = wrapFunction "void" "AwaitInitialized" [] $ wrapWhileLoop "!_initialized" [ "yield();" ]

    runInit =
      wrapFunction "private void" "RunInit" []
        $ [ "auto keys = " <> ioIndexFolder "_dir" <> ";" ]
            <> mapArray_For { arr: "keys", el: "key", ix: "i" }
              ( wrapIf "key.EndsWith('.bin')"
                  [ "Get(UnK(key.SubStr(0, key.Length - 4)));" ]
              )
            <> [ "_initialized = true;" ]

    getObjs = wrapFunction "private dictionary@" "get_objs" [] [ "return _objs;" ]

    kFn =
      wrapFunction "const string" "K" [ keyF ]
        [ "return " <> jValToStr keyType "key" <> ";" ]

    unKFn =
      wrapFunction (jTyToFuncRes keyType) "UnK" [ JField "keyStr" JString ]
        [ "return " <> jValFromStr keyType "keyStr" <> ";" ]

    getFileNameFn =
      wrapFunction "const string" "GetFileName" [ keyF ]
        [ "return K(key) + '.bin';" ]

    getFilePathFn =
      wrapFunction "const string" "GetFilePath" [ keyF ]
        [ "return _dir + '/' + GetFileName(key);" ]

    readFileToObj =
      wrapFunction objHandleTy "ReadFileToObj" [ JField "path" JString ]
        $ case objIsDict of
            true -> [ "throw('do not call ReadFileToObj for dict');", "return null;" ]
            _ ->
              [ ioOpenFileReadStmt "f" "path"
              , "MemoryBuffer@ buf = MemoryBuffer(f.Read(f.Size()));"
              , "f.Close();"
              , "return " <> fnCall ("ReadFromBuffer") [ "buf" ] <> ";"
              ]

    existsFn =
      wrapFunction "bool" "Exists" [ keyF ]
        $ [ "return objs.Exists(K(key)) || " <> ioFileExists "GetFilePath(key)" <> ";" ]

    -- VERY INEFFICIENT WITHOUT PRELOADING
    -- countExistsFn =
    --   wrapFunction "uint" "CountExists" [ JField "keys" (JArray keyType) ]
    --     $ [ "uint ret = 0;" ]
    --     <> mapArray_For { arr: "keys", ix: "i", el: "key" }
    --         [ "if (Exists(key)) ret++;" ]
    --     <> [ "return ret;" ]
    getBody =
      [ objName <> "@ obj;" ]
        <> case objIsDict of
          true ->
            [ "@obj = " <> fnCall objName [ "_dir", "GetFileName(key)" ] <> ";"
            , "@objs[K(key)] = obj;"
            ]
          _ ->
            wrapIf (ioFileExists "GetFilePath(key)")
              [ "@obj = " <> readFileToObj.callRaw [ "GetFilePath(key)" ] <> ";"
              , "@objs[K(key)] = obj;"
              ]

    getFn =
      wrapFunction objHandleTy "Get" [ keyF ]
        $ wrapIf "objs.Exists(K(key))" [ "return cast<" <> objName <> "@>(objs[K(key)]);" ]
            <> getBody
            <> [ "return obj;" ]

    onSet = case objIsDict of
      true -> [ "throw('Do not call .Set on DirOfDict');" ]
      _ ->
        [ ioOpenFileWriteStmt "f" "GetFilePath(key)"
        , "MemoryBuffer@ buf = MemoryBuffer();"
        , "val.WriteToBuffer(buf);"
        , "buf.Seek(0);"
        , "f.Write(buf);"
        , "f.Close();"
        ]

    setFn =
      wrapFunction "void" "Set" [ keyF, valF ]
        onSet

-- getKeys = wrapFunction ("array<" <> objName <> "@>@") "GetKeys" []
--   [io]
-- getkeys mb an issue b/c we have keys for objs and keys for files
