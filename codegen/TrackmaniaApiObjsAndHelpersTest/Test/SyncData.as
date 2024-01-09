#if UNIT_TEST
namespace Test_SyncData {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_SyncData_CommonTesting() {
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
  
  bool unitTestResults_SyncData_CommonTesting = runAsync(Tests_RegisterAll_SyncData_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_SyncData_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_SyncData', UnitTest_ToJsonFromJson_SyncData);
  }
  
  bool Test_ToJsonFromJson_Check(uint lastUpdated, const string &in status) {
    SyncData@ tmp = SyncData(lastUpdated, status);
    assert(tmp == SyncData(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_SyncData() {
    Test_ToJsonFromJson_Check(129450, "㳋뽄旤ᮔ﵇獣ແ");
    Test_ToJsonFromJson_Check(191439, "ᱶ");
    Test_ToJsonFromJson_Check(883496, "澯�჌江䚏꼸");
    Test_ToJsonFromJson_Check(181454, "汯粌鉅");
    Test_ToJsonFromJson_Check(259935, "");
    Test_ToJsonFromJson_Check(294609, "㟳䢕颒饣ퟶ");
    Test_ToJsonFromJson_Check(141875, "ꦻ땬黿");
    Test_ToJsonFromJson_Check(541297, "堉⍴ᲊ");
    Test_ToJsonFromJson_Check(606311, "摂ꖶ鍁紙");
    Test_ToJsonFromJson_Check(957341, "客㒞᫯볠箢暂遐");
    Test_ToJsonFromJson_Check(509010, "扬껰朣뵧칒튪윷窋澵z");
    Test_ToJsonFromJson_Check(774112, "ஷࣅ");
    Test_ToJsonFromJson_Check(425743, "");
    Test_ToJsonFromJson_Check(228874, "봌彺য়ꬢ毝榆");
    Test_ToJsonFromJson_Check(748773, "炤䩦ᛥ婫囼▏");
    Test_ToJsonFromJson_Check(740990, "皼䦋쁗缧ⱊﱻ");
    Test_ToJsonFromJson_Check(291599, "ͽ텫");
    Test_ToJsonFromJson_Check(238755, "徭");
    Test_ToJsonFromJson_Check(689542, "");
    Test_ToJsonFromJson_Check(293608, "咧놪☼앇炄㐕");
    Test_ToJsonFromJson_Check(814563, "엣ᩁ㟅ഽ");
    Test_ToJsonFromJson_Check(19141, "ꗥ쟭銗䔜῏⻖蚇ங");
    Test_ToJsonFromJson_Check(275663, "");
    Test_ToJsonFromJson_Check(501721, "窐踎윉懜翊신꨻በ");
    Test_ToJsonFromJson_Check(929417, "鹥灦㣋충왦굸褢");
    Test_ToJsonFromJson_Check(106792, "更든Ηꨘ躀퓹ꔴ");
    Test_ToJsonFromJson_Check(417442, "ꧾ큽ⷾ");
    Test_ToJsonFromJson_Check(147453, "鍡轔");
    Test_ToJsonFromJson_Check(757477, "ᣙ욗");
    Test_ToJsonFromJson_Check(61424, "");
    Test_ToJsonFromJson_Check(123025, "");
    Test_ToJsonFromJson_Check(945480, "Ὄ㜣");
    Test_ToJsonFromJson_Check(609511, "⼸៯ꭍڑ쀈ⵗ㏬蠑");
    Test_ToJsonFromJson_Check(960296, "퍂蘇賻ᜳ벛ﳾ啃둸");
    Test_ToJsonFromJson_Check(828508, "䭭澀⽹ᱶ爅螝⬣홭ᢻ");
    Test_ToJsonFromJson_Check(454929, "�");
    Test_ToJsonFromJson_Check(522901, "ᖦﭭ见禁䡼淣럸튦");
    Test_ToJsonFromJson_Check(758410, "");
    Test_ToJsonFromJson_Check(378524, "쎧ᨘ퉁");
    Test_ToJsonFromJson_Check(554346, "엽뷗뢑");
    Test_ToJsonFromJson_Check(227340, "");
    Test_ToJsonFromJson_Check(881761, "㢝蔹");
  }
  
  bool unitTestResults_SyncData_ToFromJSONObject = runAsync(Tests_RegisterAll_SyncData_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_SyncData_Getters() {
    RegisterUnitTest('UnitTest_SyncData_Getters', UnitTest_SyncData_Getters);
  }
  
  bool Test_CheckProps_SyncData(uint lastUpdated, const string &in status) {
    SyncData@ tmp = SyncData(lastUpdated, status);
    assert(lastUpdated == tmp.lastUpdated, 'field lastUpdated with value `' + lastUpdated + '`');
    assert(status == tmp.status, 'field status with value `' + status + '`');
    return true;
  }
  
  void UnitTest_SyncData_Getters() {
    Test_CheckProps_SyncData(394184, "馩");
    Test_CheckProps_SyncData(888896, "빬�￿");
    Test_CheckProps_SyncData(980813, "�╝㸌鐁㧖⢢羋⽪㎜");
    Test_CheckProps_SyncData(313205, "鰉");
    Test_CheckProps_SyncData(14178, "�싺");
    Test_CheckProps_SyncData(464786, "鳔ꂆऒ涮�뗗");
    Test_CheckProps_SyncData(54851, "●ꜛ귦翮漽똮覧﶑䙢");
    Test_CheckProps_SyncData(212517, "먳�⿵枵");
    Test_CheckProps_SyncData(622511, "윰蘆콬⨸۫芁≲");
    Test_CheckProps_SyncData(49504, "握");
    Test_CheckProps_SyncData(321608, "ᄼﵰ㞪㷗᤾虝䰒");
    Test_CheckProps_SyncData(149817, "那");
    Test_CheckProps_SyncData(853156, "懓奲쮄⸔옯");
    Test_CheckProps_SyncData(985047, "ᓭ褾㵹徲㼏嘿ꑙ尚");
    Test_CheckProps_SyncData(719653, "�拣䵱䌏");
    Test_CheckProps_SyncData(433840, "ᇡ");
    Test_CheckProps_SyncData(983172, "䤩䇢�뽥");
    Test_CheckProps_SyncData(502172, "鏓윃ᆟ퇚");
    Test_CheckProps_SyncData(6143, "뭷┼쿽騍큋㈣揘䢊儞祹");
    Test_CheckProps_SyncData(544625, "鈤ꦀ");
    Test_CheckProps_SyncData(733923, "㎀꿈�ᴶ๏㕭∸缲");
    Test_CheckProps_SyncData(972616, "");
    Test_CheckProps_SyncData(680656, "皌撏랭즫ᇁ﹀");
    Test_CheckProps_SyncData(945399, "");
    Test_CheckProps_SyncData(381002, "珐瀮㍿웦쭜䢝䃙");
    Test_CheckProps_SyncData(585012, "阚⦈郶炼");
    Test_CheckProps_SyncData(847011, "弊䮷⃷쨗蝢ᳳ");
    Test_CheckProps_SyncData(816997, "㩾껫墰菌㶑ꔘₜ齬");
    Test_CheckProps_SyncData(469838, "過");
    Test_CheckProps_SyncData(153273, "륦홰떌䱇盰");
    Test_CheckProps_SyncData(184404, "鐷痚ꄻ滇�ꒉ㳀䈾");
    Test_CheckProps_SyncData(705388, "杻�죝ᝫ᥾鼾㮦窘ᤲ쯳");
    Test_CheckProps_SyncData(275775, "痒");
    Test_CheckProps_SyncData(494491, "墒≜蔗塚䌽");
    Test_CheckProps_SyncData(395859, "秉ⵑ᠟Ꮍ⁭豹理癙⤊");
    Test_CheckProps_SyncData(681795, "߇");
    Test_CheckProps_SyncData(920965, "㆒刱❕騐헵�䉨⏋");
    Test_CheckProps_SyncData(978653, "벷쨭욢璞");
    Test_CheckProps_SyncData(30588, "鶧ㆌ痒㇌⋛䨗ও�");
    Test_CheckProps_SyncData(181358, "퍑");
    Test_CheckProps_SyncData(315253, "森ⶍභࢆ⑧");
    Test_CheckProps_SyncData(742625, "К߄뽇㪢㸿ᓮ");
  }
  
  bool unitTestResults_SyncData_Getters = runAsync(Tests_RegisterAll_SyncData_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_SyncData_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_SyncData', UnitTest_OpEqSimple_SyncData);
  }
  
  SyncData@ lastChecked = null;
  
  bool OpEqSimple_Check(uint lastUpdated, const string &in status) {
    SyncData@ o1 = SyncData(lastUpdated, status);
    SyncData@ o2 = SyncData(lastUpdated, status);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_SyncData() {
    OpEqSimple_Check(393455, "ﷰ눵뭩㵷衟춗䵩");
    OpEqSimple_Check(631581, "퍉첯㚥");
    OpEqSimple_Check(606964, "");
    OpEqSimple_Check(295268, "霋흽묌");
    OpEqSimple_Check(148099, "麑遬徨");
    OpEqSimple_Check(787504, "펍캒ᨶ롆਀ꩣ");
    OpEqSimple_Check(221991, "甄壝玃勑");
    OpEqSimple_Check(489079, "");
    OpEqSimple_Check(509350, "");
    OpEqSimple_Check(591080, "璊诛퇟鯚핦壉");
    OpEqSimple_Check(643073, "쇳濶鵛");
    OpEqSimple_Check(783443, "ݙ");
    OpEqSimple_Check(804528, "ᬤ쿊菆︐좙桭");
    OpEqSimple_Check(131073, "䝅攨鑽烆ঙﶇ䚱윲冥㶶");
    OpEqSimple_Check(133463, "㞫䫆ើ鹆ʊ");
    OpEqSimple_Check(392143, "䝕");
    OpEqSimple_Check(288195, "");
    OpEqSimple_Check(531474, "횱宙홧㉜는ꒋ㑶");
    OpEqSimple_Check(504118, "耏盧я␜");
    OpEqSimple_Check(822701, "");
    OpEqSimple_Check(179642, "뮱");
    OpEqSimple_Check(521707, "ࠡ똮");
    OpEqSimple_Check(854015, "燵㪆汀ᆣ젙娣ʱᯜ");
    OpEqSimple_Check(840953, "");
    OpEqSimple_Check(208909, "䀐硩钗쏥䁏");
    OpEqSimple_Check(819364, "鳐ꈉʜ䀿");
    OpEqSimple_Check(718449, "");
    OpEqSimple_Check(422278, "⻰쬟");
    OpEqSimple_Check(830012, "뻹媋");
    OpEqSimple_Check(629572, "ꮸ");
    OpEqSimple_Check(333348, "惝�嬅");
    OpEqSimple_Check(766369, "⃠嚅");
    OpEqSimple_Check(689395, "櫇");
    OpEqSimple_Check(910388, "墐こꅯ껳ሌ괙");
    OpEqSimple_Check(207068, "耽裮ዖ锲釹");
    OpEqSimple_Check(12795, "㤬꾷ټ໿ꍱ꟤��");
    OpEqSimple_Check(694261, "館胄ા즣");
    OpEqSimple_Check(6580, "괗饖㪟");
    OpEqSimple_Check(438577, "통�ﭝ豲氹");
    OpEqSimple_Check(780762, "�둕껅汆");
    OpEqSimple_Check(671624, "秨玹桗喐");
    OpEqSimple_Check(814326, "⩮�ώ꒏퓂䉰ꋗ嗳ರ");
  }
  
  bool unitTestResults_SyncData_OpEq = runAsync(Tests_RegisterAll_SyncData_OpEq);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_SyncData_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_SyncData', UnitTest_ToFromBuffer_SyncData);
  }
  
  bool Test_ToFromBuffer_Check(uint lastUpdated, const string &in status) {
    SyncData@ tmp = SyncData(lastUpdated, status);
    MemoryBuffer@ buf = MemoryBuffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _SyncData::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_SyncData() {
    Test_ToFromBuffer_Check(490366, "");
    Test_ToFromBuffer_Check(426468, "壩괛�㸝赳粢");
    Test_ToFromBuffer_Check(546426, "");
    Test_ToFromBuffer_Check(184950, "㑽沒皔�");
    Test_ToFromBuffer_Check(275544, "ⶭ灁ᏹ㑚ᄟ텻");
    Test_ToFromBuffer_Check(123656, "ﯹ윶ㅸ꓍咽糥");
    Test_ToFromBuffer_Check(16729, "䧂攤룷ꠅꊹ뿭");
    Test_ToFromBuffer_Check(394003, "㍅");
    Test_ToFromBuffer_Check(542064, "�䓂ൗ㬬䱿학");
    Test_ToFromBuffer_Check(760473, "进疎崟뺥⁔啉");
    Test_ToFromBuffer_Check(1464, "ț븶餦ਗ਼玵⌂玍뱑ự");
    Test_ToFromBuffer_Check(500830, "ꏅ㜔庯쎿命⒯");
    Test_ToFromBuffer_Check(493127, "䃩벋⛩");
    Test_ToFromBuffer_Check(668089, "圍㳷ᘙ");
    Test_ToFromBuffer_Check(966690, "銥롘⣎녿썳");
    Test_ToFromBuffer_Check(956474, "겧徕");
    Test_ToFromBuffer_Check(871047, "婗�嗇웖峔䞠");
    Test_ToFromBuffer_Check(254406, "࡟记Ⴒ늴㐆醁递");
    Test_ToFromBuffer_Check(499243, "䲏Ȥ");
    Test_ToFromBuffer_Check(318603, "䴊芺➞ᷟᦊ");
    Test_ToFromBuffer_Check(379446, "扠排蛬�卻恀墿䌣�癓");
    Test_ToFromBuffer_Check(193423, "缆罙푅인Ӽ");
    Test_ToFromBuffer_Check(330939, "⿧�ⷨ㴑縅 弋裚똠綗");
    Test_ToFromBuffer_Check(611940, "ℤ䃧택髞뺥潹琦欉");
    Test_ToFromBuffer_Check(201699, "ꞈ짶܊瓽捭ﱋ");
    Test_ToFromBuffer_Check(691552, "讽ń");
    Test_ToFromBuffer_Check(841908, "綯臭ध");
    Test_ToFromBuffer_Check(373377, "褺끤찙뗿");
    Test_ToFromBuffer_Check(611847, "");
    Test_ToFromBuffer_Check(821325, "❜料痁혈䒽ꢢ顊꾷㍀");
    Test_ToFromBuffer_Check(153581, "㫴ݲ");
    Test_ToFromBuffer_Check(349336, "쉫탑尴ᡰ傹");
    Test_ToFromBuffer_Check(479024, "냐娫责擔挡賵ঃ");
    Test_ToFromBuffer_Check(960991, "㸪");
    Test_ToFromBuffer_Check(674685, "먫ᣆ");
    Test_ToFromBuffer_Check(638918, "璔氉恌⿇�");
    Test_ToFromBuffer_Check(7876, "觞影圓倖ŝ䋇ﮥ㇮ᛏ");
    Test_ToFromBuffer_Check(983162, "Ɉ틛顿");
    Test_ToFromBuffer_Check(260709, "��짺ၑ珤꼟");
    Test_ToFromBuffer_Check(173894, "湧섳⒜㓚苵孇᚞粷ּ繞");
    Test_ToFromBuffer_Check(260068, "㥬ֵ뷨Ŏ猥窣忚軡뿵㏭");
    Test_ToFromBuffer_Check(786352, "蓞椆욛⪺嶷艒玧");
  }
  
  bool unitTestResults_SyncData_ToFromBuffer = runAsync(Tests_RegisterAll_SyncData_ToFromBuffer);
  
  /* Test // Mixin: Persistent */
  void Tests_RegisterAll_SyncData_Persistent() {
    RegisterUnitTest('UnitTest_Persistent_SyncData', UnitTest_Persistent_SyncData);
  }
  
  bool Check_Persistent_SyncData(uint lastUpdated, const string &in status) {
    SyncData@ tmp = SyncData(lastUpdated, status);
    auto loc = StorageLocation('SyncData.bin');
    if (IO::FileExists(loc.Path)) {
      IO::Delete(loc.Path);
    }
    tmp.InitPersist(loc);
    tmp.quiet = true;
    tmp.Persist();
    assert(IO::FileExists(loc.Path), 'file should exist after persisting');
    auto tmp2 = SyncData(loc);
    assert(tmp == tmp2, 'persisted data should match expected');
    tmp.lastUpdated += 1;
    assert(tmp == SyncData(loc), 'mutation should have persisted');
    assert(tmp != tmp2, 'ensure tmp and tmp2 differ');
    tmp2.ReloadFromDisk();
    assert(tmp == tmp2, 'ensure tmp and tmp2 do not differ after reload');
    return true;
  }
  
  void UnitTest_Persistent_SyncData() {
    trace('UnitTest_Persistent_SyncData running extra for firstFsIsInt');
    Check_Persistent_SyncData(883873, "ዿꪹ顂ꭓ軱！");
    Check_Persistent_SyncData(478225, "䥅뇰㚯態妴ᶄ焟诵ᎋ");
    Check_Persistent_SyncData(264938, "");
    Check_Persistent_SyncData(904163, "닼㠠");
    Check_Persistent_SyncData(826761, "쬅ા鐈");
    Check_Persistent_SyncData(89268, "");
    Check_Persistent_SyncData(256839, "⨅砼뛧芀");
    Check_Persistent_SyncData(949437, "ꃊ");
    Check_Persistent_SyncData(524862, "");
    Check_Persistent_SyncData(264667, "홪泍ꀚ");
    Check_Persistent_SyncData(993695, "ᱹ朕�ꦗ憁෪");
    Check_Persistent_SyncData(564222, "髃낛⑨༾ྌ쓀�ḉ");
    Check_Persistent_SyncData(978309, "ه⻮糄");
    Check_Persistent_SyncData(939164, "䆅躎垜");
    Check_Persistent_SyncData(712783, "瀶ﵾ⽎ȶ眄烞טּ");
    Check_Persistent_SyncData(411303, "쭫㻕槄䀮");
    Check_Persistent_SyncData(178622, "㇈");
    Check_Persistent_SyncData(905325, "珹㧖");
    Check_Persistent_SyncData(760686, "㙎뼢⨉㖛엄쳌쁖㟳");
    Check_Persistent_SyncData(818677, "虒溺῟");
    Check_Persistent_SyncData(783380, "ก᮷쓎拎䜹췶젗");
    Check_Persistent_SyncData(40342, "淋ꁜ钭띀槯");
    Check_Persistent_SyncData(688924, "ਿ銕�⦗※ꚳ㺚梌");
    Check_Persistent_SyncData(731967, "ؗ霱藜딒挹ꋲ䞜뙓");
    Check_Persistent_SyncData(721725, "ƺ썱谔థ粄촒펩");
    Check_Persistent_SyncData(969514, "");
    Check_Persistent_SyncData(961529, "긼䬳");
    Check_Persistent_SyncData(575853, "糒㱑혓䰛懑֜⌽");
    Check_Persistent_SyncData(20712, "꛷꧿ꫬ");
    Check_Persistent_SyncData(188256, "膑㹝̓");
    Check_Persistent_SyncData(97043, "抬箌ɝ�㪾ຒ뵑");
    Check_Persistent_SyncData(201315, "");
    Check_Persistent_SyncData(858918, "츲닋黢沺㲂σ祲");
    Check_Persistent_SyncData(333268, "");
    Check_Persistent_SyncData(941030, "齩⾸包");
    Check_Persistent_SyncData(250089, "䓢꥔Ⰽ�璥߲틁䣠");
    Check_Persistent_SyncData(257478, "");
    Check_Persistent_SyncData(298206, "搂Ꮟ兼⑨ࡿ�鍅䌙炞");
    Check_Persistent_SyncData(592381, "᧖䊦勤誛");
    Check_Persistent_SyncData(545349, "霴绒騠藝坠狧蛌");
    Check_Persistent_SyncData(982596, "滗ｳ궈蹛");
    Check_Persistent_SyncData(786350, "");
  }
  
  bool unitTestResults_SyncData_Persistent = runAsync(Tests_RegisterAll_SyncData_Persistent);
}
#endif