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
import Mixins.FromJsonObj (mxFromJsonObj)
import Mixins.Getters (mxGetters)
import Mixins.OpEq (mxOpEq)
import Mixins.RowSz (mxRowSz)
import Mixins.ToJsonObj (mxToJsonObj)

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
challengeCls = jsonObjToClass codecChallenge [] [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxFromJsonObj, mxToJsonObj, mxGetters, mxOpEq, mxRowSz ]

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
    , mxFromJsonObj
    , mxToJsonObj
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

everything :: Array AsClass
everything =
  [ dictStr.cls
  , challengeCls
  , dictInt.cls
  , dictChallenge.cls
  , dWlChallenge.cls
  , challengeDb2.cls
  , codecChallengeDbCls
  ]
