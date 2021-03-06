#if UNIT_TEST
namespace Test_DictOfInt_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfInt_WriteLog_CommonTesting() {
    RegisterUnitTest('UnitTest_Common_Nop', UnitTest_Common_Nop);
  }
  
  bool runAsync(CoroutineFunc@ func) {
    startnew(func);
    return true;
  }
  
  void assert(bool condition, const string &in msg) {
    if (!condition) {
      throw('Assert failed: ' + msg);
    }
  }
  
  void debug_trace(const string &in msg) {
    trace(msg);
  }
  
  int countFileLines(const string &in path) {
    IO::File f(path, IO::FileMode::Read);
    string contents = f.ReadToEnd();
    f.Close();
    return contents.Split('\n').Length - (contents.EndsWith('\n') ? 1 : 0);
  }
  
  void UnitTest_Common_Nop() {
  }
  
  bool unitTestResults_DictOfInt_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfInt_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfInt_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfInt_WriteLog', UnitTest_DictBacking_DictOfInt_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfInt_WriteLog(DictOfInt_WriteLog@ testDict, uint n, const string &in key, int value) {
    testDict.Set(key, value);
    _DictOfInt_WriteLog::KvPair@ tmpKV = _DictOfInt_WriteLog::KvPair(key, value);
    string e = ' for test #' + n + ', k: ' + key;
    assert(value == testDict.Get(key), '.Get' + e);
    assert(value == testDict[key], '.opIndex' + e);
    assert(testDict.Exists(key), '.Exists' + e);
    assert(testDict.GetItem(key) == tmpKV, '.GetItem' + e);
    assert(n == testDict.GetSize(), '.GetSize' + e);
    assert(n == testDict.GetKeys().Length, '.GetKeys.Length' + e);
    assert(n == testDict.GetItems().Length, '.GetItems.Length' + e);
    assert(0 <= testDict.GetKeys().Find(key), '.GetKeys.Find' + e);
    assert(testDict.Delete(key), '.Delete' + e);
    assert(n == testDict.GetSize() + 1, '.GetSize+1' + e);
    assert(!testDict.Exists(key), '!.Exists' + e);
    testDict.Set(key, value);
    yield();
    return true;
  }
  
  void UnitTest_DictBacking_DictOfInt_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfInt_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfInt_WriteLog.txt');
    }
    DictOfInt_WriteLog@ testDict = DictOfInt_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfInt_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 1, "??????????????????????????????", -424411);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 2, "???", 158112);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 3, "?????????????????????", 495249);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 4, "???????????????????????", -908024);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 5, "?????????????????????????????", 325502);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 6, "??????", -983399);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 7, "?????????", -673067);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 8, "???????????????????????????", 272468);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 9, "?????????????????", -812524);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 10, "???", -927237);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 11, "???4?????????????????", -304982);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 12, "??????", -772731);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 13, "????????????????????", -720539);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 14, "???????????????", -73180);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 15, "???????????", -151673);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 16, "?????????????????????", 95984);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 17, "????????????", -166429);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 18, "????????????", 827732);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 19, "????????", 197908);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 20, "??????????????????", 704856);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 21, "?????????", 751539);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 22, "???????????", -656884);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 23, "??????????????????", 513378);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 24, "???", 853283);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 25, "????????????", -78255);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 26, "?????????????????????", 26839);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 27, "??????????????????????????????", 201094);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 28, "?????????????????", 925762);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 29, "?????????????????????", -411591);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 30, "??????????????", -422937);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 31, "??????????????????????????????", 275210);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 32, "????????????????????????", 720849);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 33, "??????????????????", -962124);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 34, "???????????", -780037);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 35, "???????????????????????????", 275291);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 36, "?????????", 975376);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 37, "???", 502637);
    Test_ProxyFns_DictOfInt_WriteLog(testDict, 38, "??????????????????", -878784);
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfInt_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfInt_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(38 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfInt_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfInt_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfInt_WriteLog_DictBacking);
}
#endif