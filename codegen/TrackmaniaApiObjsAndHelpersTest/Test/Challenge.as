#if UNIT_TEST
namespace Test_Challenge {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_Challenge_CommonTesting() {
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
  
  bool unitTestResults_Challenge_CommonTesting = runAsync(Tests_RegisterAll_Challenge_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_Challenge_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_Challenge', UnitTest_ToJsonFromJson_Challenge);
  }
  
  bool Test_ToJsonFromJson_Check(uint id, const string &in uid, const string &in name, uint startDate, uint endDate, uint leaderboardId) {
    Challenge@ tmp = Challenge(id, uid, name, startDate, endDate, leaderboardId);
    assert(tmp == Challenge(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_Challenge() {
    Test_ToJsonFromJson_Check(129450, "㳋뽄旤ᮔ﵇獣ແ", "䃧쁐욘ᱶ谛䆳ꔼ躜ಙ㟊", 673390, 116343, 181454);
    Test_ToJsonFromJson_Check(620474, "雱燐꬝,汯粌", "饣ퟶ䳟", 292599, 141875, 331925);
    Test_ToJsonFromJson_Check(541297, "堉⍴ᲊ", "ｓ", 853398, 34736, 880999);
    Test_ToJsonFromJson_Check(957341, "客㒞᫯볠箢暂遐", "澵z懇", 553541, 857256, 67966);
    Test_ToJsonFromJson_Check(842264, "⦱", "䞚", 962581, 425743, 228874);
    Test_ToJsonFromJson_Check(545237, "봌彺য়ꬢ毝", "▏᯿", 8357, 740990, 125510);
    Test_ToJsonFromJson_Check(201887, "렷뵫皼", "�常祈ᵒ㪗", 291599, 158796, 236301);
    Test_ToJsonFromJson_Check(772258, "唃徭ྈ", "", 293608, 562436, 192429);
    Test_ToJsonFromJson_Check(814563, "엣ᩁ㟅ഽ", "", 19141, 147800, 307977);
    Test_ToJsonFromJson_Check(782152, "鿊坯켫ꗥ쟭", "窐踎윉懜翊신꨻በ", 929417, 362775, 866688);
    Test_ToJsonFromJson_Check(555417, "躀퓹ꔴ㳇୭鹥灦㣋충왦", "ꧾ큽ⷾ뮁d更든Η", 147453, 442122, 757477);
    Test_ToJsonFromJson_Check(61319, "죤箖质ᣙ", "", 61424, 123025, 945480);
    Test_ToJsonFromJson_Check(812588, "㏬蠑坖澂ꉃ뒅Ὄ", "៯ꭍڑ쀈ⵗ", 330434, 960296, 368435);
    Test_ToJsonFromJson_Check(48539, "䴾퍂蘇賻ᜳ벛", "螝⬣홭ᢻ샞饤", 959377, 703562, 133268);
    Test_ToJsonFromJson_Check(454929, "�", "䡼淣럸튦蘥", 490369, 936231, 758410);
    Test_ToJsonFromJson_Check(670355, "瑁캳륣쑋쎧ᨘ퉁濑", "엽뷗뢑", 227340, 204841, 881761);
    Test_ToJsonFromJson_Check(817776, "㵁㢝", "쐤얪", 235494, 8576, 23152);
    Test_ToJsonFromJson_Check(201380, "再섚ᘭ", "", 74150, 318565, 35974);
    Test_ToJsonFromJson_Check(954857, "ᔲ逥좣㉒㇜ꗸ롼ᬁ籕", "", 798815, 951763, 811960);
    Test_ToJsonFromJson_Check(415355, "꫎淐", "授↳", 91151, 743344, 44570);
    Test_ToJsonFromJson_Check(56280, "䴨", "겶຾", 532804, 34223, 734280);
    Test_ToJsonFromJson_Check(226201, "뺪髷漻拹ⓨ淪熷", "聅䄳ㆳ尉ź", 354192, 471506, 827710);
    Test_ToJsonFromJson_Check(844727, "求뺝숯䐪䈞䞞", "蜵来৷몖괩퉧", 256248, 250599, 907104);
    Test_ToJsonFromJson_Check(779715, "ħ蔋팪絠촊枤ŀཎ", "穏뫤࡙攴쑋㵗髍澇㤘", 801176, 883112, 765603);
    Test_ToJsonFromJson_Check(958172, "Ԍ", "䗺", 245672, 817303, 44522);
    Test_ToJsonFromJson_Check(911772, "৹", "霋", 442711, 615355, 929340);
    Test_ToJsonFromJson_Check(235459, "", "", 863576, 553871, 150690);
    Test_ToJsonFromJson_Check(80314, "䐁ߠɯ밥�틭姻韷ሸ蜰", "꺗⯒", 313111, 457076, 470409);
    Test_ToJsonFromJson_Check(645878, "멨靮垆", "왪噧㉊㚨줫⧑㙵覆", 195672, 489062, 158912);
    Test_ToJsonFromJson_Check(156113, "䁹呦㷽혭㞥ۚ轔", "⍗ꦘ疁", 260294, 13752, 693335);
    Test_ToJsonFromJson_Check(143856, "嚄譵ʢᖀ㨎乕", "剈授䎫쉑ᢰ靡", 306458, 632656, 652417);
    Test_ToJsonFromJson_Check(740388, "祆䊼Ꙕ", "᥌⇝䱓䎸帍곔", 679849, 608847, 283554);
    Test_ToJsonFromJson_Check(524348, "紣ㄷꀞ秇⋽吢ↈ種祶⯔", "耾㾃庅", 925671, 602002, 114641);
    Test_ToJsonFromJson_Check(379745, "軬ꇈ퉿ማ鰜㞡吂檞", "꼭㗶", 181844, 822200, 152001);
    Test_ToJsonFromJson_Check(825672, "骽䭄", "", 814831, 838411, 788089);
    Test_ToJsonFromJson_Check(621229, "儻쳷계쳣㪏", "㈹�䕋⿬", 355681, 462683, 26762);
    Test_ToJsonFromJson_Check(578239, "잒淮듑箩厈䃐᲎", "耕굗ご䎽붏矓暴", 688702, 40402, 438512);
    Test_ToJsonFromJson_Check(740039, "念ꓩꦼ�୹౺삯Ϩ", "뷌齟蜰", 997977, 631049, 988710);
    Test_ToJsonFromJson_Check(432442, "䎇", "蛢䲲闞ꩍ㨧㞆豽", 804084, 767134, 302662);
    Test_ToJsonFromJson_Check(890783, "뎝⺧䛙픮", "温膀璠", 45787, 733079, 915433);
    Test_ToJsonFromJson_Check(849459, "͢떳窖鬦歾䙖ᲀ", "浸酒袑橒", 333832, 314379, 737608);
    Test_ToJsonFromJson_Check(430147, "똼顯얮듖", "볶烓", 373373, 471592, 172674);
  }
  
  bool unitTestResults_Challenge_ToFromJSONObject = runAsync(Tests_RegisterAll_Challenge_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_Challenge_Getters() {
    RegisterUnitTest('UnitTest_Challenge_Getters', UnitTest_Challenge_Getters);
  }
  
  bool Test_CheckProps_Challenge(uint id, const string &in uid, const string &in name, uint startDate, uint endDate, uint leaderboardId) {
    Challenge@ tmp = Challenge(id, uid, name, startDate, endDate, leaderboardId);
    assert(id == tmp.id, 'field id with value `' + id + '`');
    assert(uid == tmp.uid, 'field uid with value `' + uid + '`');
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(startDate == tmp.startDate, 'field startDate with value `' + startDate + '`');
    assert(endDate == tmp.endDate, 'field endDate with value `' + endDate + '`');
    assert(leaderboardId == tmp.leaderboardId, 'field leaderboardId with value `' + leaderboardId + '`');
    return true;
  }
  
  void UnitTest_Challenge_Getters() {
    Test_CheckProps_Challenge(394184, "馩", "躮", 980813, 825164, 378662);
    Test_CheckProps_Challenge(252919, "蜽韋�╝", "鰉", 14178, 409104, 402441);
    Test_CheckProps_Challenge(464786, "鳔ꂆऒ涮�뗗", "﶑䙢꺰ꦞ", 504000, 654758, 678612);
    Test_CheckProps_Challenge(605730, "�⿵枵ⴾ㬪●ꜛ", "彲⏈", 265299, 476140, 324910);
    Test_CheckProps_Challenge(49504, "握", "㷗᤾虝䰒ஷ", 149817, 853156, 438676);
    Test_CheckProps_Challenge(425498, "", "豈", 224303, 788874, 44714);
    Test_CheckProps_Challenge(425650, "拣䵱䌏�㯂ᓭ", "뽥뤎祰ᇡᒧឝ밇", 999977, 502172, 837902);
    Test_CheckProps_Challenge(183274, "鏓", "㈣揘䢊儞祹㚏", 290417, 254860, 984066);
    Test_CheckProps_Challenge(544625, "鈤ꦀ", "㎀꿈�ᴶ๏㕭∸缲䁏뤥", 985736, 972616, 680656);
    Test_CheckProps_Challenge(509010, "撏랭", "�׭駭겯ƴ", 926979, 620839, 892156);
    Test_CheckProps_Challenge(363342, "", "䵙", 264138, 345680, 37504);
    Test_CheckProps_Challenge(847011, "弊䮷⃷쨗蝢ᳳ", "㶑ꔘₜ齬聎雄攩澴", 135571, 428782, 785817);
    Test_CheckProps_Challenge(966274, "옡뭱過ଚ㩕", "뙱䕂륦홰떌䱇盰쩑", 428390, 96314, 704214);
    Test_CheckProps_Challenge(611458, "᥾鼾㮦窘ᤲ쯳枦섍鐷痚", "ୣ筃痒胊의䉶杻�죝", 392980, 565032, 395859);
    Test_CheckProps_Challenge(848880, "ⵑ᠟Ꮍ⁭豹理癙", "＠߇₹紇", 920965, 982620, 978653);
    Test_CheckProps_Challenge(334968, "⋛䨗ও�휋℃벷쨭욢", "鶧ㆌ痒", 181358, 266408, 312816);
    Test_CheckProps_Challenge(315253, "森ⶍභࢆ⑧", "沕К߄뽇㪢㸿ᓮₙ", 22089, 401867, 691035);
    Test_CheckProps_Challenge(773592, "", "蔟Ι龲ꇗ⡔辅⭉", 454352, 78530, 529329);
    Test_CheckProps_Challenge(83328, "쐭ғ㒴퟽ᗦ㴟봨ￊ", "", 518141, 153623, 2628);
    Test_CheckProps_Challenge(772861, "", "ᔻἚ", 833723, 27085, 506361);
    Test_CheckProps_Challenge(903157, "༏큝㫓", "ힼ㼓", 808460, 108758, 772472);
    Test_CheckProps_Challenge(107812, "谥缃ಟ킐⁮ꕕ뉲�工", "۟弜쌘㙛핺﫽㑪㿊", 694416, 783971, 913764);
    Test_CheckProps_Challenge(883796, "Ҹꃈ䮣ᬬ", "㻗﬽팊�슍郫홟㕤", 497196, 724861, 452001);
    Test_CheckProps_Challenge(447526, "狥Ü매剟䝛튟뿎ວ", "聹匂仰䭬鹃ȟ薲", 885581, 948170, 333021);
    Test_CheckProps_Challenge(731067, "⧞픭蚏ࣼ䪞㧯䦴귏", "㈾នﯸ滣轁竁怒ৈ", 623470, 438389, 805260);
    Test_CheckProps_Challenge(752226, "פ", "�淲ﺆ跏㜤샱镧畉弐", 901310, 771561, 357901);
    Test_CheckProps_Challenge(952652, "妐檣袿칉谜訷໰胖", "뚪䬹칭烈罽췜歵ȧㄚ", 582898, 482768, 925363);
    Test_CheckProps_Challenge(355531, "ጢ", "豺댜￰", 407047, 990522, 133511);
    Test_CheckProps_Challenge(930210, "嵐䓸瀓䳻Ჵ﨑", "", 147555, 303027, 462299);
    Test_CheckProps_Challenge(965014, "㼘ⵏ骗", "⋵隸꫍痈", 666968, 969195, 468413);
    Test_CheckProps_Challenge(455407, "ꭢធ沈", "ꏛ", 575293, 650559, 361945);
    Test_CheckProps_Challenge(900907, "啕ኞ衍蛜", "䃿fྔ㐔ᡄ鷂", 409258, 487252, 847881);
    Test_CheckProps_Challenge(974829, "揉筢㲸", "穂Hᡶ⛥杭貴溪৥롰꬜", 717791, 449432, 307209);
    Test_CheckProps_Challenge(349405, "啞婓菨뻟௎餵긽榈", "溊䷡꬈फ़Ը㌲狊⵪诨⥇", 684845, 571451, 914746);
    Test_CheckProps_Challenge(375598, "밃괦㮜䔐炒悄௶揸ꥒ叵", "贙殺뱆ᩖ彐", 490417, 744440, 498609);
    Test_CheckProps_Challenge(237947, "", "⿳훿☸꤫睊", 605257, 915086, 489560);
    Test_CheckProps_Challenge(284881, "㗻壺旻", "ದ鴆䟎他�", 412232, 772864, 760754);
    Test_CheckProps_Challenge(963563, "�䅴", "阊额禱鍾齪床὏勐", 437881, 957451, 439545);
    Test_CheckProps_Challenge(819074, "헽⇐춻嶻㐙㷀뵌慔", "⃙㾥괶", 516520, 961253, 905806);
    Test_CheckProps_Challenge(387647, "쩢姽ἆ奨", "ꌗ枚逳剭ﺏ柙", 282186, 400614, 951189);
    Test_CheckProps_Challenge(894450, "컏�嚌", "⶯弸", 751600, 82673, 881873);
    Test_CheckProps_Challenge(44403, "륍虋陱濣灈￨℈⩝ꝶ", "莻ጺ䭉胼ᑝ쨀", 873724, 994918, 343715);
  }
  
  bool unitTestResults_Challenge_Getters = runAsync(Tests_RegisterAll_Challenge_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_Challenge_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_Challenge', UnitTest_OpEqSimple_Challenge);
  }
  
  Challenge@ lastChecked = null;
  
  bool OpEqSimple_Check(uint id, const string &in uid, const string &in name, uint startDate, uint endDate, uint leaderboardId) {
    Challenge@ o1 = Challenge(id, uid, name, startDate, endDate, leaderboardId);
    Challenge@ o2 = Challenge(id, uid, name, startDate, endDate, leaderboardId);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_Challenge() {
    OpEqSimple_Check(393455, "ﷰ눵뭩㵷衟춗䵩", "쭶퍉첯㚥涬", 606964, 746965, 295268);
    OpEqSimple_Check(535487, "਀ꩣ釪�麑遬徨탏", "壝玃勑뤋펍캒ᨶ", 526999, 962771, 489079);
    OpEqSimple_Check(509350, "", "", 591080, 333816, 159512);
    OpEqSimple_Check(123640, "ᚬ쇳濶鵛獔楷", "︐좙桭垛峵כֿ鐄ℛ", 749954, 450775, 480461);
    OpEqSimple_Check(131073, "䝅攨鑽烆ঙﶇ䚱윲冥㶶", "ʊ冿�Ⓢꖠ", 515156, 280342, 310378);
    OpEqSimple_Check(392143, "䝕", "鎤쎣", 288195, 531474, 7923);
    OpEqSimple_Check(471876, "␜῰蹎쟳횱宙홧㉜는", "蚵⧝耏盧", 179642, 145172, 521707);
    OpEqSimple_Check(606939, "ʱᯜ鱦ࠡ", "噚셑燵㪆汀ᆣ젙", 840953, 20188, 208909);
    OpEqSimple_Check(610006, "䀐硩", "䀿虿砍", 624373, 718449, 909595);
    OpEqSimple_Check(422278, "⻰쬟", "�㏊뻹媋痰", 629572, 333348, 4203);
    OpEqSimple_Check(147695, "嚅⒝ࣾ", "⬲櫇ꟙ栥鏡螫", 700928, 897339, 559404);
    OpEqSimple_Check(726400, "锲釹ឰ", "耽裮", 298494, 457344, 106515);
    OpEqSimple_Check(40481, "", "즣傪꼻", 6580, 997818, 438577);
    OpEqSimple_Check(704848, "", "喐橀뛰�둕껅汆講", 814326, 317042, 332229);
    OpEqSimple_Check(631334, "ώ", "צ츷⩮", 747775, 333922, 24944);
    OpEqSimple_Check(263165, "ཧ捺슅", "ᱧᫎ솠轼ⱬ", 457029, 770199, 522160);
    OpEqSimple_Check(104104, "⛲㕤�", "ꃢ｡뫇묯", 304399, 29411, 78939);
    OpEqSimple_Check(636291, "墨큽咪઼側똶뙈", "ꛬ苵䎥�쭲鄻콨�", 557945, 937519, 279639);
    OpEqSimple_Check(759681, "粄⅝挝㠊", "共䳶넊ᙓࡀ컒", 475985, 789265, 36996);
    OpEqSimple_Check(322382, "芸덍갽郭", "䚨篱鬻피䌱踀", 829588, 992454, 47786);
    OpEqSimple_Check(141600, "⟹驵盲ⓟ娣ዯ", "賥硬⭷혀ⴿ㓶ࣛﬣ", 294139, 170604, 690603);
    OpEqSimple_Check(578377, "﨑", "ᚭࣳ", 783622, 424914, 417084);
    OpEqSimple_Check(877689, "띟璦Ⴗ婑", "䨾㶜☭ෳ", 284057, 296593, 97859);
    OpEqSimple_Check(343909, "텩㚽댯맑힊骝", "瞐奺ဂ", 917838, 203988, 773250);
    OpEqSimple_Check(395321, "㝳䵉貟↟ڹ錠쟓쎭뗧", "罚", 978412, 15728, 543714);
    OpEqSimple_Check(31625, "閯ﺸ娂ᑠ쟀냖럢쩪", "愶彄纇鼗䘚秱ᗱ", 610831, 834401, 438887);
    OpEqSimple_Check(728516, "Ú銼", "쉰龊〢ᔖ̉韺輨浉ㆠ", 323966, 493150, 371477);
    OpEqSimple_Check(170942, "囲ﻯ機稻�", "䋰ꭔ䧂", 196654, 968043, 958667);
    OpEqSimple_Check(223128, "㙫姦䟧ఊꪫ㪛숬勯ﵜ", "圦긡㴽䷗넱", 1447, 703199, 927171);
    OpEqSimple_Check(714203, "죹⪱濱놿宦奋豮ⴈ", "일ٸ顚", 796197, 147837, 128962);
    OpEqSimple_Check(901043, "씅煍尪읒쪭剈", "ө㩣�轏", 612128, 959191, 138540);
    OpEqSimple_Check(801560, "", "㵟蝅迨︧兀ࢺ鱈䛳啨", 696064, 331215, 897341);
    OpEqSimple_Check(155958, "ힾ䣇ᚇ梅翂", "", 867988, 950426, 250555);
    OpEqSimple_Check(553377, "枌녑埖韠፧迒", "癓", 445761, 857000, 976480);
    OpEqSimple_Check(455033, "过�蝄合౜녜뎙㾣", "൹貈垸", 229473, 575927, 155319);
    OpEqSimple_Check(107419, "䷫킹륦", "䂃堮㹺暮", 856521, 84333, 651960);
    OpEqSimple_Check(562413, "繶藩륍韚킉迊ṱ帮—", "倢슭펵", 542692, 549628, 303267);
    OpEqSimple_Check(239582, "䅖ꏊ", "禾", 677295, 262088, 508624);
    OpEqSimple_Check(38712, "綒搅聍Ꟑᨎﳌ祊⠤❮뙡", "쎙竗硨ɯ䃟偶", 406292, 109178, 333940);
    OpEqSimple_Check(20634, "ᬣ뾩ᨶ␫祡扁拚ꑧ", "䮕", 24041, 47111, 957356);
    OpEqSimple_Check(796492, "⏏᧎䫁詵䯻", "뀁م", 55892, 967496, 74974);
    OpEqSimple_Check(504468, "✜ྦྷ", "낤햳釽⛧옩炰၃鉝", 471983, 508026, 929051);
  }
  
  bool unitTestResults_Challenge_OpEq = runAsync(Tests_RegisterAll_Challenge_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_Challenge_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_Challenge', UnitTest_SzThenUnSz_Challenge);
  }
  
  bool Test_SzThenUnSz_Check(uint id, const string &in uid, const string &in name, uint startDate, uint endDate, uint leaderboardId) {
    Challenge@ tmp = Challenge(id, uid, name, startDate, endDate, leaderboardId);
    assert(tmp == _Challenge::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_Challenge() {
    Test_SzThenUnSz_Check(823221, "�朹鎟ﳙ㻲翾鵜靀㍒", "ﰙ⠁玭텆", 325863, 922558, 661263);
    Test_SzThenUnSz_Check(436830, "쯣欚", "⿕氎꼻㤚藴킅", 964425, 605220, 262638);
    Test_SzThenUnSz_Check(498192, "", "賄�匼뒱", 826942, 906038, 616400);
    Test_SzThenUnSz_Check(263354, "푲෗蔃䓥㻥", "䟃넲䗵蹟牪", 322150, 614406, 417104);
    Test_SzThenUnSz_Check(547338, "쬙ꅇ᭧봅≹", "�ౝ", 629002, 832887, 693999);
    Test_SzThenUnSz_Check(4946, "︠걿좳樁㠵", "髣蘟먝瞄⧛鉼竲", 392550, 83184, 876484);
    Test_SzThenUnSz_Check(70271, "㏰鉓켯τ㪔ﻊ爛", "ꈽ洞⤦➦踆⌾", 4920, 122428, 837623);
    Test_SzThenUnSz_Check(615687, "䩸Ὼ", "", 964248, 970574, 467845);
    Test_SzThenUnSz_Check(956732, "퍻䳥最徐㭾멭Პ䑰", "䟥ፕ⎃ﲀᦓ솛格둪", 234787, 700902, 853957);
    Test_SzThenUnSz_Check(759104, "剼᪲ꮚ෌", "ⰳ팑ꇬ䋶慸", 405127, 314974, 151896);
    Test_SzThenUnSz_Check(129142, "ㅡ螘笣䨯䄸", "璫⃔煡욣", 908297, 233268, 471390);
    Test_SzThenUnSz_Check(341399, "淡", "뙸줒女ѽ泡誄狋撧곟", 356559, 161330, 809993);
    Test_SzThenUnSz_Check(973135, "⻖㋽", "雈皇殤膕躯蓬㥊", 820813, 647490, 647392);
    Test_SzThenUnSz_Check(868449, "�〿Ꝼ샛ᣱ", "ӑ䞖猏鐪﹀ྏ䅳税", 729161, 92, 558576);
    Test_SzThenUnSz_Check(297578, "⸕숈祭鑚ൃ", "䯯桾뭎挘殤掙얷ᐮጧ", 147932, 493491, 300346);
    Test_SzThenUnSz_Check(447767, "樦纍ﲀ⧝�䄳凜", "Ꮪ猾ؙ太蠵", 99463, 860757, 909951);
    Test_SzThenUnSz_Check(951620, "鋣ꊌ멉녍ഩ਽䫚蜳㽤쎮", "⿺⯌憎祖羔", 209790, 723283, 128346);
    Test_SzThenUnSz_Check(859526, "᭬퇠至៳", "샩愍꩸㸵刪", 606450, 478495, 271620);
    Test_SzThenUnSz_Check(651952, "疧ꅦ", "", 116699, 616919, 769796);
    Test_SzThenUnSz_Check(544943, "䂁", "ᡊ︆᤾℟仅䃜쪪㌲", 876904, 384560, 271358);
    Test_SzThenUnSz_Check(595771, "䶂簜饋᲏඿", "䷗鷪묡拠銢᜼錢", 450685, 913447, 380426);
    Test_SzThenUnSz_Check(542068, "ꇖⲽ", "", 884816, 252573, 449721);
    Test_SzThenUnSz_Check(421428, "ຶꔽﾜᵏ䒴", "譥횓ƹ", 360995, 43735, 133754);
    Test_SzThenUnSz_Check(771161, "琧", "쎆㊆⯟骙䁣", 983651, 768217, 477588);
    Test_SzThenUnSz_Check(555890, "麃犿", "陣띰摼푔⼧", 487546, 504451, 808646);
    Test_SzThenUnSz_Check(898762, "ﴋᮝ", "▫윁벼", 233228, 57986, 455286);
    Test_SzThenUnSz_Check(886316, "댢㌠商ᅾ", "箯浔陳᳚乹ﻺ鮷囫я", 482962, 745915, 315247);
    Test_SzThenUnSz_Check(912496, "�桮럫憍ᕝ芜쎡韠", "", 577624, 959424, 779544);
    Test_SzThenUnSz_Check(141403, "", "쒿№妝�並㈛贆", 930027, 532104, 633576);
    Test_SzThenUnSz_Check(854263, "똣궆暱여군햛", "ﷺ⋏晆뗭", 27512, 645217, 635672);
    Test_SzThenUnSz_Check(394180, "႙趹攘ꆓ믔ы", "낊㮄瓲", 680346, 153507, 335942);
    Test_SzThenUnSz_Check(779011, "鱫댫", "鉠", 491930, 695761, 478307);
    Test_SzThenUnSz_Check(405974, "仚饩�Ꮚ혹霭䞓盅", "鳊鍽扐肑レ", 896003, 238891, 267100);
    Test_SzThenUnSz_Check(216236, "ﶾ鞞㉪屹팑", "뒧", 416887, 193882, 131058);
    Test_SzThenUnSz_Check(392530, "�", "䞓㕋", 829491, 742412, 433578);
    Test_SzThenUnSz_Check(786049, "婌ਠ愤섉韭쟰튤⟫", "췭栴省ᨱ흴뒭㺡࣊", 159725, 498260, 41159);
    Test_SzThenUnSz_Check(178803, "蛱왓꿨᳁ْଠ墻", "忧ⷾ챲퉗溕㹅灜桩弜", 727940, 382451, 621003);
    Test_SzThenUnSz_Check(307142, "尷", "놲싵뇵쯷", 581686, 977267, 266241);
    Test_SzThenUnSz_Check(93150, "ꇑﾷꃦ", "␬", 953518, 283816, 334966);
    Test_SzThenUnSz_Check(17733, "Ⱄㄺ꛼㻔㴕", "窗䊨㎠๥Ⲣ⪒冁", 896342, 154401, 373048);
    Test_SzThenUnSz_Check(125776, "ꨟ泒擵䆲罋婬", "ૐ", 363891, 810147, 786060);
    Test_SzThenUnSz_Check(403152, "옮伴ꁧⓚ紝쾲铃켴돺", "ᚡ窓", 576027, 20949, 788899);
  }
  
  bool unitTestResults_Challenge_RowSerialization = runAsync(Tests_RegisterAll_Challenge_RowSerialization);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_Challenge_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_Challenge', UnitTest_ToFromBuffer_Challenge);
  }
  
  bool Test_ToFromBuffer_Check(uint id, const string &in uid, const string &in name, uint startDate, uint endDate, uint leaderboardId) {
    Challenge@ tmp = Challenge(id, uid, name, startDate, endDate, leaderboardId);
    Buffer@ buf = Buffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _Challenge::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_Challenge() {
    Test_ToFromBuffer_Check(490366, "", "ᦞ壩괛�㸝赳粢ോ银浕", 208087, 184950, 608908);
    Test_ToFromBuffer_Check(798589, "ᄟ텻鯄ﴻ㑽沒", "咽糥疿눪ⶭ灁ᏹ㑚", 829354, 16729, 195527);
    Test_ToFromBuffer_Check(860777, "攤룷ꠅ", "ൗ㬬䱿학钻ꂆࣤ㍅糳�", 760473, 549906, 156703);
    Test_ToFromBuffer_Check(1464, "ț븶餦ਗ਼玵⌂玍뱑ự", "", 500830, 215149, 949599);
    Test_ToFromBuffer_Check(493127, "䃩벋⛩", "᫳ᦇ粜", 612549, 248742, 307951);
    Test_ToFromBuffer_Check(966690, "銥롘⣎녿썳", "峔䞠⧖奡玜겧徕䧎࠺", 524415, 683358, 509962);
    Test_ToFromBuffer_Check(254406, "࡟记Ⴒ늴㐆醁递", "礱䲏Ȥﭢ", 318603, 27503, 664733);
    Test_ToFromBuffer_Check(835031, "�", "墿䌣�", 935627, 305848, 489756);
    Test_ToFromBuffer_Check(193423, "缆罙푅인Ӽ", "໭", 610901, 520261, 319227);
    Test_ToFromBuffer_Check(861842, "㴑", "潷⿧�", 611940, 376915, 665797);
    Test_ToFromBuffer_Check(599204, "抅뻱ℤ䃧택", "淹ꞈ짶܊瓽捭", 691552, 740264, 459935);
    Test_ToFromBuffer_Check(217232, "뗿㾃솸綯臭ध□-蛬", "꒚憑ȍ♑褺끤", 821325, 79569, 692075);
    Test_ToFromBuffer_Check(153581, "㫴ݲ", "聊䣯", 196468, 933514, 832224);
    Test_ToFromBuffer_Check(500671, "꒍", "냐娫责擔挡賵ঃ", 960991, 385463, 674685);
    Test_ToFromBuffer_Check(977204, "뿿끄먫", "⿇", 473825, 7876, 56855);
    Test_ToFromBuffer_Check(265468, "倖ŝ䋇ﮥ", "ꥎɈ틛顿惚ỗ觞影", 491002, 668805, 29048);
    Test_ToFromBuffer_Check(458473, "ּ繞홐��", "죢湧섳⒜㓚苵孇᚞", 877783, 112853, 887898);
    Test_ToFromBuffer_Check(632768, "", "㥬ֵ", 786352, 781973, 709747);
    Test_ToFromBuffer_Check(119549, "밦󻴑ւꈒ戚춭袺㙒౫", "⃄玔묍", 563923, 289567, 639966);
    Test_ToFromBuffer_Check(472901, "鿞겮鴆痉泲훇嶈Қ", "混�禳", 739553, 137795, 24883);
    Test_ToFromBuffer_Check(411059, "Չ찐ꕩ칌녔笱棯볿鋄郆", "틛", 715606, 39083, 122547);
    Test_ToFromBuffer_Check(782025, "劼", "믃໩鲔✀ॵ", 950275, 941100, 351011);
    Test_ToFromBuffer_Check(957219, "㧵ⷧ", "㒡ᢢ껏䉙吪⁴⡀拙", 49515, 112592, 392369);
    Test_ToFromBuffer_Check(248972, "", "", 512740, 35511, 107080);
    Test_ToFromBuffer_Check(18330, "㾶傻", "", 254649, 106208, 625473);
    Test_ToFromBuffer_Check(386513, "봳鑈ꍥ", "�젳쳝匥ᄯ", 319194, 847441, 457902);
    Test_ToFromBuffer_Check(598805, "몏ꠑ纋ᮖឣ", "", 100513, 908455, 281342);
    Test_ToFromBuffer_Check(209507, "≰晭�", "ꂟ쬪孂왱˂੭ᓟ逤", 239575, 219995, 649787);
    Test_ToFromBuffer_Check(560058, "䜎㊟焱쑔ᣛﻃ瞽�쀮ꢸ", "냙", 385218, 640059, 454315);
    Test_ToFromBuffer_Check(779022, "挏䆭䐜�䖩仍", "쨣雜蒘痃隔䨓䐭ǘ钶", 991105, 611797, 279996);
    Test_ToFromBuffer_Check(742423, "", "蚥▒䢫", 647385, 490055, 570569);
    Test_ToFromBuffer_Check(233081, "캣ᮅ", "뉠缾릭潑赃脕ᶬ", 591520, 354629, 334771);
    Test_ToFromBuffer_Check(542510, "鼋", "묓ﱼ鉴", 588519, 605952, 63954);
    Test_ToFromBuffer_Check(140266, "蓷璉ὕ᳊ꀕ绪됉韲媲", "쑶ⱽꊑ⏹㝣魠齁", 832092, 559458, 580200);
    Test_ToFromBuffer_Check(790541, "ꚩ", "粙", 95161, 615343, 784257);
    Test_ToFromBuffer_Check(682330, "쀐㴔", "韯ꝺ茜紜", 336367, 585416, 301561);
    Test_ToFromBuffer_Check(640719, "", "귋룄踂뷡焱．", 450920, 611365, 404741);
    Test_ToFromBuffer_Check(604555, "魨殉빰", "", 577567, 816054, 552342);
    Test_ToFromBuffer_Check(632030, "炳", "剒剿幦☮", 679471, 82437, 269561);
    Test_ToFromBuffer_Check(518572, "͍뤃蜥ࡆ掹᭚☰", "ꍤ칺�ࣞ", 898463, 938465, 177702);
    Test_ToFromBuffer_Check(886642, "诟镝䎵꿻杗", "値᯺껙ꊚ㉻摃", 730341, 396182, 77201);
    Test_ToFromBuffer_Check(901931, "穓᫅鯚㾴", "榭鋽੊鼎汴", 867334, 650901, 298793);
  }
  
  bool unitTestResults_Challenge_ToFromBuffer = runAsync(Tests_RegisterAll_Challenge_ToFromBuffer);
}
#endif