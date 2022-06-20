#if UNIT_TEST
namespace Test_MatchResults {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_MatchResults_CommonTesting() {
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
  
  bool unitTestResults_MatchResults_CommonTesting = runAsync(Tests_RegisterAll_MatchResults_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_MatchResults_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_MatchResults', UnitTest_ToJsonFromJson_MatchResults);
  }
  
  bool Test_ToJsonFromJson_Check(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    MatchResults@ tmp = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    assert(tmp == MatchResults(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_MatchResults() {
    Test_ToJsonFromJson_Check(129450, "㳋뽄旤ᮔ﵇獣ແ", "䃧쁐욘ᱶ谛䆳ꔼ躜ಙ㟊", {MatchResult(MaybeOfUint(606311), MaybeOfUint(121822), "ᮃ놜冺햵ᤫ簔�"), MatchResult(MaybeOfUint(292599), MaybeOfUint(481904), "䂟礽ᚪ�司䌭덉羌ฬ"), MatchResult(MaybeOfUint(), MaybeOfUint(704518), "딘"), MatchResult(MaybeOfUint(673390), MaybeOfUint(587832), "땶烈軻")});
    Test_ToJsonFromJson_Check(272929, "⍛", "㚡딽蔭䍕᫃ᔼꊛ", {MatchResult(MaybeOfUint(318015), MaybeOfUint(), ""), MatchResult(MaybeOfUint(656514), MaybeOfUint(774112), "ஷࣅ"), MatchResult(MaybeOfUint(), MaybeOfUint(), "")});
    Test_ToJsonFromJson_Check(796389, "᯿쨄봌彺য়ꬢ", "炤䩦ᛥ婫囼", {MatchResult(MaybeOfUint(293608), MaybeOfUint(947632), "똞"), MatchResult(MaybeOfUint(291599), MaybeOfUint(13629), "ᇠ炦♱솎"), MatchResult(MaybeOfUint(740990), MaybeOfUint(592964), "ἁ맱稜븯剬")});
    Test_ToJsonFromJson_Check(932520, "", "撛首譤攊ԭ藙聍㚃", {MatchResult(MaybeOfUint(694964), MaybeOfUint(275663), ""), MatchResult(MaybeOfUint(115425), MaybeOfUint(307977), "銗䔜῏")});
    Test_ToJsonFromJson_Check(501721, "窐踎윉懜翊신꨻በ", "충왦굸褢鶳", {MatchResult(MaybeOfUint(503262), MaybeOfUint(781176), "趑怎饍`櫝뎧")});
    Test_ToJsonFromJson_Check(299592, "䙐禭", "መ꣡嗚㥱", {MatchResult(MaybeOfUint(108410), MaybeOfUint(61424), "")});
    Test_ToJsonFromJson_Check(123025, "", "坖澂ꉃ뒅Ὄ㜣뗃㷦", {MatchResult(MaybeOfUint(625858), MaybeOfUint(228006), "簈"), MatchResult(MaybeOfUint(920767), MaybeOfUint(178195), "ཞꑓ뷾�뤴焦")});
    Test_ToJsonFromJson_Check(468916, "萐뫉", "萋", {MatchResult(MaybeOfUint(), MaybeOfUint(489123), "䡼淣럸튦蘥")});
    Test_ToJsonFromJson_Check(490369, "ᖦﭭ", "੉Ⱬꖗ", {MatchResult(MaybeOfUint(), MaybeOfUint(141704), "뙋招곢贕没�ᴝ삱")});
    Test_ToJsonFromJson_Check(47391, "", "ꆢ", {});
    Test_ToJsonFromJson_Check(881761, "㢝蔹", "�郁❨鲶쐤얪", {MatchResult(MaybeOfUint(703353), MaybeOfUint(188204), "ﭕ椅롥峡�쩇"), MatchResult(MaybeOfUint(201380), MaybeOfUint(245093), "쉒▹ﯖ號㪳ᒶ퐞"), MatchResult(MaybeOfUint(235494), MaybeOfUint(), "쭋胋젮Ⱑ")});
    Test_ToJsonFromJson_Check(975594, "簡॰ഀ㶴٨ῦ鴧", "Ѯꤘ꭭䊘睈宥", {MatchResult(MaybeOfUint(692390), MaybeOfUint(34223), "颤짒傉"), MatchResult(MaybeOfUint(604406), MaybeOfUint(743344), "鈧䴨餶갯")});
    Test_ToJsonFromJson_Check(285613, "漻拹ⓨ", "恮뺪", {MatchResult(MaybeOfUint(827710), MaybeOfUint(131607), "뚖ꯥ끁"), MatchResult(MaybeOfUint(526475), MaybeOfUint(497081), "")});
    Test_ToJsonFromJson_Check(456094, "䟘鱐ꄝ标妒䗶", "苅", {MatchResult(MaybeOfUint(934467), MaybeOfUint(), "؏")});
    Test_ToJsonFromJson_Check(160914, "髍澇㤘▝ħ蔋팪絠촊", "鿉穏뫤࡙攴쑋", {MatchResult(MaybeOfUint(245672), MaybeOfUint(931353), "蜡い驾ℳ"), MatchResult(MaybeOfUint(765603), MaybeOfUint(377004), "鿬횊穧")});
    Test_ToJsonFromJson_Check(66059, "馒扁", "矮冠", {MatchResult(MaybeOfUint(), MaybeOfUint(), "檜⛟왪噧㉊㚨"), MatchResult(MaybeOfUint(760757), MaybeOfUint(470409), "㙵覆ೕ멨靮垆规"), MatchResult(MaybeOfUint(293637), MaybeOfUint(), "⯒ꊑ"), MatchResult(MaybeOfUint(120250), MaybeOfUint(669151), "밥�틭姻韷ሸ")});
    Test_ToJsonFromJson_Check(489062, "㞥ۚ轔렫炙띤䮔", "꼵䁹呦㷽", {MatchResult(MaybeOfUint(64905), MaybeOfUint(434202), "ᙱ֤")});
    Test_ToJsonFromJson_Check(876634, "⢻疳쨟ጦ", "撁銹瞝ۄ", {MatchResult(MaybeOfUint(307430), MaybeOfUint(804780), "᥌⇝䱓䎸帍곔"), MatchResult(MaybeOfUint(995150), MaybeOfUint(), "맆晝劬瘪剈授")});
    Test_ToJsonFromJson_Check(679849, "祶⯔䥮䒸龅鑭", "", {MatchResult(MaybeOfUint(449872), MaybeOfUint(542289), "ᶀ䍾㎦猱銼௒"), MatchResult(MaybeOfUint(311819), MaybeOfUint(958812), "鍼"), MatchResult(MaybeOfUint(925671), MaybeOfUint(846903), "⏎늻텿錈솢"), MatchResult(MaybeOfUint(900364), MaybeOfUint(10972), "ฏ垄")});
    Test_ToJsonFromJson_Check(494262, "皬毸圌蒵⢢⣳燘", "䞚䲈", {MatchResult(MaybeOfUint(558668), MaybeOfUint(355681), "妙薐㨵䓸뷐")});
    Test_ToJsonFromJson_Check(26762, "淮듑箩厈䃐᲎暓煆", "ご䎽붏矓暴颙", {MatchResult(MaybeOfUint(988710), MaybeOfUint(231848), "榚"), MatchResult(MaybeOfUint(192767), MaybeOfUint(916783), "˶鵺ﯶᲑ篥ɿ읒럕࠘"), MatchResult(MaybeOfUint(688702), MaybeOfUint(), "鈝젾늇媎笖")});
    Test_ToJsonFromJson_Check(363103, "籲ݏ쁒", "蛛᠓᥵", {MatchResult(MaybeOfUint(346296), MaybeOfUint(302662), "")});
    Test_ToJsonFromJson_Check(890783, "뎝⺧䛙픮", "温膀璠", {MatchResult(MaybeOfUint(421799), MaybeOfUint(106956), "ⶌ㚍뾮蚕⯉肱箉礠"), MatchResult(MaybeOfUint(737608), MaybeOfUint(503046), ""), MatchResult(MaybeOfUint(717574), MaybeOfUint(), "䃪ಅ䈣ঈࢧ믂⥖"), MatchResult(MaybeOfUint(915433), MaybeOfUint(38087), "㡪ῥ舙鬱訁至")});
    Test_ToJsonFromJson_Check(533601, "ᑯ鶠褒ó퓓驏陽允", "鞺", {MatchResult(MaybeOfUint(), MaybeOfUint(), "♖쥁힒뼘㽗")});
    Test_ToJsonFromJson_Check(496057, "▘녝裂ꦍꜚ䪗⇹瓒䬓", "㩵㈰㽇䙃珍㉡�郺", {MatchResult(MaybeOfUint(523884), MaybeOfUint(908975), "铁뮱ོ再푷娬⸰ઋ")});
    Test_ToJsonFromJson_Check(86975, "�ᑠ蜴쬣ܹ㈸襁盟", "䅣", {MatchResult(MaybeOfUint(155432), MaybeOfUint(921210), ""), MatchResult(MaybeOfUint(6459), MaybeOfUint(536447), ""), MatchResult(MaybeOfUint(298599), MaybeOfUint(89105), "〶力෎")});
    Test_ToJsonFromJson_Check(98021, "尰", "", {MatchResult(MaybeOfUint(394098), MaybeOfUint(), "䗌�䫁ꆑ榻秱�ꁙ"), MatchResult(MaybeOfUint(55990), MaybeOfUint(32769), "痽"), MatchResult(MaybeOfUint(242717), MaybeOfUint(609876), "�ꚴ램ഔ쁴蔝")});
    Test_ToJsonFromJson_Check(692501, "鸊䕲璷瘑ᩰ넑쨧ᆔ耵攰", "ꥯ얩倳", {MatchResult(MaybeOfUint(898206), MaybeOfUint(275134), "ꄡ䦱�롴ퟌ驠")});
    Test_ToJsonFromJson_Check(681251, "Ҥ襤덌ῤ䐧", "꽻뺿쭠贑麏揅שּ㰄", {MatchResult(MaybeOfUint(823493), MaybeOfUint(929475), "嚐ꇵ个豭῝ｕ"), MatchResult(MaybeOfUint(788234), MaybeOfUint(9590), "꺼乧홻"), MatchResult(MaybeOfUint(540486), MaybeOfUint(358284), "줺ᠣᨲ瀔ሑ瘻嶰幃")});
    Test_ToJsonFromJson_Check(32450, "", "⬫꽎铖†㥯吨", {MatchResult(MaybeOfUint(861154), MaybeOfUint(264554), ""), MatchResult(MaybeOfUint(32282), MaybeOfUint(55538), "Ⱕ⤑ﻂ"), MatchResult(MaybeOfUint(419168), MaybeOfUint(728577), "䜷ꄀ罫")});
    Test_ToJsonFromJson_Check(645752, "뾬䰦ⷅ뮹", "", {MatchResult(MaybeOfUint(68906), MaybeOfUint(377640), "䉄嗝嵾ⶻ")});
    Test_ToJsonFromJson_Check(547939, "筺궜쁶", "䩶骵銶⮧", {MatchResult(MaybeOfUint(840861), MaybeOfUint(743799), "")});
    Test_ToJsonFromJson_Check(700426, "Ⅲꂐ硘우梨杯ꤎ", "थに", {MatchResult(MaybeOfUint(358371), MaybeOfUint(267507), "╙鄩覇텃")});
    Test_ToJsonFromJson_Check(642233, "ﺜ쿝虘鄃燵", "汫ㇵ⇖", {MatchResult(MaybeOfUint(699157), MaybeOfUint(587058), "ኣ䍅Ꝙ袘䯞髟螋뱏")});
    Test_ToJsonFromJson_Check(587688, "䘴୵㘱䢨", "퉃瀍ﱬ⠔軙", {MatchResult(MaybeOfUint(), MaybeOfUint(736281), ""), MatchResult(MaybeOfUint(788811), MaybeOfUint(899038), "⦽擱裊쮷")});
    Test_ToJsonFromJson_Check(745258, "㬺ᬥͬ⩉ࠍ㥄", "鮳裴ⲍꨞ﷨뺛穿濶蝆", {MatchResult(MaybeOfUint(397114), MaybeOfUint(901982), ""), MatchResult(MaybeOfUint(7833), MaybeOfUint(749730), "蠰鸀臐"), MatchResult(MaybeOfUint(4522), MaybeOfUint(), "嬔䅒帆櫊䦚鶯짫")});
    Test_ToJsonFromJson_Check(28880, "覞잰聡ﳆ⠧뚇မͿ", "ּㄯ닢砐ᤌ�媓", {MatchResult(MaybeOfUint(618854), MaybeOfUint(853388), "鍀㇕蟃෵㥔̳姇")});
    Test_ToJsonFromJson_Check(905071, "", "⟐䶢", {MatchResult(MaybeOfUint(629363), MaybeOfUint(), "냱뾯抃䱈೵谬㭹馤탢")});
    Test_ToJsonFromJson_Check(48005, "", "", {MatchResult(MaybeOfUint(279746), MaybeOfUint(909769), "")});
    Test_ToJsonFromJson_Check(412185, "", "荤佀ഇ礲", {MatchResult(MaybeOfUint(940520), MaybeOfUint(258583), "퉈䨽턋ᄙ噕"), MatchResult(MaybeOfUint(464106), MaybeOfUint(), ""), MatchResult(MaybeOfUint(658874), MaybeOfUint(462465), "ꓛᦱ軽ꂜ춙K䱯㨯葄")});
    Test_ToJsonFromJson_Check(277254, "瘏", "ฑ舩쿋��㥌쟍퐩", {MatchResult(MaybeOfUint(373576), MaybeOfUint(364418), "䪾癌䠗夋Ἲ櫌垫"), MatchResult(MaybeOfUint(965403), MaybeOfUint(288954), "좓�䲦ឃ"), MatchResult(MaybeOfUint(633479), MaybeOfUint(577773), ""), MatchResult(MaybeOfUint(95115), MaybeOfUint(343513), "䟁穳冥�ꠓ�쀇띧癤")});
    Test_ToJsonFromJson_Check(108083, "推杪䊫纂记", "깭랚ᢘ", {MatchResult(MaybeOfUint(), MaybeOfUint(393864), "赱�暜窋ᖪ࡝ἇ"), MatchResult(MaybeOfUint(767444), MaybeOfUint(789280), "ꔊ줮㿮ᚶ堩ᘟ縏"), MatchResult(MaybeOfUint(952959), MaybeOfUint(44534), "쏁ŵ㣈Ꞑ"), MatchResult(MaybeOfUint(), MaybeOfUint(64367), "목楥ᾥ軫ꕠ")});
  }
  
  bool unitTestResults_MatchResults_ToFromJSONObject = runAsync(Tests_RegisterAll_MatchResults_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_MatchResults_Getters() {
    RegisterUnitTest('UnitTest_MatchResults_Getters', UnitTest_MatchResults_Getters);
  }
  
  bool Test_CheckProps_MatchResults(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    MatchResults@ tmp = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    assert(roundPosition == tmp.roundPosition, 'field roundPosition with value `' + roundPosition + '`');
    assert(matchLiveId == tmp.matchLiveId, 'field matchLiveId with value `' + matchLiveId + '`');
    assert(scoreUnit == tmp.scoreUnit, 'field scoreUnit with value `' + scoreUnit + '`');
    assert(results == tmp.results, 'field results');
    return true;
  }
  
  void UnitTest_MatchResults_Getters() {
    Test_CheckProps_MatchResults(394184, "馩", "躮", {MatchResult(MaybeOfUint(378662), MaybeOfUint(450822), "븺寔옛"), MatchResult(MaybeOfUint(980813), MaybeOfUint(895509), "ᣖ")});
    Test_CheckProps_MatchResults(397204, "暭쑁㚷￣꟪뢖棱꡺鼀", "萦﫦䉕㌄搡즗쿵", {MatchResult(MaybeOfUint(48204), MaybeOfUint(986078), "㞪㷗᤾虝䰒ஷ"), MatchResult(MaybeOfUint(584610), MaybeOfUint(55244), "⨸۫芁≲彲⏈먳�"), MatchResult(MaybeOfUint(292448), MaybeOfUint(54851), "●ꜛ귦翮漽똮覧﶑䙢")});
    Test_CheckProps_MatchResults(149817, "那", "젮훇懓奲쮄⸔옯듡", {MatchResult(MaybeOfUint(224303), MaybeOfUint(575746), "쥝ꋟ툴䜮")});
    Test_CheckProps_MatchResults(429159, "쁍", "햷ሕﯷ", {MatchResult(MaybeOfUint(), MaybeOfUint(302501), "쿽騍큋"), MatchResult(MaybeOfUint(672021), MaybeOfUint(), "儞祹㚏풓鏓윃")});
    Test_CheckProps_MatchResults(984066, "㔭묹", "缲䁏뤥蹪鈤", {MatchResult(MaybeOfUint(381002), MaybeOfUint(81777), "洔槰∁丟두㣦瘃"), MatchResult(MaybeOfUint(703391), MaybeOfUint(703789), "㢲蘆"), MatchResult(MaybeOfUint(791515), MaybeOfUint(741566), "楚㔊夷郥﫛僓揱৊")});
    Test_CheckProps_MatchResults(951829, "䋪㋘늒", "�ꢻ턆뙚", {MatchResult(MaybeOfUint(902587), MaybeOfUint(678280), "ᤲ쯳枦섍鐷"), MatchResult(MaybeOfUint(779184), MaybeOfUint(853065), "�ꒉ㳀䈾뙱䕂륦홰"), MatchResult(MaybeOfUint(785867), MaybeOfUint(785817), "ଚ㩕ၪ"), MatchResult(MaybeOfUint(799138), MaybeOfUint(378630), "菌㶑")});
    Test_CheckProps_MatchResults(469141, "胊의䉶杻�죝ᝫ᥾", "≜蔗塚䌽ୣ筃", {MatchResult(MaybeOfUint(334968), MaybeOfUint(161933), "␞ꎴ"), MatchResult(MaybeOfUint(), MaybeOfUint(835767), "죋穽"), MatchResult(MaybeOfUint(802277), MaybeOfUint(), "ቚ⬋㫟슷崠"), MatchResult(MaybeOfUint(848880), MaybeOfUint(874548), "�额㳦䥍ⅸ⯃")});
    Test_CheckProps_MatchResults(588647, "耓봸鱚뿽룣ӟꓟ砥㜬", "줯党Ὥ䜚", {MatchResult(MaybeOfUint(515133), MaybeOfUint(), "짭"), MatchResult(MaybeOfUint(224795), MaybeOfUint(742625), "К߄뽇㪢㸿ᓮ")});
    Test_CheckProps_MatchResults(773592, "", "蔟Ι龲ꇗ⡔辅⭉", {MatchResult(MaybeOfUint(418900), MaybeOfUint(809718), "퉾돂띨體륯幈᠀㯱"), MatchResult(MaybeOfUint(133172), MaybeOfUint(149066), "횄俁鏟灭ᶳ"), MatchResult(MaybeOfUint(346182), MaybeOfUint(669169), "쑅閜䈀疶뫰줪쌽奚"), MatchResult(MaybeOfUint(78530), MaybeOfUint(581447), "꿫琢췹")});
    Test_CheckProps_MatchResults(285594, "䡎ꋐﰸ⩱刞", "칂쮽񜋑⊳汧載", {MatchResult(MaybeOfUint(706225), MaybeOfUint(883796), "Ҹꃈ䮣ᬬ"), MatchResult(MaybeOfUint(), MaybeOfUint(783971), "覑甃")});
    Test_CheckProps_MatchResults(850147, "扚듍꩐瘁쪟怢瞱", "Ü매剟䝛튟뿎", {MatchResult(MaybeOfUint(), MaybeOfUint(987805), "⑼驏᩽嬨默䚥�糣"), MatchResult(MaybeOfUint(366682), MaybeOfUint(272553), "꣺"), MatchResult(MaybeOfUint(), MaybeOfUint(163833), "齶褱炋�Ժ蕧枪ⳳ흰"), MatchResult(MaybeOfUint(396785), MaybeOfUint(924696), "")});
    Test_CheckProps_MatchResults(434223, "胣颡", "ᥕ剃爆爣膡꛶", {MatchResult(MaybeOfUint(), MaybeOfUint(582898), "㗟豺댜￰귥ጢ䨣뉐㕋"), MatchResult(MaybeOfUint(893367), MaybeOfUint(647698), "뚪䬹칭烈"), MatchResult(MaybeOfUint(313986), MaybeOfUint(684445), "檣袿"), MatchResult(MaybeOfUint(164200), MaybeOfUint(901310), "䞈䚴鵁틖")});
    Test_CheckProps_MatchResults(990522, "ꁄ枙꥞琷", "嵐䓸瀓䳻Ჵ", {MatchResult(MaybeOfUint(650559), MaybeOfUint(668670), "緱뒏鋦ឱ釂䕳ﲢ츸"), MatchResult(MaybeOfUint(534398), MaybeOfUint(952563), "⧿"), MatchResult(MaybeOfUint(666968), MaybeOfUint(), "ﮜ镕㠇篘㹡휁ꅮ"), MatchResult(MaybeOfUint(147555), MaybeOfUint(677985), "鲶헞雟❢�䖗�쁰ꢚﲆ")});
    Test_CheckProps_MatchResults(608736, "㹒稃⤳늽趽ማ鐆ᒓ", "㣇ꨒꋙ켍Ⰼᜤ", {MatchResult(MaybeOfUint(488851), MaybeOfUint(717791), "퐥ঠ἗넾ᅳꙬꇰ⦥"), MatchResult(MaybeOfUint(), MaybeOfUint(551557), "⛥杭貴溪৥롰꬜䮖")});
    Test_CheckProps_MatchResults(349405, "啞婓菨뻟௎餵긽榈", "溊䷡꬈फ़Ը㌲狊⵪诨⥇", {MatchResult(MaybeOfUint(571451), MaybeOfUint(428969), "蠩")});
    Test_CheckProps_MatchResults(559594, "틠䤙礎㋳숙෥즇졧娒", "捣嶟廌⁹掠욿Т᏾쟰", {MatchResult(MaybeOfUint(448692), MaybeOfUint(541083), "�ࠫ⿳훿"), MatchResult(MaybeOfUint(583163), MaybeOfUint(498609), "澎낭荸〈韴"), MatchResult(MaybeOfUint(65331), MaybeOfUint(), "")});
    Test_CheckProps_MatchResults(915086, "慺㗻壺旻슽铟Ꙓ鐻", "䟎他�", {MatchResult(MaybeOfUint(772864), MaybeOfUint(709313), "쟹膗堳뾒뮦놘蘜"), MatchResult(MaybeOfUint(), MaybeOfUint(), "ꂵ")});
    Test_CheckProps_MatchResults(798750, "Ϡᱮዖ�", "᮶๑肬區뫴ᵼ뾆ᛷ", {MatchResult(MaybeOfUint(), MaybeOfUint(), ""), MatchResult(MaybeOfUint(853742), MaybeOfUint(282186), "挂ꁪ쥫�쭑뒱"), MatchResult(MaybeOfUint(842384), MaybeOfUint(905806), "剭ﺏ柙㕤쩢姽ἆ奨啈"), MatchResult(MaybeOfUint(329915), MaybeOfUint(), "⃙㾥괶됼헽")});
    Test_CheckProps_MatchResults(549837, "ᢦ폛⶯弸龭", "ꝶ擆⷗륶땣", {MatchResult(MaybeOfUint(994918), MaybeOfUint(680932), "蓸�舆"), MatchResult(MaybeOfUint(), MaybeOfUint(279781), "౤ᅺ鑪뿗뒔ട墳")});
    Test_CheckProps_MatchResults(542936, "똳䁶䉇ꖸ渡ꒋלּ⚶η㝯", "ﲏ", {});
    Test_CheckProps_MatchResults(68507, "罜", "뮄ᢿ", {MatchResult(MaybeOfUint(77285), MaybeOfUint(676684), "턺ᐅ�绬嗭밅괢ᖁ鬅"), MatchResult(MaybeOfUint(39143), MaybeOfUint(), "؟잫긬ᒦ窸䃿ﲩ�")});
    Test_CheckProps_MatchResults(976532, "傗䘠桌", "쐑벒푈簵㟦兡䏰糗鿾", {MatchResult(MaybeOfUint(74594), MaybeOfUint(429882), "㘅驹劣")});
    Test_CheckProps_MatchResults(478706, "ઌ㳲嘁", "㵲�", {MatchResult(MaybeOfUint(967173), MaybeOfUint(819909), "�亭瓩얩䛯Ⳗ"), MatchResult(MaybeOfUint(332001), MaybeOfUint(97523), "")});
    Test_CheckProps_MatchResults(963810, "筬薥㤌됧ꖮꔂઆ", "靡힥虻鸞儸呔嵭", {MatchResult(MaybeOfUint(961228), MaybeOfUint(623797), "赯"), MatchResult(MaybeOfUint(406325), MaybeOfUint(952190), "䏭哧唨䌲㓂䗻칦⼝")});
    Test_CheckProps_MatchResults(996815, "胪⌊핤촆᠅絵橱꧵", "䈭䋟嵎桅꣒뙤偌", {MatchResult(MaybeOfUint(254338), MaybeOfUint(340029), "蚰覀茣歽፦뿤ᾖ뚬"), MatchResult(MaybeOfUint(979748), MaybeOfUint(598321), "껗々Ꝺ"), MatchResult(MaybeOfUint(880971), MaybeOfUint(459941), "ᴕ"), MatchResult(MaybeOfUint(802021), MaybeOfUint(449912), "棱館迠祠斄ᘫ턒")});
    Test_CheckProps_MatchResults(171027, "㈥텒툨", "棼檹", {MatchResult(MaybeOfUint(657445), MaybeOfUint(236077), "츙촐㲃"), MatchResult(MaybeOfUint(216093), MaybeOfUint(335879), "⫞떵�鷜™"), MatchResult(MaybeOfUint(92965), MaybeOfUint(514523), "鳼歿捺퇵�렡ڣ뢐಼떍"), MatchResult(MaybeOfUint(977444), MaybeOfUint(483718), "")});
    Test_CheckProps_MatchResults(419668, "䥾箉穘ꇠ䫧䟧儷", "묁폹", {MatchResult(MaybeOfUint(90327), MaybeOfUint(407207), ""), MatchResult(MaybeOfUint(547396), MaybeOfUint(882723), "룹螈蘰⩉呢")});
    Test_CheckProps_MatchResults(215478, "Բᱳ磡栧ꝱ⺺Ҩ", "ꥒﮉ", {MatchResult(MaybeOfUint(781192), MaybeOfUint(248619), "裹挬裀ǃ"), MatchResult(MaybeOfUint(443536), MaybeOfUint(215935), "䗗ꕩ髽")});
    Test_CheckProps_MatchResults(12574, "眧畹㘅놔筶ꑢ", "ᒟ൒", {MatchResult(MaybeOfUint(291255), MaybeOfUint(), "꼰괘᪄녪꒻⼧闂Ꭴ詓"), MatchResult(MaybeOfUint(262511), MaybeOfUint(914143), "₎ㄊፂ�꿘腷頀")});
    Test_CheckProps_MatchResults(15680, "菽䡐膅⫳㸷앉", "づ뮔죯뱿锄�ꦸ슇훃�", {MatchResult(MaybeOfUint(241452), MaybeOfUint(371580), "衴猱妞᧫垃배⒔ퟭ焿"), MatchResult(MaybeOfUint(314689), MaybeOfUint(27000), "﵌雫忡閊뺌킮㴗퍶")});
    Test_CheckProps_MatchResults(130942, "獘", "", {MatchResult(MaybeOfUint(876763), MaybeOfUint(627436), "좓툛蚀ᇥဖ"), MatchResult(MaybeOfUint(850515), MaybeOfUint(882101), "わ")});
    Test_CheckProps_MatchResults(308086, "弩蒬쬒閨്쟵㖥", "㹆㦌ꯊૂ혺", {MatchResult(MaybeOfUint(18020), MaybeOfUint(911753), "蔥瘤հ"), MatchResult(MaybeOfUint(), MaybeOfUint(416819), "�獠")});
    Test_CheckProps_MatchResults(492174, "ᘈ缥躒�펀ᯒ㙬ͳ", "虋", {MatchResult(MaybeOfUint(), MaybeOfUint(372286), "힄팁牛붔଴㏧"), MatchResult(MaybeOfUint(407516), MaybeOfUint(405295), "画砎끸쁂刻")});
    Test_CheckProps_MatchResults(702071, "", "㕿�슌욵ｪ餤１렏⢈", {MatchResult(MaybeOfUint(), MaybeOfUint(19295), "蟋嵨㟠㕆蔎椑"), MatchResult(MaybeOfUint(482767), MaybeOfUint(240742), "䡖딇␮弢㒴캹차")});
    Test_CheckProps_MatchResults(615038, "툯࠙㯫榲⒦䂮뾟", "距쥎", {MatchResult(MaybeOfUint(466166), MaybeOfUint(499798), "蔨"), MatchResult(MaybeOfUint(362400), MaybeOfUint(745607), "ṻ暂"), MatchResult(MaybeOfUint(73444), MaybeOfUint(988191), "湥㠇쟰ొ锓仡婧裂"), MatchResult(MaybeOfUint(616920), MaybeOfUint(426363), "쬂麻룯흹댒䌤")});
    Test_CheckProps_MatchResults(954290, "嵉�晴鞔ᥞ⇸", "ꄀ䇿ʇ⽕鯪�", {MatchResult(MaybeOfUint(469386), MaybeOfUint(303487), "弑쥶뙎䈢䞨泿쥄뒅蕾쪊"), MatchResult(MaybeOfUint(), MaybeOfUint(327365), "醈�铙ឡ撨㱫㻃"), MatchResult(MaybeOfUint(724128), MaybeOfUint(802745), "ⱅᾠ唏ࠔ")});
    Test_CheckProps_MatchResults(563010, "鏉쫿뙡쀿蚺輂", "頌⛌", {MatchResult(MaybeOfUint(885502), MaybeOfUint(753522), "㣄쌀㷨䓜诽舁楍"), MatchResult(MaybeOfUint(), MaybeOfUint(), "Ж꾟눗"), MatchResult(MaybeOfUint(148163), MaybeOfUint(224748), "焤☜⭽")});
    Test_CheckProps_MatchResults(892101, "䜲횧碵뻽钰嚚휜", "쨉�똣럴舟滐隌셑�", {MatchResult(MaybeOfUint(551677), MaybeOfUint(316128), "䇑홂᫐퓙쌄"), MatchResult(MaybeOfUint(), MaybeOfUint(780395), "끕蘆㉰춈ꪦﵥ⁥㦠ꣃ")});
    Test_CheckProps_MatchResults(2630, "쩰ᾑ笍ᐠꟊ䱤㖹鐶", "䄀ੱ࢟킱", {MatchResult(MaybeOfUint(722458), MaybeOfUint(), "삋쌶ඨ╋"), MatchResult(MaybeOfUint(865735), MaybeOfUint(792163), "")});
    Test_CheckProps_MatchResults(405090, "", "긆䭆떞硞햅匿", {MatchResult(MaybeOfUint(12789), MaybeOfUint(273664), "벾㄄엲┄杮斱送"), MatchResult(MaybeOfUint(412371), MaybeOfUint(798371), "ꝃ尛ᬜ큀鬏⾍塰祛壏"), MatchResult(MaybeOfUint(931443), MaybeOfUint(942830), "ⓤݜ撌窘룛"), MatchResult(MaybeOfUint(), MaybeOfUint(657144), "拼ᤩㄛ嶂�浼쵑쌂")});
    Test_CheckProps_MatchResults(262377, "�믜耿ᨈ蒁Ʞ㙖㲶", "魐", {MatchResult(MaybeOfUint(433339), MaybeOfUint(465211), "摝侾췮玙ަᗱ⸡"), MatchResult(MaybeOfUint(485225), MaybeOfUint(46547), "ݯ켾粼ò䙄䍩뼚韦"), MatchResult(MaybeOfUint(842090), MaybeOfUint(170100), "탑帆"), MatchResult(MaybeOfUint(262291), MaybeOfUint(356005), "鷵ኺ微ꋓ缪⫋⋔ှ瀞")});
    Test_CheckProps_MatchResults(891045, "ꊟ", "", {MatchResult(MaybeOfUint(748523), MaybeOfUint(552517), "鈚횳襹젡")});
  }
  
  bool unitTestResults_MatchResults_Getters = runAsync(Tests_RegisterAll_MatchResults_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_MatchResults_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_MatchResults', UnitTest_OpEqSimple_MatchResults);
  }
  
  MatchResults@ lastChecked = null;
  
  bool OpEqSimple_Check(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    MatchResults@ o1 = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    MatchResults@ o2 = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_MatchResults() {
    OpEqSimple_Check(393455, "ﷰ눵뭩㵷衟춗䵩", "쭶퍉첯㚥涬", {MatchResult(MaybeOfUint(), MaybeOfUint(214613), "ꖯ꒲풜豈窏ｅ㛵"), MatchResult(MaybeOfUint(295268), MaybeOfUint(665920), "")});
    OpEqSimple_Check(728579, "技呝쵄", "뵉삕⁪", {MatchResult(MaybeOfUint(332990), MaybeOfUint(591080), "璊诛퇟鯚핦壉")});
    OpEqSimple_Check(643073, "쇳濶鵛", "垛峵כֿ鐄ℛݙᚬ", {MatchResult(MaybeOfUint(785460), MaybeOfUint(645917), "Ŧ⃡釄"), MatchResult(MaybeOfUint(75537), MaybeOfUint(833738), "凌띫趻"), MatchResult(MaybeOfUint(222008), MaybeOfUint(), "�豝䌹쁡퐕썷ᯱ")});
    OpEqSimple_Check(32507, "", "后⡆鍙莕", {MatchResult(MaybeOfUint(139088), MaybeOfUint(541699), ""), MatchResult(MaybeOfUint(43208), MaybeOfUint(471876), "␜῰蹎쟳횱宙홧㉜는"), MatchResult(MaybeOfUint(735204), MaybeOfUint(288195), "")});
    OpEqSimple_Check(757154, "ꨕẽ뮱", "ʱᯜ鱦ࠡ", {MatchResult(MaybeOfUint(), MaybeOfUint(959971), "ᜇꩥ")});
    OpEqSimple_Check(834349, "㧣⿾꛴", "⥠渠ᐢ", {MatchResult(MaybeOfUint(876624), MaybeOfUint(82116), "뻹"), MatchResult(MaybeOfUint(885000), MaybeOfUint(909595), "쬟칁껁"), MatchResult(MaybeOfUint(705322), MaybeOfUint(68708), "픽鳐ꈉ")});
    OpEqSimple_Check(629572, "ꮸ", "鏡螫⃠嚅⒝ࣾ惝�嬅糓", {MatchResult(MaybeOfUint(106515), MaybeOfUint(), "奟"), MatchResult(MaybeOfUint(292550), MaybeOfUint(884234), "墳룠డ"), MatchResult(MaybeOfUint(632609), MaybeOfUint(153090), "㑭畼〭⤓ﲁ들≱髀")});
    OpEqSimple_Check(544378, "疡赬", "캈", {MatchResult(MaybeOfUint(681787), MaybeOfUint(), "통�ﭝ豲氹"), MatchResult(MaybeOfUint(786095), MaybeOfUint(997818), "")});
    OpEqSimple_Check(780762, "�둕껅汆", "玹桗喐橀", {MatchResult(MaybeOfUint(680607), MaybeOfUint(535344), "㽘웆覕䃄�ЊЫᯱ"), MatchResult(MaybeOfUint(631334), MaybeOfUint(), "侮ꀵ"), MatchResult(MaybeOfUint(), MaybeOfUint(521754), "ბ")});
    OpEqSimple_Check(884620, "׊�猋┕緰튅", "㝛侢㳹�蛖ꬹ耐", {MatchResult(MaybeOfUint(), MaybeOfUint(557945), "�丮祒"), MatchResult(MaybeOfUint(213686), MaybeOfUint(673623), "ꛬ苵"), MatchResult(MaybeOfUint(985182), MaybeOfUint(304399), "側똶뙈瓪ﲥ疬᳢")});
    OpEqSimple_Check(255643, "", "粄⅝挝㠊", {MatchResult(MaybeOfUint(322382), MaybeOfUint(39828), "砟ᙵ굩ᱟ骲盼ﰢ࿏꘰଒"), MatchResult(MaybeOfUint(131924), MaybeOfUint(783297), "扮깡㸵괬춣")});
    OpEqSimple_Check(303636, "脫㕿덖揙�", "殺荼", {MatchResult(MaybeOfUint(220644), MaybeOfUint(), "룎"), MatchResult(MaybeOfUint(959091), MaybeOfUint(356165), "硬")});
    OpEqSimple_Check(690603, "螥㗓", "ᚭࣳ�﨑ğ", {MatchResult(MaybeOfUint(424914), MaybeOfUint(642478), "薾ꔲ昽꜓ᵃ")});
    OpEqSimple_Check(267052, "", "�냀㛛ꂧ", {MatchResult(MaybeOfUint(489165), MaybeOfUint(943082), "㎭啷⨍揉뭮"), MatchResult(MaybeOfUint(), MaybeOfUint(343909), "텩㚽댯맑힊骝"), MatchResult(MaybeOfUint(691963), MaybeOfUint(296593), "멖�"), MatchResult(MaybeOfUint(753465), MaybeOfUint(284057), "")});
    OpEqSimple_Check(203988, "", "↟ڹ錠쟓쎭뗧䢼", {MatchResult(MaybeOfUint(421894), MaybeOfUint(291997), "啴"), MatchResult(MaybeOfUint(921986), MaybeOfUint(361522), "旌"), MatchResult(MaybeOfUint(132643), MaybeOfUint(6880), "૰"), MatchResult(MaybeOfUint(739364), MaybeOfUint(217154), "ﺙ▧坡ꍎ㴱皀梆")});
    OpEqSimple_Check(410162, "", "㖳驡囈椐༁틋�鯺", {MatchResult(MaybeOfUint(888785), MaybeOfUint(574276), "")});
    OpEqSimple_Check(323966, "稻�ꊈ껿譍扆䡖図", "ﻯ機", {MatchResult(MaybeOfUint(1447), MaybeOfUint(), ""), MatchResult(MaybeOfUint(69302), MaybeOfUint(369335), "濺췲"), MatchResult(MaybeOfUint(958667), MaybeOfUint(79195), "ﰃ҅飛曀푧鯄꟒䠂"), MatchResult(MaybeOfUint(756593), MaybeOfUint(80350), "쭾炞푵묺�좢")});
    OpEqSimple_Check(533390, "䌤譢䳷", "ﵜ⫌Ꞻ⧙㐈", {MatchResult(MaybeOfUint(292877), MaybeOfUint(809472), "씅煍尪"), MatchResult(MaybeOfUint(308035), MaybeOfUint(796197), "膞坫窀훱Ⅺ")});
    OpEqSimple_Check(629633, "⹳ꈰ뗵丷", "", {MatchResult(MaybeOfUint(375620), MaybeOfUint(227662), "䟒⹗㭁"), MatchResult(MaybeOfUint(), MaybeOfUint(265254), "嫲�쓋쾙樂⏭"), MatchResult(MaybeOfUint(926220), MaybeOfUint(878514), "陉"), MatchResult(MaybeOfUint(801560), MaybeOfUint(894415), "弋ꑓ踠䦺褃")});
    OpEqSimple_Check(419277, "", "▴れꘅ澏ⱜ率Ⅳ魨粑", {MatchResult(MaybeOfUint(744065), MaybeOfUint(914453), "—뜔愄츿첣⦝脘곅䂃堮"), MatchResult(MaybeOfUint(86998), MaybeOfUint(107419), "䷫킹륦"), MatchResult(MaybeOfUint(311873), MaybeOfUint(111470), "馺൹貈垸뀰过�"), MatchResult(MaybeOfUint(198145), MaybeOfUint(445761), "녜뎙㾣咂ﱉ皾澐")});
    OpEqSimple_Check(734945, "繶藩륍韚킉迊", "倢슭펵", {MatchResult(MaybeOfUint(95772), MaybeOfUint(479567), "㩧⏕Ҭ辙巴⶯"), MatchResult(MaybeOfUint(239582), MaybeOfUint(151434), "∆ⴝ䨥踯龂Ƞ�뱄⯈"), MatchResult(MaybeOfUint(549628), MaybeOfUint(554187), "翍쵓㩌")});
    OpEqSimple_Check(571410, "㼉媻뉾ᮈⵌ", "玗붐", {MatchResult(MaybeOfUint(), MaybeOfUint(233572), "⏏"), MatchResult(MaybeOfUint(63435), MaybeOfUint(443493), "赖뇁讌弴ᄔ䮕밤ᬣ뾩ᨶ")});
    OpEqSimple_Check(704430, "ྦྷ擊㣙㾯禗뻧쌜⺢뀁", "낤햳釽⛧옩炰၃鉝✜", {MatchResult(MaybeOfUint(454708), MaybeOfUint(975296), "食ꆔ뾘�浹珩"), MatchResult(MaybeOfUint(951957), MaybeOfUint(869994), "岳뗭蜢穽ᓪ"), MatchResult(MaybeOfUint(274962), MaybeOfUint(258463), "瑨ᘂㄺƫ㪙"), MatchResult(MaybeOfUint(929051), MaybeOfUint(109996), "")});
    OpEqSimple_Check(605805, "㌌ࡍ埔캫", "㼗䉕ꐡ딞눼诠ﱐ", {MatchResult(MaybeOfUint(62975), MaybeOfUint(837621), "衔ΰ탡뒤엄闼嵞뿭燨ꍶ"), MatchResult(MaybeOfUint(447277), MaybeOfUint(516914), "퇭ꥑ듴䎇꺥侚綽ケ摓")});
    OpEqSimple_Check(517655, "䱪㪪䀷", "ȃㅞἄ辰思", {MatchResult(MaybeOfUint(164296), MaybeOfUint(311165), "鑽"), MatchResult(MaybeOfUint(102070), MaybeOfUint(56189), "煾❴"), MatchResult(MaybeOfUint(602322), MaybeOfUint(), "౵泐詝潑"), MatchResult(MaybeOfUint(765047), MaybeOfUint(246041), "Ĺ甗쇸蛙惢")});
    OpEqSimple_Check(108210, "麼◹۝塴惑涑홨", "廌ढ़秘", {MatchResult(MaybeOfUint(914953), MaybeOfUint(267078), "鼹冥풭樮쟓銀氢봃"), MatchResult(MaybeOfUint(464965), MaybeOfUint(773269), "룦ύ"), MatchResult(MaybeOfUint(269383), MaybeOfUint(), "䢿眭᫜侯억맖Ⴙ潊"), MatchResult(MaybeOfUint(769047), MaybeOfUint(40693), "Ư⥣䞘")});
    OpEqSimple_Check(187265, "핋嶣䇙", "쾖촱痛窆섀뇗嵢ⵜ", {MatchResult(MaybeOfUint(751776), MaybeOfUint(539629), "闧㼅﬎梡"), MatchResult(MaybeOfUint(67959), MaybeOfUint(847887), "ǌ皁꺼㲇߇⾕嚪랄⬄")});
    OpEqSimple_Check(487367, "演읎떩煤⼉岁岮", "喭﬚﹢멊┰ಂℳ", {MatchResult(MaybeOfUint(531572), MaybeOfUint(92494), "㫋�")});
    OpEqSimple_Check(475261, "續Ꮪ", "ἦ㰞�", {MatchResult(MaybeOfUint(585095), MaybeOfUint(1109), "ℶ换ਾ暵仫힒✩褃�"), MatchResult(MaybeOfUint(987124), MaybeOfUint(), "萩➽縴邾滁﫿ყꉼ嵠﬙")});
    OpEqSimple_Check(120708, "㍙⊘�౟", "欣ﳋ乯", {MatchResult(MaybeOfUint(104954), MaybeOfUint(974123), "ᘟ"), MatchResult(MaybeOfUint(59634), MaybeOfUint(743323), "热⹉㊘၁᫄鍹䨢䵟ۄ")});
    OpEqSimple_Check(995308, "ቒ녈㰚ㇿ떶", "ீ憨", {MatchResult(MaybeOfUint(734911), MaybeOfUint(878200), "�趸Ꙝ拳沈�"), MatchResult(MaybeOfUint(929767), MaybeOfUint(92252), "꜓⵬㊇ᖕ⺸⣥꽈쐦㊓킑")});
    OpEqSimple_Check(708753, "疱↢", "爙⋥Ⓠ�憝蕘", {MatchResult(MaybeOfUint(721229), MaybeOfUint(), "号ㆃ긺簼곽⺲댾麎")});
    OpEqSimple_Check(461071, "핈䌶", "㫷ൈ�ぞᓺ", {MatchResult(MaybeOfUint(), MaybeOfUint(121888), "䔥岿隆鰖蚞")});
    OpEqSimple_Check(406665, "뻏", "䱨换ᵘ蒭ᦇ", {MatchResult(MaybeOfUint(903288), MaybeOfUint(19293), "ꏳ沗"), MatchResult(MaybeOfUint(174588), MaybeOfUint(365089), "ꓛ廉ཝݿ厪ꎢң"), MatchResult(MaybeOfUint(187048), MaybeOfUint(361776), "鲤戙᤿䜦鈷兔呃")});
    OpEqSimple_Check(416888, "鲅", "䝤㰯䕼ꢟ", {MatchResult(MaybeOfUint(189651), MaybeOfUint(2664), ""), MatchResult(MaybeOfUint(481910), MaybeOfUint(), "㘖"), MatchResult(MaybeOfUint(968112), MaybeOfUint(824996), "瑫�긇")});
    OpEqSimple_Check(950231, "", "膥", {MatchResult(MaybeOfUint(7620), MaybeOfUint(726525), "秢"), MatchResult(MaybeOfUint(), MaybeOfUint(453659), "㼳쬺義")});
    OpEqSimple_Check(59050, "ꕮ餗뼂�숣怣楊멕纍", "䋢ฅⴑ鋆㫊훝湕", {MatchResult(MaybeOfUint(569972), MaybeOfUint(260611), "뺏㨫Ꝫ缬컥溂㫸"), MatchResult(MaybeOfUint(887225), MaybeOfUint(400064), "")});
    OpEqSimple_Check(467419, "榉䳇ጃ䴳攃ꃶࠋ嬫", "霍ํ곖玀", {MatchResult(MaybeOfUint(878556), MaybeOfUint(138796), "㫬䠜ヸഫ傻䂓"), MatchResult(MaybeOfUint(), MaybeOfUint(576553), "烖ᩬ䎠"), MatchResult(MaybeOfUint(861555), MaybeOfUint(190623), "鷍뒦羊テ"), MatchResult(MaybeOfUint(488433), MaybeOfUint(597319), "⃟㢋ꮂퟄ")});
    OpEqSimple_Check(163241, "響ض쭂槶ﾽ꒿㣶喒", "솫劊", {MatchResult(MaybeOfUint(730857), MaybeOfUint(262656), "鿸큿"), MatchResult(MaybeOfUint(15990), MaybeOfUint(983930), "ᔲ疡谉"), MatchResult(MaybeOfUint(942010), MaybeOfUint(56177), "␞뎹飾繲")});
    OpEqSimple_Check(981931, "꼐㆒衐⾕쩿ी狲篌髋", "棁༙㭮嗷㠽�୽", {MatchResult(MaybeOfUint(), MaybeOfUint(31576), "腎뱛ﵢ띣莹"), MatchResult(MaybeOfUint(930243), MaybeOfUint(664123), "偛ᖧ⠀㲰ڣڪ⽷먍汃Q"), MatchResult(MaybeOfUint(157093), MaybeOfUint(288208), "푔ﻖ䋘痡뗏�ᓀ"), MatchResult(MaybeOfUint(984216), MaybeOfUint(357258), "崁尉ꊹ娷匇绱㑝")});
    OpEqSimple_Check(506114, "䫌咃ࠄ裞ꥭ峘갤", "⮖铢뢇懅⧈碴熭彰", {MatchResult(MaybeOfUint(681282), MaybeOfUint(273790), "籎뵡㨸膑�䷀"), MatchResult(MaybeOfUint(21798), MaybeOfUint(36685), "⍽䪅Ș焸"), MatchResult(MaybeOfUint(472596), MaybeOfUint(853187), "瑸ꤰזּ窞璫濝詼"), MatchResult(MaybeOfUint(679607), MaybeOfUint(538187), "뗼Ⲉ")});
    OpEqSimple_Check(169558, "Ⲇ璡⩘", "寲疥῰馮얠", {MatchResult(MaybeOfUint(257623), MaybeOfUint(651593), "䴚꒦틆⿄䅓ﷇ"), MatchResult(MaybeOfUint(520926), MaybeOfUint(68162), "☷�"), MatchResult(MaybeOfUint(137895), MaybeOfUint(), "⼁馚㤀"), MatchResult(MaybeOfUint(197788), MaybeOfUint(180939), "뉢")});
  }
  
  bool unitTestResults_MatchResults_OpEq = runAsync(Tests_RegisterAll_MatchResults_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_MatchResults_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_MatchResults', UnitTest_SzThenUnSz_MatchResults);
  }
  
  bool Test_SzThenUnSz_Check(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    MatchResults@ tmp = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    assert(tmp == _MatchResults::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_MatchResults() {
    Test_SzThenUnSz_Check(823221, "�朹鎟ﳙ㻲翾鵜靀㍒", "ﰙ⠁玭텆", {MatchResult(MaybeOfUint(), MaybeOfUint(585467), "躗괱韲瓄ﲼ᭫뇾ﬕ૆"), MatchResult(MaybeOfUint(179363), MaybeOfUint(187232), "堝ᛟ㤔䤍ř챉鋱Ʞ"), MatchResult(MaybeOfUint(964425), MaybeOfUint(150771), "赩"), MatchResult(MaybeOfUint(661263), MaybeOfUint(840437), "錭鿩꤉䵚ࢂ浮翅쿕焫")});
    Test_SzThenUnSz_Check(131261, "榋陏�쵒닟츰ꍆ๩", "徰藧퀕ᶏ䙑ꡕ씠䪉", {MatchResult(MaybeOfUint(694614), MaybeOfUint(), "⏂ꥏ꼼砍띑䗇"), MatchResult(MaybeOfUint(178321), MaybeOfUint(67877), "瞄"), MatchResult(MaybeOfUint(), MaybeOfUint(832887), "㠵ᢐ")});
    Test_SzThenUnSz_Check(542139, "踆⌾ꎳ㏰鉓켯τ㪔", "Ὼ㐚ꂖ摇䞰鄕ꈽ洞⤦", {MatchResult(MaybeOfUint(606676), MaybeOfUint(996777), "̊鳩཮㤷")});
    Test_SzThenUnSz_Check(214679, "ୀ飦閣", "㉮ꇊ疶↧쟣᎕", {MatchResult(MaybeOfUint(28064), MaybeOfUint(), "剼᪲"), MatchResult(MaybeOfUint(977757), MaybeOfUint(700902), "෌ᚸᄺ"), MatchResult(MaybeOfUint(329026), MaybeOfUint(), "ͩ줞䟥")});
    Test_SzThenUnSz_Check(45702, "ⰳ팑ꇬ䋶", "鐮軅㧦胷", {MatchResult(MaybeOfUint(), MaybeOfUint(976559), "簳鋒馑읊쾮"), MatchResult(MaybeOfUint(571633), MaybeOfUint(176289), ""), MatchResult(MaybeOfUint(151896), MaybeOfUint(241793), "愵䗽ﵱꐎ")});
    Test_SzThenUnSz_Check(362888, "", "澸曂Ԧ懁ㅲ砤", {MatchResult(MaybeOfUint(539543), MaybeOfUint(266937), "㐟ꯩ㹎ӑ䞖猏鐪"), MatchResult(MaybeOfUint(54809), MaybeOfUint(647392), "�〿Ꝼ샛ᣱ沲툕ී쨳"), MatchResult(MaybeOfUint(447567), MaybeOfUint(240382), "膕躯"), MatchResult(MaybeOfUint(442238), MaybeOfUint(161330), "⻖㋽빽睍뉥")});
    Test_SzThenUnSz_Check(92, "挤", "鑚ൃ䶀椼ズꡃ᫔躹", {MatchResult(MaybeOfUint(147932), MaybeOfUint(31957), "�⡛︮䡴㉧偉ῇﳓ"), MatchResult(MaybeOfUint(573568), MaybeOfUint(549842), "踴Ṷ"), MatchResult(MaybeOfUint(548818), MaybeOfUint(632361), "া䦾")});
    Test_SzThenUnSz_Check(554352, "逎ஙஇᜳꍪ", "砤늈ꆅむ␢䎭ꊱ㧟", {MatchResult(MaybeOfUint(332985), MaybeOfUint(478495), "䗶"), MatchResult(MaybeOfUint(142829), MaybeOfUint(830203), "꩸㸵"), MatchResult(MaybeOfUint(751060), MaybeOfUint(652149), "⁋컱ⳃ㩄앪衚ध⿺")});
    Test_SzThenUnSz_Check(651952, "疧ꅦ", "", {MatchResult(MaybeOfUint(271358), MaybeOfUint(439881), ""), MatchResult(MaybeOfUint(), MaybeOfUint(), "㶡앧"), MatchResult(MaybeOfUint(379916), MaybeOfUint(317874), "㮝ႝ"), MatchResult(MaybeOfUint(116699), MaybeOfUint(81373), "肯䨏﻿ꓼ构㖨")});
    Test_SzThenUnSz_Check(44984, "嚟挆ꡨ⚝霡", "⧬䥱ᔇ즾�", {MatchResult(MaybeOfUint(), MaybeOfUint(252573), ""), MatchResult(MaybeOfUint(557752), MaybeOfUint(42367), "")});
    Test_SzThenUnSz_Check(449721, "풠氂", "ຶꔽﾜᵏ", {MatchResult(MaybeOfUint(477588), MaybeOfUint(10462), "㖰阮"), MatchResult(MaybeOfUint(896339), MaybeOfUint(703179), "妊嵚뻭"), MatchResult(MaybeOfUint(360995), MaybeOfUint(999224), "")});
    Test_SzThenUnSz_Check(901092, "ᐼ쳴䣹뒞듻", "ꊣǆ녃", {MatchResult(MaybeOfUint(), MaybeOfUint(808646), "㪁▫윁벼寥ﴋᮝ臢")});
    Test_SzThenUnSz_Check(233228, "㌠商ᅾ鲑頸헳ᑭᷡƫ믅", "乹ﻺ鮷囫я戵", {MatchResult(MaybeOfUint(295400), MaybeOfUint(711262), "㟧歒䉛笔ꦚ흯슍뾚ॄ"), MatchResult(MaybeOfUint(433202), MaybeOfUint(), "뼖ቬ뫁귫铸┆ᾋ૵瘞")});
    Test_SzThenUnSz_Check(240441, "紨⤦鄻隳砒긳", "ⶾ仄떏ମ뇌ß儴礋啹ӧ", {MatchResult(MaybeOfUint(485481), MaybeOfUint(680346), "鱫댫䚦럕ț頛臾"), MatchResult(MaybeOfUint(533734), MaybeOfUint(885846), ""), MatchResult(MaybeOfUint(132572), MaybeOfUint(27512), "ы䞀�ᐑꖢ䞶ꡡ훅꼦"), MatchResult(MaybeOfUint(), MaybeOfUint(), "ﷺ⋏晆뗭⴬똣궆")});
    Test_SzThenUnSz_Check(281680, "�욜푭沈ĉ漎㛊�", "霭䞓", {MatchResult(MaybeOfUint(131058), MaybeOfUint(713480), ""), MatchResult(MaybeOfUint(227017), MaybeOfUint(538568), "ᆻ�圜苨ꮸ"), MatchResult(MaybeOfUint(435581), MaybeOfUint(79839), "헣⧾ﾊ驏שּׂ맳站둨"), MatchResult(MaybeOfUint(), MaybeOfUint(114601), "矨ﱳ刎퍒")});
    Test_SzThenUnSz_Check(212628, "瑌", "道Ⓑ", {MatchResult(MaybeOfUint(245216), MaybeOfUint(333008), "愤섉")});
    Test_SzThenUnSz_Check(401634, "省ᨱ흴뒭㺡࣊砅婌", "췭", {MatchResult(MaybeOfUint(727940), MaybeOfUint(409249), "ᙧ"), MatchResult(MaybeOfUint(675410), MaybeOfUint(284174), "췙鏰ᕑ쥋蒕媕矔泔ﷹ"), MatchResult(MaybeOfUint(498260), MaybeOfUint(516414), "䖓")});
    Test_SzThenUnSz_Check(423057, "忨䴈", "◛歴", {MatchResult(MaybeOfUint(597499), MaybeOfUint(), "Ⱄㄺ꛼㻔㴕"), MatchResult(MaybeOfUint(468068), MaybeOfUint(953518), "橄�"), MatchResult(MaybeOfUint(790340), MaybeOfUint(), "ꇑﾷꃦꅕ")});
    Test_SzThenUnSz_Check(618972, "Ⲣ", "魶㭷栳ﮂ窗䊨㎠", {MatchResult(MaybeOfUint(599225), MaybeOfUint(850901), "躴绷"), MatchResult(MaybeOfUint(403152), MaybeOfUint(159641), "䄟"), MatchResult(MaybeOfUint(125776), MaybeOfUint(36375), "ਥ噚濷ެ䡠ࠋ")});
    Test_SzThenUnSz_Check(920400, "㓩濥岤", "Ꜿ�", {MatchResult(MaybeOfUint(853452), MaybeOfUint(), "뼍掰圷뵛蝶ꙵ隓"), MatchResult(MaybeOfUint(37170), MaybeOfUint(), "ㆻಖⳡ忆"), MatchResult(MaybeOfUint(94340), MaybeOfUint(763745), "즍")});
    Test_SzThenUnSz_Check(416051, "켊෦聁�诨", "❕蒚ₖᒁ토ф⮭갭", {MatchResult(MaybeOfUint(249686), MaybeOfUint(514683), "⺃爛")});
    Test_SzThenUnSz_Check(968986, "濖෷൹袴義겋㞔鲱", "臿陋㋫", {MatchResult(MaybeOfUint(814284), MaybeOfUint(), "贉"), MatchResult(MaybeOfUint(629344), MaybeOfUint(608287), "떾뱮὏"), MatchResult(MaybeOfUint(48336), MaybeOfUint(419937), "")});
    Test_SzThenUnSz_Check(331361, "뎻튓뗽j", "?�ﲙ྇﹠⧫펝郀곐", {MatchResult(MaybeOfUint(373405), MaybeOfUint(82856), "襜洞")});
    Test_SzThenUnSz_Check(83850, "ᯒ쵷࡛맵", "魾풶", {MatchResult(MaybeOfUint(), MaybeOfUint(), "칧瓖"), MatchResult(MaybeOfUint(235251), MaybeOfUint(897768), "ഀ옉龞꺌ꭎ")});
    Test_SzThenUnSz_Check(462891, "", "续盲碚", {MatchResult(MaybeOfUint(358763), MaybeOfUint(663005), "⏭슒鷖ꩰ﵄㡰䌪"), MatchResult(MaybeOfUint(432129), MaybeOfUint(284152), "࡞啈냢໚껃꽉೵")});
    Test_SzThenUnSz_Check(940280, "⍴䇸ꍫ", "鴄拯ꮯ㺜홀혍뉻", {MatchResult(MaybeOfUint(), MaybeOfUint(545687), "ꇊ쭎�ℾ"), MatchResult(MaybeOfUint(451599), MaybeOfUint(875242), "ቓ瑪ؠ欸�њֿ㪝峵傊")});
    Test_SzThenUnSz_Check(934201, "닺쿿ꉧʪ", "ă拻⃋＊₅뿴僧狑뻇", {MatchResult(MaybeOfUint(), MaybeOfUint(), "")});
    Test_SzThenUnSz_Check(21513, "䏿븮赡ዿن훻", "凹핲摊ꊣ⑏냏", {MatchResult(MaybeOfUint(), MaybeOfUint(339274), "േ᥹뛼켄雝繗")});
    Test_SzThenUnSz_Check(385683, "쉅亠햇ᖇ⼏歖", "㡆햽㸞", {MatchResult(MaybeOfUint(293878), MaybeOfUint(297433), ""), MatchResult(MaybeOfUint(186903), MaybeOfUint(725397), "ꙕ")});
    Test_SzThenUnSz_Check(496104, "軖➝ㆡℜ", "輐౟휐咒⣅꩹呕", {MatchResult(MaybeOfUint(225516), MaybeOfUint(60001), "骦灭⭔櫳挧盬䣃"), MatchResult(MaybeOfUint(), MaybeOfUint(119882), ""), MatchResult(MaybeOfUint(658587), MaybeOfUint(396000), "쫒뗺磝脮঍ꆡ�鯉"), MatchResult(MaybeOfUint(), MaybeOfUint(731491), "멘┗�莘럜ꪱ㖔⍁")});
    Test_SzThenUnSz_Check(100690, "큙퐵儋䳆䦺謑膢", "᭔뭃⧊萉ꇱ灶�", {MatchResult(MaybeOfUint(665288), MaybeOfUint(), "�娯딉슝")});
    Test_SzThenUnSz_Check(327162, "꓂튛", "", {MatchResult(MaybeOfUint(744276), MaybeOfUint(981829), "ᖕὪＩᬶ")});
    Test_SzThenUnSz_Check(777534, "卤㵠휄Ｋ咱敏", "뿂⬔紘⅛䉠稯ꛬ焄－", {MatchResult(MaybeOfUint(655057), MaybeOfUint(981158), "ꔻ䪣续蹘镃帜뇘"), MatchResult(MaybeOfUint(), MaybeOfUint(758871), "䔋")});
    Test_SzThenUnSz_Check(487812, "ﭒ䜹ᰯồ趌ݸﰙ囦鷎", "ᘎ耼", {MatchResult(MaybeOfUint(772298), MaybeOfUint(916384), "㗫"), MatchResult(MaybeOfUint(698236), MaybeOfUint(251899), "憷")});
    Test_SzThenUnSz_Check(756483, "븝弮�옚䬟", "", {MatchResult(MaybeOfUint(509939), MaybeOfUint(668800), "ꑷ堓儝맒샭넗휐�졣"), MatchResult(MaybeOfUint(916666), MaybeOfUint(156734), "봂"), MatchResult(MaybeOfUint(724134), MaybeOfUint(), "鋋騿牢"), MatchResult(MaybeOfUint(635778), MaybeOfUint(308347), "")});
    Test_SzThenUnSz_Check(292380, "惯廤", "", {MatchResult(MaybeOfUint(779425), MaybeOfUint(215898), "鈂➲ஊ惧吁略䑹뱕")});
    Test_SzThenUnSz_Check(259505, "韄色톽ⱥ졗", "ᡐ蜑ዡ渝봫᧮Ἳ", {MatchResult(MaybeOfUint(), MaybeOfUint(370152), "硱厒建龰ᘃ㵶燞⻱昤虉"), MatchResult(MaybeOfUint(166520), MaybeOfUint(735896), "쓊쵠署ᇨ猝᫺鱴䝧"), MatchResult(MaybeOfUint(809621), MaybeOfUint(51669), "蒃攍�꒭ɞ�斧晛")});
    Test_SzThenUnSz_Check(42480, "體峊瀏࿟颖ꨧ鷂", "ꟛ⧐䷔본촄益뎘", {MatchResult(MaybeOfUint(), MaybeOfUint(227792), ""), MatchResult(MaybeOfUint(), MaybeOfUint(851912), "墋㽀ꨟ逪"), MatchResult(MaybeOfUint(551008), MaybeOfUint(692454), "�溵ⱇ墙ୋ蹽鵔㾡"), MatchResult(MaybeOfUint(559282), MaybeOfUint(873155), "斫�휋ཞ")});
    Test_SzThenUnSz_Check(494551, "", "᥉⬋鎑ꌐ㭯⦱⽂", {MatchResult(MaybeOfUint(321371), MaybeOfUint(754916), "ﵸ亏ʐ鸓쇵")});
    Test_SzThenUnSz_Check(915308, "뒞ݭⷧ", "", {MatchResult(MaybeOfUint(50692), MaybeOfUint(146610), "�迬�"), MatchResult(MaybeOfUint(103881), MaybeOfUint(762638), "糢쨶波ፑ"), MatchResult(MaybeOfUint(425105), MaybeOfUint(3276), "釕"), MatchResult(MaybeOfUint(453229), MaybeOfUint(16977), "锗�〗춙")});
    Test_SzThenUnSz_Check(655210, "쟔楟旒笟둀魟", "", {MatchResult(MaybeOfUint(108619), MaybeOfUint(849105), "⛦뚈組仕"), MatchResult(MaybeOfUint(725125), MaybeOfUint(584620), "�ⴘ芢㏤깠�")});
    Test_SzThenUnSz_Check(699856, "�", "", {MatchResult(MaybeOfUint(619400), MaybeOfUint(213048), "�뜙翕鏅ᩒ딢"), MatchResult(MaybeOfUint(980174), MaybeOfUint(), "酀"), MatchResult(MaybeOfUint(223118), MaybeOfUint(658967), "瘚ꡁ쾕ᣉ"), MatchResult(MaybeOfUint(988462), MaybeOfUint(), "঑ⷷ莣겄㖡⦲؈ⲏ䞹")});
  }
  
  bool unitTestResults_MatchResults_RowSerialization = runAsync(Tests_RegisterAll_MatchResults_RowSerialization);
}
#endif