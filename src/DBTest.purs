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
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultCons (mxDefaultCons, mxEmptyCons, mxEmptyConsWDefaults)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.DictBacking (DictOpts, mkDO, mxDictBacking)
import Mixins.Getters (mxGetters)
import Mixins.JMaybes (mxJMaybes)
import Mixins.OpEq (mxOpEq)
import Mixins.RowSz (mxRowSz)
import Mixins.ToFromJsonObj (mxToFromJsonObj)
import Mixins.ToString (mxToString)

typicalMixins = [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxToFromJsonObj, mxGetters, mxToString, mxOpEq, mxRowSz ]

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

dictGen :: DictOpts -> { cls :: AsClass, obj :: JsonObj }
dictGen opts@{ valType } = { cls, obj }
  where
  obj = object ("DictOf" <> objNameSfx) # field "d" (JDict valType)

  objNameSfx =
    jTyPascalCase valType
      <> (if opts.writeLog then "_WriteLog" else "")

  cls =
    jsonObjToClass obj []
      $ [ mxCommonTesting, mxDefaultProps, mxDictBacking opts ]
      <> opts.extraMixins

dictStr :: { cls :: AsClass, obj :: JsonObj }
dictStr = dictGen $ mkDO JString

dictInt :: { cls :: AsClass, obj :: JsonObj }
dictInt = dictGen $ mkDO JInt

dictChallenge :: { cls :: AsClass, obj :: JsonObj }
dictChallenge = dictGen $ mkDO $ JObject codecChallenge

dWlChallenge :: { cls :: AsClass, obj :: JsonObj }
dWlChallenge = dictGen $ (mkDO $ JObject codecChallenge) { writeLog = true }

-- codecChallengeDb :: JsonObj
-- codecChallengeDb =
--   object "ChallengeDB"
--     # field "challenges"
--         (JArray (JObject codecChallenge))
-- codecChallengeDbCls :: AsClass
-- codecChallengeDbCls =
--   jsonObjToClass codecChallengeDb [ challengeCls ]
--     typicalMixins
-- challengeDb :: { cls :: AsClass, obj :: JsonObj }
-- challengeDb = { cls, obj }
--   where
--   obj = object "ChallengeDB" # field "challenges" (JObject dictChallenge.obj)
--   cls =
--     jsonObjToClass obj [ challengeCls ]
--       [ mxCommonTesting
--       , mxDefaultProps
--       , mxEmptyCons
--       ]
type ClsWithObj
  = { cls :: AsClass, obj :: JsonObj }

competition :: ClsWithObj
competition = { cls, obj }
  where
  cls = jsonObjToClass obj [] typicalMixins

  obj =
    object "Competition"
      # field "id" JUint
      # field "liveId" JString
      # field "name" JString
      # field "startDate" JUint
      # field "endDate" JUint
      # field "matchesGenerationDate" JUint
      # field "nbPlayers" JUint
      # field "leaderboardId" JUint

matchResult :: ClsWithObj
matchResult = { cls, obj }
  where
  cls = jsonObjToClass obj [] typicalMixins

  obj =
    object "MatchResult"
      # field "rank" (JMaybe JUint)
      # field "score" (JMaybe JUint)
      # field "participant" JString

matchResults :: ClsWithObj
matchResults = { cls, obj }
  where
  cls = jsonObjToClass obj [ matchResult.cls ] typicalMixins

  obj =
    object "MatchResults"
      # field "roundPosition" JUint
      # field "matchLiveId" JString
      # field "scoreUnit" JString
      # field "results" (JArray (JObject matchResult.obj))

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
  cls = jsonObjToClass obj [] typicalMixins

  obj =
    object "TmMap"
      # field "Id" JString
      # field "Uid" JString
      # field "Name" JString
      # field "FileName" JString
      # field "AuthorScore" JString
      # field "GoldScore" JString
      # field "SilverScore" JString
      # field "BronzeScore" JString
      # field "AuthorDisplayName" JString
      # field "AuthorAccountId" JString
      # field "AuthorWebServicesUserId" JString
      # field "SubmitterAccountId" JString
      # field "SubmitterWebServicesUserId" JString
      # field "Style" JString
      # field "TimeStamp" JString
      # field "Type" JString
      # field "FileUrl" JString
      # field "ThumbnailUrl" JString

tmMapDb :: ClsWithObj
tmMapDb = dictGen $ (mkDO $ JObject tmMap.obj) { writeLog = true }

-- # field "media" (JObject empty) -- fields are empty, no point recording
everything :: Array AsClass
everything =
  [ dictStr.cls
  , challengeCls
  , dictInt.cls
  , dictChallenge.cls
  , dWlChallenge.cls
  -- , challengeDb2.cls
  -- , codecChallengeDbCls
  , competition.cls
  , matchResult.cls
  , matchResults.cls
  , totdEntry.cls
  , totdMonth.cls
  , totdResp.cls
  , totdDb.cls
  , tmMap.cls
  , tmMapDb.cls
  ]
