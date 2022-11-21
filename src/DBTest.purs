module DBTest where

import AsTypes
import CodeLines
import Data.String
import Data.Tuple
import Gen.Class
import Mixins
import Mixins.Types
import Prelude
import Types
import Data.Maybe (Maybe(..), isJust)
import Mixins.ArrayProxy (mxArrayProxy)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultCons (mxDefaultCons, mxEmptyCons, mxEmptyConsWDefaults)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.DictBacking (DictOpts, mkDO, mxDictBacking)
import Mixins.DirOf (mxDirOf)
import Mixins.FromGameObj (mxFromGameObj)
import Mixins.Getters (mxGetters)
import Mixins.OpEq (mxOpEq)
import Mixins.Persistent (mxPersistent)
import Mixins.RowSz (mxRowSz)
import Mixins.Setters (mxSetters)
import Mixins.ToFromBuffer (mxToFromBuffer)
import Mixins.ToFromJsonObj (mxToFromJsonObj)
import Mixins.ToString (mxToString)

typicalMixins :: Array Mixin
typicalMixins = [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxToFromJsonObj, mxGetters, mxToString, mxOpEq, mxToFromBuffer ] -- mxRowSz,

simpleJsonMixins :: Array Mixin
simpleJsonMixins = [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxToFromJsonObj, mxGetters, mxSetters, mxToString, mxOpEq ]

codecChallenge ∷ JsonObj
codecChallenge =
  object "Challenge"
    # field "id" JUint
    # field "uid" JString
    # field "name" JString
    # field "startDate" JUint
    # field "endDate" JUint
    # field "leaderboardId" JUint

challengeCls ∷ AsClass
challengeCls = jsonObjToClass codecChallenge [] typicalMixins

challenges :: ClsWithObj
challenges = { cls, obj }
  where
  cls = jsonObjToClass obj [ challengeCls ] (typicalMixins <> [ mxArrayProxy ])

  obj = object "Challenges" # field "challenges" (JArray (JObject codecChallenge))

type ArrayProxyOpts = { n :: String, f :: String, o :: ClsWithObj }

mkArrayProxy :: ArrayProxyOpts -> ClsWithObj
mkArrayProxy { n, f, o } = { cls, obj }
  where
  cls = jsonObjToClass obj [ o.cls ] (typicalMixins <> [ mxArrayProxy ])

  obj = object n # field f (JArray (JObject o.obj))

dictGen :: DictOpts -> { cls :: AsClass, obj :: JsonObj }
dictGen opts@{ valType } = { cls, obj }
  where
  obj = object ("DictOf" <> objNameSfx) # field "d" (JDict valType)

  objNameSfx =
    (if opts.keyType /= JString then jTyPascalCase opts.keyType <> "To" else "")
      <> jTyPascalCase valType
      <> (if isJust opts.defaultDictVal then "_WDefault" else "")
      <> (if opts.writeLog then "_WriteLog" else "")

  cls =
    jsonObjToClass obj []
      $ [ mxCommonTesting, mxDefaultProps, mxDictBacking opts ]
          <> opts.extraMixins

stdDictTypes ∷ Array JType
stdDictTypes = [ JBool, JUint, JInt, JString ]

stdDictOpts t = [ mkDO t, (mkDO t) { writeLog = true } ]

stdDicts = do
  ty <- stdDictTypes
  opts <- stdDictOpts ty
  pure $ dictGen opts

dictChallenge :: { cls :: AsClass, obj :: JsonObj }
dictChallenge = dictGen $ mkDO $ JObject codecChallenge

dWlChallenge :: { cls :: AsClass, obj :: JsonObj }
dWlChallenge = dictGen $ (mkDO $ JObject codecChallenge) { writeLog = true }

dictIndex :: ClsWithObj
dictIndex = dictGen $ (mkDO $ JArray JInt) { defaultDictVal = Just "{}", keyType = JInt, writeLog = true }

dictUintIndex :: ClsWithObj
dictUintIndex = dictGen $ (mkDO $ JArray JUint) { defaultDictVal = Just "{}", keyType = JUint, writeLog = true }

-- indexDict :: ClsWithObj
-- indexDict = dictGen $ mkDO (JArray JUint) { writeLog = true, isIndex = true }
competition :: ClsWithObj
competition = { cls, obj }
  where
  cls = jsonObjToClass obj [] typicalMixins

  -- lots more fields that are omitted
  obj =
    object "Competition"
      # field "id" JUint
      # field "startDate" JUint
      # field "endDate" JUint
      # field "matchesGenerationDate" (JMaybe JUint)
      # field "nbPlayers" JUint
      # field "leaderboardId" JUint
      # field "name" JString
      # field "liveId" JString
      # field "creator" JString
      # field "region" (JMaybe JString)
      # field "description" (JMaybe JString)
      # field "registrationStart" (JMaybe JUint)

