#if UNIT_TEST
namespace Test_DictOfUintToCompRoundMatch_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfUintToCompRoundMatch_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfUintToCompRoundMatch_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfUintToCompRoundMatch_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfUintToCompRoundMatch_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfUintToCompRoundMatch_WriteLog', UnitTest_DictBacking_DictOfUintToCompRoundMatch_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(DictOfUintToCompRoundMatch_WriteLog@ testDict, uint n, uint key, CompRoundMatch@ value) {
    testDict.Set(key, value);
    _DictOfUintToCompRoundMatch_WriteLog::KvPair@ tmpKV = _DictOfUintToCompRoundMatch_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfUintToCompRoundMatch_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToCompRoundMatch_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToCompRoundMatch_WriteLog.txt');
    }
    DictOfUintToCompRoundMatch_WriteLog@ testDict = DictOfUintToCompRoundMatch_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUintToCompRoundMatch_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 1, 303792, CompRoundMatch(481159, 346360, true, "", "㡂쓷苒"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 2, 317393, CompRoundMatch(196696, 480760, true, "㦁", "폢昳豜䍤"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 3, 934426, CompRoundMatch(495249, 450933, true, "ꄂ", ""));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 4, 944764, CompRoundMatch(102363, 748813, true, "칍ⷃ筯颔↢", "優缴댷턾ﮞ栋"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 5, 451852, CompRoundMatch(176947, 395324, true, "䛋��ꌥ嗪⩳䆈‴硻", "쳘"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 6, 946522, CompRoundMatch(72970, 435926, false, "瑅㏣咊䈍4ᥜ勼ⲓﶄ", "㕈�뙷瀊喘ٵ搕霆ս"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 7, 627618, CompRoundMatch(216399, 873330, false, "ꗄ", "ᖲ⭃땫쿅鑚"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 8, 867702, CompRoundMatch(208171, 992078, false, "㤯沣﯄ஂﺻ", "Ɓ㢛㠘풂ﱊ傹鮠糈"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 9, 138470, CompRoundMatch(197908, 839412, false, "勚ࣸ", "찊튩筪㮪"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 10, 742001, CompRoundMatch(70241, 908955, false, "˔�˗", ""));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 11, 327322, CompRoundMatch(97308, 513378, true, "", "녖ퟆ軘῍ꓪ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 12, 186514, CompRoundMatch(304645, 258378, false, "ﹲ缂釺耄隒", "⬺ʁ籁蔒헃㷸肳"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 13, 639814, CompRoundMatch(312418, 491609, false, "㯌㝱捍鵘獜", "詙ퟶ釘躟ᇗ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 14, 763133, CompRoundMatch(608095, 195740, false, "번⤫愪ᑐ㥠⍟퇄", "믕㸊奯숑㚯붣쮑ꡛ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 15, 607425, CompRoundMatch(321767, 703892, false, "津ઝ", "煔ݐ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 16, 869105, CompRoundMatch(686934, 355441, false, "", "ᣃ刖ꛥ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 17, 975376, CompRoundMatch(502637, 869169, true, "෫ὴ㣷", ""));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 18, 524812, CompRoundMatch(546826, 102175, false, "筕됋䏄峹", "雇㧱홨�䛊⳱"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 19, 537084, CompRoundMatch(432401, 381848, true, "સ揾⥵ะ껩�繞", "桍⻣杋"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 20, 908495, CompRoundMatch(75472, 481298, false, "롇�ꭹ膺ᓣ㔺͒桝", "㿎휹ᬸꤏꋹ᧿뛀퀫"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 21, 303837, CompRoundMatch(761761, 658988, true, "", "㲟釐쩔䧟"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 22, 928827, CompRoundMatch(966017, 774023, true, "➙꟒ὢ벨ۻ", "먴�ຸ趓⃛呱鋜髫"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 23, 225738, CompRoundMatch(390295, 791476, true, "", "ρ㉧｀Ꞿ時ﭠ宂귓ᚑ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 24, 842421, CompRoundMatch(470493, 910316, false, "詊", "⊪蔸：쫂ᜪ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 25, 737342, CompRoundMatch(264412, 531935, false, "", "�쏽Ϩ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 26, 328559, CompRoundMatch(810041, 652547, true, "ⓓ畗⚻ꜚ", "敢諗뗛悗畆"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 27, 340926, CompRoundMatch(790018, 627356, true, "[鬹햤샳둊", "⟤䨽랥"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 28, 259448, CompRoundMatch(861134, 544383, false, "箱ﴩ", "乪剤⹥먃ꑐ㷠얌苫"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 29, 266751, CompRoundMatch(264422, 288314, true, "鬌", "장浟븫䲾鳚㜰瞷汏䋐泔"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 30, 188684, CompRoundMatch(669048, 393301, true, "㳦꛹槛컙瞘䝩땑̀", "⺫晋败땒ဍ䞽隫ा"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 31, 466790, CompRoundMatch(745872, 464164, true, "笣戇旮૮", "ᛌᢡ᬴"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 32, 925226, CompRoundMatch(407553, 591518, false, "♾췲뫤귷軿賨㠙踎", ""));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 33, 688823, CompRoundMatch(748245, 296832, true, "", "匤鴑凡깁䧌鼏㮒"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 34, 157778, CompRoundMatch(320484, 948802, false, "㔚ﳂ뙾덲ᆰ씳҄�", "섞⌱방"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 35, 172472, CompRoundMatch(215078, 780184, false, "�㰸牏짰除", "ṭ䵅䇛盈�塓"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 36, 920107, CompRoundMatch(108626, 207948, true, "仡", "年鴔꠿र칛첑彠"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 37, 263770, CompRoundMatch(193441, 687257, true, "ꧽ݊ꨲ�ၦ艍䇯肽", "ᶢ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 38, 96567, CompRoundMatch(961841, 274541, false, "婁ホ", "࡭Þ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 39, 797319, CompRoundMatch(648241, 182563, false, "셐뒛㡁ꟍ", "�蠚ʿ덏⡀谍嬶ᡗ"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 40, 572579, CompRoundMatch(866730, 656797, true, "", "슁⾵蛆"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 41, 501966, CompRoundMatch(481364, 487701, true, "炾闂ၠ岶﹊ᘀ", "䥴녊璄殲麖"));
    Test_ProxyFns_DictOfUintToCompRoundMatch_WriteLog(testDict, 42, 943607, CompRoundMatch(773439, 31342, true, "�悅蝽", "䔟펼藹嶦巯ฐ"));
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfUintToCompRoundMatch_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUintToCompRoundMatch_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(42 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToCompRoundMatch_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfUintToCompRoundMatch_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfUintToCompRoundMatch_WriteLog_DictBacking);
}
#endif