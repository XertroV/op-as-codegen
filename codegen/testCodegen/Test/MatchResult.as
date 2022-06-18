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