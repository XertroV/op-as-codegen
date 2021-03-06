#if UNIT_TEST
namespace Test_DictOfTmMap_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfTmMap_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfTmMap_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfTmMap_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfTmMap_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfTmMap_WriteLog', UnitTest_DictBacking_DictOfTmMap_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfTmMap_WriteLog(DictOfTmMap_WriteLog@ testDict, uint n, const string &in key, TmMap@ value) {
    testDict.Set(key, value);
    _DictOfTmMap_WriteLog::KvPair@ tmpKV = _DictOfTmMap_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfTmMap_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfTmMap_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfTmMap_WriteLog.txt');
    }
    DictOfTmMap_WriteLog@ testDict = DictOfTmMap_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfTmMap_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 1, "??????????????????????????????", TmMap("??????????????????", "?????????", "?????????", "", 584122, 8624, 257855, 444245, "???????????????", "??????????????????", "????????????????????????", "????????????????????????", "???????????????", "?????????????????", 828138, "????????????????????", "?????????????????????????????", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 2, "?????????????????????", TmMap("??????", "???????????", "?????????????????????", "??????????????????", 432877, 369191, 827732, 585107, "?????????????????????", "??????????????????", "????????????????????????????", "???????????????????????????", "?????????", "???????????????", 320871, "", "????????????", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 3, "????????????", TmMap("?????????????????????????????", "?????????????????????", "?????????", "?????????????????????????????", 938887, 548107, 275210, 746771, "???????????????", "??????????????????", "???????????", "", "???????????????", "???", 19055, "???????????????????????????", "???", "???????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 4, "???", TmMap("?????????", "?????????", "???????????????????????????", "???", 65272, 321869, 537084, 432401, "???", "???????????????", "", "??????????????????????????", "??????????????????????????", "????????????????????????", 303837, "???????????????", "", "???"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 5, "??", TmMap("??????", "???????????????????????????", "????????????????????????", "??", 230141, 522418, 611883, 411634, "?????????", "?????????????????????????????", "???????????????????????????", "??????????????????????????????", "", "???????????????????????", 530573, "", "??????????????????", "?????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 6, "???????????????", TmMap("???????????????", "", "???????????????????????????", "", 360730, 876609, 417401, 832404, "??????", "??????", "?????????", "????????????", "???????????????????????????", "???????????????????????????", 372790, "???", "????????????????????????", "????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 7, "??????????????????????????????", TmMap("???", "", "?????????", "??????", 360745, 797319, 648241, 182563, "????????????????????", "??????????????????????????????", "??????????????????????????????", "???????????????????????", "???????????????????????????", "???????????????????????????", 44122, "????????????", "????????????????????????", "????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 8, "??????????????????", TmMap("??????????????????????????????", "????????????", "??????????????????????????", "??????", 735984, 328733, 466309, 428539, "???", "??????????????????????????", "???????????????", "????????????", "???????????", "???????????", 669412, "??????", "??????", "??????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 9, "?????????????????????", TmMap("????????????", "??????????????????????????????", "", "????????????????????????", 446623, 737218, 547731, 179184, "?????????????????????????????", "?????????", "??????????????????", "????????????????????????", "???????????????????????????", "", 569937, "??????????????????????????????", "????????????????????", "??????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 10, "?????????", TmMap("????????????", "?????????????????????", "", "??????????????????????????????", 772445, 749289, 946736, 783365, "??????????????????????????????", "???????????????????????????", "???????????????", "?????????", "?????????", "???????????????????????????", 336000, "???", "????????????", "??????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 11, "????????????", TmMap("?????????", "???????????????", "??????????????????", "???????????????", 80948, 811357, 897023, 124520, "???", "", "??????????????", "???????????????????????????", "????????", "????????????", 106838, "", "???", "????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 12, "????????????????????????", TmMap("??????????????", "?????????A??????", "???", "??????", 6306, 621961, 911765, 545224, "?????????????????", "", "????????????", "?????????????????????", "???????????????????????????", "???????????????", 951561, "???????????????????????????", "??????????????????", "????????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 13, "??????????????????", TmMap("?????????????????", "??????????????????????????????", "?????????????????????", "??????????????????", 786239, 907307, 537631, 171434, "????????????", "????????????(????????????", "???????????????????????????", "?????????????????????", "?????????????????????", "???????????????", 241918, "????????????????????", "??????????????????????????????", "?????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 14, "???", TmMap("??????????????????", "??????", "?????????????????", "", 71658, 992189, 530089, 93399, "??????", "????????????", "???????????????????????????", "?????????", "??????????????????????????????", "?????????????????????", 656523, "??????????????????", "??????????????", "??????????????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 15, "????????????", TmMap("??????", "", "???????????????", "?????????", 21323, 542072, 283977, 285704, "", "???????????????????????????", "??????????????????", "???", "????????????????????", "???", 316309, "?????????????????????????", "??????????????????", "???"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 16, "?????????????????????", TmMap("???????????????", "??????????????????", "?????????????????", "??????????????????????????", 764723, 922231, 27869, 629368, "????????????????????", "?????????", "??????????????????", "???", "???????????????????", "?????????????????????????????", 504961, "?????????????????????", "??????????????????", "?????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 17, "???????????????", TmMap("???????????????", "???????????????", "???", "?????????????????????", 44241, 545110, 425348, 535505, "???", "???????????????", "??????????????????", "???????????????", "??????????????????", "????????", 976091, "", "??????????????????", "???"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 18, "??????????????????????????????", TmMap("?????????????????????", "M????????????", "?????????????????????", "??????????????????", 148152, 821242, 20883, 596703, "???", "???????????????????????????", "?????????????????????", "?????????????????????", "????????????", "????????????", 376447, "???????????????????????????", "????????????????????????", "????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 19, "??????", TmMap("????????????????????????", "??????????????????????????", "??????", "?????????????????????", 407067, 762301, 642097, 304455, "?????????????????????", "???????????????????????????", "?????????????????????", "???????????", "??????????????????????????????", "??????????????????", 525525, "??????????????????????????????", "????????????????????????", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 20, "???????????", TmMap("??????", "????????????", "????????????????????????", "???????????", 789461, 471851, 705421, 800636, "??????????????????????????????", "?????????????????????", "", "??????", "??????", "???????????????????????????", 64069, "??????????????????????????????", "??????", "???"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 21, "?????????????????", TmMap("???????????", "??????????????????????????????", "????????????", "??????", 201741, 102356, 160713, 4456, "???????????????", "?????????", "?????????????????????????????", "????????????????????????", "???????????????????????????", "?????????????????????", 306866, "???????????????", "", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 22, "???", TmMap("?????????????????????", "?????????", "???", "??????", 231960, 522629, 141813, 226223, "", "???", "?????????", "?????????????????????", "???????????????", "??????", 212308, "??????????????????????????????", "??????????????", "????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 23, "??????", TmMap("???????????????", "", "???????????????????????????", "????????", 613585, 371717, 768848, 3156, "???????????????", "", "", "???", "?????????", "????????????", 465204, "????????????", "????????????", "????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 24, "???????????????", TmMap("????????????????????????", "?????????", "??????", "???", 30575, 276233, 859973, 873720, "?????????????????????", "???", "", "?????????????????????", "", "????????????", 339111, "??????????????????", "???????????", "?????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 25, "??????", TmMap("???", "?????????????????????", "?????????", "???????????????", 166591, 393307, 271255, 387947, "", "??????????????", "?????????", "?????????????????????", "?????????????????????", "??????????????????????????????", 315111, "????????????", "????????????", "????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 26, "???????????????", TmMap("??????????????????", "???", "?????????????????", "??????????????????????????????", 699593, 288153, 549039, 847687, "??????????????????????????????", "??????", "???", "????????????", "???", "??????????????????????????????", 472971, "??????????????????????????????", "????????????", "???????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 27, "???", TmMap("?????????????????????", "?????????", "??????????????????", "??????????????????????????", 891519, 537602, 854674, 546289, "??????????????????", "??????", "?????????", "???????????????", "???", "????????????", 698512, "??????", "?????????", "????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 28, "???????????????", TmMap("???", "?????????????????????", "???", "????????????", 947839, 968102, 908865, 218470, "?????????????????????", "?????????????????", "???", "", "???", "?????????", 357058, "?????????????????????????????", "??????????????????????????????", "??????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 29, "?????????????????????", TmMap("??????", "??????????????????????????????", "??????", "????????????????????????", 695913, 25521, 264789, 422554, "?????????????????????", "????????????????????", "??????????????????????????", "?????????????????????", "????????????", "???????????", 850503, "????????????", "??????", "??????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 30, "?????????????????????", TmMap("????????????????????????", "???????????????????????", "???????????????????????????", "????????????????????", 434616, 753499, 981754, 15670, "??????????????????", "???", "?????????", "?????????", "?????????????????", "", 573108, "?????????????????????", "??????????????????", "??????????????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 31, "???", TmMap("??????", "???", "???????????????????????", "", 380785, 807100, 481543, 558626, "??????????????????????????????", "????????????", "????????????", "????????????", "??????", "??????????????????", 402619, "???????????????", "???", "???????????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 32, "????????????", TmMap("????????????", "???????????????????????????", "????????????", "????????????????????????", 936241, 372409, 75696, 273803, "?????????", "??????????????????", "???????????????", "?????????????????????????????", "????????????????????????", "???????????????", 334170, "???", "", "?????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 33, "????????????????????????????", TmMap("????????????????????????", "??????????????????????????", "???????????????????????", "??????????????????", 213956, 478636, 75055, 159777, "??????????????????", "??????????????", "????????????????????????", "?????????????????????", "???????????????????????????", "", 830173, "??????", "????????????????????????????", "??????g??????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 34, "???????????????????????????", TmMap("????????????????????????", "???", "???????????????", "???????????????????????", 366151, 238240, 650573, 967118, "?????????", "???????????????", "???", "?????????????????", "?????????????????????", "????????????", 653946, "", "????????????????????????", "??????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 35, "???????????????", TmMap("???", "??????????????????", "??????", "??????????????????????????????", 21483, 927728, 348103, 878693, "????????????????????????", "?????????????????????????????", "???????????????", "??????", "????????????????????????", "????????????", 367016, "???????????????", "??????", "???"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 36, "????????????", TmMap("????????????????????", "???????????????", "???", "??????????????", 297450, 976159, 94480, 994351, "???????????????????????????", "??????????????????", "", "???", "??????????????????????????????", "??????????????????", 116824, "???", "????????????????????????", "???????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 37, "?????????", TmMap("???????????????????????????", "?????????????????????", "???????????????", "??????", 71334, 146127, 131837, 668764, "???????????????????????????", "???", "??????", "????????????????????????", "??", "????????????????????", 857901, "?????????", "??????????????????", "??????????????????????????????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 38, "????????????????????????", TmMap("?????????????????????????????", "???????????????", "??????????????????????????????", "???", 948504, 816023, 413169, 432347, "?????????????????????", "??????????????????????", "???????????????", "???????????????", "??????????????????????????????", "?????????????????????", 81184, "?????????????????????", "", "???"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 39, "???????????????", TmMap("??????????????????????????????", "??????????????????????????????", "?????", "????????????????????????", 140457, 687592, 983025, 39149, "???", "??????", "???", "???????????????", "????????????", "???", 226981, "???????????????", "???????????????", "??????"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 40, "????????????", TmMap("??????", "????????????????????????", "???", "?????????????????????", 321331, 221054, 658194, 309983, "??????", "???????????????????????????", "??????????????????????????", "??????????????????", "??????????????????????????????", "????????????", 344176, "??????????????????????????????", "???", "??????????????????????????????"));
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfTmMap_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfTmMap_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(40 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfTmMap_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfTmMap_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfTmMap_WriteLog_DictBacking);
}
#endif