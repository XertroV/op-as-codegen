#if UNIT_TEST
namespace Test_DictOfBool_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfBool_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfBool_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfBool_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfBool_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfBool_WriteLog', UnitTest_DictBacking_DictOfBool_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfBool_WriteLog(DictOfBool_WriteLog@ testDict, uint n, const string &in key, bool value) {
    testDict.Set(key, value);
    _DictOfBool_WriteLog::KvPair@ tmpKV = _DictOfBool_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfBool_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfBool_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfBool_WriteLog.txt');
    }
    DictOfBool_WriteLog@ testDict = DictOfBool_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfBool_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 2, "계揨锖＼叢", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 3, "籤뗷쫷", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 4, "啐", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 5, "㵜ܘ閿", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 6, "쮿饿쾿턪靾ꐋ亩", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 7, "칍ⷃ筯", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 8, "�돉낦郛㾮鼧", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 9, "홊稛㏭捪氏鰥鎾脔䚃", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 10, "䆈", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 11, "៲䔸僯ʚ땚", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 12, "�ⷴ佖䙞", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 13, "㏣咊䈍4ᥜ勼ⲓ", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 14, "嚷뢷빫턢ᘴ젽攚", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 15, "謓฼叆䈋㷸㕈�", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 16, "ᖲ⭃땫쿅鑚", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 17, "湴瘖暹ꝝ벤゜", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 18, "է荅拎妣퍴媱", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 19, "ꂘ簚♩ֿ⢽௙탚", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 20, "", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 21, "Ѱѡ꣐찊튩筪㮪", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 22, "˗釹춎", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 23, "⿡ꁑ뎝탩罈ﮁ厇翟", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 24, "풖Ⓑ㘇", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 25, "ퟆ", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 26, "겣柆璢뎙�葘ꫵ", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 27, "釺耄隒喠", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 28, "礪瀙 ꨩ晄ᬽ", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 29, "覤憸⢂ෘ⟳孶ꮣ", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 30, "뜟�", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 31, "㝱", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 32, "폥꒠퉝更誓皵䯬껠", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 33, "꾠ૐﷅ", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 34, "쏜번⤫愪ᑐ", true);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 35, "樹믕㸊奯숑㚯", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 36, "津ઝ紤⛍射톀", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 37, "ｇ믡똘ꌣ皈�餥", false);
    Test_ProxyFns_DictOfBool_WriteLog(testDict, 38, "坁䠋鉮쥘΍쐡", true);
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfBool_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfBool_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(38 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfBool_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfBool_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfBool_WriteLog_DictBacking);
}
#endif