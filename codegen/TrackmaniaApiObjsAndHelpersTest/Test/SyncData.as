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
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_SyncData_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_SyncData', UnitTest_SzThenUnSz_SyncData);
  }
  
  bool Test_SzThenUnSz_Check(uint lastUpdated, const string &in status) {
    SyncData@ tmp = SyncData(lastUpdated, status);
    assert(tmp == _SyncData::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_SyncData() {
    Test_SzThenUnSz_Check(823221, "�朹鎟ﳙ㻲翾鵜靀㍒");
    Test_SzThenUnSz_Check(141231, "엻렒哾๺⾖㻄쪼ﰙ⠁玭");
    Test_SzThenUnSz_Check(437979, "킅Ề");
    Test_SzThenUnSz_Check(789556, "밄ꊦ⊼⿕氎꼻");
    Test_SzThenUnSz_Check(605220, "섌");
    Test_SzThenUnSz_Check(179363, "汛瀹ፎﬡ賄�匼");
    Test_SzThenUnSz_Check(906038, "佪�䮞");
    Test_SzThenUnSz_Check(263354, "푲෗蔃䓥㻥");
    Test_SzThenUnSz_Check(365118, "䟃넲䗵");
    Test_SzThenUnSz_Check(322150, "潔箯㉽");
    Test_SzThenUnSz_Check(547338, "쬙ꅇ᭧봅≹");
    Test_SzThenUnSz_Check(337261, "ၛⶍ쎦㋥霈�");
    Test_SzThenUnSz_Check(4946, "︠걿좳樁㠵");
    Test_SzThenUnSz_Check(67877, "瞄");
    Test_SzThenUnSz_Check(207150, "ﻊ爛⏂ꥏ꼼砍띑");
    Test_SzThenUnSz_Check(552233, "㏰鉓켯");
    Test_SzThenUnSz_Check(675803, "踆");
    Test_SzThenUnSz_Check(564566, "䩸Ὼ㐚ꂖ摇䞰鄕ꈽ");
    Test_SzThenUnSz_Check(606676, "᳔䬳⑇勿掝");
    Test_SzThenUnSz_Check(467845, "㭾멭Პ䑰繤");
    Test_SzThenUnSz_Check(951853, "퍻䳥");
    Test_SzThenUnSz_Check(592141, "솛");
    Test_SzThenUnSz_Check(288796, "奞ͩ줞䟥ፕ⎃");
    Test_SzThenUnSz_Check(234787, "᪲ꮚ෌ᚸᄺ膲㑅");
    Test_SzThenUnSz_Check(45702, "ⰳ팑ꇬ䋶");
    Test_SzThenUnSz_Check(405127, "궈䩓�魓쬣㸕");
    Test_SzThenUnSz_Check(227499, "巖ㅡ螘笣䨯");
    Test_SzThenUnSz_Check(571633, "ు盡ₜ阵璫⃔煡");
    Test_SzThenUnSz_Check(341399, "淡");
    Test_SzThenUnSz_Check(258409, "ѽ泡誄狋撧곟");
    Test_SzThenUnSz_Check(925854, "佌Țꡮ殴䉵庨嶏");
    Test_SzThenUnSz_Check(809993, "㥊ᆺ⻖㋽빽睍");
    Test_SzThenUnSz_Check(126840, "䒹ਮゴ虻雈皇殤膕");
    Test_SzThenUnSz_Check(868449, "�〿Ꝼ샛ᣱ");
    Test_SzThenUnSz_Check(881016, "");
    Test_SzThenUnSz_Check(266937, "㐟ꯩ㹎ӑ䞖猏鐪");
    Test_SzThenUnSz_Check(92, "挤");
    Test_SzThenUnSz_Check(558576, "ꡃ");
    Test_SzThenUnSz_Check(297578, "⸕숈祭鑚ൃ");
    Test_SzThenUnSz_Check(848229, "桾뭎挘殤掙얷ᐮ");
    Test_SzThenUnSz_Check(147932, "");
    Test_SzThenUnSz_Check(493491, "�䄳凜嬚魯ᄍ");
  }
  
  bool unitTestResults_SyncData_RowSerialization = runAsync(Tests_RegisterAll_SyncData_RowSerialization);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_SyncData_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_SyncData', UnitTest_ToFromBuffer_SyncData);
  }
  
  bool Test_ToFromBuffer_Check(uint lastUpdated, const string &in status) {
    SyncData@ tmp = SyncData(lastUpdated, status);
    Buffer@ buf = Buffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _SyncData::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_SyncData() {
    Test_ToFromBuffer_Check(823221, "�朹鎟ﳙ㻲翾鵜靀㍒");
    Test_ToFromBuffer_Check(141231, "엻렒哾๺⾖㻄쪼ﰙ⠁玭");
    Test_ToFromBuffer_Check(437979, "킅Ề");
    Test_ToFromBuffer_Check(789556, "밄ꊦ⊼⿕氎꼻");
    Test_ToFromBuffer_Check(605220, "섌");
    Test_ToFromBuffer_Check(179363, "汛瀹ፎﬡ賄�匼");
    Test_ToFromBuffer_Check(906038, "佪�䮞");
    Test_ToFromBuffer_Check(263354, "푲෗蔃䓥㻥");
    Test_ToFromBuffer_Check(365118, "䟃넲䗵");
    Test_ToFromBuffer_Check(322150, "潔箯㉽");
    Test_ToFromBuffer_Check(547338, "쬙ꅇ᭧봅≹");
    Test_ToFromBuffer_Check(337261, "ၛⶍ쎦㋥霈�");
    Test_ToFromBuffer_Check(4946, "︠걿좳樁㠵");
    Test_ToFromBuffer_Check(67877, "瞄");
    Test_ToFromBuffer_Check(207150, "ﻊ爛⏂ꥏ꼼砍띑");
    Test_ToFromBuffer_Check(552233, "㏰鉓켯");
    Test_ToFromBuffer_Check(675803, "踆");
    Test_ToFromBuffer_Check(564566, "䩸Ὼ㐚ꂖ摇䞰鄕ꈽ");
    Test_ToFromBuffer_Check(606676, "᳔䬳⑇勿掝");
    Test_ToFromBuffer_Check(467845, "㭾멭Პ䑰繤");
    Test_ToFromBuffer_Check(951853, "퍻䳥");
    Test_ToFromBuffer_Check(592141, "솛");
    Test_ToFromBuffer_Check(288796, "奞ͩ줞䟥ፕ⎃");
    Test_ToFromBuffer_Check(234787, "᪲ꮚ෌ᚸᄺ膲㑅");
    Test_ToFromBuffer_Check(45702, "ⰳ팑ꇬ䋶");
    Test_ToFromBuffer_Check(405127, "궈䩓�魓쬣㸕");
    Test_ToFromBuffer_Check(227499, "巖ㅡ螘笣䨯");
    Test_ToFromBuffer_Check(571633, "ు盡ₜ阵璫⃔煡");
    Test_ToFromBuffer_Check(341399, "淡");
    Test_ToFromBuffer_Check(258409, "ѽ泡誄狋撧곟");
    Test_ToFromBuffer_Check(925854, "佌Țꡮ殴䉵庨嶏");
    Test_ToFromBuffer_Check(809993, "㥊ᆺ⻖㋽빽睍");
    Test_ToFromBuffer_Check(126840, "䒹ਮゴ虻雈皇殤膕");
    Test_ToFromBuffer_Check(868449, "�〿Ꝼ샛ᣱ");
    Test_ToFromBuffer_Check(881016, "");
    Test_ToFromBuffer_Check(266937, "㐟ꯩ㹎ӑ䞖猏鐪");
    Test_ToFromBuffer_Check(92, "挤");
    Test_ToFromBuffer_Check(558576, "ꡃ");
    Test_ToFromBuffer_Check(297578, "⸕숈祭鑚ൃ");
    Test_ToFromBuffer_Check(848229, "桾뭎挘殤掙얷ᐮ");
    Test_ToFromBuffer_Check(147932, "");
    Test_ToFromBuffer_Check(493491, "�䄳凜嬚魯ᄍ");
  }
  
  bool unitTestResults_SyncData_ToFromBuffer = runAsync(Tests_RegisterAll_SyncData_ToFromBuffer);
  
  /* Test // Mixin: Persistent */
  void Tests_RegisterAll_SyncData_Persistent() {
    RegisterUnitTest('UnitTest_Persistent_SyncData', UnitTest_Persistent_SyncData);
  }
  
  bool Check_Persistent_SyncData() {
  }
  
  void UnitTest_Persistent_SyncData() {
  }
  
  bool unitTestResults_SyncData_Persistent = runAsync(Tests_RegisterAll_SyncData_Persistent);
}
#endif