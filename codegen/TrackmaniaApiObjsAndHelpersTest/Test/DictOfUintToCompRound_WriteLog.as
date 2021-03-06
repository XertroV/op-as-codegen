#if UNIT_TEST
namespace Test_DictOfUintToCompRound_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfUintToCompRound_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfUintToCompRound_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfUintToCompRound_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfUintToCompRound_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfUintToCompRound_WriteLog', UnitTest_DictBacking_DictOfUintToCompRound_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfUintToCompRound_WriteLog(DictOfUintToCompRound_WriteLog@ testDict, uint n, uint key, CompRound@ value) {
    testDict.Set(key, value);
    _DictOfUintToCompRound_WriteLog::KvPair@ tmpKV = _DictOfUintToCompRound_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfUintToCompRound_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToCompRound_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToCompRound_WriteLog.txt');
    }
    DictOfUintToCompRound_WriteLog@ testDict = DictOfUintToCompRound_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUintToCompRound_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 1, 303792, CompRound(481159, 346360, 243863, 723666, 272809, 791498, "??????????????????????????????", "??????????????????????????", "??????", MaybeOfString("?????????"), "?????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 2, 981442, CompRound(810642, 7336, 826069, 447238, 892527, 981431, "????????????????????????", "???????????????????????????", "???", MaybeOfString("???????????????????????"), "?????????????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 3, 834852, CompRound(695690, 627618, 216399, 873330, 978498, 461061, "???", "???????????????????????????", "??????????????????", MaybeOfString("???????????"), "?????????????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 4, 924115, CompRound(515144, 930280, 339239, 742001, 70241, 908955, "???????????????????????????", "??????????????????", "??????????????????", MaybeOfString(""), "???"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 5, 26839, CompRound(910156, 729909, 304899, 528516, 201094, 816669, "?????????????????", "?????????????????????", "?????????", MaybeOfString(""), "??????????????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 6, 195740, CompRound(466291, 642064, 455567, 693799, 814673, 684538, "?????????????????", "?????????????????????", "?????", MaybeOfString("???"), "?????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 7, 975376, CompRound(502637, 869169, 90168, 105541, 251520, 568243, "?????????", "???????????????????????????", "???", MaybeOfString("?????????"), "???"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 8, 182075, CompRound(528692, 606826, 507440, 359096, 467918, 109743, "??????????????????????????????", "?????????????????????????????", "?????????????????????", MaybeOfString("?????????????????????"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 9, 163721, CompRound(537856, 619189, 233768, 667000, 995954, 594041, "", "??????????????????", "??????????????????????????????", MaybeOfString("??????????????"), "?????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 10, 16321, CompRound(128285, 648111, 909479, 724921, 328559, 810041, "????????????", "???", "???", MaybeOfString(""), "??????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 11, 790018, CompRound(627356, 687861, 802186, 416798, 333499, 515082, "???????????????????????????", "????????????????????????", "???", MaybeOfString("?????????"), "??????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 12, 992293, CompRound(631685, 620875, 509441, 530340, 229795, 44931, "???????????????????????", "", "????????????", MaybeOfString(), "????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 13, 432846, CompRound(350484, 489156, 841143, 369601, 811641, 797421, "???????????", "???????????????", "????????????", MaybeOfString("???????????????"), "??????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 14, 591518, CompRound(492013, 162096, 362767, 632498, 195612, 478887, "?????????????????????????????", "???", "???", MaybeOfString("?????????????????????????????"), "??????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 15, 231734, CompRound(536618, 172472, 215078, 780184, 483426, 761573, "???", "???", "", MaybeOfString("???"), "???"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 16, 808674, CompRound(750781, 758471, 920107, 108626, 207948, 769909, "?????????", "?????????", "????????????", MaybeOfString("???"), "??????????????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 17, 677495, CompRound(958630, 360516, 892949, 360745, 797319, 648241, "?????????????????????????????", "??????", "???????????????????????", MaybeOfString("???"), "??????????????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 18, 974243, CompRound(401678, 166101, 967390, 675078, 282692, 249030, "???????????????", "", "?????????????????????????????", MaybeOfString("??????????????????????????????"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 19, 311474, CompRound(695675, 552976, 991815, 733831, 933037, 799635, "????????????????????????", "?????????????????????", "?????????????????????", MaybeOfString("?????????????????????"), "?????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 20, 283638, CompRound(215246, 796845, 910481, 37565, 307490, 396572, "", "?????????????????????", "??????????????????????????", MaybeOfString("???"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 21, 779838, CompRound(172893, 916155, 158208, 409653, 95629, 649272, "", "????????????????????????", "", MaybeOfString("???"), "????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 22, 535494, CompRound(601890, 594510, 350906, 659998, 989227, 603503, "??????????????????????????", "??????????????????????????????", "???????????????", MaybeOfString("??????????????????"), "????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 23, 149057, CompRound(994865, 776412, 978462, 882577, 453095, 248249, "?????????", "????????????", "?????????????????????", MaybeOfString("???????????????????????"), "????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 24, 550570, CompRound(112647, 678094, 133460, 27896, 138918, 213620, "??????", "???", "?????????????????", MaybeOfString("???????????????????????????"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 25, 134600, CompRound(811, 472873, 130998, 990988, 621673, 640421, "?????????", "???????????????????????????", "??????????????????????", MaybeOfString("????????????"), "????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 26, 980228, CompRound(897486, 182810, 15427, 188396, 290456, 945543, "", "???????????????????????????", "", MaybeOfString("???"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 27, 73684, CompRound(108726, 865567, 500571, 369948, 902168, 982822, "????????????", "?????????????????????", "?????????", MaybeOfString("???"), "??????????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 28, 109627, CompRound(260914, 984171, 528836, 683928, 153122, 310783, "???", "?????????", "", MaybeOfString("??????????????????????????????"), "????????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 29, 123399, CompRound(743510, 956604, 225354, 86865, 825055, 82320, "??????????????????", "???????????????", "???????????????", MaybeOfString("????????????"), "???"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 30, 264607, CompRound(453761, 365806, 467452, 918427, 45811, 900550, "??????????????????????????????", "????????????", "???????????????????????????", MaybeOfString(), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 31, 88639, CompRound(237955, 36127, 884518, 154769, 603565, 127045, "?????????", "?????????????????????????????", "????????????????????", MaybeOfString("?????????????????????"), "?????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 32, 284389, CompRound(80153, 509857, 870317, 922579, 631408, 758921, "??????????????????????????????", "??????????????????????????????", "??????????????????????????????", MaybeOfString("?????????????????????????????"), "???"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 33, 789485, CompRound(130190, 838063, 1570, 898372, 71658, 992189, "????????????????????????", "??????", "", MaybeOfString("???"), "?????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 34, 246961, CompRound(427356, 251769, 201232, 241150, 362488, 607492, "???????????????????????????", "??????????????????", "????????????????????", MaybeOfString("??????????????????"), "??????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 35, 169836, CompRound(875231, 202705, 936706, 46835, 318502, 21323, "", "???", "????????????", MaybeOfString("????????????????????????"), "?????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 36, 23179, CompRound(615276, 493723, 547199, 283624, 637993, 267074, "?????????", "???", "??????????????????", MaybeOfString("??????????????????"), "?????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 37, 181632, CompRound(810503, 859679, 740899, 786355, 889124, 309957, "", "????????", "???????????????", MaybeOfString("??????????????????????????????"), "??????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 38, 885525, CompRound(35550, 241992, 615267, 298963, 803562, 339056, "???????????", "????????????????????????", "??????????????????", MaybeOfString("??????"), "???????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 39, 139549, CompRound(418027, 465207, 741457, 892669, 283645, 349849, "???", "???", "??????", MaybeOfString("???????????????????????????"), "?????????????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 40, 779430, CompRound(572430, 513711, 7215, 976153, 132588, 538271, "????????????", "??????", "??????????????????", MaybeOfString("?????????????????????"), "??????????????????????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 41, 66775, CompRound(12053, 423606, 562264, 424639, 188477, 303240, "????????????", "?????????????????????", "???????????????", MaybeOfString("???????????????"), "???????????????"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 42, 565403, CompRound(480346, 12689, 369316, 580535, 819121, 570777, "??????", "??????????????????", "", MaybeOfString("?????????"), "??????????????????????????"));
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfUintToCompRound_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUintToCompRound_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(42 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToCompRound_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfUintToCompRound_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfUintToCompRound_WriteLog_DictBacking);
}
#endif