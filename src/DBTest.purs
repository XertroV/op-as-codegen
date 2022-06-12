module DBTest
  ( challengeCls
  , codecChallenge
  , codecChallengeDb
  , codecChallengeDbCls
  ) where

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
import Mixins.DefaultCons (mxDefaultCons)
import Mixins.DefaultProps (mxDefaultProps)
import Mixins.FromJsonObj (mxFromJsonObj)
import Mixins.Getters (mxGetters)
import Mixins.OpEq (mxOpEq)
import Mixins.RowSz (mxRowSz)
import Mixins.ToJsonObj (mxToJsonObj)

-- codecChallenge =
--   CA.object "Challenge"
--     ( CAR.record
--         { id: CA.int
--         , uid: CA.string
--         , name: CA.string
--         , startDate: CA.int
--         , endDate: CA.int
--         , leaderboardId: CA.int
--         }
--     )
codecChallenge ∷ JsonObj
codecChallenge =
  object "Challenge"
    # field "id" JUint
    # field "uid" JString
    # field "name" JString
    # field "startDate" JUint
    # field "endDate" JUint
    # field "leaderboardId" JUint

-- safeInt = CA.string
challengeCls ∷ AsClass
challengeCls = jsonObjToClass codecChallenge [] [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxFromJsonObj, mxToJsonObj, mxGetters, mxOpEq, mxRowSz ]

codecChallengeDb :: JsonObj
codecChallengeDb =
  object "ChallengeDB"
    # field "challenges"
        (JArray (JObject codecChallenge))

codecChallengeDbCls :: AsClass
codecChallengeDbCls = jsonObjToClass codecChallengeDb [ challengeCls ] [ mxCommonTesting, mxDefaultProps, mxDefaultCons, mxFromJsonObj, mxToJsonObj, mxGetters, mxOpEq, mxRowSz ]
