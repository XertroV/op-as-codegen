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
    Test_ToFromBuffer_Check(490366, 613160, true, "㷕y䖀湶㐇쩎䷐묲", "㍜殮⧽਄劦퐄");
    Test_ToFromBuffer_Check(429952, 439826, true, "ﴻ", "ⶭ灁ᏹ㑚ᄟ텻");
    Test_ToFromBuffer_Check(123656, 829354, false, "쥲拝", "쪚ꗼ");
    Test_ToFromBuffer_Check(514374, 3520, false, "ൗ㬬䱿학钻ꂆࣤ㍅糳�", "忭�");
    Test_ToFromBuffer_Check(549906, 156703, true, "䞀", "�");
    Test_ToFromBuffer_Check(447451, 167614, true, "⒯둷盚ⳬ斮ț븶餦", "ꏅ㜔庯쎿命");
    Test_ToFromBuffer_Check(493127, 268958, true, "ܪ�濃ฮ⢩", "ꥮꐦႠ");
    Test_ToFromBuffer_Check(352464, 913879, false, "蒔銥", "峔䞠⧖奡玜겧徕䧎");
    Test_ToFromBuffer_Check(524415, 683358, true, "ꙹ☻ｲ㾔", "隕ᴋ쓣ã葙春裎");
    Test_ToFromBuffer_Check(222696, 247284, false, "芺➞ᷟᦊ럃礱", "蛬�卻恀墿䌣�癓�鄒");
    Test_ToFromBuffer_Check(305848, 489756, true, "", "ꎁ杕묙뷘뽵ꀜ");
    Test_ToFromBuffer_Check(928195, 816502, false, "ⷨ㴑縅 弋裚", "痴潷⿧");
    Test_ToFromBuffer_Check(376915, 665797, false, "׊へ坾䇲⑯", "饮톑써ꝍ");
    Test_ToFromBuffer_Check(773480, 950743, true, "讽ń鞋릗䊡", "솸綯臭ध□-");
    Test_ToFromBuffer_Check(299431, 236913, false, "ຨの⧚諍愥", "");
    Test_ToFromBuffer_Check(712467, 873063, false, "", "㏻");
    Test_ToFromBuffer_Check(153581, 120117, true, "룩䚪怐齵連�ړ犺", "醱✨딦鹟㙾⛢鵷扑敚");
    Test_ToFromBuffer_Check(84815, 197029, true, "먫ᣆ抣㋠", "氉恌⿇�뿿");
    Test_ToFromBuffer_Check(473825, 7876, false, "ᘤ�6蠕씹ꖪ", "뵈곋衫�鐭뢂梱");
    Test_ToFromBuffer_Check(724963, 807307, true, "��짺ၑ珤", "湧섳⒜㓚苵孇᚞粷ּ繞");
    Test_ToFromBuffer_Check(260068, 877783, true, "渽뒮㩍哙쮈쟝", "礱ﾡῼ�ﭾ싌无죋轧瑦");
    Test_ToFromBuffer_Check(450463, 68765, false, "㙒౫썍", "ւꈒ戚춭");
    Test_ToFromBuffer_Check(465852, 638173, true, "", "祽勽迩ﬀࡴ");
    Test_ToFromBuffer_Check(871793, 462917, false, "禳蓮鿞겮鴆痉泲훇嶈", "᤮㘄ᯈ샅邯镇混�");
    Test_ToFromBuffer_Check(411059, 726425, true, "헧ᜰ︺ꮛⳲ贷誸", "뀃궳");
    Test_ToFromBuffer_Check(10528, 949124, true, "劼", "믃໩鲔✀ॵ");
    Test_ToFromBuffer_Check(950275, 941100, false, "켻㵛�꣎⺞㨱㘌", "ѕ鸰襢");
    Test_ToFromBuffer_Check(858389, 508488, false, "�ྰ", "佶");
    Test_ToFromBuffer_Check(112592, 392369, true, "犖", "犉");
    Test_ToFromBuffer_Check(938354, 468334, false, "", "紮㾶傻竨罽");
    Test_ToFromBuffer_Check(409361, 254649, true, "쩎ꍌ섴날ꧾ截௻⅘", "᮵樇");
    Test_ToFromBuffer_Check(10587, 438625, false, "㭿몏ꠑ纋ᮖឣ첚", "䁿縒酗");
    Test_ToFromBuffer_Check(908455, 281342, true, "琭⮜뎬뫛쫴곳", "䴳垇跌ꂺ㟭莇ᇾ㟊쌭");
    Test_ToFromBuffer_Check(612062, 656208, false, "퀜㛟넸", "쑔ᣛﻃ瞽�쀮ꢸ쭾甤");
    Test_ToFromBuffer_Check(841223, 117297, false, "똓�몗헗ᘖ疰厔ǜ韊", "쭰⦯⌳㿪⊊�냷涥ズ");
    Test_ToFromBuffer_Check(533765, 34746, true, "鶑煮쨣雜蒘", "姛旅꼳ꧨ免Ϳ㚑䲾਴᪾");
    Test_ToFromBuffer_Check(611797, 279996, false, "난㼄Ɱ", "ｹ䷿￫蕬翓둝");
    Test_ToFromBuffer_Check(480458, 109814, false, "뉠缾릭潑赃脕ᶬ", "ꮺ玚疭爿㰙");
    Test_ToFromBuffer_Check(821229, 128428, false, "䝜ˎ", "⺢喳爕ᡟ");
    Test_ToFromBuffer_Check(81862, 212951, false, "魠齁⣔蓷璉", "");
    Test_ToFromBuffer_Check(554244, 914083, false, "⤛叕気℩惘봎︠封", "릥�鉭烄뎔唍撻짳稆㿷");
    Test_ToFromBuffer_Check(733018, 937372, true, "紜㗆", "韯ꝺ");
  }
  
  bool unitTestResults_CompRoundMatch_ToFromBuffer = runAsync(Tests_RegisterAll_CompRoundMatch_ToFromBuffer);
}
#endif