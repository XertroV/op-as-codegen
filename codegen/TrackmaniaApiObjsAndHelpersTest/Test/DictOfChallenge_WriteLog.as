#if UNIT_TEST
namespace Test_DictOfChallenge_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfChallenge_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfChallenge_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfChallenge_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfChallenge_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfChallenge_WriteLog', UnitTest_DictBacking_DictOfChallenge_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfChallenge_WriteLog(DictOfChallenge_WriteLog@ testDict, uint n, const string &in key, Challenge@ value) {
    testDict.Set(key, value);
    _DictOfChallenge_WriteLog::KvPair@ tmpKV = _DictOfChallenge_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfChallenge_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfChallenge_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfChallenge_WriteLog.txt');
    }
    DictOfChallenge_WriteLog@ testDict = DictOfChallenge_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfChallenge_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", Challenge(806449, "㦁", "폢昳豜䍤", 934426, 495249, 450933));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 2, "㵜ܘ閿", Challenge(444245, "뼙﷞䷨乄", "칍ⷃ筯颔↢", 325502, 225525, 639496));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 3, "氏鰥鎾脔䚃ꑒ鼑혅凐優", Challenge(395324, "䔸僯ʚ땚㰎ॵ覫돬홊", "ꤜ즱妖䜇붧煟", 729753, 183742, 679591));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 4, "霆ս㈖瑅㏣咊䈍4ᥜ", Challenge(936167, "ٵ", "叆䈋㷸㕈�뙷瀊", 978498, 461061, 188916));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 5, "暹ꝝ벤゜皁뾞䉫ޒ", Challenge(95984, "㤯沣﯄ஂ", "Ɓ㢛㠘풂ﱊ傹鮠糈", 138470, 197908, 839412));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 6, "", Challenge(446794, "춎༬⏴翏堙艚泄釳ꑼ", "˔�˗", 716096, 327322, 97308));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 7, "悂ꝁ聞풖Ⓑ㘇径밋", Challenge(377695, "겣柆璢뎙�", "㥾ﹲ缂釺耄隒喠�", 201094, 816669, 944708));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 8, "ῧ泦탞ꙹꛡ⬺ʁ籁蔒", Challenge(617076, "뜟", "ﾨئ뗖튧�", 585819, 310701, 938887));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 9, "쏜번⤫愪ᑐ㥠⍟퇄푇", Challenge(140479, "㸊奯숑㚯붣", "�樹", 703892, 457176, 797693));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 10, "�餥娧礁밵", Challenge(423678, "ｇ믡똘", "", 446504, 594171, 975376));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 11, "홨�", Challenge(65272, "撏雇", "쳟퀖錮", 698106, 411556, 430589));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 12, "匴薻릃难꘱", Challenge(569198, "흭扑㒽㰹Ἒ㘂", "ꭹ膺ᓣ㔺͒", 403509, 482398, 946614));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 13, "휹ᬸꤏ", Challenge(303837, "뎠쫫羓氊❘", "", 413050, 163721, 537856));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 14, "➙꟒ὢ벨ۻ", Challenge(995954, "⃛呱鋜", "먴�ຸ", 225738, 390295, 791476));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 15, "�饾㦐ﰴ��㊚⊚嘄", Challenge(838087, "窵ㆮ", "詊", 205036, 992595, 746274));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 16, "巧滯鷚�詛芑", Challenge(531935, "⇗㸣ᠼ❰Ꝁ둑❶宄᮰", "畗⚻ꜚ嵡᷂ꏨ�", 429315, 642628, 251008));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 17, "俄岵ᨪ敢諗뗛", Challenge(790018, "딫펥䑽ࡰ�", "鑳耮⠸ꀞ㪑蔇ꈟ揘", 619022, 395255, 610575));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 18, "箱ﴩ", Challenge(543551, "", "┪�ဩ쓋乪剤", 94078, 226219, 864384));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 19, "䞨ﷴ", Challenge(230141, "嶁ড়鏧呲䞿렀", "槛컙瞘䝩땑̀莫", 432846, 350484, 489156));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 20, "⺫晋败땒ဍ", Challenge(466790, "ᇬ떝᱒ꑽ欄풼♃飙", "", 978878, 889671, 975797));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 21, "清鏵�Ḏ⫳캐ꜞ", Challenge(56238, "귷軿賨㠙踎鑲⨲", "읶㥄伟녈ꎨ♾췲", 748245, 296832, 592869));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 22, "꛸�", Challenge(477704, "덲ᆰ씳҄�ㄠꍝ芉햺䎬", "섞⌱방䅠㔚ﳂ", 172472, 215078, 780184));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 23, "㯓", Challenge(483426, "᏷椈佟䏼௥�漉ᖔ⬚", "蓐ॣ栋㢺䰍亿", 372790, 295452, 383704));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 24, "鴔꠿र칛첑", Challenge(762040, "럀斲밃", "�츺⋧保퓖躱阘㸄ꖡ", 677495, 958630, 360516));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 25, "ꫯ詡ࣲ'壯⹋࡭Þ찙", Challenge(648241, "꼮䱹㠀ʿ穅�㡲걟蕅꠭", "�᫻", 498906, 484509, 577275));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 26, "슁⾵蛆剞�求᱒蘗膐", Challenge(501966, "펌㙪ᮑ䲲㜡鞰帚ꮛ", "䄁អ棩눫檞ᶮ", 272978, 857801, 836230));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 27, "害컃퍝ꀠ⪇", Challenge(517188, "펼藹嶦巯ฐ�悅", "�緧ꘖ䔟", 311474, 695675, 552976));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 28, "땀廀㶭쇿䎏燑", Challenge(175974, "", "", 269536, 341333, 738252));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 29, "ਛ젦釞吠韹菱", Challenge(51668, "ݝ㢗鏯ᯣ⒋樝쟴訛", "摝簾짭移૞ᢪ", 99313, 594235, 695481));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 30, "㽗", Challenge(313471, "", "˝殣塗퓖ᥙ㠗쫓熭贮봣", 113250, 781249, 348795));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 31, "⃱혳ᬪ섣婄筙俚ʊ郰ፄ", Challenge(225203, "껍Ṑ䰯繷⩷謝㱮奜", "䅒ꉓ虸팊ᐢ쳲ꄎ섹", 649272, 945936, 432774));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 32, "ᑛ开�퓔炵", Challenge(547731, "", "쿅硬겙犋㕛�ⱪꦜق", 310610, 107012, 108316));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 33, "틖Ფ褐怺㠂챡", Challenge(513575, "", "", 703490, 485744, 729129));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 34, "鑟㓹껶⮏娧", Challenge(569937, "馢䲏쿁㵾⚿벣家≉夞", "뻲͉砅", 776412, 978462, 882577));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 35, "㝬⽈쏎", Challenge(894474, "㏰栝㥻䈲", "⍑୫屢㭘⹯탳ꍏ", 161669, 519736, 497023));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 36, "慕⻆ᙠ淐쏄쵯", Challenge(783365, "錛居芟큳괛䆏䨄ᤰ闟䱲", "瓉赼끓切ꎕ築䨪컰ꦰ", 483875, 962762, 160185));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 37, "緤猥", Challenge(134600, "鲵粮䟊", "ᵁ굣㮚䶹淹ᲁᝁ꾿൚", 336000, 673001, 179049));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 38, "葾볡怡ݴⰄ", Challenge(102413, "䧭ྏ誓筿", "ↈ髞", 958545, 68787, 470658));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 39, "폁趗婆引兘뛮�", Challenge(80948, "Ꜯ謃꛼", "", 124520, 749383, 922529));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 40, "�Ⱦ燷⑅", Challenge(500571, "", "쨙肮⇭�ራ䀄", 982822, 330394, 52025));
    Test_ProxyFns_DictOfChallenge_WriteLog(testDict, 41, "⏱霅眾讅䃻齁긒⟵俬", Challenge(281354, "㶂㲺ㄖઃ롘ẕᶯ", "虰", 597830, 741691, 8385));
    sleep(50);
    assert(41*2 == countFileLines(IO::FromDataFolder('Storage/codegenTest/test/DictOfChallenge_WriteLog.txt')), "Should have written exactly 41*2 lines to the log, but wrote: " + countFileLines(IO::FromDataFolder('Storage/codegenTest/test/DictOfChallenge_WriteLog.txt')));
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfChallenge_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfChallenge_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(41 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfChallenge_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfChallenge_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfChallenge_WriteLog_DictBacking);
}
#endif