competitions :: ClsWithObj
competitions = mkArrayProxy { n: "Competitions", f: "comps", o: competition }

compsDb :: ClsWithObj
compsDb = dictGen $ (mkDO $ JObject competition.obj) { writeLog = true }

compRound :: ClsWithObj
compRound = { cls, obj }
  where
  cls = jsonObjToClass obj [] typicalMixins

  obj =
    object "CompRound"
      # field "id" JUint
      # field "qualifierChallengeId" JUint
      # field "position" JUint
      # field "nbMatches" JUint
      # field "startDate" JUint
      # field "endDate" JUint
      # field "name" JString
      # field "status" JString
      # field "leaderboardComputeType" JString
      # field "teamLeaderboardComputeType" (JMaybe JString)
      # field "matchScoreDirection" JString

compRounds :: ClsWithObj
compRounds = mkArrayProxy { n: "CompRounds", f: "rounds", o: compRound }

compRoundsDb :: ClsWithObj
compRoundsDb = dictGen $ (mkDO $ JObject compRound.obj) { keyType = JUint, writeLog = true }

compRoundMatch :: ClsWithObj
compRoundMatch = { cls, obj }
  where
  cls = jsonObjToClass obj [] typicalMixins

  -- # field "tags" (JArray (JString)) -- not sure what type this is
  obj =
    object "CompRoundMatch"
      # field "id" JUint
      # field "position" JUint
      # field "isCompleted" JBool
      # field "name" JString
      # field "clubMatchLiveId" JString

compRoundMatches :: ClsWithObj
compRoundMatches = mkArrayProxy { n: "CompRoundMatches", f: "matches", o: compRoundMatch }

compRoundMatchesDb :: ClsWithObj
compRoundMatchesDb = dictGen $ (mkDO $ JObject compRoundMatch.obj) { keyType = JUint, writeLog = true }

matchResult :: ClsWithObj
matchResult = { cls, obj }
  where
  cls = jsonObjToClass obj [] typicalMixins

  obj =
    object "MatchResult"
      # field "rank" (JMaybe JUint)
      # field "score" (JMaybe JUint)
      # field "participant" JString
      # field "zone" JString

matchResults :: ClsWithObj
matchResults = { cls, obj }
  where
  cls = jsonObjToClass obj [ matchResult.cls ] (typicalMixins <> [ mxDirOf { keyType: JUint } ])

  obj =
    object "MatchResults"
      # field "roundPosition" JUint
      # field "matchLiveId" JString
      # field "scoreUnit" JString
      # field "results" (JArray (JObject matchResult.obj))

matchResultsDb :: ClsWithObj
matchResultsDb = dictGen $ (mkDO $ JObject matchResults.obj) { keyType = JUint, writeLog = true, extraMixins = [ mxDirOf { keyType: JUint } ] }

totdEntry :: ClsWithObj
totdEntry = { cls, obj }
  where
  cls = jsonObjToClass obj [] typicalMixins

  -- additional fields: relativeStart, relativeEnd
  obj =
    object "TrackOfTheDayEntry"
      # field "campaignId" JUint
      # field "mapUid" JString
      # field "day" JUint
      # field "monthDay" JUint
      # field "seasonUid" JString
      # field "startTimestamp" JUint
      # field "endTimestamp" JUint

totdMonth :: ClsWithObj
totdMonth = { cls, obj }
  where
  cls = jsonObjToClass obj [ totdEntry.cls ] typicalMixins

  -- additional field: media object (all fields are "" so who cares)
  obj =
    object "TotdMonth"
      # field "year" JUint
      # field "month" JUint
      # field "lastDay" JUint
      # field "days" (JArray (JObject totdEntry.obj))

totdResp :: ClsWithObj
totdResp = { cls, obj }
  where
  cls = jsonObjToClass obj [ totdMonth.cls ] typicalMixins

  -- additional field: relativeNextRequest
  obj =
    object "TotdResp"
      # field "monthList" (JArray (JObject totdMonth.obj))
      # field "itemCount" JUint
      # field "nextRequestTimestamp" JUint

totdDb :: ClsWithObj
totdDb = dictGen $ (mkDO $ JObject totdEntry.obj) { writeLog = true }

