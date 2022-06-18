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
challengeCls = jsonObjToClass codecChallenge [] [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxToFromJsonObj, mxGetters, mxOpEq, mxRowSz ]

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
      <> (if opts.writeLog then [] else [])

dictStr :: { cls :: AsClass, obj :: JsonObj }
dictStr = dictGen $ mkDO JString

dictInt :: { cls :: AsClass, obj :: JsonObj }
dictInt = dictGen $ mkDO JInt

dictChallenge :: { cls :: AsClass, obj :: JsonObj }
dictChallenge = dictGen $ mkDO $ JObject codecChallenge

dWlChallenge :: { cls :: AsClass, obj :: JsonObj }
dWlChallenge = dictGen $ (mkDO $ JObject codecChallenge) { writeLog = true }

codecChallengeDb :: JsonObj
codecChallengeDb =
  object "ChallengeDB"
    # field "challenges"
        (JArray (JObject codecChallenge))

codecChallengeDbCls :: AsClass
codecChallengeDbCls =
  jsonObjToClass codecChallengeDb [ challengeCls ]
    [ mxCommonTesting
    , mxDefaultProps
    , mxDefaultCons
    , mxToFromJsonObj
    , mxGetters
    , mxOpEq
    , mxRowSz
    ]

challengeDb2 :: { cls :: AsClass, obj :: JsonObj }
challengeDb2 = { cls, obj }
  where
  obj = object "ChallengeDB2" # field "challenges" (JObject dictChallenge.obj)

  cls =
    jsonObjToClass obj [ challengeCls ]
      [ mxCommonTesting
      , mxDefaultProps
      , mxEmptyCons
      ]

type ClsWithObj
  = { cls :: AsClass, obj :: JsonObj }

competition :: ClsWithObj
competition = { cls, obj }
  where
  cls = jsonObjToClass obj [] [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxToFromJsonObj, mxGetters, mxOpEq, mxRowSz ]

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
  cls = jsonObjToClass obj [] [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxToFromJsonObj, mxGetters, mxOpEq, mxRowSz ]

  obj =
    object "MatchResult"
      # field "rank" (JMaybe JUint)
      # field "score" (JMaybe JUint)
      # field "participant" JString

matchResults :: ClsWithObj
matchResults = { cls, obj }
  where
  cls = jsonObjToClass obj [ matchResult.cls ] [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxToFromJsonObj, mxGetters, mxOpEq, mxRowSz ]

  obj =
    object "MatchResults"
      # field "roundPosition" JUint
      # field "matchLiveId" JString
      # field "scoreUnit" JString
      # field "results" (JArray (JObject matchResult.obj))

everything :: Array AsClass
everything =
  [ dictStr.cls
  , challengeCls
  , dictInt.cls
  , dictChallenge.cls
  , dWlChallenge.cls
  , challengeDb2.cls
  , codecChallengeDbCls
  , competition.cls
  , matchResult.cls
  , matchResults.cls
  ]
