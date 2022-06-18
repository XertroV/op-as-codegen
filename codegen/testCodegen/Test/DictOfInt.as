#if UNIT_TEST
namespace Test_DictOfInt {
  /* Test // Mixin: Common Testing */
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
    print('\\$26fUnit Test Start: UnitTest_Common_Nop (42 tests)');
    print('\\$2f6Unit Test Success: UnitTest_Common_Nop (42 tests)');
    return;
  }
  
  bool unitTestResults_DictOfInt_CommonTesting = true
    && runAsync(CoroutineFunc(UnitTest_Common_Nop))
    ;
  
  /* Test // Mixin: Dict Backing */
  bool Test_ProxyFns_DictOfInt(DictOfInt@ testDict, uint n, const string &in key, int value) {
    testDict.Set(key, value);
    DictOfInt::KvPair@ tmpKV = DictOfInt::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfInt() {
    print('\\$26fUnit Test Start: UnitTest_DictBacking_DictOfInt (42 tests)');
    DictOfInt@ testDict = DictOfInt();
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfInt(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", -424411);
    Test_ProxyFns_DictOfInt(testDict, 2, "ꍚ", 158112);
    Test_ProxyFns_DictOfInt(testDict, 3, "䁝籤뗷쫷蚙폢昳", 495249);
    Test_ProxyFns_DictOfInt(testDict, 4, "䷨乄䉹뚩㵜ܘ", -908024);
    Test_ProxyFns_DictOfInt(testDict, 5, "栋ˆ칍ⷃ筯颔↢衩", 325502);
    Test_ProxyFns_DictOfInt(testDict, 6, "댷턾", -983399);
    Test_ProxyFns_DictOfInt(testDict, 7, "鼑혅凐", -673067);
    Test_ProxyFns_DictOfInt(testDict, 8, "돬홊稛㏭捪氏鰥鎾脔", 272468);
    Test_ProxyFns_DictOfInt(testDict, 9, "៲䔸僯ʚ땚㰎", -812524);
    Test_ProxyFns_DictOfInt(testDict, 10, "䜇", -927237);
    Test_ProxyFns_DictOfInt(testDict, 11, "䈍4ᥜ勼ⲓﶄʿꤜ", -304982);
    Test_ProxyFns_DictOfInt(testDict, 12, "瑅㏣", -772731);
    Test_ProxyFns_DictOfInt(testDict, 13, "뙷瀊喘ٵ搕霆", -720539);
    Test_ProxyFns_DictOfInt(testDict, 14, "謓฼叆䈋㷸", -73180);
    Test_ProxyFns_DictOfInt(testDict, 15, "䉫ޒࡏ堶", -151673);
    Test_ProxyFns_DictOfInt(testDict, 16, "湴瘖暹ꝝ벤゜", 95984);
    Test_ProxyFns_DictOfInt(testDict, 17, "㤯沣﯄ஂ", -166429);
    Test_ProxyFns_DictOfInt(testDict, 18, "풂ﱊ傹鮠", 827732);
    Test_ProxyFns_DictOfInt(testDict, 19, "蘅Ɓ", 197908);
    Test_ProxyFns_DictOfInt(testDict, 20, "ꑼ建皟䆆", 704856);
    Test_ProxyFns_DictOfInt(testDict, 21, "堙艚泄", 751539);
    Test_ProxyFns_DictOfInt(testDict, 22, "˗釹춎༬", -656884);
    Test_ProxyFns_DictOfInt(testDict, 23, "䊧쪘싣Ｋꚛ躩", 513378);
    Test_ProxyFns_DictOfInt(testDict, 24, "径", 853283);
    Test_ProxyFns_DictOfInt(testDict, 25, "聞풖Ⓑ", -78255);
    Test_ProxyFns_DictOfInt(testDict, 26, "겣柆璢뎙�葘ꫵ", 26839);
    Test_ProxyFns_DictOfInt(testDict, 27, "㥾ﹲ缂釺耄隒喠�", 201094);
    Test_ProxyFns_DictOfInt(testDict, 28, "⬺ʁ籁蔒헃", 925762);
    Test_ProxyFns_DictOfInt(testDict, 29, "�燨捞ῧ泦탞ꙹ", -411591);
    Test_ProxyFns_DictOfInt(testDict, 30, "ﾨئ뗖튧�", -422937);
    Test_ProxyFns_DictOfInt(testDict, 31, "푇柳䊬폥꒠퉝更誓皵", 275210);
    Test_ProxyFns_DictOfInt(testDict, 32, "ꡛ쏜번⤫愪ᑐ㥠", 720849);
    Test_ProxyFns_DictOfInt(testDict, 33, "樹믕㸊奯숑㚯", -962124);
    Test_ProxyFns_DictOfInt(testDict, 34, "聏ƣ튧鶬", -780037);
    Test_ProxyFns_DictOfInt(testDict, 35, "ｇ믡똘ꌣ皈�餥娧礁", 275291);
    Test_ProxyFns_DictOfInt(testDict, 36, "ᣃ刖ꛥ", 975376);
    Test_ProxyFns_DictOfInt(testDict, 37, "椾", 502637);
    Test_ProxyFns_DictOfInt(testDict, 38, "ﱋ⌎媑", -878784);
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
    print('\\$2f6Unit Test Success: UnitTest_DictBacking_DictOfInt (42 tests)');
    return;
  }
  
  bool unitTestResults_DictOfInt_DictBacking = true
    && runAsync(CoroutineFunc(UnitTest_DictBacking_DictOfInt))
    ;
}
#endif