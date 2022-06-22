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
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", 806449);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 2, "㦁", 158112);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 3, "䁝籤뗷쫷蚙폢昳", 495249);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 4, "䷨乄䉹뚩㵜ܘ", 19370);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 5, "칍ⷃ筯颔↢", 325502);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 6, "댷턾", 451852);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 7, "㰎ॵ覫돬홊稛㏭捪氏鰥", 510574);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 8, "ꤜ즱妖䜇붧煟", 729753);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 9, "㏣咊䈍4ᥜ勼ⲓ", 922877);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 10, "㕈�뙷瀊喘ٵ搕霆ս", 627618);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 11, "฼叆", 978498);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 12, "䉫ޒࡏ堶帆", 250335);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 13, "ꝝ벤", 95984);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 14, "㤯沣﯄ஂ", 432877);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 15, "Ɓ㢛㠘풂ﱊ傹", 691526);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 16, "쁇愾ࡽ", 839412);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 17, "", 446794);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 18, "춎༬⏴翏堙艚泄釳ꑼ", 474842);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 19, "˔", 716096);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 20, "㘇径밋㧀䊧쪘싣Ｋ", 734568);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 21, "ꝁ聞", 915442);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 22, "겣柆璢뎙�葘", 910156);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 23, "㷸肳㥾ﹲ缂釺", 95873);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 24, "�燨捞ῧ泦탞ꙹꛡ", 463145);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 25, "뗖튧", 18461);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 26, "柳䊬폥꒠퉝更誓皵䯬", 548107);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 27, "ᑐ㥠⍟", 512590);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 28, "숑㚯붣쮑ꡛ쏜번", 607425);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 29, "ƣ튧鶬", 797693);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 30, "�餥娧礁밵", 423678);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 31, "ｇ믡똘", 275291);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 32, "ᣃ刖ꛥ", 975376);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 33, "ﱋ⌎媑", 568243);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 34, "ꣵ죰爲", 158875);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 35, "�䛊⳱獡筕됋", 859666);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 36, "錮앬撏雇㧱", 432401);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 37, "쐁", 411556);
    Test_ProxyFns_DictOfUint_WriteLog(testDict, 38, "簁劀ޓ匴薻릃难꘱䮲", 585360);
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