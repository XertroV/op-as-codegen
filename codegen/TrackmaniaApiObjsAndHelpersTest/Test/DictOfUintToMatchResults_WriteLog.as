#if UNIT_TEST
namespace Test_DictOfUintToMatchResults_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfUintToMatchResults_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfUintToMatchResults_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfUintToMatchResults_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfUintToMatchResults_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfUintToMatchResults_WriteLog', UnitTest_DictBacking_DictOfUintToMatchResults_WriteLog);
  }
  
  bool Test_ProxyFns_DictOfUintToMatchResults_WriteLog(DictOfUintToMatchResults_WriteLog@ testDict, uint n, uint key, MatchResults@ value) {
    testDict.Set(key, value);
    _DictOfUintToMatchResults_WriteLog::KvPair@ tmpKV = _DictOfUintToMatchResults_WriteLog::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfUintToMatchResults_WriteLog() {
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToMatchResults_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToMatchResults_WriteLog.txt');
    }
    DictOfUintToMatchResults_WriteLog@ testDict = DictOfUintToMatchResults_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUintToMatchResults_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 1, 303792, MatchResults(481159, "䞥", "ᗙᕱ", {MatchResult(MaybeOfUint(), MaybeOfUint(480760), "", "셜睟捡ᑽ계揨锖＼")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 2, 335094, MatchResults(306325, "", "횪쮿饿쾿턪靾ꐋ亩적쟙", {MatchResult(MaybeOfUint(43391), MaybeOfUint(272468), "៲䔸僯ʚ땚㰎", "ʿꤜ즱妖䜇붧"), MatchResult(MaybeOfUint(942730), MaybeOfUint(325502), "댷턾", "氏鰥鎾脔䚃ꑒ鼑혅凐優")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 3, 183742, MatchResults(679591, "霆ս㈖瑅㏣咊䈍4ᥜ", "뙷瀊喘ٵ搕", {MatchResult(MaybeOfUint(446794), MaybeOfUint(339239), "찊", "厇翟즯蔕鋁뜵竱�Ѱѡ"), MatchResult(MaybeOfUint(432877), MaybeOfUint(935898), "탚줅", "ࣸகꂘ簚♩ֿ⢽௙"), MatchResult(MaybeOfUint(250335), MaybeOfUint(), "ﶰ荚ႝ塷", "媱㈉"), MatchResult(MaybeOfUint(627618), MaybeOfUint(289608), "ꗄ", "ᖲ⭃땫쿅鑚")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 4, 546221, MatchResults(331497, "얿⿡ꁑ뎝", "녖ퟆ軘῍", {MatchResult(MaybeOfUint(304645), MaybeOfUint(997590), "柆", "喠�竀")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 5, 729909, MatchResults(304899, "㥾ﹲ", "⬺ʁ籁蔒헃㷸肳", {MatchResult(MaybeOfUint(479693), MaybeOfUint(), "ছᏱꦰԡ屨ള띄", "먿"), MatchResult(MaybeOfUint(18461), MaybeOfUint(719100), "戌꾠ૐﷅ랫苀睇�८", "櫓䁠"), MatchResult(MaybeOfUint(), MaybeOfUint(403102), "獜�覤", "捍鵘")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 6, 827431, MatchResults(998153, "煔ݐ﷕津", "쥘΍쐡�냊ᗩ掌⥏둜芙", {MatchResult(MaybeOfUint(64861), MaybeOfUint(), "홨�", "錮앬撏雇㧱"), MatchResult(MaybeOfUint(901575), MaybeOfUint(502637), "ﱋ⌎媑", "䏄峹䀲跜ꣵ죰爲躒蚗")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 7, 432401, MatchResults(381848, "䮲哎뽬", "ޓ匴薻릃难", {MatchResult(MaybeOfUint(225738), MaybeOfUint(279127), "귓ᚑ蠠輥", "｀Ꞿ時ﭠ"), MatchResult(MaybeOfUint(233768), MaybeOfUint(), "멊", "맃㗣멒憣귅㢦ﬔ"), MatchResult(MaybeOfUint(946614), MaybeOfUint(328201), "釐쩔䧟燋뮶ဪ긘喣줓", "杯✺萫埻�ﾐ貄"), MatchResult(MaybeOfUint(585360), MaybeOfUint(75472), "ⰟΗ픚딦因↸럏豷휿", "뿺")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 8, 773360, MatchResults(842421, "㹔鲞창艿⛙", "삍堷텶裿", {MatchResult(MaybeOfUint(16321), MaybeOfUint(115137), "を⇗㸣ᠼ❰Ꝁ둑❶", "畗⚻ꜚ嵡᷂ꏨ")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 9, 429315, MatchResults(642628, "", "俄岵ᨪ敢諗뗛", {MatchResult(MaybeOfUint(937066), MaybeOfUint(626621), "汏䋐泔肢鬌玄魯", "浟븫䲾鳚㜰"), MatchResult(MaybeOfUint(910429), MaybeOfUint(492762), "跉觥", "⧌"), MatchResult(MaybeOfUint(627356), MaybeOfUint(408573), "랥矈[鬹햤샳", "래䠎薂姯⟤")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 10, 740227, MatchResults(188684, "ԏ", "", {MatchResult(MaybeOfUint(), MaybeOfUint(889671), "", "ᨛ清鏵�Ḏ⫳캐ꜞߴ"), MatchResult(MaybeOfUint(511363), MaybeOfUint(466790), "ᇬ떝᱒ꑽ欄풼♃飙", ""), MatchResult(MaybeOfUint(580707), MaybeOfUint(962650), "䞽隫ा멃㳦꛹", "")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 11, 744201, MatchResults(374046, "췲뫤귷軿賨㠙", "㥄伟녈ꎨ", {MatchResult(MaybeOfUint(563116), MaybeOfUint(), "Ӎ춵锕섆殀鄲쓨嗿쌋", "賎얍䐋ꠎ믱礵晴"), MatchResult(MaybeOfUint(748245), MaybeOfUint(181775), "", "匤鴑凡깁䧌鼏㮒")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 12, 777480, MatchResults(483145, "�㰸牏짰除", "ṭ䵅䇛盈�塓", {MatchResult(MaybeOfUint(954189), MaybeOfUint(111985), "꼮䱹㠀", "�᫻"), MatchResult(MaybeOfUint(863027), MaybeOfUint(677495), "࡭Þ찙婁ホ鈥�", "ꫯ詡ࣲ'壯"), MatchResult(MaybeOfUint(), MaybeOfUint(687257), "⋧保퓖躱阘㸄ꖡ넯", "퇰�"), MatchResult(MaybeOfUint(108626), MaybeOfUint(), "鴔꠿र칛첑彠슜仡鹚", "밃끻")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 13, 498906, MatchResults(484509, "Ζ", "", {MatchResult(MaybeOfUint(73493), MaybeOfUint(168916), "", "墳﵋쏥暸冫"), MatchResult(MaybeOfUint(), MaybeOfUint(943607), "㿺�蛡ӌ㒀ᦤ", "憷銅彺茍៿"), MatchResult(MaybeOfUint(501966), MaybeOfUint(974243), "ၠ岶﹊ᘀ螲鲹", "䳫䥴녊璄殲麖톸炾")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 14, 152486, MatchResults(226317, "㫡繙곑寂뼀", "簰顙ﯚ㱥널剅׈泵鹪流", {MatchResult(MaybeOfUint(), MaybeOfUint(845626), "촇煎ꕈ", "⩷謝㱮奜ជ鵳"), MatchResult(MaybeOfUint(), MaybeOfUint(113250), "", "섣婄筙俚ʊ郰ፄ훺Ṁ"), MatchResult(MaybeOfUint(424722), MaybeOfUint(710114), "熭贮봣靈샣", "塗퓖ᥙ㠗"), MatchResult(MaybeOfUint(544770), MaybeOfUint(275316), "ꃀݝ㢗", "핊摝簾짭移૞")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 15, 916155, MatchResults(158208, "ᐢ쳲", "⣦≜༓斳洠⸹䅒ꉓ虸", {MatchResult(MaybeOfUint(614508), MaybeOfUint(591129), "꺭ꁅ覤籂訢", "ꃅᨩ윐窼젮")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 16, 535494, MatchResults(601890, "ﲄ㙗鸏硨讄㿶箊ﶫ", "쌸ߦ繶⟸", {MatchResult(MaybeOfUint(880910), MaybeOfUint(), "㭘⹯탳ꍏ趼㏰栝", "୫"), MatchResult(MaybeOfUint(498272), MaybeOfUint(776412), "⽈쏎ﴣ㩔Ἃ", "䱒ገ䒥"), MatchResult(MaybeOfUint(343559), MaybeOfUint(773127), "㵾⚿벣家", "砅慄馢䲏"), MatchResult(MaybeOfUint(161083), MaybeOfUint(838377), "鮿恱礼䍘汜⌓", "鑟㓹껶⮏娧")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 17, 932372, MatchResults(161669, "룆", "慕⻆ᙠ淐쏄쵯", {MatchResult(MaybeOfUint(), MaybeOfUint(879778), "橱튗㐰쉹즚", "뵼꩹鏀矕"), MatchResult(MaybeOfUint(811), MaybeOfUint(), "", "ሦ㗸밒啯쑩盬�੢ꅠ"), MatchResult(MaybeOfUint(483875), MaybeOfUint(), "춛ග⸤ꎢ尷", "袕"), MatchResult(MaybeOfUint(532151), MaybeOfUint(), "ᾷ틗𥳐ꞑ䎃汏圾", "♸識ے阔䅐ე஠맪")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 18, 331474, MatchResults(306936, "ꓜὤ", "翫ⱬ�踙", {MatchResult(MaybeOfUint(897486), MaybeOfUint(68787), "폁趗婆引兘뛮��", "䅭")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 19, 811357, MatchResults(897023, "Ⱦ燷⑅┠◚〥鑨", "⇭�ራ䀄乡웪ǿ�", {MatchResult(MaybeOfUint(267792), MaybeOfUint(), "⪒왮弚ꥁ", "⢬㒻仾엍搯룴髷Ӌ坆돺"), MatchResult(MaybeOfUint(), MaybeOfUint(793078), "ᘜ", "肶"), MatchResult(MaybeOfUint(982822), MaybeOfUint(), "괕᜘鄖ﲿ⚕", "鳪铔⋲⌇鎊蔏")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 20, 736019, MatchResults(347105, "▆魠旄ﯳ蝱끻", "☸ᔈᅰ넎᭰", {MatchResult(MaybeOfUint(188742), MaybeOfUint(742441), "䷙駒ꖷ贰ꗰ", "愁ཹຣ串飘蒑翰펵")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 21, 794578, MatchResults(343169, "㘺감潥＝", "㷠ꨐ클홈᧕", {MatchResult(MaybeOfUint(36127), MaybeOfUint(184540), "⡱䠏�㼗", "헊뜎볧佫⣋"), MatchResult(MaybeOfUint(271487), MaybeOfUint(72022), "�﹪퐑嬙", "顣㝙켟ꊔ뜛ᦿ粔閲䔵"), MatchResult(MaybeOfUint(910637), MaybeOfUint(453761), "ᇈ蕁䡤껬䦜⢹膧뀘", "苯寺稆騻샰"), MatchResult(MaybeOfUint(), MaybeOfUint(67534), "", "嫯뤐â")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 22, 855254, MatchResults(293110, "ꗦ⭏琳ꉩ", "惯ﭪୗ겠㻒凃앿", {MatchResult(MaybeOfUint(427255), MaybeOfUint(), "ᮣ쾙᎗癑눋", "⥄"), MatchResult(MaybeOfUint(414243), MaybeOfUint(740723), "勵寀儍", "ᑭ谊ㆵ"), MatchResult(MaybeOfUint(931949), MaybeOfUint(936134), "ḷ", "쥩谅Ɯ觕ʉ첃氁�"), MatchResult(MaybeOfUint(), MaybeOfUint(588548), "쩜瑸뺊픜模첳", "⍭ᢹ鞄�")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 23, 773845, MatchResults(971346, "ಒ碙ᐵ蛭譟�", "瓕慱η", {MatchResult(MaybeOfUint(71658), MaybeOfUint(), "ᔯ釀偷", "ꀇᕋો䝻徕ꠋ홮ㄎ鰛")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 24, 316641, MatchResults(92079, "�榩ࠣ焧诗䜹㓦", "য穁녣翏", {MatchResult(MaybeOfUint(607492), MaybeOfUint(442910), "䵠哕료㜧፭", "⊬愊")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 25, 658199, MatchResults(720189, "ྱ", "䖜", {MatchResult(MaybeOfUint(412742), MaybeOfUint(425832), "ᾴ댁⋬魝멜몊", "泦眨ඎバґ�圉过끒ꆐ")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 26, 499819, MatchResults(435167, "ᜊ懓", "鐃亳諀؃ޔ剋搾Ҥ", {MatchResult(MaybeOfUint(), MaybeOfUint(740899), "阉ﻬ㦇᱔ᔂ킁", ""), MatchResult(MaybeOfUint(717516), MaybeOfUint(959903), "郑ꬭ恢㲟࿲㣁⟠", "鿹鵇鈾箶묀䘥齫虴"), MatchResult(MaybeOfUint(18929), MaybeOfUint(), "幃㚌", "꧷仢ᤦƼ뵕Х"), MatchResult(MaybeOfUint(959521), MaybeOfUint(147227), "젥턤ΐｧ�夾큁슍茒泗", "驎ᔇॸ鑬䁚")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 27, 567182, MatchResults(843322, "⤡쌩繄歚ᦆ⫮뾧Ў죬", "茿⠿챯顈꓀鼏", {MatchResult(MaybeOfUint(418027), MaybeOfUint(477811), "䰼밉㤽⤋鳙", "㘐聳祋㊅ᐁ賩﹙￞"), MatchResult(MaybeOfUint(335684), MaybeOfUint(544459), "ꣂ迟Ὸ꥔㊂澭ꑸ鋱続", "헡꼮ุ"), MatchResult(MaybeOfUint(), MaybeOfUint(803562), "љ㠏儮蝇訦", "ᔴ䩲鳄꫏Ⲳ䢁䊞쉼"), MatchResult(MaybeOfUint(679763), MaybeOfUint(823727), "", "斋డሟᔧ퇵㛭砣㸆㎏")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 28, 790438, MatchResults(133166, "䳋鴓餔视짻佌⻛폛", "那퍁޽쵝႕鹙㇨庯⤘", {MatchResult(MaybeOfUint(598989), MaybeOfUint(), "嗢ᣳ䡛櫩̘ࢲ὜", "蛘똷ꭍ"), MatchResult(MaybeOfUint(), MaybeOfUint(), "鐼ꈲ", "᜚痓裠艷陆쥿��")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 29, 585302, MatchResults(918298, "粑給ឥ豈ꡎ虌ᤨ눒鵶", "䲕㿨빖", {MatchResult(MaybeOfUint(12053), MaybeOfUint(), "ݐ悺⡹齤쳚Ⱉ", "")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 30, 704337, MatchResults(360387, "刡榡蘸赤", "ꍴ漒옳咽郦", {MatchResult(MaybeOfUint(696365), MaybeOfUint(289426), "笑퍩쑬벝ꊢꊜ甆", ""), MatchResult(MaybeOfUint(131620), MaybeOfUint(998238), "㎮", "㤶䈗，")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 31, 331715, MatchResults(87757, "꼺昰뻝Ẓ", "࿕", {MatchResult(MaybeOfUint(), MaybeOfUint(695619), "⟠芔奈", "�䃐㋋꧝ꑱẎ"), MatchResult(MaybeOfUint(376447), MaybeOfUint(983633), "챴洄挺㤨጗蕘猁", "⺞侻ᬝ䵰쵝碍ιف壐⹒")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 32, 477062, MatchResults(254057, "撊랷嶿賕�毯㈍", "퉔", {MatchResult(MaybeOfUint(5286), MaybeOfUint(237400), "ￖ", "ᥝ䎄"), MatchResult(MaybeOfUint(174812), MaybeOfUint(407067), "﶑꽤२莀켙㎉", "杀㣖讝�駥﫰ﴄ")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 33, 659296, MatchResults(609345, "芒ѫ긠됹쉜넿㲁镋覴", "◮ꋍ廙銶댶夷", {MatchResult(MaybeOfUint(687666), MaybeOfUint(54390), "刾脿㮧ꖗ侫", ""), MatchResult(MaybeOfUint(418848), MaybeOfUint(246599), "ힳ给혂㓲궪燲᭝", "뽗兖")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 34, 870089, MatchResults(190247, "鋮즏⩤蠀Îﱗ捓⃑", "괱", {MatchResult(MaybeOfUint(636080), MaybeOfUint(64245), "䨿밪屼໠緸ῌꮏ", "뢬瘉ᓔƮ")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 35, 789461, MatchResults(471851, "峂ူ᫦쳾ᆛऩꋇ", "劀", {MatchResult(MaybeOfUint(543083), MaybeOfUint(285932), "禮僘穸鳷㹭쫽䕏ꐜ", "䵞趙␲"), MatchResult(MaybeOfUint(92941), MaybeOfUint(527739), "멯⌙", "ꑸ䫦䡄叺鼋")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 36, 91046, MatchResults(128334, "⌆如䐓ଃ뽘", "▯ꔂ�", {MatchResult(MaybeOfUint(659825), MaybeOfUint(356120), "䘜텓얆穐浩䨜䐩", "빅馣㮳㓸皫䯣≯䘏䚹"), MatchResult(MaybeOfUint(554199), MaybeOfUint(337831), "쭃ᘇһ雦ډ", "苯趯Ὧ⼆")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 37, 100110, MatchResults(867217, "㍀րᑒ㾟娠琴䄽", "址숟⒗닪礗삶ᒎ咲", {MatchResult(MaybeOfUint(), MaybeOfUint(697748), "墭뷑쇐㍡鈹챁ᇰ裢턛孷", "枲騽花ᄖ迡㌣峖ﱩ揹"), MatchResult(MaybeOfUint(487773), MaybeOfUint(626173), "蔃", "肀츆溗"), MatchResult(MaybeOfUint(255707), MaybeOfUint(), "凟鸮ﺴ", "셇눒몆䮐")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 38, 582021, MatchResults(405922, "�㑡ꅥ", "", {MatchResult(MaybeOfUint(403721), MaybeOfUint(847859), "⭈6ᅩ僦�", ""), MatchResult(MaybeOfUint(453898), MaybeOfUint(614633), "௖菪䮥䫝鮞", "쟣큽鮗細ᶜ焑"), MatchResult(MaybeOfUint(), MaybeOfUint(202831), "�ż䘛࿎麭짱", "﷢䬻࿑�")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 39, 441830, MatchResults(220733, "", "", {MatchResult(MaybeOfUint(141813), MaybeOfUint(340229), "鑊狢썃鐑檐慟읕ꐺ�", ""), MatchResult(MaybeOfUint(), MaybeOfUint(), "揲Ე䳉庂", "뿣鎋薗ﾐ뛶ꓐ�ヽ䄬")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 40, 868395, MatchResults(127433, "֬练䮋玴䁞鉟૆", "㒝蜓", {MatchResult(MaybeOfUint(), MaybeOfUint(870485), "䇁", ""), MatchResult(MaybeOfUint(457103), MaybeOfUint(757192), "쨧䗾遝", ""), MatchResult(MaybeOfUint(857488), MaybeOfUint(), "㟈턩ꎘ龎", "俨Ͱﮕ䜝隳")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 41, 463894, MatchResults(38565, "衮ॎ", "榗", {MatchResult(MaybeOfUint(360261), MaybeOfUint(801412), "置ခ㐄⒃Щ᳏", "ꖊ頪ဲ㷒繁鮬"), MatchResult(MaybeOfUint(821639), MaybeOfUint(130383), "ꔖ", "ﾠὦ螲�റ"), MatchResult(MaybeOfUint(876661), MaybeOfUint(574618), "ᶄ턧ꍬ㲲析ꝵ枠", "穏Åደ")}));
    Test_ProxyFns_DictOfUintToMatchResults_WriteLog(testDict, 42, 317488, MatchResults(713463, "䣯걯會�鑒鸐韼", "쟠觬攳賤ᧄ汏", {MatchResult(MaybeOfUint(), MaybeOfUint(873720), "ꑋ뉉⇜熔ᤥᖻ", "롊"), MatchResult(MaybeOfUint(10911), MaybeOfUint(392855), "溹ퟹኊ훬錱⼭", "躷")}));
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfUintToMatchResults_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfUintToMatchResults_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(42 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfUintToMatchResults_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfUintToMatchResults_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfUintToMatchResults_WriteLog_DictBacking);
}
#endif