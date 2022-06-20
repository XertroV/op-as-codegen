#if UNIT_TEST
namespace Test_DictOfString {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfString_CommonTesting() {
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
  
  bool unitTestResults_DictOfString_CommonTesting = runAsync(Tests_RegisterAll_DictOfString_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfString_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfString', UnitTest_DictBacking_DictOfString);
  }
  
  bool Test_ProxyFns_DictOfString(DictOfString@ testDict, uint n, const string &in key, const string &in value) {
    testDict.Set(key, value);
    _DictOfString::KvPair@ tmpKV = _DictOfString::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfString() {
    DictOfString@ testDict = DictOfString();
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfString(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", "豜䍤ꍚ㦁谱ᬜ");
    Test_ProxyFns_DictOfString(testDict, 2, "쫷蚙폢", "弯䁝籤");
    Test_ProxyFns_DictOfString(testDict, 3, "乄䉹", "");
    Test_ProxyFns_DictOfString(testDict, 4, "뼙", "칍ⷃ筯颔↢");
    Test_ProxyFns_DictOfString(testDict, 5, "優缴댷턾ﮞ栋", "氏鰥鎾脔䚃ꑒ鼑혅");
    Test_ProxyFns_DictOfString(testDict, 6, "覫돬홊稛㏭", "៲䔸僯ʚ땚㰎");
    Test_ProxyFns_DictOfString(testDict, 7, "ʿꤜ즱妖䜇붧", "㏣咊䈍4ᥜ勼ⲓ");
    Test_ProxyFns_DictOfString(testDict, 8, "ٵ搕霆ս㈖", "叆䈋㷸㕈�뙷瀊");
    Test_ProxyFns_DictOfString(testDict, 9, "謪謓", "䉫ޒࡏ堶");
    Test_ProxyFns_DictOfString(testDict, 10, "瘖暹ꝝ벤゜皁", "㤯沣﯄ஂﺻ꧂");
    Test_ProxyFns_DictOfString(testDict, 11, "Ɓ㢛㠘풂ﱊ傹鮠糈", "쁇愾ࡽ");
    Test_ProxyFns_DictOfString(testDict, 12, "ꑼ建皟䆆", "艚泄");
    Test_ProxyFns_DictOfString(testDict, 13, "ꚛ躩˔�˗釹춎༬⏴翏", "쪘싣");
    Test_ProxyFns_DictOfString(testDict, 14, "Ⓑ㘇径밋㧀", "ꝁ聞");
    Test_ProxyFns_DictOfString(testDict, 15, "겣柆璢뎙�葘ꫵ", "�竀");
    Test_ProxyFns_DictOfString(testDict, 16, "ﹲ缂釺耄隒", "⬺ʁ籁蔒헃㷸肳");
    Test_ProxyFns_DictOfString(testDict, 17, "�燨捞ῧ泦탞ꙹ", "튧�웽");
    Test_ProxyFns_DictOfString(testDict, 18, "꒠퉝更誓皵䯬껠ﾨئ", "");
    Test_ProxyFns_DictOfString(testDict, 19, "번⤫愪ᑐ㥠⍟퇄푇柳", "믕㸊奯숑㚯붣쮑ꡛ");
    Test_ProxyFns_DictOfString(testDict, 20, "ƣ튧鶬�", "");
    Test_ProxyFns_DictOfString(testDict, 21, "�餥娧礁밵", "ꌣ");
    Test_ProxyFns_DictOfString(testDict, 22, "ᣃ刖ꛥｇ믡", "玥");
    Test_ProxyFns_DictOfString(testDict, 23, "椾", "⌎媑̟");
    Test_ProxyFns_DictOfString(testDict, 24, "ﱋ", "躒蚗徱");
    Test_ProxyFns_DictOfString(testDict, 25, "ꣵ죰爲", "䛊⳱獡筕됋䏄峹䀲");
    Test_ProxyFns_DictOfString(testDict, 26, "홨", "錮앬撏雇㧱");
    Test_ProxyFns_DictOfString(testDict, 27, "뽬쐁쳟", "簁劀ޓ匴薻릃难꘱䮲");
    Test_ProxyFns_DictOfString(testDict, 28, "흭扑㒽㰹Ἒ㘂", "ꭹ膺ᓣ㔺͒");
    Test_ProxyFns_DictOfString(testDict, 29, "ꋹ᧿뛀퀫ু롇", "휹ᬸꤏ");
    Test_ProxyFns_DictOfString(testDict, 30, "羓氊❘刑ᡅ", "쿘죃ٽ鋷⠺닮䤡뎠");
    Test_ProxyFns_DictOfString(testDict, 31, "벨ۻ珑", "呱鋜髫➙꟒");
    Test_ProxyFns_DictOfString(testDict, 32, "㦐ﰴ��㊚⊚嘄﬛", "ㆮ寗��");
    Test_ProxyFns_DictOfString(testDict, 33, "：쫂ᜪꥶ詊讳", "퐮巧滯鷚�詛芑⊪");
    Test_ProxyFns_DictOfString(testDict, 34, "⇗㸣ᠼ❰Ꝁ둑❶宄᮰", "畗⚻ꜚ嵡᷂ꏨ�");
    Test_ProxyFns_DictOfString(testDict, 35, "뗛悗畆䃱", "펥䑽ࡰ�뎽䡚俄岵ᨪ敢");
    Test_ProxyFns_DictOfString(testDict, 36, "揘韞", "ម흃鑳耮⠸ꀞ㪑蔇");
    Test_ProxyFns_DictOfString(testDict, 37, "ٝ", "箱ﴩ");
    Test_ProxyFns_DictOfString(testDict, 38, "乪剤⹥먃ꑐ㷠얌苫", "䞭橄䨛㾢┪�ဩ");
    Test_ProxyFns_DictOfString(testDict, 39, "۸", "둭껦퓵뺟⪂䞨");
    Test_ProxyFns_DictOfString(testDict, 40, "莫攃嶁ড়鏧呲䞿", "멃㳦꛹槛컙瞘䝩땑");
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfString_DictBacking = runAsync(Tests_RegisterAll_DictOfString_DictBacking);
}
#endif