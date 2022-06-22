module Testing where

import Prelude
import CodeLines (ln, wrapForLoop, wrapFunction, wrapFunction', wrapIf, wrapIfElse, wrapInitedScope, wrapTryCatch, wrapTryCatchFake, wrapWhileLoop)
import ManiaColors (c_green_700, c_orange_600)
import Types (Lines, AsFunction)

utGs :: String
utGs = "_unitTests_globalSingleton"

utFuncs :: String
utFuncs = "_unitTests_funcs"

utFms :: String
utFms = "_unitTests_failureMessages"

utNames :: String
utNames = "_unitTests_names"

nbUts :: String
nbUts = "_unitTests_counter"

nbUtsStarted :: String
nbUtsStarted = "_unitTests_nStarted"

nbUtsRunning :: String
nbUtsRunning = "_unitTests_nRunning"

nbUtsDone :: String
nbUtsDone = "_unitTests_nDone"

nbUtsPassed :: String
nbUtsPassed = "_unitTests_nPassed"

unitTestSingletonFileLines ∷ Lines
unitTestSingletonFileLines =
  enumTestStatus
    <> ln
    <> [ "array<TestStatus> " <> utGs <> " = {};"
      , "array<CoroutineFunc@> " <> utFuncs <> " = {};"
      , "array<string> " <> utNames <> " = {};"
      , "dictionary@ " <> utFms <> " = dictionary();"
      , "uint " <> nbUts <> " = 0;"
      , "uint " <> nbUtsStarted <> " = 0;"
      , "uint " <> nbUtsRunning <> " = 0;"
      , "uint " <> nbUtsDone <> " = 0;"
      , "uint " <> nbUtsPassed <> " = 0;"
      , "uint _unitTests_startedAt = 0;"
      , "bool unitTestsStarted = " <> startMainLoop.call [] <> ";"
      ]
    <> ln
    <> registerUnitTest.decl
    <> ln
    <> startMainLoop.decl
    <> ln
    <> mainLoop.decl
    <> ln
    <> runNextTest.decl
    <> ln
    <> printResults.decl

enumTestStatus :: Array String
enumTestStatus =
  wrapInitedScope "enum TestStatus"
    [ "Waiting = 0, Started = 1, Failed = 2, Passed = 3" ]

registerUnitTest :: AsFunction
registerUnitTest =
  wrapFunction' "bool" "RegisterUnitTest" [ "const string &in name", "CoroutineFunc@ &in func" ]
    $ wrapIf ("_unitTests_startedAt == 0")
        ( wrapWhileLoop (utGs <> " is null") [ "yield();" ]
            <> wrapWhileLoop (utFms <> " is null") [ "yield();" ]
            <> [ "_unitTests_startedAt = Time::Now;" ]
        )
    <> [ "uint id = " <> nbUts <> "++;"
      , utGs <> ".InsertLast(TestStatus::Waiting);"
      , utFuncs <> ".InsertLast(func);"
      , utNames <> ".InsertLast(name);"
      -- , "print('Test registered. ' + id + ': ' + name);"
      , "return true;"
      ]

startMainLoop :: AsFunction
startMainLoop =
  wrapFunction "bool" "UnitTest_StartMainLoop" []
    [ "startnew(UnitTest_MainLoop);"
    , "return true;"
    ]

mainLoop :: AsFunction
mainLoop =
  wrapFunction "void" "UnitTest_MainLoop" []
    $ wrapWhileLoop (utGs <> ".Length == 0")
        [ "yield();" ]
    <> [ "sleep(25);" ]
    <> wrapWhileLoop (nbUts <> " > " <> nbUtsDone) -- while there are tests that are not done
        -- check if we can start new tests
        -- if so, start the next one, otherwise wait
        ( [] -- "print('N Tests: ' + " <> nbUts <> " + ' | N Tests Running: ' + " <> nbUtsRunning <> " + ' | N Tests Done: ' + " <> nbUtsDone <> ");" ]
            <> wrapIf (nbUtsRunning <> " < 10")
                [ "startnew(UnitTest_RunNext);" ]
            <> [ "yield();" ]
        )
    <> [ printResults.call [] <> ";"
      , "print('Completed ' + " <> nbUts <> " + ' unit tests.');"
      ]

runNextTest :: AsFunction
runNextTest =
  wrapFunction "void" "UnitTest_RunNext" []
    $ [ "while (" <> nbUtsStarted <> " >= " <> nbUts <> ") { yield(); }"
      , "uint id = " <> nbUtsStarted <> "++;"
      , nbUtsRunning <> "++;"
      , utGs <> "[id] = TestStatus::Started;"
      -- , "print('Starting test: ' + " <> utNames <> "[id]);"
      ]
    <> wrapTryCatch
        [ utFuncs <> "[id]();  // run directly -- not as coro since we're already a coro"
        , utGs <> "[id] = TestStatus::Passed;"
        , nbUtsPassed <> "++;"
        -- , "print('Test passed: ' + " <> utNames <> "[id]);"
        ]
        [ utGs <> "[id] = TestStatus::Failed;"
        , "string exInfo = getExceptionInfo();"
        , utFms <> "['' + id] = exInfo;"
        -- , "print('Test failed: ' + " <> utNames <> "[id] + ' => ' + exInfo);"
        ]
    <> [ nbUtsRunning <> "--;"
      , nbUtsDone <> "++;"
      , "print('Test completed: ' + " <> utNames <> "[id]);"
      ]

tsFailed ∷ String
tsFailed = "TestStatus::Failed"

printResults :: AsFunction
printResults =
  wrapFunction "void" "UnitTest_SuiteComplete_PrintResults" []
    (printSummary <> printFailed <> [ "print('Tests took: ' + (Time::Now - _unitTests_startedAt) + ' ms');" ])
  where
  printSummary =
    [ "print('" <> c_green_700 <> "Tests run: ' + " <> nbUts <> ");"
    , "print('" <> c_green_700 <> "Tests passed: ' + " <> nbUtsPassed <> ");"
    ]

  printFailed =
    wrapForLoop ("uint id = 0; id < " <> nbUts <> "; id++")
      ( wrapIf (utGs <> "[id] == " <> tsFailed)
          [ "print('" <> c_orange_600 <> "' + " <> utNames <> "[id] + ' failed with message: ' + string(" <> utFms <> "['' + id]));" ]
      )
