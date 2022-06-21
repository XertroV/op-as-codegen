#if UNIT_TEST
namespace Test_CompRoundMatch {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_CompRoundMatch_CommonTesting() {
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
  
  bool unitTestResults_CompRoundMatch_CommonTesting = runAsync(Tests_RegisterAll_CompRoundMatch_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_CompRoundMatch_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_CompRoundMatch', UnitTest_ToJsonFromJson_CompRoundMatch);
  }
  
  bool Test_ToJsonFromJson_Check(uint id, uint position, bool isCompleted, const string &in name, const string &in clubMatchLiveId) {
    CompRoundMatch@ tmp = CompRoundMatch(id, position, isCompleted, name, clubMatchLiveId);
    assert(tmp == CompRoundMatch(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_CompRoundMatch() {
    Test_ToJsonFromJson_Check(129450, 573551, false, "ﭤℊ䮇귂⎶越⫺녺ࡏ쌳", "�勩ִ嬂㹦");
    Test_ToJsonFromJson_Check(584806, 263483, true, "澯�჌", "�");
    Test_ToJsonFromJson_Check(620474, 767667, true, "딘ꃺꆈჸ땶烈軻ᖧ⭾", "톶뜣힐");
    Test_ToJsonFromJson_Check(481904, 681748, true, "̇॑䎞", "堉⍴");
    Test_ToJsonFromJson_Check(606311, 853398, false, "ᮃ놜冺햵ᤫ簔�", "");
    Test_ToJsonFromJson_Check(232649, 316905, true, "客㒞᫯", "澵z懇");
    Test_ToJsonFromJson_Check(553541, 857256, true, "ꋣ䡓兡↉", "⹬响憴");
    Test_ToJsonFromJson_Check(914935, 314391, true, "봌彺", "▏᯿");
    Test_ToJsonFromJson_Check(8357, 740990, false, "", "剬鯫");
    Test_ToJsonFromJson_Check(789486, 77932, false, "㪗羘렷", "徭ྈ佛ͽ텫ᤊ�常祈");
    Test_ToJsonFromJson_Check(689542, 293608, true, "", "똞");
    Test_ToJsonFromJson_Check(932520, 11124, true, "罆鹌", "엣ᩁ㟅ഽ");
    Test_ToJsonFromJson_Check(19141, 147800, false, "뤗慵뽳掗ￊ", "");
    Test_ToJsonFromJson_Check(789918, 70765, true, "신", "褢鶳ᄶ窐踎윉懜");
    Test_ToJsonFromJson_Check(38087, 419346, true, "뎧檺憃", "`");
    Test_ToJsonFromJson_Check(886253, 593682, false, "큽ⷾ뮁", "鍡轔援�ꧾ");
    Test_ToJsonFromJson_Check(757477, 61319, false, "转ᢶ퇈侘룒फᝌᣇ꒨㟋", "ၰ㡽걅៵㓉");
    Test_ToJsonFromJson_Check(916111, 436498, false, "ڑ쀈ⵗ", "벛ﳾ啃둸瀀⼸៯");
    Test_ToJsonFromJson_Check(698297, 625858, false, "뫉茻뚑簈", "�೻壎ⴍ�萋笩");
    Test_ToJsonFromJson_Check(714151, 936398, true, "淣", "ᖦﭭ见禁");
    Test_ToJsonFromJson_Check(758410, 670355, true, "�", "招곢贕没�ᴝ삱鄎");
    Test_ToJsonFromJson_Check(348997, 47391, false, "┛輄", "쐤얪㵁㢝蔹ｽ≨⢮舊");
    Test_ToJsonFromJson_Check(235494, 8576, false, "笜ꢩ쭋胋젮", "퐞也툃");
    Test_ToJsonFromJson_Check(236918, 112159, true, "ᬁ籕ￌ龎쬩ꨝ", "豣閑㏲ᔲ逥좣㉒㇜ꗸ");
    Test_ToJsonFromJson_Check(811960, 415355, true, "睈", "홣�讼Ѯꤘ꭭");
    Test_ToJsonFromJson_Check(604406, 645830, true, "갯䘞", "䴨");
    Test_ToJsonFromJson_Check(440156, 532804, false, "", "䔻镩෾萫郅栗�᭩앋");
    Test_ToJsonFromJson_Check(402836, 758944, true, "ꢶ嗲聅䄳ㆳ尉", "瑏求뺝숯䐪䈞䞞䜋歹☰");
    Test_ToJsonFromJson_Check(508457, 876283, false, "罧㣜樐㽼㿝啻苅㍧", "嗟徤澌כֿ昢");
    Test_ToJsonFromJson_Check(775867, 242290, false, "穏뫤࡙攴쑋㵗髍澇㤘", "뾋뿰秮");
    Test_ToJsonFromJson_Check(765603, 958172, true, "い驾ℳ땓꟭뗏聲鿬", "扁⫦㿕롔");
    Test_ToJsonFromJson_Check(853246, 408753, true, "", "");
    Test_ToJsonFromJson_Check(850587, 863576, true, "ꙍṧᬔ꼅", "믙㬢娵ⵌ⫿鰰⇹");
    Test_ToJsonFromJson_Check(611399, 241932, true, "靮垆规☉᡽햅𤋮柅", "噧㉊㚨줫⧑㙵覆ೕ");
    Test_ToJsonFromJson_Check(195672, 489062, false, "䭅Ⅸ", "");
    Test_ToJsonFromJson_Check(974359, 382427, true, "疁꼵䁹", "答㺳萵ꊕᑑ球⍗ꦘ");
    Test_ToJsonFromJson_Check(506204, 233926, false, "뼣撁銹", "7䳟盒繕﷑㯌ﯵ");
    Test_ToJsonFromJson_Check(582294, 182356, false, "䱓䎸帍곔遲祆䊼Ꙕ", "釄⅟᥌");
    Test_ToJsonFromJson_Check(679849, 608847, false, "潛픔綽傍ᙏ젙濍γ曘", "�");
    Test_ToJsonFromJson_Check(10972, 887527, true, "⍣�浥ԈǶ봒❖耾", "ማ鰜㞡吂檞ꨁ");
    Test_ToJsonFromJson_Check(450978, 449872, true, "ﴪỗᯁ", "值ᶀ䍾㎦猱銼");
    Test_ToJsonFromJson_Check(11650, 345755, true, "㪏", "");
  }
  
  bool unitTestResults_CompRoundMatch_ToFromJSONObject = runAsync(Tests_RegisterAll_CompRoundMatch_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_CompRoundMatch_Getters() {
    RegisterUnitTest('UnitTest_CompRoundMatch_Getters', UnitTest_CompRoundMatch_Getters);
  }
  
  bool Test_CheckProps_CompRoundMatch(uint id, uint position, bool isCompleted, const string &in name, const string &in clubMatchLiveId) {
    CompRoundMatch@ tmp = CompRoundMatch(id, position, isCompleted, name, clubMatchLiveId);
    assert(id == tmp.id, 'field id with value `' + id + '`');
    assert(position == tmp.position, 'field position with value `' + position + '`');
    assert(isCompleted == tmp.isCompleted, 'field isCompleted with value `' + isCompleted + '`');
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(clubMatchLiveId == tmp.clubMatchLiveId, 'field clubMatchLiveId with value `' + clubMatchLiveId + '`');
    return true;
  }
  
  void UnitTest_CompRoundMatch_Getters() {
    Test_CheckProps_CompRoundMatch(394184, 158696, true, "ӆ쟭⦀椖", "湩ᣖ迦");
    Test_CheckProps_CompRoundMatch(450822, 852539, true, "韋�", "�싺콠旱疍鰉橿");
    Test_CheckProps_CompRoundMatch(464786, 672947, true, "礃ឝਛ轱蚴", "䊣�갏䭯岊⒆肭꘤쥹变");
    Test_CheckProps_CompRoundMatch(584610, 260232, true, "⨸۫芁≲彲⏈먳�", "�拺윰蘆");
    Test_CheckProps_CompRoundMatch(321608, 715346, false, "䧩㓅磃ଧⴐ﯐", "ꠊ軈吪㧕");
    Test_CheckProps_CompRoundMatch(409053, 177289, true, "젮훇懓奲", "ᓭ褾㵹徲㼏嘿ꑙ尚豈");
    Test_CheckProps_CompRoundMatch(719653, 49582, true, "⊫햷ሕﯷ⸱", "㶈�㻡뼇ṽ杢⅄");
    Test_CheckProps_CompRoundMatch(672021, 217370, true, "鏓", "㈣揘䢊儞祹㚏");
    Test_CheckProps_CompRoundMatch(290417, 254860, false, "姈⑻", "뇎≌膅๴޷Მᑨ쾳ﺷ");
    Test_CheckProps_CompRoundMatch(741566, 263950, true, "﹀賊惍됞ᨴ㪂ꦽ", "ƴ皌撏랭즫");
    Test_CheckProps_CompRoundMatch(696757, 381002, false, "∁丟두㣦瘃빻", "뗧돥轈ꭾﯗ歡洔");
    Test_CheckProps_CompRoundMatch(32083, 397387, true, "ₜ齬聎雄攩澴䶩弊", "菌㶑");
    Test_CheckProps_CompRoundMatch(428782, 785817, false, "鉴㉙", "ꟗ唡");
    Test_CheckProps_CompRoundMatch(779184, 804972, true, "滇�ꒉ㳀䈾뙱䕂륦", "᥾鼾㮦窘ᤲ쯳枦섍鐷痚");
    Test_CheckProps_CompRoundMatch(388432, 275775, false, "ꦏ썱줖睪授", "䥍ⅸ⯃쩆搊늜넚敦");
    Test_CheckProps_CompRoundMatch(252345, 927020, false, "", "㆒刱❕騐헵�䉨⏋릈䨕");
    Test_CheckProps_CompRoundMatch(978653, 334968, false, "ꎴ흨榼", "ꓟ砥㜬⋣亶");
    Test_CheckProps_CompRoundMatch(142433, 234266, true, "", "森ⶍභࢆ⑧");
    Test_CheckProps_CompRoundMatch(742625, 707776, false, "ᆴ걾�", "刑ᅘ鳰Ԕࠆ祊藍藄");
    Test_CheckProps_CompRoundMatch(47926, 77000, false, "颦蚕蔟", "㒴퟽ᗦ㴟봨ￊￔ쥲兆");
    Test_CheckProps_CompRoundMatch(346182, 518141, false, "閜䈀疶뫰", "⒄색Ї쑅");
    Test_CheckProps_CompRoundMatch(149066, 399166, false, "嶹堠", "༏큝㫓");
    Test_CheckProps_CompRoundMatch(67462, 782210, true, "띨體륯", "ꋐﰸ⩱刞爆쁘攇뽿퉾");
    Test_CheckProps_CompRoundMatch(820438, 487117, true, "쌘㙛핺", "ॐ쮞覑甃縎貥็۟");
    Test_CheckProps_CompRoundMatch(883796, 488370, false, "ᩳ삝뵶鳱㶋硂银撸", "叅");
    Test_CheckProps_CompRoundMatch(508311, 552893, false, "䝛튟뿎ວ扚듍꩐瘁쪟怢", "狥Ü매");
    Test_CheckProps_CompRoundMatch(396785, 680498, true, "姺㼙", "齶褱炋�Ժ蕧枪ⳳ");
    Test_CheckProps_CompRoundMatch(970711, 573283, false, "ࣼ", "⧞픭");
    Test_CheckProps_CompRoundMatch(519232, 327978, false, "�", "♹⑼驏᩽嬨默");
    Test_CheckProps_CompRoundMatch(434223, 598243, true, "畉弐狝פ뤫硥", "�淲ﺆ跏㜤샱");
    Test_CheckProps_CompRoundMatch(901310, 771561, false, "", "");
    Test_CheckProps_CompRoundMatch(150513, 313986, true, "ㄚ�妐檣袿칉谜訷", "");
    Test_CheckProps_CompRoundMatch(623725, 647698, true, "쿆蕻﬏坊₰糣䱎쪓崉", "᳓⢋ᚾ�똝줶嵠雵੻");
    Test_CheckProps_CompRoundMatch(812163, 501964, true, "䓸瀓䳻Ჵ﨑ꁄ枙꥞", "扟킋泎ⲅ朓复䚃ᖓ");
    Test_CheckProps_CompRoundMatch(965014, 40648, true, "詮柃ㄼ鲶헞雟❢", "ﮜ镕㠇篘㹡휁ꅮ");
    Test_CheckProps_CompRoundMatch(755458, 952563, false, "犌郉鷪䈥⏀淓둬ਈ", "䃿fྔ㐔ᡄ鷂啕ኞ衍");
    Test_CheckProps_CompRoundMatch(409258, 487252, true, "鳱䊞챆맰쵛㣇", "漾骞詻栞嶽");
    Test_CheckProps_CompRoundMatch(846547, 440819, true, "⦥๤즿ㄨ穂", "");
    Test_CheckProps_CompRoundMatch(307209, 349405, true, "셝", "䅴헜㘴䉌");
    Test_CheckProps_CompRoundMatch(392138, 447727, false, "", "⵪");
    Test_CheckProps_CompRoundMatch(848668, 123956, true, "", "䗎稦⡠式㏩됤蓼");
    Test_CheckProps_CompRoundMatch(428969, 263376, false, "﨑밍", "悄௶揸ꥒ");
  }
  
  bool unitTestResults_CompRoundMatch_Getters = runAsync(Tests_RegisterAll_CompRoundMatch_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_CompRoundMatch_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_CompRoundMatch', UnitTest_OpEqSimple_CompRoundMatch);
  }
  
  CompRoundMatch@ lastChecked = null;
  
  bool OpEqSimple_Check(uint id, uint position, bool isCompleted, const string &in name, const string &in clubMatchLiveId) {
    CompRoundMatch@ o1 = CompRoundMatch(id, position, isCompleted, name, clubMatchLiveId);
    CompRoundMatch@ o2 = CompRoundMatch(id, position, isCompleted, name, clubMatchLiveId);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_CompRoundMatch() {
    OpEqSimple_Check(393455, 392207, true, "펫픶ᠺ먲梏뼂铠駆蕥", "珱姢抳滛ỉ");
    OpEqSimple_Check(26686, 665920, false, "਀ꩣ釪�麑遬徨탏핈霋", "壝玃勑뤋펍캒ᨶ");
    OpEqSimple_Check(526999, 962771, false, "詘렰佹膴ᳲ풜ᬃ⿠왾", "﩯ᘞ쉓㻇娍쪁ᆬ鬹");
    OpEqSimple_Check(60415, 479941, false, "כֿ鐄ℛݙᚬ", "좙桭垛");
    OpEqSimple_Check(222008, 658911, false, "酎鵀�豝䌹쁡퐕썷", "忙凌띫趻䎕䝌");
    OpEqSimple_Check(645917, 88839, false, "㞫䫆ើ鹆ʊ冿", "");
    OpEqSimple_Check(392143, 117677, true, "쮟허", "怸፦⺑띌렯岺");
    OpEqSimple_Check(847881, 20283, true, "", "蹎쟳");
    OpEqSimple_Check(316940, 401551, false, "뼡㾢笏㶆ʱ", "늭豈䖡");
    OpEqSimple_Check(435630, 300568, false, "㪆汀ᆣ젙娣ʱᯜ鱦", "쏥䁏ਮ虴簪䤀揾噚셑");
    OpEqSimple_Check(627814, 18103, false, "慹﮽ꫤⅥȩ", "ޜ");
    OpEqSimple_Check(939833, 616710, true, "⻰쬟칁", "�㏊뻹媋痰");
    OpEqSimple_Check(629572, 333348, true, "श胤Ⲟ", "웇Ⓩ");
    OpEqSimple_Check(106739, 181998, true, "櫇", "ሌ괙");
    OpEqSimple_Check(559404, 726400, false, "⤓", "齦㑭畼");
    OpEqSimple_Check(539265, 92364, true, "㤬꾷ټ໿ꍱ꟤��", "즣傪꼻");
    OpEqSimple_Check(6580, 997818, true, "柷ꥧ荣ᢕ縠靿ᩬ□ꮟ蟉", "든㣗짰ꌂ윝뺭눎㋨");
    OpEqSimple_Check(428886, 521754, false, "⩮�ώ꒏퓂䉰", "슅엎筄䄗灰ᔃ㣛צ");
    OpEqSimple_Check(758489, 774359, false, "猋┕緰튅", "�蛖ꬹ耐厙׊");
    OpEqSimple_Check(590083, 445348, true, "瓪ﲥ疬᳢䩶㩒", "墨큽咪઼側똶뙈");
    OpEqSimple_Check(601038, 673623, false, "Ⱚ௝ミօ⥶批钅ೢ", "꼥ᗁቲ堽ᬵ꽧");
    OpEqSimple_Check(697224, 27811, false, "䳶넊", "♕");
    OpEqSimple_Check(475985, 789265, false, "ޓ", "ᱟ骲盼ﰢ࿏꘰଒嬋笩");
    OpEqSimple_Check(463332, 173202, false, "챀", "﷤賚�");
    OpEqSimple_Check(131429, 370081, true, "㑗蟒⌧츂�ꁟᾅ죐戃䶆", "讖宦뻸");
    OpEqSimple_Check(310600, 891295, true, "﨑", "ᚭࣳ");
    OpEqSimple_Check(783622, 424914, true, "ꂧ팲薾ꔲ昽꜓ᵃ퇎", "郹똹텽㙝㉻�냀");
    OpEqSimple_Check(570762, 348076, true, "", "᣾킯䠧◐");
    OpEqSimple_Check(97859, 343909, false, "", "쎑ˬ퍪쉹٥");
    OpEqSimple_Check(211152, 705593, false, "㎭啷⨍揉", "");
    OpEqSimple_Check(773250, 395321, false, "ꡂ၌鳿윀꡴⻜銵", "뮓荔");
    OpEqSimple_Check(766948, 69729, true, "톤", "냖럢쩪媭");
    OpEqSimple_Check(921986, 284973, false, "啴㟡䂸☸便", "驡囈椐༁틋�鯺䅷⮙ꥁ");
    OpEqSimple_Check(800931, 634867, true, "図罛⢲Ȃ㹪쉰龊〢", "扆");
    OpEqSimple_Check(371477, 170942, true, "Ô聈", "좢統佩諾訲꼟");
    OpEqSimple_Check(213556, 236951, false, "", "ﵜ쳮쬤﨣ኛ");
    OpEqSimple_Check(856391, 263019, false, "㐇", "韑ଵ");
    OpEqSimple_Check(369335, 265296, false, "⡋늟", "豮ⴈ");
    OpEqSimple_Check(80547, 56148, false, "＄ꤻ�鳛䊀덒턗屷", "ඟ姡�럴咨ᮭ");
    OpEqSimple_Check(292877, 851901, true, "轏씅煍尪", "੿퉛꿪⹳ꈰ뗵丷ө㩣");
    OpEqSimple_Check(801560, 533724, true, "帷", "䝈⊻弋ꑓ踠䦺");
    OpEqSimple_Check(878514, 492262, true, "ᚇ梅翂㳕࢏ᶩᄈ믋", "衽縰㷇ힾ䣇");
  }
  
  bool unitTestResults_CompRoundMatch_OpEq = runAsync(Tests_RegisterAll_CompRoundMatch_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_CompRoundMatch_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_CompRoundMatch', UnitTest_SzThenUnSz_CompRoundMatch);
  }
  
  bool Test_SzThenUnSz_Check(uint id, uint position, bool isCompleted, const string &in name, const string &in clubMatchLiveId) {
    CompRoundMatch@ tmp = CompRoundMatch(id, position, isCompleted, name, clubMatchLiveId);
    assert(tmp == _CompRoundMatch::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_CompRoundMatch() {
    Test_SzThenUnSz_Check(823221, 663647, true, "�놮鿍ᔛ覎漸࿚팂툭뮊", "骈咮ﱴ㞩谶릚끣");
    Test_SzThenUnSz_Check(840437, 29355, true, "꼻㤚藴", "");
    Test_SzThenUnSz_Check(964425, 605220, true, "", "ř챉鋱Ʞ爇⼺鐸䨒");
    Test_SzThenUnSz_Check(311318, 690397, true, "佪�", "㻥잒묑");
    Test_SzThenUnSz_Check(565451, 198964, false, "ヂᶥ뾠", "");
    Test_SzThenUnSz_Check(796997, 527623, true, "竟潔", "쬙ꅇ᭧봅≹");
    Test_SzThenUnSz_Check(337261, 394778, false, "뭺鍪㤅쏦웺㟌", "侴괰襧魒");
    Test_SzThenUnSz_Check(145385, 342094, false, "⏂ꥏ꼼砍띑䗇髣蘟", "鉓켯τ㪔ﻊ爛");
    Test_SzThenUnSz_Check(4343, 482726, false, "얨ᗨ釴䤏㟈ꡕ", "㎑䣷㬴䥪抑࿐ច");
    Test_SzThenUnSz_Check(321123, 996777, false, "Პ䑰繤牉᳔䬳", "솛格둪퍻䳥最徐㭾");
    Test_SzThenUnSz_Check(288796, 42061, false, "贅谌⼋牐", "糶킢␌窖");
    Test_SzThenUnSz_Check(480710, 37562, false, "᪲ꮚ", "");
    Test_SzThenUnSz_Check(45702, 896779, true, "ה철攣�母柊", "ꐎ굻⛩㰣兵∋沴");
    Test_SzThenUnSz_Check(129658, 92430, false, "璫⃔煡욣", "ₜ");
    Test_SzThenUnSz_Check(471390, 341399, true, "Ԧ懁ㅲ砤㉾滑肜깛", "ബ踳蝘䳡逶澸");
    Test_SzThenUnSz_Check(954615, 923112, false, "膕躯蓬㥊ᆺ⻖㋽빽", "");
    Test_SzThenUnSz_Check(730997, 820813, true, "쫌ㆃ欍", "넺硫銚䋱垇ᒋ젔攸");
    Test_SzThenUnSz_Check(539543, 854039, true, "享㐟ꯩ㹎ӑ䞖猏鐪﹀", "挤");
    Test_SzThenUnSz_Check(558576, 297578, true, "া䦾灋䗆ᵭ䠽읨껏", "ᗿ鉞ꊵ㻛踴Ṷ耦穰㢴翹");
    Test_SzThenUnSz_Check(253805, 750292, false, "", "⧝");
    Test_SzThenUnSz_Check(824789, 700839, false, "逎ஙஇᜳꍪ", "砤늈ꆅむ␢䎭ꊱ㧟");
    Test_SzThenUnSz_Check(751060, 162893, false, "", "憎");
    Test_SzThenUnSz_Check(575382, 78147, true, "陏殀", "ٺ늴");
    Test_SzThenUnSz_Check(142829, 411907, false, "刪ᖑ᭬", "䗶찀믌聅똯샩愍꩸");
    Test_SzThenUnSz_Check(651952, 806313, true, "ⵢ⎕곰", "");
    Test_SzThenUnSz_Check(915071, 81373, false, "∐", "᤾℟仅䃜쪪㌲㯊");
    Test_SzThenUnSz_Check(770642, 834356, true, "鸓", "㶡앧");
    Test_SzThenUnSz_Check(760086, 694611, true, "䶂簜饋᲏඿", "䷗鷪묡拠銢᜼錢");
    Test_SzThenUnSz_Check(450685, 913447, false, "", "騧➊皠㓧脺﫭맢ﬗ");
    Test_SzThenUnSz_Check(623212, 396305, true, "풠氂", "ຶꔽﾜᵏ");
    Test_SzThenUnSz_Check(360995, 43735, true, "코姦퇈⻟돴", "㙂詵");
    Test_SzThenUnSz_Check(703179, 605664, false, "", "웕펽꩙负釺锼珟");
    Test_SzThenUnSz_Check(559916, 78214, true, "녃䩈ᐼ쳴䣹뒞듻뙐붰", "ꒇ損荂䷫ꊣ");
    Test_SzThenUnSz_Check(374839, 237721, true, "벼寥ﴋ", "믅༐൨㪁▫");
    Test_SzThenUnSz_Check(455286, 886316, false, "먓쏜뙅橙䳅퓪룐บ䩘", "૵瘞⺔셡秆ᢜ");
    Test_SzThenUnSz_Check(661744, 916701, false, "쎡韠ᣳ翠�", "삈켳劻�桮럫憍ᕝ");
    Test_SzThenUnSz_Check(577624, 959424, true, "紨⤦鄻隳砒긳佒", "ⶾ仄떏ମ뇌ß儴礋啹ӧ");
    Test_SzThenUnSz_Check(877839, 489240, true, "ﷺ⋏晆뗭⴬똣궆", "狤í똫");
    Test_SzThenUnSz_Check(635672, 394180, false, "૧籠ᱰ", "꽣");
    Test_SzThenUnSz_Check(143075, 485481, true, "䚦럕ț頛臾Í", "鉠託鱫");
    Test_SzThenUnSz_Check(491930, 695761, false, "颋骶", "㔻ᓵ倽䨬㭺邇맣");
    Test_SzThenUnSz_Check(693093, 399064, true, "扻ꋨ䳘쏡卋鳊鍽扐", "鞞㉪屹팑龚⿞䅰ꡉፀ");
  }
  
  bool unitTestResults_CompRoundMatch_RowSerialization = runAsync(Tests_RegisterAll_CompRoundMatch_RowSerialization);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_CompRoundMatch_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_CompRoundMatch', UnitTest_ToFromBuffer_CompRoundMatch);
  }
  
  bool Test_ToFromBuffer_Check(uint id, uint position, bool isCompleted, const string &in name, const string &in clubMatchLiveId) {
    CompRoundMatch@ tmp = CompRoundMatch(id, position, isCompleted, name, clubMatchLiveId);
    Buffer@ buf = Buffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _CompRoundMatch::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_CompRoundMatch() {
    Test_ToFromBuffer_Check(823221, 663647, true, "�놮鿍ᔛ覎漸࿚팂툭뮊", "骈咮ﱴ㞩谶릚끣");
    Test_ToFromBuffer_Check(840437, 29355, true, "꼻㤚藴", "");
    Test_ToFromBuffer_Check(964425, 605220, true, "", "ř챉鋱Ʞ爇⼺鐸䨒");
    Test_ToFromBuffer_Check(311318, 690397, true, "佪�", "㻥잒묑");
    Test_ToFromBuffer_Check(565451, 198964, false, "ヂᶥ뾠", "");
    Test_ToFromBuffer_Check(796997, 527623, true, "竟潔", "쬙ꅇ᭧봅≹");
    Test_ToFromBuffer_Check(337261, 394778, false, "뭺鍪㤅쏦웺㟌", "侴괰襧魒");
    Test_ToFromBuffer_Check(145385, 342094, false, "⏂ꥏ꼼砍띑䗇髣蘟", "鉓켯τ㪔ﻊ爛");
    Test_ToFromBuffer_Check(4343, 482726, false, "얨ᗨ釴䤏㟈ꡕ", "㎑䣷㬴䥪抑࿐ច");
    Test_ToFromBuffer_Check(321123, 996777, false, "Პ䑰繤牉᳔䬳", "솛格둪퍻䳥最徐㭾");
    Test_ToFromBuffer_Check(288796, 42061, false, "贅谌⼋牐", "糶킢␌窖");
    Test_ToFromBuffer_Check(480710, 37562, false, "᪲ꮚ", "");
    Test_ToFromBuffer_Check(45702, 896779, true, "ה철攣�母柊", "ꐎ굻⛩㰣兵∋沴");
    Test_ToFromBuffer_Check(129658, 92430, false, "璫⃔煡욣", "ₜ");
    Test_ToFromBuffer_Check(471390, 341399, true, "Ԧ懁ㅲ砤㉾滑肜깛", "ബ踳蝘䳡逶澸");
    Test_ToFromBuffer_Check(954615, 923112, false, "膕躯蓬㥊ᆺ⻖㋽빽", "");
    Test_ToFromBuffer_Check(730997, 820813, true, "쫌ㆃ欍", "넺硫銚䋱垇ᒋ젔攸");
    Test_ToFromBuffer_Check(539543, 854039, true, "享㐟ꯩ㹎ӑ䞖猏鐪﹀", "挤");
    Test_ToFromBuffer_Check(558576, 297578, true, "া䦾灋䗆ᵭ䠽읨껏", "ᗿ鉞ꊵ㻛踴Ṷ耦穰㢴翹");
    Test_ToFromBuffer_Check(253805, 750292, false, "", "⧝");
    Test_ToFromBuffer_Check(824789, 700839, false, "逎ஙஇᜳꍪ", "砤늈ꆅむ␢䎭ꊱ㧟");
    Test_ToFromBuffer_Check(751060, 162893, false, "", "憎");
    Test_ToFromBuffer_Check(575382, 78147, true, "陏殀", "ٺ늴");
    Test_ToFromBuffer_Check(142829, 411907, false, "刪ᖑ᭬", "䗶찀믌聅똯샩愍꩸");
    Test_ToFromBuffer_Check(651952, 806313, true, "ⵢ⎕곰", "");
    Test_ToFromBuffer_Check(915071, 81373, false, "∐", "᤾℟仅䃜쪪㌲㯊");
    Test_ToFromBuffer_Check(770642, 834356, true, "鸓", "㶡앧");
    Test_ToFromBuffer_Check(760086, 694611, true, "䶂簜饋᲏඿", "䷗鷪묡拠銢᜼錢");
    Test_ToFromBuffer_Check(450685, 913447, false, "", "騧➊皠㓧脺﫭맢ﬗ");
    Test_ToFromBuffer_Check(623212, 396305, true, "풠氂", "ຶꔽﾜᵏ");
    Test_ToFromBuffer_Check(360995, 43735, true, "코姦퇈⻟돴", "㙂詵");
    Test_ToFromBuffer_Check(703179, 605664, false, "", "웕펽꩙负釺锼珟");
    Test_ToFromBuffer_Check(559916, 78214, true, "녃䩈ᐼ쳴䣹뒞듻뙐붰", "ꒇ損荂䷫ꊣ");
    Test_ToFromBuffer_Check(374839, 237721, true, "벼寥ﴋ", "믅༐൨㪁▫");
    Test_ToFromBuffer_Check(455286, 886316, false, "먓쏜뙅橙䳅퓪룐บ䩘", "૵瘞⺔셡秆ᢜ");
    Test_ToFromBuffer_Check(661744, 916701, false, "쎡韠ᣳ翠�", "삈켳劻�桮럫憍ᕝ");
    Test_ToFromBuffer_Check(577624, 959424, true, "紨⤦鄻隳砒긳佒", "ⶾ仄떏ମ뇌ß儴礋啹ӧ");
    Test_ToFromBuffer_Check(877839, 489240, true, "ﷺ⋏晆뗭⴬똣궆", "狤í똫");
    Test_ToFromBuffer_Check(635672, 394180, false, "૧籠ᱰ", "꽣");
    Test_ToFromBuffer_Check(143075, 485481, true, "䚦럕ț頛臾Í", "鉠託鱫");
    Test_ToFromBuffer_Check(491930, 695761, false, "颋骶", "㔻ᓵ倽䨬㭺邇맣");
    Test_ToFromBuffer_Check(693093, 399064, true, "扻ꋨ䳘쏡卋鳊鍽扐", "鞞㉪屹팑龚⿞䅰ꡉፀ");
  }
  
  bool unitTestResults_CompRoundMatch_ToFromBuffer = runAsync(Tests_RegisterAll_CompRoundMatch_ToFromBuffer);
}
#endif