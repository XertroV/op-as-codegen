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
import Mixins.ArrayProxy (mxArrayProxy)
import Mixins.CommonTesting (mxCommonTesting)
import Mixins.DefaultCons (mxDefaultCons, mxEmptyCons, mxEmptyConsWDefaults)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.DictBacking (DictOpts, mkDO, mxDictBacking)
import Mixins.FromGameObj (mxFromGameObj)
import Mixins.Getters (mxGetters)
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

challenges :: ClsWithObj
challenges = { cls, obj }
  where
  cls = jsonObjToClass obj [ challengeCls ] (typicalMixins <> [ mxArrayProxy ])

  obj = object "Challenges" # field "challenges" (JArray (JObject codecChallenge))

type ArrayProxyOpts
  = { n :: String, f :: String, o :: ClsWithObj }

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
      # field "teamLeaderboardComputeType" JString
      # field "matchScoreDirection" JString

compRounds :: ClsWithObj
compRounds = mkArrayProxy { n: "CompRounds", f: "rounds", o: compRound }

compRoundsDb :: ClsWithObj
compRoundsDb = dictGen $ (mkDO $ JObject compRound.obj) { writeLog = true }

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
compRoundMatchesDb = dictGen $ (mkDO $ JObject compRoundMatch.obj) { writeLog = true }

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

-- # field "media" (JObject empty) -- fields are empty, no point recording
everything :: Array AsClass
everything =
  [ dictStr.cls
  , challengeCls
  , challenges.cls
  , dictInt.cls
  , dictChallenge.cls
  , dWlChallenge.cls
  -- , challengeDb2.cls
  -- , codecChallengeDbCls
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
  , totdEntry.cls
  , totdMonth.cls
  , totdResp.cls
  , totdDb.cls
  , tmMap.cls
  , tmMapDb.cls
  ]
