#if UNIT_TEST
namespace Test_DictOfCompRound_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfCompRound_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfCompRound_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfCompRound_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfCompRound_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfCompRound_WriteLog', UnitTest_DictBacking_DictOfCompRound_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfCompRound_WriteLog(DictOfCompRound_WriteLog@ testDict, uint n, const string &in key, CompRound@ value) {
    testDict.Set(key, value);
    _DictOfCompRound_WriteLog::KvPair@ tmpKV = _DictOfCompRound_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfCompRound_WriteLog() {
    DictOfCompRound_WriteLog@ testDict = DictOfCompRound_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfCompRound_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", CompRound(806449, 950456, 158112, 26688, 934426, 495249, "", "㵜ܘ閿", "乄䉹", "", "뼙"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 2, "칍ⷃ筯颔↢", CompRound(325502, 225525, 639496, 451852, 176947, 395324, "䔸僯ʚ땚㰎ॵ覫돬홊", "ꤜ즱妖䜇붧煟", "瑅㏣咊䈍4ᥜ勼ⲓﶄ", "㕈�뙷瀊喘ٵ搕霆ս", "䉫ޒࡏ堶帆謪謓฼叆䈋"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 3, "瘖暹ꝝ벤゜皁", CompRound(95984, 432877, 369191, 827732, 585107, 691526, "쁇愾ࡽ", "ꑼ建皟䆆", "艚泄", "ꚛ躩˔�˗釹춎༬⏴翏", "쪘싣"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 4, "Ⓑ㘇径밋㧀", CompRound(318816, 915442, 377695, 793004, 997590, 320871, "", "喠�竀", "", "ﹲ缂釺耄", "⬺ʁ籁蔒헃㷸肳"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 5, "�燨捞ῧ泦탞ꙹ", CompRound(463145, 18461, 585819, 310701, 938887, 548107, "ᑐ㥠⍟", "쮑ꡛ쏜번⤫", "樹믕㸊奯숑㚯", "ƣ튧鶬", ""));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 6, "�餥娧礁밵", CompRound(423678, 703463, 19055, 275291, 446504, 594171, "覫", "媑̟籧椾癉", "蚗徱ﱋ", "죰爲", "獡筕됋䏄峹䀲跜"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 7, "홨�䛊", CompRound(65272, 321869, 537084, 432401, 381848, 698106, "릃难꘱䮲哎", "", "扑㒽㰹Ἒ㘂�簁劀ޓ", "롇�ꭹ膺ᓣ㔺͒桝", "㿎휹ᬸꤏꋹ᧿뛀퀫"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 8, "羓氊❘刑", CompRound(658988, 411220, 413050, 163721, 537856, 619189, "⃛呱鋜髫➙꟒ὢ", "먴�ຸ", "", "㦐ﰴ��㊚⊚嘄﬛", "ㆮ寗��"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 9, "：쫂ᜪꥶ詊讳", CompRound(746274, 737342, 264412, 531935, 41545, 115137, "を⇗㸣ᠼ❰Ꝁ둑❶", "畗⚻ꜚ嵡᷂ꏨ", "뗛悗畆䃱", "펥䑽ࡰ�뎽䡚俄岵ᨪ敢", "揘韞"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 10, "ម흃鑳耮⠸ꀞ㪑蔇", CompRound(610575, 910429, 543551, 937066, 935018, 878516, "䞭橄䨛㾢┪�ဩ", "۸", "둭껦퓵뺟⪂䞨", "莫攃嶁ড়鏧呲䞿", "멃㳦꛹槛컙瞘䝩땑"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 11, "⺫晋败땒ဍ䞽隫", CompRound(466790, 745872, 464164, 252552, 884560, 978878, "圎䣃흂ꕱ", "清鏵�Ḏ⫳캐ꜞ", "軿賨㠙踎鑲⨲豯", "㥄伟녈ꎨ♾췲뫤귷", ""));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 12, "㩧⸎뺀癑厘", CompRound(592869, 434959, 477704, 563116, 444121, 360730, "㔚ﳂ뙾덲ᆰ씳҄�", "섞⌱방", "�漉ᖔ⬚줏藜㯓㑫峋抬", "", "䰍亿⟻᏷椈佟"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 13, "鈥�쾋", CompRound(360516, 892949, 360745, 797319, 648241, 182563, "㠀ʿ穅�㡲걟蕅", "쇛台柖ꞑ䉾ᑄ�᫻꼮", "슁⾵蛆剞�求᱒蘗膐", "䲲㜡鞰帚ꮛ݄옐", "អ棩눫檞ᶮ宴펌㙪"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 14, "ꀠ⪇鳃왚꛾", CompRound(44122, 441812, 517188, 820816, 364856, 632276, "�緧ꘖ䔟", "䎏燑ﻜ檈쾮蛣", "鷇㧭뚳틽駌䅋땀廀㶭", "韹菱뻏", "樝쟴訛팖Śਛ젦釞"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 15, "鏯ᯣ", CompRound(735984, 328733, 466309, 428539, 917094, 647879, "㽗뜐텙è핊摝", "ᥙ㠗쫓熭贮봣靈샣蹖", "ፄ훺Ṁ龪흛뾫˝殣塗", "筙俚ʊ", "⃱혳ᬪ섣"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 16, "촇煎", CompRound(225203, 389316, 779838, 172893, 916155, 158208, "ᐢ쳲", "⣦≜༓斳洠⸹䅒ꉓ虸", "⛫꧷ᑛ开�퓔炵Ⴏ", "ق쩡ጁ⠦ደ", "䰸࢕쿅硬겙犋㕛�ⱪ"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 17, "縁", CompRound(107012, 108316, 301902, 579878, 838377, 513575, "", "", "恱", "㓹껶⮏娧鮆鮿", ""));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 18, "㵾⚿벣家≉夞芨웪", CompRound(149057, 994865, 776412, 978462, 882577, 453095, "", "䱒ገ䒥", "㏰栝㥻䈲", "⍑୫屢㭘⹯탳ꍏ", ""));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 19, "쏄쵯將룆햑菢ᴘ즬", CompRound(772445, 749289, 946736, 783365, 532151, 475829, "", "컰ꦰ⾩錛居芟큳괛䆏", "䅇瓉赼끓切ꎕ築", "咬참☦緤猥廥绢", "ᲁᝁ꾿൚Ӑ鲵粮"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 20, "굣㮚䶹", CompRound(946620, 336000, 673001, 179049, 388704, 68847, "Ͷ葾볡怡", "䧭ྏ誓筿拲艱", "ↈ髞", "ᨸ輿緅", "��褖켵�怶"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 21, "趗婆引兘", CompRound(80948, 811357, 897023, 124520, 749383, 922529, "�Ⱦ燷⑅", "쨙肮⇭�ራ䀄乡웪", "社Ŗ", "ꓻ親꬈䂺", "霅眾讅䃻齁긒⟵"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 22, "ㄖઃ롘ẕᶯ낪辸", CompRound(267792, 72808, 597830, 741691, 8385, 752632, "堜", "᪊ꬻ", "၌�椔敲榹瘚蘘萷흱病", "瓩ᦽ�", "灗헱义咭䧛퉨꧈ົ"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 23, "䷙駒ꖷ贰ꗰ", CompRound(86865, 825055, 82320, 774377, 768520, 794578, "㘺감潥＝暼", "㷠ꨐ클홈᧕", "≱ᒎ⨻뛗䟈틻ﷺﺱ좫", "䣫ᬽ�ᖕ撬咍", "藫ⴅ�卟멞崅₰"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 24, "ꊪ�蚞쉺�", CompRound(642709, 271487, 54777, 396688, 841347, 186268, "", "⪴ℽ靼຦", "띤⻯胣迾쥡攦ꕫ", "죋襰㹅慻콨畿", "þ㱚奏"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 25, "ꍽ嘚盿媗ꙍ쇄殒끄", CompRound(592886, 148792, 419025, 43557, 136173, 860709, "젆嶐墿䡱勥", "첳편ꁹ", "뺊픜", "ᢹ鞄�籾쩜", ""));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 26, "扬", CompRound(936134, 521732, 359671, 241918, 472905, 672382, "쥩谅", "谊ㆵꋈ勵寀儍漥맩᠀", "癑눋Ẉ됕ﾼ伈", "쾙", "䞰"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 27, "㛇ﯶ⥄", CompRound(130190, 838063, 1570, 898372, 71658, 992189, "⏛줨䈲닌郆涋헂", "㌄쿳", "", "ᙡ멧荞돲㊳홐㌦�䝁", "懰ᒣ䕾"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 28, "햰讟蘥់붠뗩", CompRound(218816, 463737, 597256, 628092, 442910, 544120, "료㜧", "�嗝첹幥⊬愊꺳䵠", "᎙", "ಶ斍䖜ٳ", "判䏩౞퐭뗌缸틸젓쏪"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 29, "ኻ㔇", CompRound(482814, 713109, 169836, 875231, 202705, 936706, "㯚큊䭃摛帏ꏌ넛", "뤊쾲婑莵", "泗쓁�ꯟᢪ敎鋝뵻䄈", "턤ΐｧ�夾큁슍", "ᔇॸ鑬䁚궗"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 30, "⊇厬밲", CompRound(360153, 715491, 201155, 104490, 587411, 25706, "", "㣁⟠씳鮄녞⽝", "虴镀郑ꬭ恢㲟", "鈾箶묀䘥", "ᔂ킁募㱌鳑鿹"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 31, "ۙ囵䚱阉ﻬ㦇", CompRound(152695, 998454, 330790, 361019, 781132, 486025, "茿⠿챯顈꓀鼏", "ץ", "屏ᦻ", "蓹鷞笗", "�瘯匿觺洚䲥"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 32, "営", CompRound(62391, 436227, 926043, 481734, 534436, 647119, "ů悢", "", "哆〽", "巖綡條븣繧풽", "轐緋�ᕖ"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 33, "䒲ፃ䐆ꏣ躘䀐틬茶涌娣", CompRound(892669, 283645, 349849, 985226, 604169, 44241, "嚨輻", "嬜", "⃫믶⥥䊟☢", "鸴鐼ꈲ㪑填䐎", "裠艷陆쥿�"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 34, "὜⯇嘣לּ᜚", CompRound(306277, 636246, 240419, 976091, 966784, 585302, "⪱", "ඍ粑給ឥ豈ꡎ虌ᤨ눒", "淂菢�䲕㿨", "M쒸냼搳", "俅䵮䕑鲆㣐쵧"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 35, "釁要倓ഔሟ", CompRound(148152, 821242, 20883, 596703, 998238, 798751, "⇫⌞赍뱽㤶䈗，㿀", "笑퍩쑬벝ꊢꊜ", "꼺昰뻝Ẓ偦ᄅ", "࿕", "ᓵ῁"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 36, "ᬚ虑䖏㩲殏", CompRound(355002, 438469, 80, 748968, 920458, 711046, "⡶⳻", "䏺쾂", "⤌㲢", "ଉꮭ", "쳧ᖖ䒞"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 37, "ɔﱙ䑓輑䏘諚", CompRound(726586, 467537, 149744, 339901, 573257, 856145, "켙㎉㯨鶆迆宠", "२", "杀㣖讝�駥﫰ﴄ糒﶑", "븖浿ᥝ䎄ᇫￖ䦅詉翰", "쉜넿㲁镋覴뷵"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 38, "芒ѫ긠", CompRound(512865, 25889, 978223, 494487, 43382, 418848, "", "콳쀥缿娉퇯諶", "㷴Ʊḩ곍", "㴼誏埤�ꐳ㭓桂", "࿎霓"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 39, "ⵁ", CompRound(168762, 971594, 10355, 148017, 571653, 10177, "໠緸ῌꮏ쐔继鄚", "鬸뢬瘉ᓔƮ䨿밪", "ꋇ�ᘲ", "", "ᆛ"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 40, "ᆔ峂ူ᫦", CompRound(92941, 749422, 740222, 440733, 510617, 335326, "", "⚝浩", "戮댬", "쾙緭", "悔嫨犃돋⪠斥怺돔긖"));
    Test_ProxyFns_DictOfCompRound_WriteLog(testDict, 41, "Ṽ홞寷ﵣﳸﳉቇ蔥妄", CompRound(390086, 426594, 884044, 193847, 337831, 31351, "⼆謻쭃ᘇһ雦", "苯趯", "䐩ꨪ皷䂉", "穐浩", "䘜텓"));
    assert(41*2 == countFileLines(IO::FromDataFolder('Storage/codegenTest/test/DictOfCompRound_WriteLog.txt')), "Should have written exactly 41*2 lines to the log.");
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfCompRound_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfCompRound_WriteLog.txt');
    assert(41 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize());
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfCompRound_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfCompRound_WriteLog_DictBacking);
}
#endif