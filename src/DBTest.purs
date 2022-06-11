module DBTest where

import AsTypes
import CodeLines
import Data.String
import Data.Tuple
import Mixins
import Mixins.Types
import Prelude
import Types
import Mixins.FromJsonObj (mxFromJsonObj)
import Mixins.Getters (mxGetters)
import Mixins.RowSz (mxRowSz)
import Gen.Class

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
challengeCls ∷ String
challengeCls = jsonObjToClass codecChallenge [ mxDefaultProps, mxDefaultCons, mxFromJsonObj, mxGetters, mxRowSz ]

codecChallengeDb :: JsonObj
codecChallengeDb =
  object "ChallengeDB"
    # field "challenges"
        (JArray (JObject codecChallenge))

codecChallengeDbCls :: String
codecChallengeDbCls = jsonObjToClass codecChallengeDb []
