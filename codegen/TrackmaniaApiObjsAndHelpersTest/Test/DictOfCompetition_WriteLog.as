#if UNIT_TEST
namespace Test_DictOfCompetition_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfCompetition_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfCompetition_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfCompetition_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfCompetition_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfCompetition_WriteLog', UnitTest_DictBacking_DictOfCompetition_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfCompetition_WriteLog(DictOfCompetition_WriteLog@ testDict, uint n, const string &in key, Competition@ value) {
    testDict.Set(key, value);
    _DictOfCompetition_WriteLog::KvPair@ tmpKV = _DictOfCompetition_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfCompetition_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfCompetition_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfCompetition_WriteLog.txt');
    }
    DictOfCompetition_WriteLog@ testDict = DictOfCompetition_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfCompetition_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", Competition(806449, 950456, 158112, MaybeOfUint(), 511693, 653847, "왷啐쿈셜睟捡", "ꄂ", "", MaybeOfString("䉹뚩"), MaybeOfString("쾿턪靾"), MaybeOfUint()));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 2, "칍ⷃ筯颔↢", Competition(325502, 225525, 639496, MaybeOfUint(826069), 447238, 892527, "", "䫠饣옦딉탮䒰", "䛋��ꌥ嗪⩳䆈‴硻", MaybeOfString("ʿꤜ즱妖䜇붧"), MaybeOfString("䚾兄݄㍫䤌⇼鯠嶢"), MaybeOfUint(936167)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 3, "ٵ", Competition(834852, 695690, 627618, MaybeOfUint(289608), 792693, 813748, "땫", "ႝ塷Ლ늘Àᖲ", "荚", MaybeOfString("㤯沣﯄ஂﺻ꧂"), MaybeOfString("줅櫹է"), MaybeOfUint(827732)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 4, "蘅Ɓ", Competition(197908, 839412, 135747, MaybeOfUint(924115), 515144, 930280, "뜵竱�Ѱѡ꣐찊튩筪", "ﮁ厇翟즯蔕", "얿⿡ꁑ뎝탩罈", MaybeOfString("聞풖Ⓑ"), MaybeOfString("宍�뤯Ԥ妳᧡鷲庇镬"), MaybeOfUint(910156)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 5, "쏜번⤫愪ᑐ㥠⍟퇄푇", Competition(140479, 720849, 24396, MaybeOfUint(238538), 911687, 493678, "ઝ紤⛍射톀먿်", "﷕", "䓎煔", MaybeOfString("ｇ믡똘"), MaybeOfString("䙮坁䠋鉮쥘΍쐡�"), MaybeOfUint(869169)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 6, "躒蚗徱ﱋ⌎", Competition(149156, 978960, 521596, MaybeOfUint(64861), 900717, 109712, "穔�", "㗀", "ᡍ�∃", MaybeOfString(), MaybeOfString(""), MaybeOfUint()));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 7, "ޓ匴薻릃难", Competition(569198, 585360, 580942, MaybeOfUint(75472), 481298, 26705, "䗱ⰟΗ픚딦因↸", "‐ꌜ畘㷾䎠", "䷋蒖⏽ꡑꥮ", MaybeOfString("닮䤡뎠쫫羓氊"), MaybeOfString("ﾐ貄㲟"), MaybeOfUint(537856)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 8, "➙꟒ὢ벨ۻ", Competition(995954, 594041, 86311, MaybeOfUint(497729), 279127, 731706, "", "ρ㉧｀Ꞿ時ﭠ宂귓ᚑ", "⛙", MaybeOfString("詊"), MaybeOfString("堷텶裿ꐂ㹔鲞"), MaybeOfUint(737342)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 9, "宄᮰㍟퐮巧滯", Competition(238760, 934685, 133165, MaybeOfUint(), 27964, 464507, "", "俖ἕ잝ꠌ廉ꕘࢳ咑킡", "샳둊裫", MaybeOfString("鑳耮⠸ꀞ㪑蔇ꈟ揘"), MaybeOfString("䠎薂"), MaybeOfUint(610575)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 10, "箱ﴩ", Competition(543551, 937066, 935018, MaybeOfUint(626621), 667214, 992293, "장浟븫䲾鳚㜰瞷汏䋐泔", "ԏ戥繅킸삷", "", MaybeOfString("槛컙瞘䝩땑̀莫"), MaybeOfString("뵞鄅�傥䡮錱榟"), MaybeOfUint(811641)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 11, "ɔ⺫", Competition(466790, 745872, 464164, MaybeOfUint(333334), 987569, 590760, "ᢡ᬴⁋笣", "鶱‹ᾖ㥏ᛌ", "턄㐻ڎ줠ㅜ", MaybeOfString("軿賨㠙踎鑲"), MaybeOfString("㒙쁺唚짎⏍콜"), MaybeOfUint(748245)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 12, "꛸�蔵ጄ㱛㩧⸎", Competition(477704, 563116, 444121, MaybeOfUint(948802), 739775, 118286, "賎얍䐋ꠎ믱礵晴츽Ӎ", "除惑", "�塓⠚�㰸牏", MaybeOfString("蓐ॣ栋㢺䰍亿"), MaybeOfString("Ổ紭"), MaybeOfUint()));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 13, "鴔꠿र칛첑", Competition(762040, 263770, 193441, MaybeOfUint(259618), 672815, 606276, "搜", "", "薦", MaybeOfString("찙婁"), MaybeOfString("࢏戎ᎋ蝑ᄁ싮ꜧ"), MaybeOfUint(182563)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 14, "㠀ʿ穅�㡲걟蕅", Competition(993428, 846539, 603080, MaybeOfUint(572579), 866730, 656797, "ᩐ惴ᐎퟵ癯臺阒诉ﱉ", "ၠ岶﹊ᘀ螲鲹옇Α", "䳫䥴녊璄殲麖톸炾", MaybeOfString(), MaybeOfString(""), MaybeOfUint(44122)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 15, "䛄ꊟ旾害", Competition(820816, 364856, 632276, MaybeOfUint(65967), 355362, 986560, "褉墳﵋쏥暸冫敬霧", "", "뼀勐吴", MaybeOfString("뻏䎟鷇"), MaybeOfString("泵"), MaybeOfUint(221414)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 16, "Ś", Competition(509372, 740808, 67327, MaybeOfUint(526114), 43400, 550866, "䐬쩥齭㚽爐瞓", "璉꩜颤", "㫙ढ़অ௞䳝媹ﰰཤ", MaybeOfString("龪흛"), MaybeOfString("贽蚈ﱸ欘䑃䊆텧稉"), MaybeOfUint(225203)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 17, "껍Ṑ䰯繷⩷謝㱮奜", Competition(158208, 409653, 95629, MaybeOfUint(), 685061, 242231, "錒", "츁", "훵", MaybeOfString("⛫꧷ᑛ开�"), MaybeOfString("ꃅᨩ윐窼젮"), MaybeOfUint(264308)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 18, "뻲͉砅慄", Competition(776412, 978462, 882577, MaybeOfUint(), 706599, 586054, "Ṥᦉ㡘踾⢒鬿", "ǧ⯅᧸ඊ᫔临", "蹭綞꽌ؓᏪ૯裁", MaybeOfString("䱲膯쁀㔈慕⻆ᙠ淐쏄"), MaybeOfString(), MaybeOfUint(931206)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 19, "컰ꦰ⾩錛居芟큳괛䆏", Competition(44703, 619088, 392531, MaybeOfUint(), 904001, 843438, "춛ග⸤ꎢ尷", "袕", "�੢ꅠ럸�蒬", MaybeOfString("ೆ淽윭ꆹᵁ굣㮚䶹淹"), MaybeOfString("鏀矕煍橱튗㐰쉹즚"), MaybeOfUint(102413)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 20, "䧭ྏ誓筿", Competition(446280, 910219, 958545, MaybeOfUint(897486), 182810, 15427, "䫶顨몡䚾辺壂ᇍ琏᜜", "실", "읰", MaybeOfString("燷⑅┠◚〥鑨釅艵"), MaybeOfString("킪鲼덦搌쒓쿮㭋"), MaybeOfUint(982822)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 21, "꬈䂺社", Competition(52025, 106838, 614309, MaybeOfUint(897848), 463388, 793078, "ᘜ", "肶", "뇡⪒왮弚ꥁ뽽쓥éꕆ", MaybeOfString("睵A"), MaybeOfString("ꤣ⢬㒻仾엍搯"), MaybeOfUint(6306)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 22, "榹瘚蘘萷", Competition(911765, 545224, 541352, MaybeOfUint(993143), 20825, 635007, "컎琊엄疁﫝", "", "㻪", MaybeOfString("펵睫䷙駒"), MaybeOfString("➚"), MaybeOfUint(774377)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 23, "暼鋦愁", Competition(298515, 944798, 951561, MaybeOfUint(85168), 67534, 730736, "嫯뤐â", "尟ᚈꭡ!좇", "䦜⢹膧", MaybeOfString("抮藫ⴅ�"), MaybeOfString("籼苯寺稆騻"), MaybeOfUint()));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 24, "鶆鏗Ų霶ㇵ", Competition(186268, 913742, 347544, MaybeOfUint(800275), 352746, 895017, "鍧谽밃什顣", "⡱䠏�㼗", "헊뜎볧佫⣋", MaybeOfString("͹ᮈ﷾ꍽ嘚盿媗ꙍ쇄"), MaybeOfString(), MaybeOfUint()));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 25, "嬨쌴䒴朰듒逐(", Competition(133986, 266778, 350407, MaybeOfUint(), 284389, 80153, "䂂陪뎅桦⁝᎖", "퐓厦ቇ", "", MaybeOfString("扬"), MaybeOfString("⳩崈᳒"), MaybeOfUint(241918)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 26, "᠀⿚쥩谅Ɯ觕", Competition(740723, 268250, 503897, MaybeOfUint(427255), 341943, 16584, "੨䖂", "簌Ẑ", "￸蘸", MaybeOfString(), MaybeOfString("拤ꝡ㢖⽴"), MaybeOfUint()));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 27, "ٳྱ᎙�嗝첹幥", Competition(494210, 308901, 412742, MaybeOfUint(425832), 47852, 653074, "ᾴ댁⋬", "泦眨ඎバґ�圉过끒ꆐ", "", MaybeOfString("㯚큊䭃摛帏ꏌ넛"), MaybeOfString("剋"), MaybeOfUint(21983)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 28, "䘥齫虴镀郑ꬭ恢㲟࿲", Competition(810503, 859679, 740899, MaybeOfUint(), 400851, 967478, "澐紣襏ㆿ뇨귰", "᧛쯈崽쯢璁", "ⱟὈ", MaybeOfString(), MaybeOfString("ꔝ霔䱿섭㐹韯�夎"), MaybeOfUint(124670)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 29, "洚䲥뿰蓹", Competition(838032, 300412, 756288, MaybeOfUint(), 803562, 339056, "љ㠏儮蝇", "ᔴ䩲鳄꫏Ⲳ䢁䊞쉼", "続뮈ꂠ낽", MaybeOfString("巖綡"), MaybeOfString(""), MaybeOfUint(277624)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 30, "轐緋", Competition(139549, 418027, 465207, MaybeOfUint(178028), 349876, 935569, "賩﹙￞邋䰼", "祋㊅", "㘐", MaybeOfString("ᴉ鵂"), MaybeOfString("䳋鴓餔视짻佌⻛폛"), MaybeOfUint(425348)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 31, "䊟☢톡嬜", Competition(401501, 968336, 38451, MaybeOfUint(132588), 538271, 344878, "䍮ᙶ筛�襗", "虳ힹ", "ꠀ지봉", MaybeOfString("虌ᤨ눒鵶⪱䚸훨蛘"), MaybeOfString("ᖯᙔ篙"), MaybeOfUint(970450)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 32, "淂菢�䲕㿨", Competition(12053, 423606, 562264, MaybeOfUint(318282), 152763, 704337, "", "刡榡蘸赤", "ꍴ漒옳咽郦", MaybeOfString("㷽쾊㣦ᷙ�"), MaybeOfString("獸㮀켝怹颤ꄈ俪ꨃ"), MaybeOfUint(289426)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 33, "笑퍩쑬벝ꊢꊜ甆", Competition(321707, 331715, 87757, MaybeOfUint(265199), 991286, 546656, "嶮", "䰄�঎", "጗蕘猁竌", MaybeOfString("ψゔ"), MaybeOfString("碍ιف壐"), MaybeOfUint(711046)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 34, "⡶⳻", Competition(557373, 41584, 94925, MaybeOfUint(1478), 730222, 418034, "䃐㋋", "賕�毯㈍麓ꊓ㬠鵜㕾", "浔퉔�撊랷", MaybeOfString("켙㎉㯨鶆迆宠"), MaybeOfString("ⅷ隌ŋ"), MaybeOfUint(187240)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 35, "䦅詉翰쭧杀㣖讝�駥", Competition(596737, 659296, 609345, MaybeOfUint(380940), 74250, 277677, "ኩ跗웞축䉽䪦覿", "塨", "燲᭝櫧쒫ູ銸웮볽", MaybeOfString(""), MaybeOfString("﯆�㝻ᑈ뽗兖鵇ힳ给"), MaybeOfUint(339404)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 36, "ꦣ謁ⵁ戻࿎霓얗㴼誏埤", Competition(168762, 971594, 10355, MaybeOfUint(598466), 322227, 825925, "瞬", "訯⽅涒", "뗧䲕봦㨾ᓅ▐", MaybeOfString(""), MaybeOfString(), MaybeOfUint(789461)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 37, "ꋇ�", Competition(705421, 800636, 821017, MaybeOfUint(), 546496, 967954, "⌙鍧Ⴑ鍸삅銦", "规艿ᡖꑸ䫦䡄叺鼋논", "䕏ꐜ䘗", MaybeOfString("妄鶏悔嫨犃돋⪠斥怺"), MaybeOfString("如䐓ଃ뽘⾻ꀍ蘁㵮쎧"), MaybeOfUint(884044)));
    Test_ProxyFns_DictOfCompetition_WriteLog(testDict, 38, "ꛫĚ躻", Competition(337831, 31351, 504364, MaybeOfUint(966275), 924288, 775519, "�鼒串☂", "뺯퐐", "嗢ỽ突࠱⦣뚮", MaybeOfString(), MaybeOfString(), MaybeOfUint(102356)));
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfCompetition_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfCompetition_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(38 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfCompetition_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfCompetition_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfCompetition_WriteLog_DictBacking);
}
#endif