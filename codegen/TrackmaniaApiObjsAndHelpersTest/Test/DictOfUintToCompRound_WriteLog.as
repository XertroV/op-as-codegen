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
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 1, 303792, CompRound(481159, 346360, 243863, 723666, 272809, 791498, "蚙폢昳豜䍤ꍚ㦁谱ᬜᱹ", "㵜ܘ閿찖弯䁝籤뗷", "䉹뚩", MaybeOfString("쾿턪靾"), "㩩捠蛅躒횪쮿"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 2, 981442, CompRound(810642, 7336, 826069, 447238, 892527, 981431, "䫠饣옦딉탮䒰", "䛋��ꌥ嗪⩳䆈‴硻", "쳘", MaybeOfString("ᥜ勼ⲓﶄʿꤜ즱妖"), "搕霆ս㈖瑅㏣咊䈍"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 3, 834852, CompRound(695690, 627618, 216399, 873330, 978498, 461061, "ࡏ", "瘖暹ꝝ벤゜皁뾞䉫", "㤯沣﯄ஂﺻ꧂", MaybeOfString("줅櫹է"), "கꂘ簚♩ֿ⢽௙"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 4, 924115, CompRound(515144, 930280, 339239, 742001, 70241, 908955, "탩罈ﮁ厇翟즯蔕鋁", "ꓪ얿⿡ꁑ", "鷲庇镬녖ퟆ軘", MaybeOfString(""), "柆"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 5, 26839, CompRound(910156, 729909, 304899, 528516, 201094, 816669, "⬺ʁ籁蔒헃", "�燨捞ῧ泦탞ꙹ", "튧�웽", MaybeOfString(""), "苀睇�८詙ퟶ釘躟ᇗ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 6, 195740, CompRound(466291, 642064, 455567, 693799, 814673, 684538, "먿်ছᏱꦰԡ", "津ઝ紤⛍射톀", "煔ݐ", MaybeOfString("ꌣ"), "ᣃ刖ꛥｇ믡"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 7, 975376, CompRound(502637, 869169, 90168, 105541, 251520, 568243, "ꣵ죰爲", "䛊⳱獡筕됋䏄峹䀲", "홨", MaybeOfString("穔�"), "㗀"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 8, 182075, CompRound(528692, 606826, 507440, 359096, 467918, 109743, "럏豷휿㖴䬣琉丝桍⻣", "畘㷾䎠뿺䗱ⰟΗ픚딦因", "䷋蒖⏽ꡑꥮ䖬‐", MaybeOfString("닮䤡뎠쫫羓氊"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 9, 163721, CompRound(537856, 619189, 233768, 667000, 995954, 594041, "", "橩먴�ຸ趓", "㦐ﰴ��㊚⊚嘄﬛", MaybeOfString("⛙诏ρ"), "텶裿ꐂ㹔鲞창"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 10, 16321, CompRound(128285, 648111, 909479, 724921, 328559, 810041, "芏훓ﯱꎸ", "珡", "嵌", MaybeOfString(""), "俄岵ᨪ敢諗뗛"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 11, 790018, CompRound(627356, 687861, 802186, 416798, 333499, 515082, "⦜ម흃鑳耮⠸ꀞ", "㷠얌苫頜箱ﴩସ", "먃", MaybeOfString("雍�⚗"), "魯聾"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 12, 992293, CompRound(631685, 620875, 509441, 530340, 229795, 44931, "ԏ戥繅킸삷䉆장浟", "", "⚠싉嫮鲒", MaybeOfString(), "槛컙瞘"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 13, 432846, CompRound(350484, 489156, 841143, 369601, 811641, 797421, "飙杒Ꜯɔ", "떝᱒ꑽ欄풼", "ꕱ⵺ᬒ", MaybeOfString("鶱‹ᾖ㥏ᛌ"), "턄㐻ڎ줠ㅜ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 14, 591518, CompRound(492013, 162096, 362767, 632498, 195612, 478887, "㮒喯뫾㥴ꯝψ뗠�㒙쁺", "䧌", "凡", MaybeOfString("҄�ㄠꍝ芉햺䎬綏ಃ�"), "덲ᆰ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 15, 231734, CompRound(536618, 172472, 215078, 780184, 483426, 761573, "ᖔ", "�", "", MaybeOfString("�"), "盈"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 16, 808674, CompRound(750781, 758471, 920107, 108626, 207948, 769909, "萚Ổ", "腀崂䵎", "枍�㊀곥", MaybeOfString("럀"), "�츺⋧保퓖躱阘㸄ꖡ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 17, 677495, CompRound(958630, 360516, 892949, 360745, 797319, 648241, "꼮䱹㠀ʿ穅�㡲걟蕅꠭", "�᫻", "蘗膐Ζ쇛台柖ꞑ䉾", MaybeOfString("酬"), "ᩐ惴ᐎퟵ癯臺阒诉ﱉ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 18, 974243, CompRound(401678, 166101, 967390, 675078, 282692, 249030, "䥴녊璄殲麖", "", "�蛡ӌ㒀ᦤ걦좟럛쌯바", MaybeOfString("緧ꘖ䔟펼藹嶦巯ฐ"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 19, 311474, CompRound(695675, 552976, 991815, 733831, 933037, 799635, "뻏䎟鷇㧭뚳틽駌", "ਛ젦釞吠韹菱", "鏯ᯣ⒋樝쟴訛팖", MaybeOfString("Ⳕ䀓亰㛨했"), "䐬쩥齭㚽爐瞓"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 20, 283638, CompRound(215246, 796845, 910481, 37565, 307490, 396572, "", "䊆텧稉࿌쨉ᯩ", "ﹳ͂궾ࢇ贽蚈ﱸ欘", MaybeOfString("ជ"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 21, 779838, CompRound(172893, 916155, 158208, 409653, 95629, 649272, "", "�퓔炵Ⴏ⠈⣦≜", "", MaybeOfString("覤"), "窼젮╰꺭"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 22, 535494, CompRound(601890, 594510, 350906, 659998, 989227, 603503, "惘ヶ쌸ߦ繶⟸矵ﲄ㙗", "䧀⎤瞀睸潋诚䘑舆ᵗ", "៉緓倷쇯둘", MaybeOfString("夞芨웪鑟"), "㵾⚿벣家"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 23, 149057, CompRound(994865, 776412, 978462, 882577, 453095, 248249, "䱒ገ䒥", "㏰栝㥻䈲", "⍑୫屢㭘⹯탳ꍏ", MaybeOfString("蹭綞꽌ؓᏪ"), "᳻ኯ钝锠"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 24, 550570, CompRound(112647, 678094, 133460, 27896, 138918, 213620, "틗𥳐", "륆", "ے阔䅐ე஠맪", MaybeOfString("緤猥廥绢␪䅇瓉"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 25, 134600, CompRound(811, 472873, 130998, 990988, 621673, 640421, "굣㮚䶹", "쪩奓栥廻ೆ淽윭ꆹ", "艱ឥͶ葾볡怡ݴ", MaybeOfString("ꓜὤ鬚"), "翫ⱬ�踙"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 26, 980228, CompRound(897486, 182810, 15427, 188396, 290456, 945543, "", "嚫썾읰㹢실�䫶顨몡", "", MaybeOfString("〥"), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 27, 73684, CompRound(108726, 865567, 500571, 369948, 902168, 982822, "꬈䂺社", "䃻齁긒⟵俬ꓻ", "⏱霅眾", MaybeOfString("⹰"), "弚ꥁ뽽쓥éꕆ�肶堠"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 28, 109627, CompRound(260914, 984171, 528836, 683928, 153122, 310783, "㒻", "坯⢫ꤣ", "", MaybeOfString("瓩ᦽ�∠၌�椔敲榹瘚"), "灗헱义咭䧛퉨꧈ົ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 29, 123399, CompRound(743510, 956604, 225354, 86865, 825055, 82320, "愁ཹຣ串", "㘺감潥＝暼", "㷠ꨐ클홈᧕", MaybeOfString("핮◧뚈"), "䱢"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 30, 264607, CompRound(453761, 365806, 467452, 918427, 45811, 900550, "籼苯寺稆騻샰妩ᇈ", "퐑嬙쯒�", "ꊔ뜛ᦿ粔閲䔵鯄�", MaybeOfString(), ""));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 31, 88639, CompRound(237955, 36127, 884518, 154769, 603565, 127045, "㹅慻콨", "ꙍ쇄殒끄澨þ㱚奏죋", "梅͹ᮈ﷾ꍽ嘚盿", MaybeOfString("겠㻒凃앿⸏ꗦ⭏"), "惯ﭪ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 32, 284389, CompRound(80153, 509857, 870317, 922579, 631408, 758921, "렰⳩崈᳒콜ﮢ擵鵡柨", "㊸솻㊜║䩂욃쨁ｺ", "黯룊�ꆫ褢山럝욫�▱", MaybeOfString("⥄䞰ᮣ쾙᎗癑눋"), "ﯶ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 33, 789485, CompRound(130190, 838063, 1570, 898372, 71658, 992189, "⏛줨䈲닌郆涋헂", "㌄쿳", "", MaybeOfString("ꅬ"), "䜹㓦﫳ꓶ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 34, 246961, CompRound(427356, 251769, 201232, 241150, 362488, 607492, "균匑⁤ᛸᱦ쐳杝", "숴訲怔㒛鈿", "೐ա잱澜鳱밹", MaybeOfString("䏩౞퐭뗌缸"), "괠煄ኻ㔇岪"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 35, 169836, CompRound(875231, 202705, 936706, 46835, 318502, 21323, "", "㯚", "뤊쾲婑莵", MaybeOfString("⏞➁⦵℉쓞鰊쯑鐃"), "਋ૂ㈯"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 36, 23179, CompRound(615276, 493723, 547199, 283624, 637993, 267074, "鶰㣳蚈", "쥽", "톷䤼峛翫橔", MaybeOfString("㣁⟠씳鮄녞⽝"), "虴镀郑ꬭ恢㲟"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 37, 181632, CompRound(810503, 859679, 740899, 786355, 889124, 309957, "", "죬겈ۙ", "繄歚ᦆ⫮뾧", MaybeOfString("㐹韯�夎习扔ⱟὈ�᧛"), "㸆㎏檄ꔝ霔䱿"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 38, 885525, CompRound(35550, 241992, 615267, 298963, 803562, 339056, "љ㠏儮蝇", "ᔴ䩲鳄꫏Ⲳ䢁䊞쉼", "続뮈ꂠ낽", MaybeOfString("巖綡"), "轐緋�ᕖ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 39, 139549, CompRound(418027, 465207, 741457, 892669, 283645, 349849, "ᓊ", "", "ᴉ鵂", MaybeOfString("䳋鴓餔视짻佌⻛폛"), "那퍁޽쵝႕鹙㇨庯⤘"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 40, 779430, CompRound(572430, 513711, 7215, 976153, 132588, 538271, "筛�襗篒", "䍮", "셪ꠀ지봉鮨虳", MaybeOfString("ᤨ눒鵶⪱䚸훨蛘"), "㿨빖ඍ粑給ឥ豈ꡎ"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 41, 66775, CompRound(12053, 423606, 562264, 424639, 188477, 303240, "ሟ뤕俅䵮", "䆕篔“釁要倓", "쾊㣦ᷙ�뉆", MaybeOfString("颤ꄈ俪ꨃ坞"), "앪둁獸㮀켝"));
    Test_ProxyFns_DictOfUintToCompRound_WriteLog(testDict, 42, 565403, CompRound(480346, 12689, 369316, 580535, 819121, 570777, "࢘䫛", "঎햧嶮鿴얂�", "", MaybeOfString("䖏㩲"), "ᡑ鵞ψゔ䌝難鯼ᬚ"));
    sleep(50);
    assert(42*2 == countFileLines(IO::FromDataFolder('Storage/codegenTest/test/DictOfUintToCompRound_WriteLog.txt')), "Should have written exactly 42*2 lines to the log, but wrote: " + countFileLines(IO::FromDataFolder('Storage/codegenTest/test/DictOfUintToCompRound_WriteLog.txt')));
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