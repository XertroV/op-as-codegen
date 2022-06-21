#if UNIT_TEST
namespace Test_DictOfUintToArrayOfUint_WDefault_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfUintToArrayOfUint_WDefault_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfUintToArrayOfUint_WDefault_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfUintToArrayOfUint_WDefault_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfUintToArrayOfUint_WDefault_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfUintToArrayOfUint_WDefault_WriteLog', UnitTest_DictBacking_DictOfUintToArrayOfUint_WDefault_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(DictOfUintToArrayOfUint_WDefault_WriteLog@ testDict, uint n, uint key, const uint[] &in value) {
    testDict.Set(key, value);
    _DictOfUintToArrayOfUint_WDefault_WriteLog::KvPair@ tmpKV = _DictOfUintToArrayOfUint_WDefault_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfUintToArrayOfUint_WDefault_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToArrayOfUint_WDefault_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToArrayOfUint_WDefault_WriteLog.txt');
    }
    DictOfUintToArrayOfUint_WDefault_WriteLog@ testDict = DictOfUintToArrayOfUint_WDefault_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUintToArrayOfUint_WDefault_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 1, 303792, {196696, 317393, 994136, 322174});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 2, 480760, {158112});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 3, 26688, {213504, 921380, 305445});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 4, 335094, {8624});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 5, 257855, {921440, 748813, 102363, 944764});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 6, 305178, {344883, 770474});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 7, 325502, {826069, 7336});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 8, 447238, {176947, 451852});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 9, 395324, {669650, 43391});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 10, 117704, {510574});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 11, 705053, {872863, 435926, 72970, 946522});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 12, 922050, {936167, 922877, 985726});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 13, 259004, {674471, 6666});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 14, 878039, {461061, 978498, 873330});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 15, 188916, {504747});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 16, 963856, {432877, 95984});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 17, 369191, {521062});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 18, 147937, {138470, 691526});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 19, 197908, {770817});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 20, 30371, {236480, 446794});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 21, 704856, {742001});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 22, 70241, {639843, 474842});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 23, 716096, {546221});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 24, 331497, {131593, 853283, 227936, 513378});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 25, 734568, {811409, 68804});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 26, 186514, {900978, 320871, 997590});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 27, 26839, {85811, 571618});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 28, 927485, {425713, 809863, 95873});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 29, 925762, {765426, 154690, 403102});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 30, 818641, {463145});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 31, 18461, {763133, 719100});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 32, 608095, {512590, 746771, 275210, 548107});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 33, 479693, {911687, 238538, 741229, 684538});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 34, 493678, {703892, 321767, 607425});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 35, 457176, {348656, 960954});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 36, 869105, {19055});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 37, 275291, {249995});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 38, 653415, {869169, 502637});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 39, 90168, {546826, 524812, 146563});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 40, 102175, {591737, 928716, 33820, 158875});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 41, 526691, {528692, 182075, 354540, 109712});
    Test_ProxyFns_DictOfUintToArrayOfUint_WDefault_WriteLog(testDict, 42, 606826, {585360, 569198, 945693, 709702});
    sleep(50);
    assert(42*2 == countFileLines(IO::FromDataFolder('Storage/codegenTest/test/DictOfUintToArrayOfUint_WDefault_WriteLog.txt')), "Should have written exactly 42*2 lines to the log, but wrote: " + countFileLines(IO::FromDataFolder('Storage/codegenTest/test/DictOfUintToArrayOfUint_WDefault_WriteLog.txt')));
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfUintToArrayOfUint_WDefault_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUintToArrayOfUint_WDefault_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(42 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToArrayOfUint_WDefault_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfUintToArrayOfUint_WDefault_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfUintToArrayOfUint_WDefault_WriteLog_DictBacking);
}
#endif