tmMap :: ClsWithObj
tmMap = { cls, obj }
  where
  -- cls = jsonObjToClass obj [] ([ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxFromGameObj "CNadeoServicesMap", mxToFromJsonObj, mxGetters, mxToString, mxOpEq, mxRowSz ])
  cls = jsonObjToClass obj [] (typicalMixins <> [ mxFromGameObj "CNadeoServicesMap" ])

  obj =
    object "TmMap"
      # field "Id" JString
      # field "Uid" JString
      # field "Name" JString
      # field "FileName" JString
      # field "AuthorScore" JUint
      # field "GoldScore" JUint
      # field "SilverScore" JUint
      # field "BronzeScore" JUint
      # field "AuthorDisplayName" JString
      # field "AuthorAccountId" JString
      # field "AuthorWebServicesUserId" JString
      # field "SubmitterAccountId" JString
      # field "SubmitterWebServicesUserId" JString
      # field "Style" JString
      # field "TimeStamp" JUint
      # field "Type" JString
      # field "FileUrl" JString
      # field "ThumbnailUrl" JString

tmMapDb :: ClsWithObj
tmMapDb = dictGen $ (mkDO $ JObject tmMap.obj) { writeLog = true }

syncData :: ClsWithObj
syncData = { cls, obj }
  where
  cls = jsonObjToClass obj [] (typicalMixins <> [ mxEmptyConsWDefaults, mxPersistent ])

  obj =
    object "SyncData"
      # field "lastUpdated" JUint
      # field "status" JString

-- menu bg randomizer
sceneItem :: ClsWithObj
sceneItem = { cls, obj }
  where
  cls = jsonObjToClass obj [] (simpleJsonMixins)

  obj =
    object "SceneItem"
      # field "uid" JString
      # field "name" JString
      # field "type" (JEnum "SItemType")
      # field "visible" JBool
      # field "pos" JVec3
      # field "angle" JNumber
      # field "tt" JBool
      # field "carSync" JBool
      # field "attachedTo" (JMaybe JString)
      # field "skinZip" JString
      # field "skinUrl" JString
      # field "ver" JUint

-- player skins
skinIndex :: ClsWithObj
skinIndex = { cls, obj }
  where
  cls = jsonObjToClass obj [] (simpleJsonMixins)

  obj =
    object "SkinIndex"
      # field "skins" (JArray (JObject skinSpec.obj))

textureUrlPair :: ClsWithObj
textureUrlPair = { cls, obj }
  where
  cls = jsonObjToClass obj [] (simpleJsonMixins)

  obj =
    object "TextureUrlPair"
      # field "filename" JString
      # field "url" JString

skinSpec :: ClsWithObj
skinSpec = { cls, obj }
  where
  cls = jsonObjToClass obj [] (simpleJsonMixins)

  obj =
    object "SkinSpec"
      # field "baseModel" JString
      # field "hasPlayerMesh" JBool
      # field "texturePairs" (JArray (JObject textureUrlPair.obj))

playerStats :: ClsWithObj
playerStats = { cls, obj }
  where
  cls = jsonObjToClass obj [] (simpleJsonMixins)

  obj =
    object "PlayerStats"
      # field "Name" JString
      -- # field "TimeNow" JUint

      # field "SpawnStatus" JString
      # field "CurrentLapTimes" (JArray JUint)
      # field "CurrentRaceTimes" (JArray JUint)
      # field "CurrentLapTime" JUint
      # field "CurrentRaceTime" JUint

playerSplitsInfo :: ClsWithObj
playerSplitsInfo = { cls, obj }
  where
  cls = jsonObjToClass obj [] (typicalMixins)

  obj =
    object "PlayerSplitsInfo"
      # field "Name" JString
      # field "MapName" JString
      # field "PBTimes" (JArray JUint)
      # field "PBSplits" (JArray JUint)
      # field "BestSplits" (JArray JUint)
      # field "SumOfBest" JUint
      # field "NextBestTimes1" (JArray JUint)
      # field "NextBestTimes2" (JArray JUint)
      # field "NextBestTimes3" (JArray JUint)
      # field "NextBestTimes4" (JArray JUint)

-- # field "media" (JObject empty) -- fields are empty, no point recording
everything :: Array AsClass
everything =
  [ challengeCls
  , challenges.cls
  , dictIndex.cls
  , dictUintIndex.cls
  , dictChallenge.cls
  , dWlChallenge.cls
  , competition.cls
  , competitions.cls
  , compsDb.cls
  , compRound.cls
  , compRounds.cls
  , compRoundsDb.cls
  , compRoundMatch.cls
  , compRoundMatches.cls
  , compRoundMatchesDb.cls
  , matchResult.cls
  , matchResults.cls
  , matchResultsDb.cls
  , totdEntry.cls
  , totdMonth.cls
  , totdResp.cls
  , totdDb.cls
  , tmMap.cls
  , tmMapDb.cls
  , syncData.cls
  , sceneItem.cls
  , skinIndex.cls
  , skinSpec.cls
  , textureUrlPair.cls
  , playerStats.cls
  , playerSplitsInfo.cls
  ]
    <> (stdDicts <#> (_.cls))
