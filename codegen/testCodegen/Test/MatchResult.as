#if UNIT_TEST
namespace Test_MatchResult {
  /* Test // Mixin: Common Testing */
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
    print('\\$26fUnit Test Start: UnitTest_Common_Nop (42 tests)');
    print('\\$2f6Unit Test Success: UnitTest_Common_Nop (42 tests)');
    return;
  }
  
  bool unitTestResults_MatchResult_CommonTesting = true
    && runAsync(CoroutineFunc(UnitTest_Common_Nop))
    ;
  
  /* Test // Mixin: ToFrom JSON Object */
  bool Test_ToJsonFromJson_Check(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant) {
    MatchResult@ tmp = MatchResult(rank, score, participant);
    assert(tmp == MatchResult(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_MatchResult() {
    print('\\$26fUnit Test Start: UnitTest_ToJsonFromJson_MatchResult (42 tests)');
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(), "ꠂ쮰");
    Test_ToJsonFromJson_Check(MaybeOfUint(712811), MaybeOfUint(126408), "罐");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(191439), "ᱶ");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(883496), "澯�჌江䚏꼸");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(181454), "汯粌鉅");
    Test_ToJsonFromJson_Check(MaybeOfUint(695394), MaybeOfUint(), "䢕颒饣ퟶ䳟框雱");
    Test_ToJsonFromJson_Check(MaybeOfUint(84558), MaybeOfUint(), "ᲊ̇॑䎞ꦻ땬黿救");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(), "㕿ｓ褨");
    Test_ToJsonFromJson_Check(MaybeOfUint(573604), MaybeOfUint(880999), "遐鬱峝뻴");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(414406), "z懇�客㒞");
    Test_ToJsonFromJson_Check(MaybeOfUint(936174), MaybeOfUint(857256), "ࣅ䞚㌴⦱扬껰朣");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(), "旰蓡柿");
    Test_ToJsonFromJson_Check(MaybeOfUint(914935), MaybeOfUint(), "彺য়");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(748773), "炤䩦ᛥ婫囼▏");
    Test_ToJsonFromJson_Check(MaybeOfUint(797698), MaybeOfUint(125510), "");
    Test_ToJsonFromJson_Check(MaybeOfUint(28857), MaybeOfUint(700350), "ᵒ㪗羘렷뵫");
    Test_ToJsonFromJson_Check(MaybeOfUint(107276), MaybeOfUint(158796), "鞙栥唃徭ྈ佛ͽ");
    Test_ToJsonFromJson_Check(MaybeOfUint(947632), MaybeOfUint(), "鹌ﲒ咧놪☼앇");
    Test_ToJsonFromJson_Check(MaybeOfUint(918181), MaybeOfUint(493396), "");
    Test_ToJsonFromJson_Check(MaybeOfUint(115425), MaybeOfUint(307977), "銗䔜῏");
    Test_ToJsonFromJson_Check(MaybeOfUint(694964), MaybeOfUint(275663), "");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(203400), "褢鶳ᄶ窐踎윉懜");
    Test_ToJsonFromJson_Check(MaybeOfUint(38750), MaybeOfUint(419346), "㳇୭");
    Test_ToJsonFromJson_Check(MaybeOfUint(45802), MaybeOfUint(304545), "�ꧾ큽ⷾ뮁d更");
    Test_ToJsonFromJson_Check(MaybeOfUint(547273), MaybeOfUint(757477), "ᣙ욗");
    Test_ToJsonFromJson_Check(MaybeOfUint(108410), MaybeOfUint(61424), "");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(123025), "");
    Test_ToJsonFromJson_Check(MaybeOfUint(6572), MaybeOfUint(609511), "⼸៯ꭍڑ쀈ⵗ㏬蠑");
    Test_ToJsonFromJson_Check(MaybeOfUint(305575), MaybeOfUint(48539), "䴾퍂蘇賻ᜳ벛");
    Test_ToJsonFromJson_Check(MaybeOfUint(468916), MaybeOfUint(959377), "ꒋ符䭭澀");
    Test_ToJsonFromJson_Check(MaybeOfUint(40651), MaybeOfUint(), "䡼淣럸튦蘥");
    Test_ToJsonFromJson_Check(MaybeOfUint(658855), MaybeOfUint(936231), "ᨘ퉁濑੉Ⱬꖗ႘");
    Test_ToJsonFromJson_Check(MaybeOfUint(821576), MaybeOfUint(554346), "엽뷗뢑");
    Test_ToJsonFromJson_Check(MaybeOfUint(47391), MaybeOfUint(227340), "");
    Test_ToJsonFromJson_Check(MaybeOfUint(160751), MaybeOfUint(881761), "㢝蔹");
    Test_ToJsonFromJson_Check(MaybeOfUint(560953), MaybeOfUint(781291), "≁隵ꄻ�ঽ㎒�郁❨鲶");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(23152), "再섚ᘭ☖");
    Test_ToJsonFromJson_Check(MaybeOfUint(236918), MaybeOfUint(74150), "ᬁ籕ￌ龎쬩ꨝ");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(235631), "豣閑㏲ᔲ逥좣㉒");
    Test_ToJsonFromJson_Check(MaybeOfUint(212735), MaybeOfUint(811960), "꺒Ｅ澮");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(610207), "⧼馣谱蘄딙授");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(), "");
    print('\\$2f6Unit Test Success: UnitTest_ToJsonFromJson_MatchResult (42 tests)');
    return;
  }
  
  bool unitTestResults_MatchResult_ToFromJSONObject = true
    && runAsync(CoroutineFunc(UnitTest_ToJsonFromJson_MatchResult))
    ;
  
  /* Test // Mixin: Getters */
  bool Test_CheckProps_MatchResult(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant) {
    MatchResult@ tmp = MatchResult(rank, score, participant);
    assert(rank == tmp.rank, 'field rank');
    assert(score == tmp.score, 'field score');
    assert(participant == tmp.participant, 'field participant with value `' + participant + '`');
    return true;
  }
  
  void UnitTest_MatchResult_Getters() {
    print('\\$26fUnit Test Start: UnitTest_MatchResult_Getters (42 tests)');
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(), "㎜৏렊빬�￿躮䮠馩�");
    Test_CheckProps_MatchResult(MaybeOfUint(780361), MaybeOfUint(378662), "╝㸌鐁");
    Test_CheckProps_MatchResult(MaybeOfUint(397204), MaybeOfUint(230597), "旱疍");
    Test_CheckProps_MatchResult(MaybeOfUint(868175), MaybeOfUint(402441), "㘇힞");
    Test_CheckProps_MatchResult(MaybeOfUint(87722), MaybeOfUint(490383), "覧﶑䙢꺰ꦞᩘ鳔");
    Test_CheckProps_MatchResult(MaybeOfUint(990278), MaybeOfUint(694306), "㬪●");
    Test_CheckProps_MatchResult(MaybeOfUint(260232), MaybeOfUint(12605), "윰蘆콬⨸۫芁≲彲⏈먳");
    Test_CheckProps_MatchResult(MaybeOfUint(763812), MaybeOfUint(149817), "那");
    Test_CheckProps_MatchResult(MaybeOfUint(409053), MaybeOfUint(425498), "");
    Test_CheckProps_MatchResult(MaybeOfUint(813369), MaybeOfUint(224303), "徲㼏嘿");
    Test_CheckProps_MatchResult(MaybeOfUint(55266), MaybeOfUint(719653), "�拣䵱䌏");
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(433840), "ᇡ");
    Test_CheckProps_MatchResult(MaybeOfUint(672021), MaybeOfUint(), "儞祹㚏풓鏓윃");
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(302501), "쿽騍큋");
    Test_CheckProps_MatchResult(MaybeOfUint(614011), MaybeOfUint(544625), "鈤ꦀ");
    Test_CheckProps_MatchResult(MaybeOfUint(271115), MaybeOfUint(791515), "ꦽ㎀꿈�");
    Test_CheckProps_MatchResult(MaybeOfUint(380281), MaybeOfUint(680656), "皌撏랭즫ᇁ﹀");
    Test_CheckProps_MatchResult(MaybeOfUint(789243), MaybeOfUint(381002), "珐瀮㍿웦쭜䢝䃙");
    Test_CheckProps_MatchResult(MaybeOfUint(951829), MaybeOfUint(), "弊䮷⃷쨗蝢ᳳ");
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(816997), "㩾껫墰菌㶑ꔘₜ齬");
    Test_CheckProps_MatchResult(MaybeOfUint(631796), MaybeOfUint(153273), "륦홰떌䱇盰");
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(428390), "滇�ꒉ");
    Test_CheckProps_MatchResult(MaybeOfUint(296569), MaybeOfUint(773342), "枦");
    Test_CheckProps_MatchResult(MaybeOfUint(251911), MaybeOfUint(215862), "ୣ筃痒胊의䉶杻�죝");
    Test_CheckProps_MatchResult(MaybeOfUint(591760), MaybeOfUint(395859), "秉ⵑ᠟Ꮍ⁭豹理癙⤊");
    Test_CheckProps_MatchResult(MaybeOfUint(927020), MaybeOfUint(116042), "㆒刱❕騐헵�䉨⏋릈䨕");
    Test_CheckProps_MatchResult(MaybeOfUint(906029), MaybeOfUint(978653), "벷쨭욢璞");
    Test_CheckProps_MatchResult(MaybeOfUint(588647), MaybeOfUint(406688), "퍑ꗸ鶧ㆌ痒㇌⋛䨗");
    Test_CheckProps_MatchResult(MaybeOfUint(807284), MaybeOfUint(35581), "ᓮₙ묇森ⶍභ");
    Test_CheckProps_MatchResult(MaybeOfUint(363094), MaybeOfUint(850420), "㦟茍沕К߄");
    Test_CheckProps_MatchResult(MaybeOfUint(294837), MaybeOfUint(920471), "崤颦蚕蔟Ι龲ꇗ⡔");
    Test_CheckProps_MatchResult(MaybeOfUint(581447), MaybeOfUint(124133), "院崢ꊵ쐭ғ㒴퟽ᗦ");
    Test_CheckProps_MatchResult(MaybeOfUint(876047), MaybeOfUint(153623), "䃹눭쯺");
    Test_CheckProps_MatchResult(MaybeOfUint(917537), MaybeOfUint(633088), "耢鬗⁴炆ᔻ");
    Test_CheckProps_MatchResult(MaybeOfUint(823384), MaybeOfUint(903157), "༏큝㫓");
    Test_CheckProps_MatchResult(MaybeOfUint(23260), MaybeOfUint(772472), "工");
    Test_CheckProps_MatchResult(MaybeOfUint(285594), MaybeOfUint(431245), "ಟ");
    Test_CheckProps_MatchResult(MaybeOfUint(27157), MaybeOfUint(878595), "็۟弜쌘㙛핺﫽㑪");
    Test_CheckProps_MatchResult(MaybeOfUint(229639), MaybeOfUint(913764), "Ҹꃈ䮣ᬬ컵嶐");
    Test_CheckProps_MatchResult(MaybeOfUint(520163), MaybeOfUint(850147), "扚듍꩐瘁쪟怢瞱");
    Test_CheckProps_MatchResult(MaybeOfUint(61779), MaybeOfUint(), "");
    Test_CheckProps_MatchResult(MaybeOfUint(302773), MaybeOfUint(623932), "ȟ薲ꭉ");
    print('\\$2f6Unit Test Success: UnitTest_MatchResult_Getters (42 tests)');
    return;
  }
  
  bool unitTestResults_MatchResult_Getters = true
    && runAsync(CoroutineFunc(UnitTest_MatchResult_Getters))
    ;
  
  /* Test // Mixin: Op Eq */
  MatchResult@ lastChecked = null;
  
  bool OpEqSimple_Check(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant) {
    MatchResult@ o1 = MatchResult(rank, score, participant);
    MatchResult@ o2 = MatchResult(rank, score, participant);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_MatchResult() {
    print('\\$26fUnit Test Start: UnitTest_OpEqSimple_MatchResult (42 tests)');
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(393455), "ﷰ눵뭩㵷衟춗䵩");
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(217809), "蝔ᔁ䀓⃩쭶퍉첯");
    OpEqSimple_Check(MaybeOfUint(665920), MaybeOfUint(535487), "਀ꩣ釪�麑遬徨탏");
    OpEqSimple_Check(MaybeOfUint(618336), MaybeOfUint(693970), "㵣䎵甄壝玃勑");
    OpEqSimple_Check(MaybeOfUint(332990), MaybeOfUint(591080), "璊诛퇟鯚핦壉");
    OpEqSimple_Check(MaybeOfUint(776509), MaybeOfUint(645285), "כֿ鐄ℛݙᚬ");
    OpEqSimple_Check(MaybeOfUint(260320), MaybeOfUint(222008), "");
    OpEqSimple_Check(MaybeOfUint(631652), MaybeOfUint(480461), "윲冥㶶밑幖許");
    OpEqSimple_Check(MaybeOfUint(833738), MaybeOfUint(), "ʊ冿�Ⓢꖠ⋳䝅攨鑽烆");
    OpEqSimple_Check(MaybeOfUint(32507), MaybeOfUint(310378), "뭀ꃲ썵㞫");
    OpEqSimple_Check(MaybeOfUint(358019), MaybeOfUint(288195), "");
    OpEqSimple_Check(MaybeOfUint(43208), MaybeOfUint(471876), "␜῰蹎쟳횱宙홧㉜는");
    OpEqSimple_Check(MaybeOfUint(139088), MaybeOfUint(541699), "");
    OpEqSimple_Check(MaybeOfUint(554651), MaybeOfUint(179642), "뮱");
    OpEqSimple_Check(MaybeOfUint(716312), MaybeOfUint(606939), "ʱᯜ鱦ࠡ");
    OpEqSimple_Check(MaybeOfUint(821821), MaybeOfUint(), "燵㪆汀");
    OpEqSimple_Check(MaybeOfUint(834349), MaybeOfUint(208909), "䀐硩钗쏥䁏");
    OpEqSimple_Check(MaybeOfUint(705322), MaybeOfUint(68708), "픽鳐ꈉ");
    OpEqSimple_Check(MaybeOfUint(885000), MaybeOfUint(909595), "쬟칁껁");
    OpEqSimple_Check(MaybeOfUint(876624), MaybeOfUint(82116), "뻹");
    OpEqSimple_Check(MaybeOfUint(375289), MaybeOfUint(), "糓岁ꮸ㏧㽤᪮壐");
    OpEqSimple_Check(MaybeOfUint(785418), MaybeOfUint(766369), "⃠嚅");
    OpEqSimple_Check(MaybeOfUint(106739), MaybeOfUint(689395), "櫇");
    OpEqSimple_Check(MaybeOfUint(153090), MaybeOfUint(897339), "ឰ墐こꅯ");
    OpEqSimple_Check(MaybeOfUint(539265), MaybeOfUint(12795), "㤬꾷ټ໿ꍱ꟤��");
    OpEqSimple_Check(MaybeOfUint(544378), MaybeOfUint(263), "館胄ા");
    OpEqSimple_Check(MaybeOfUint(786095), MaybeOfUint(997818), "");
    OpEqSimple_Check(MaybeOfUint(681787), MaybeOfUint(), "통�ﭝ豲氹");
    OpEqSimple_Check(MaybeOfUint(610221), MaybeOfUint(853751), "뛰");
    OpEqSimple_Check(MaybeOfUint(777120), MaybeOfUint(814326), "⩮�ώ꒏퓂䉰ꋗ嗳ರ");
    OpEqSimple_Check(MaybeOfUint(925392), MaybeOfUint(747775), "");
    OpEqSimple_Check(MaybeOfUint(819938), MaybeOfUint(758489), "ⱬ褑");
    OpEqSimple_Check(MaybeOfUint(177035), MaybeOfUint(909926), "⧙곢歒");
    OpEqSimple_Check(MaybeOfUint(854291), MaybeOfUint(432666), "ꃢ｡뫇묯");
    OpEqSimple_Check(MaybeOfUint(243032), MaybeOfUint(636291), "墨큽咪઼側똶뙈");
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(601038), "䥓佴ꛬ苵䎥�쭲鄻");
    OpEqSimple_Check(MaybeOfUint(929569), MaybeOfUint(759681), "粄⅝挝㠊");
    OpEqSimple_Check(MaybeOfUint(697224), MaybeOfUint(131924), "䳶넊");
    OpEqSimple_Check(MaybeOfUint(183287), MaybeOfUint(475985), "뱜悶ꂋ鰲");
    OpEqSimple_Check(MaybeOfUint(39828), MaybeOfUint(667191), "篱鬻피䌱踀뤅");
    OpEqSimple_Check(MaybeOfUint(300093), MaybeOfUint(992454), "ⓟ娣ዯ﷤賚�");
    OpEqSimple_Check(MaybeOfUint(627673), MaybeOfUint(356165), "硬");
    print('\\$2f6Unit Test Success: UnitTest_OpEqSimple_MatchResult (42 tests)');
    return;
  }
  
  bool unitTestResults_MatchResult_OpEq = true
    && runAsync(CoroutineFunc(UnitTest_OpEqSimple_MatchResult))
    ;
  
  /* Test // Mixin: Row Serialization */
  bool Test_SzThenUnSz_Check(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant) {
    MatchResult@ tmp = MatchResult(rank, score, participant);
    assert(tmp == MatchResult::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_MatchResult() {
    print('\\$26fUnit Test Start: UnitTest_SzThenUnSz_MatchResult (42 tests)');
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(), "ﳙ㻲翾鵜靀㍒㋪");
    Test_SzThenUnSz_Check(MaybeOfUint(730596), MaybeOfUint(530766), "编");
    Test_SzThenUnSz_Check(MaybeOfUint(47355), MaybeOfUint(325863), "藴킅Ề쯣欚엻렒哾๺⾖");
    Test_SzThenUnSz_Check(MaybeOfUint(43228), MaybeOfUint(300954), "");
    Test_SzThenUnSz_Check(MaybeOfUint(822238), MaybeOfUint(), "");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(605220), "섌");
    Test_SzThenUnSz_Check(MaybeOfUint(208676), MaybeOfUint(144555), "幻汛瀹ፎﬡ賄");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(), "䮞丵");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(263354), "푲෗蔃䓥㻥");
    Test_SzThenUnSz_Check(MaybeOfUint(131261), MaybeOfUint(7008), "");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(322150), "潔箯㉽");
    Test_SzThenUnSz_Check(MaybeOfUint(418698), MaybeOfUint(334487), "㯠쬙ꅇ");
    Test_SzThenUnSz_Check(MaybeOfUint(852959), MaybeOfUint(629002), "㠵ᢐၛⶍ쎦");
    Test_SzThenUnSz_Check(MaybeOfUint(178321), MaybeOfUint(67877), "瞄");
    Test_SzThenUnSz_Check(MaybeOfUint(694614), MaybeOfUint(), "⏂ꥏ꼼砍띑䗇");
    Test_SzThenUnSz_Check(MaybeOfUint(833324), MaybeOfUint(552233), "㏰鉓켯");
    Test_SzThenUnSz_Check(MaybeOfUint(479132), MaybeOfUint(973529), "㐚ꂖ摇䞰鄕");
    Test_SzThenUnSz_Check(MaybeOfUint(294888), MaybeOfUint(606676), "᳔䬳⑇勿掝");
    Test_SzThenUnSz_Check(MaybeOfUint(577083), MaybeOfUint(101415), "퍻䳥最徐㭾멭Პ");
    Test_SzThenUnSz_Check(MaybeOfUint(687772), MaybeOfUint(), "奞ͩ줞䟥ፕ⎃");
    Test_SzThenUnSz_Check(MaybeOfUint(977757), MaybeOfUint(700902), "෌ᚸᄺ");
    Test_SzThenUnSz_Check(MaybeOfUint(28064), MaybeOfUint(), "剼᪲");
    Test_SzThenUnSz_Check(MaybeOfUint(49662), MaybeOfUint(485401), "");
    Test_SzThenUnSz_Check(MaybeOfUint(312200), MaybeOfUint(314974), "䩓�魓쬣");
    Test_SzThenUnSz_Check(MaybeOfUint(598275), MaybeOfUint(571633), "ు盡ₜ阵璫⃔煡");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(979997), "뙸줒女ѽ泡誄狋撧곟");
    Test_SzThenUnSz_Check(MaybeOfUint(357453), MaybeOfUint(356559), "㋽빽睍뉥៦佌Țꡮ");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(344084), "殤膕躯蓬");
    Test_SzThenUnSz_Check(MaybeOfUint(54809), MaybeOfUint(647392), "�〿Ꝼ샛ᣱ沲툕ී쨳");
    Test_SzThenUnSz_Check(MaybeOfUint(539543), MaybeOfUint(266937), "㐟ꯩ㹎ӑ䞖猏鐪");
    Test_SzThenUnSz_Check(MaybeOfUint(223813), MaybeOfUint(558576), "ꡃ");
    Test_SzThenUnSz_Check(MaybeOfUint(876146), MaybeOfUint(12322), "뭎挘殤掙얷ᐮጧ뎆⸕숈");
    Test_SzThenUnSz_Check(MaybeOfUint(501045), MaybeOfUint(), "");
    Test_SzThenUnSz_Check(MaybeOfUint(31957), MaybeOfUint(300346), "ﲀ⧝�䄳凜嬚");
    Test_SzThenUnSz_Check(MaybeOfUint(554352), MaybeOfUint(759025), "Ꮪ猾ؙ太");
    Test_SzThenUnSz_Check(MaybeOfUint(724579), MaybeOfUint(), "傩Ἂ嚓");
    Test_SzThenUnSz_Check(MaybeOfUint(718544), MaybeOfUint(283451), "ꊌ멉녍ഩ");
    Test_SzThenUnSz_Check(MaybeOfUint(162893), MaybeOfUint(652149), "⁋컱ⳃ㩄앪衚ध⿺");
    Test_SzThenUnSz_Check(MaybeOfUint(142829), MaybeOfUint(830203), "꩸㸵");
    Test_SzThenUnSz_Check(MaybeOfUint(332985), MaybeOfUint(478495), "䗶");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(806313), "濜ḟ₺洉疧");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(), "㌲㯊䂁∐⒳伷鳯");
    print('\\$2f6Unit Test Success: UnitTest_SzThenUnSz_MatchResult (42 tests)');
    return;
  }
  
  bool unitTestResults_MatchResult_RowSerialization = true
    && runAsync(CoroutineFunc(UnitTest_SzThenUnSz_MatchResult))
    ;
}
#endif