#if UNIT_TEST
namespace Test_DictOfUint_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfUint_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfUint_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfUint_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfUint_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfUint_WriteLog', UnitTest_DictBacking_DictOfUint_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfUint_WriteLog(DictOfUint_WriteLog@ testDict, uint n, const string &in key, uint value) {
    testDict.Set(key, value);
    _DictOfUint_WriteLog::KvPair@ tmpKV = _DictOfUint_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfUint_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUint_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUint_WriteLog.txt');
    }
    DictOfUint_WriteLog@ testDict = DictOfUint_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUint_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 1, "??????????????????????????????", 806449);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 2, "???", 158112);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 3, "?????????????????????", 495249);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 4, "???????????????????????", 19370);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 5, "??????????????????", 325502);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 6, "??????", 451852);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 7, "??????????????????????????????", 510574);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 8, "??????????????????", 729753);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 9, "????????????4?????????", 922877);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 10, "????????????????????????????", 627618);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 11, "??????", 978498);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 12, "??????????????", 250335);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 13, "??????", 95984);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 14, "????????????", 432877);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 15, "?????????????????", 691526);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 16, "?????????", 839412);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 17, "???", 446794);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 18, "??????????????????????????????", 474842);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 19, "??", 716096);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 20, "???????????????????????????", 734568);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 21, "?????????", 915442);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 22, "?????????????????????", 910156);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 23, "????????????????????????", 95873);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 24, "???????????????????????????", 463145);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 25, "??????", 18461);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 26, "??????????????????????????????", 548107);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 27, "????????????", 512590);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 28, "?????????????????????", 607425);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 29, "???????????", 797693);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 30, "???????????????", 423678);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 31, "?????????", 275291);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 32, "?????????", 975376);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 33, "??????????????????", 568243);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 34, "?????????", 158875);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 35, "?????????????????????", 859666);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 36, "??????????????????", 432401);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 37, "???", 411556);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 38, "??????????????????????????", 585360);
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfUint_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUint_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(38 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUint_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfUint_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfUint_WriteLog_DictBacking);
}
#endif