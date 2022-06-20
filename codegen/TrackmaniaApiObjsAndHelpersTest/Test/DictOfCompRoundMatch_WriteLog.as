#if UNIT_TEST
namespace Test_DictOfCompRoundMatch_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfCompRoundMatch_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfCompRoundMatch_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfCompRoundMatch_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfCompRoundMatch_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfCompRoundMatch_WriteLog', UnitTest_DictBacking_DictOfCompRoundMatch_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfCompRoundMatch_WriteLog(DictOfCompRoundMatch_WriteLog@ testDict, uint n, const string &in key, CompRoundMatch@ value) {
    testDict.Set(key, value);
    _DictOfCompRoundMatch_WriteLog::KvPair@ tmpKV = _DictOfCompRoundMatch_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfCompRoundMatch_WriteLog() {
    DictOfCompRoundMatch_WriteLog@ testDict = DictOfCompRoundMatch_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfCompRoundMatch_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", CompRoundMatch(806449, 950456, false, "揨锖", "쿈셜睟捡ᑽ"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 2, "亩적쟙�␈ꄂ썣왷", CompRoundMatch(102363, 748813, true, "칍ⷃ筯颔↢", "優缴댷턾ﮞ栋"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 3, "氏鰥鎾脔䚃ꑒ鼑혅", CompRoundMatch(395324, 390663, true, "쳘䛋��ꌥ嗪⩳䆈‴", "佖"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 4, "嶢�ᵝ�", CompRoundMatch(595579, 162630, false, "瑅㏣", "㕈�뙷瀊喘ٵ搕霆ս"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 5, "䉫ޒࡏ堶帆謪謓฼叆䈋", CompRoundMatch(250335, 95984, false, "拎妣퍴", "줅櫹է"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 6, "கꂘ簚♩ֿ⢽௙", CompRoundMatch(924115, 515144, true, "춎༬⏴翏堙艚泄釳ꑼ", "˔�˗"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 7, "宍�뤯Ԥ妳᧡鷲庇镬", CompRoundMatch(258378, 571618, false, "ꛡ⬺ʁ籁蔒헃㷸", "捞ῧ泦탞"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 8, "뜟�", CompRoundMatch(463145, 18461, false, "睇�८詙ퟶ釘躟", "櫓䁠鑚戌꾠ૐﷅ랫"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 9, "챿", CompRoundMatch(814673, 684538, true, "㸊奯숑", "�樹"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 10, "ƣ튧", CompRoundMatch(797693, 38734, false, "䓎煔", "ᗩ掌⥏둜"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 11, "䙮坁䠋鉮쥘΍쐡�", CompRoundMatch(709488, 842083, true, "ﱋ", "躒蚗徱"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 12, "ꣵ죰爲", CompRoundMatch(158875, 33820, false, "脗䩦�찪㌳᷏", "穔�"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 13, "㗀", CompRoundMatch(182075, 528692, true, "簁劀ޓ匴薻릃难꘱䮲", "흭扑㒽㰹Ἒ㘂"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 14, "ꭹ膺ᓣ㔺͒", CompRoundMatch(403509, 482398, false, "ꥮ䖬‐ꌜ畘", "燋뮶ဪ긘喣줓�䷋蒖⏽"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 15, "ﾐ貄㲟釐쩔", CompRoundMatch(966017, 774023, true, "➙꟒ὢ벨ۻ", "먴�ຸ趓⃛呱鋜髫"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 16, "⛙诏ρ", CompRoundMatch(130486, 547000, false, "詛芑⊪蔸：쫂", "巧滯鷚"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 17, "Ꝁ둑❶宄᮰㍟", CompRoundMatch(238760, 934685, false, "芏훓ﯱꎸ", "珡"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 18, "嵌", CompRoundMatch(777622, 265085, false, "펥䑽ࡰ�뎽䡚俄岵ᨪ敢", "揘韞"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 19, "ម흃鑳耮⠸ꀞ㪑蔇", CompRoundMatch(610575, 910429, true, "Ꞣ跉觥∃", "葉蒐龺"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 20, "ড়鏧", CompRoundMatch(158841, 159506, true, "榟줢딥륡䍼ﶌ쾎賍⚠싉", "㠋虉㊋ꢣ뵞鄅�傥䡮"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 21, "旮૮᮰韵簳湸剿", CompRoundMatch(590760, 536295, true, "캐ꜞߴ圎䣃흂ꕱ", "ᨛ清鏵�Ḏ"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 22, "귷軿賨㠙踎鑲⨲", CompRoundMatch(222335, 988757, true, "㮒喯뫾㥴ꯝψ뗠�㒙쁺", "䧌"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 23, "凡", CompRoundMatch(899384, 535246, true, "덲ᆰ씳҄�ㄠꍝ芉햺䎬", "섞⌱방䅠㔚ﳂ"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 24, "�漉ᖔ⬚줏藜㯓㑫峋抬", CompRoundMatch(662270, 393278, true, "盈", "Ꚅ瑢㓼ṭ䵅"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 25, "崂䵎窌萚Ổ紭켩Ȭ", CompRoundMatch(842309, 321279, true, "럀", "�츺⋧保퓖躱阘㸄ꖡ"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 26, "ൊ", CompRoundMatch(677495, 958630, true, "ꜧ퐟芐ꤟ", "࢏戎ᎋ蝑ᄁ"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 27, "걿", CompRoundMatch(17714, 117435, false, "쇛台柖ꞑ䉾ᑄ�᫻꼮", "슁⾵蛆剞�求᱒蘗膐"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 28, "䲲㜡鞰帚ꮛ݄옐", CompRoundMatch(232317, 97022, true, "ၠ岶﹊", "뗾䳫䥴녊璄殲麖톸炾闂"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 29, "쇿䎏燑ﻜ檈쾮蛣秨�緧", CompRoundMatch(933037, 799635, false, "", ""));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 30, "㫡繙곑寂뼀", CompRoundMatch(188301, 320428, false, "鏯ᯣ⒋樝쟴訛팖Śਛ젦", "ᢪꃀݝ㢗"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 31, "移", CompRoundMatch(647879, 919191, true, "⑛璉꩜颤帴䐬쩥齭", "ﰰ"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 32, "㫙ढ़অ௞䳝", CompRoundMatch(871079, 929959, true, "ʊ郰ፄ훺", "筙"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 33, "⃱혳ᬪ섣", CompRoundMatch(225203, 389316, false, "텀⧯ퟫ끇��", "퐖갱茨⛊ஃ蝼"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 34, "誄錒뽯땲拘㶋ﺦ", CompRoundMatch(899908, 591129, true, "", "ᑛ"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 35, "䘑舆ᵗ诟惘ヶ", CompRoundMatch(699194, 208387, true, "㓹껶⮏娧鮆鮿", ""));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 36, "㵾⚿벣家≉夞芨웪", CompRoundMatch(149057, 994865, true, "", "옓ڿᔿ涧シ骸ᑧ"));
    Test_ProxyFns_DictOfCompRoundMatch_WriteLog(testDict, 37, "临侖Ṥᦉ㡘踾⢒", CompRoundMatch(389038, 694077, false, "୫", ""));
    assert(37*2 == countFileLines(IO::FromDataFolder('Storage/codegenTest/test/DictOfCompRoundMatch_WriteLog.txt')), "Should have written exactly 37*2 lines to the log.");
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfCompRoundMatch_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfCompRoundMatch_WriteLog.txt');
    assert(37 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize());
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfCompRoundMatch_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfCompRoundMatch_WriteLog_DictBacking);
}
#endif