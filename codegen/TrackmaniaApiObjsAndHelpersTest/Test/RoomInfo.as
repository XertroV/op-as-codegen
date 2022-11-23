#if UNIT_TEST
namespace Test_RoomInfo {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_RoomInfo_CommonTesting() {
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
  
  bool unitTestResults_RoomInfo_CommonTesting = runAsync(Tests_RegisterAll_RoomInfo_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_RoomInfo_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_RoomInfo', UnitTest_ToJsonFromJson_RoomInfo);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in name, uint n_teams, uint n_players, uint player_limit, MaybeOfString@ join_code, bool is_public, uint ready_count) {
    RoomInfo@ tmp = RoomInfo(name, n_teams, n_players, player_limit, join_code, is_public, ready_count);
    assert(tmp == RoomInfo(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_RoomInfo() {
    Test_ToJsonFromJson_Check("", 129450, 573551, 355425, MaybeOfString(), false, 263911);
    Test_ToJsonFromJson_Check("罐㳋", 191439, 86104, 883496, MaybeOfString("뿣확庢⽊럮ᬃ觱ʀሯ搑"), true, 259935);
    Test_ToJsonFromJson_Check("", 294609, 403118, 996210, MaybeOfString("톶뜣힐"), true, 331925);
    Test_ToJsonFromJson_Check("ᲊ̇॑", 138748, 606311, 853398, MaybeOfString("ᮃ놜冺햵ᤫ簔�"), false, 833828);
    Test_ToJsonFromJson_Check("懇�客㒞᫯볠", 553541, 857256, 67966, MaybeOfString("䡓"), false, 962581);
    Test_ToJsonFromJson_Check("旰蓡", 545237, 796389, 811618, MaybeOfString(), false, 915574);
    Test_ToJsonFromJson_Check("▏᯿쨄", 450229, 8357, 740990, MaybeOfString(""), false, 201887);
    Test_ToJsonFromJson_Check("렷뵫皼", 291599, 158796, 236301, MaybeOfString("♱솎"), false, 689542);
    Test_ToJsonFromJson_Check("", 293608, 562436, 192429, MaybeOfString("撛首譤攊ԭ藙聍㚃"), true, 19141);
    Test_ToJsonFromJson_Check("ꗥ쟭銗䔜῏⻖蚇ங", 275663, 198407, 474515, MaybeOfString(), true, 203400);
    Test_ToJsonFromJson_Check("褢鶳ᄶ窐踎윉懜", 38087, 419346, 503262, MaybeOfString("檺"), true, 899539);
    Test_ToJsonFromJson_Check("Ηꨘ", 64291, 417442, 351797, MaybeOfString("䙐禭"), false, 147453);
    Test_ToJsonFromJson_Check("鍡轔", 757477, 61319, 220027, MaybeOfString("फᝌᣇ꒨"), true, 123025);
    Test_ToJsonFromJson_Check("", 945480, 812588, 609511, MaybeOfString("鳐�"), false, 820139);
    Test_ToJsonFromJson_Check("瀀⼸៯ꭍ", 368435, 48539, 698297, MaybeOfString("뚑簈㖻Ꙛំ"), false, 959377);
    Test_ToJsonFromJson_Check("ꒋ符䭭澀", 489123, 522901, 419173, MaybeOfString("임㾂鴈臼瀙娎뉺ꢗ軤"), false, 378524);
    Test_ToJsonFromJson_Check("쎧ᨘ퉁", 554346, 17181, 227340, MaybeOfString("ଌ蓼﫤"), false, 817776);
    Test_ToJsonFromJson_Check("㵁㢝", 886650, 781291, 235494, MaybeOfString(), true, 23152);
    Test_ToJsonFromJson_Check("再섚ᘭ☖", 928935, 74150, 318565, MaybeOfString("媡요쉒"), true, 123726);
    Test_ToJsonFromJson_Check("豣閑㏲ᔲ逥좣㉒㇜ꗸ", 811960, 415355, 760015, MaybeOfString(), false, 610207);
    Test_ToJsonFromJson_Check("⧼馣谱蘄딙授", 91151, 743344, 44570, MaybeOfString("冋"), false, 440156);
    Test_ToJsonFromJson_Check("", 532804, 34223, 734280, MaybeOfString("郅栗�"), true, 999293);
    Test_ToJsonFromJson_Check("恮뺪髷漻拹", 526475, 999438, 811107, MaybeOfString("ꯥ끁롣௑㢭ꇔ"), true, 771523);
    Test_ToJsonFromJson_Check("몖괩", 876283, 49476, 256248, MaybeOfString("כֿ昢Ｈ罧㣜樐㽼"), true, 43093);
    Test_ToJsonFromJson_Check("ħ蔋", 674608, 308745, 376275, MaybeOfString("ᶥ톪�湀"), true, 548088);
    Test_ToJsonFromJson_Check("뾋뿰秮", 765603, 958172, 390405, MaybeOfString("땓꟭뗏"), true, 911772);
    Test_ToJsonFromJson_Check("৹", 992957, 442711, 615355, MaybeOfString("矮冠"), true, 235459);
    Test_ToJsonFromJson_Check("", 850587, 863576, 553871, MaybeOfString("ṧᬔ"), true, 840907);
    Test_ToJsonFromJson_Check("꺗⯒ꊑ䐁ߠɯ밥", 457076, 470409, 645878, MaybeOfString("첕"), true, 424004);
    Test_ToJsonFromJson_Check("왪噧㉊㚨줫⧑㙵覆", 195672, 489062, 158912, MaybeOfString("�ꐒ魋䭅"), true, 235111);
    Test_ToJsonFromJson_Check("꼵䁹呦", 64905, 260294, 13752, MaybeOfString("⢻疳쨟ጦ"), true, 233926);
    Test_ToJsonFromJson_Check("ᢰ靡ﮃ嚄", 681867, 170734, 306458, MaybeOfString("胛๫"), false, 935263);
    Test_ToJsonFromJson_Check("䊼", 804780, 477471, 147878, MaybeOfString(), false, 12590);
    Test_ToJsonFromJson_Check("釄", 679849, 608847, 283554, MaybeOfString("濍γ"), false, 104905);
    Test_ToJsonFromJson_Check("", 900364, 662721, 992645, MaybeOfString("邽쪿"), true, 114641);
    Test_ToJsonFromJson_Check("", 379745, 812903, 162028, MaybeOfString("鍼륭朰ᆿᕃ"), false, 449872);
    Test_ToJsonFromJson_Check("꼭㗶", 181844, 822200, 152001, MaybeOfString(""), true, 354693);
    Test_ToJsonFromJson_Check("䴤䦳", 621229, 452225, 366477, MaybeOfString("䲈㌒"), false, 406196);
    Test_ToJsonFromJson_Check("㨵䓸뷐�댍〱둫鱆", 462683, 26762, 578239, MaybeOfString("덁闧⽺裰轛멭"), false, 892962);
    Test_ToJsonFromJson_Check("䬼덃耕굗ご䎽붏", 438512, 740039, 565965, MaybeOfString("࠘ᮍ怅䓗柳ᓒ혖඾"), true, 230185);
    Test_ToJsonFromJson_Check("䩬媴白矷孃뷌", 432442, 20231, 116955, MaybeOfString(), true, 803992);
    Test_ToJsonFromJson_Check("䲲", 626295, 804084, 767134, MaybeOfString("⋸ꃜ誉穞煮㋬傁畧"), false, 990125);
  }
  
  bool unitTestResults_RoomInfo_ToFromJSONObject = runAsync(Tests_RegisterAll_RoomInfo_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_RoomInfo_Getters() {
    RegisterUnitTest('UnitTest_RoomInfo_Getters', UnitTest_RoomInfo_Getters);
  }
  
  bool Test_CheckProps_RoomInfo(const string &in name, uint n_teams, uint n_players, uint player_limit, MaybeOfString@ join_code, bool is_public, uint ready_count) {
    RoomInfo@ tmp = RoomInfo(name, n_teams, n_players, player_limit, join_code, is_public, ready_count);
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(n_teams == tmp.n_teams, 'field n_teams with value `' + n_teams + '`');
    assert(n_players == tmp.n_players, 'field n_players with value `' + n_players + '`');
    assert(player_limit == tmp.player_limit, 'field player_limit with value `' + player_limit + '`');
    assert(join_code == tmp.join_code, 'field join_code');
    assert(is_public == tmp.is_public, 'field is_public with value `' + is_public + '`');
    assert(ready_count == tmp.ready_count, 'field ready_count with value `' + ready_count + '`');
    return true;
  }
  
  void UnitTest_RoomInfo_Getters() {
    Test_CheckProps_RoomInfo("�￿躮䮠馩�", 980813, 825164, 378662, MaybeOfString("꡺鼀ൃ橗븺寔옛�"), true, 14178);
    Test_CheckProps_RoomInfo("�싺", 464786, 672947, 490383, MaybeOfString("礃ឝਛ"), false, 704714);
    Test_CheckProps_RoomInfo("覧", 654758, 678612, 605730, MaybeOfString("ඵ壿綊蕣Ѳ䊣�"), true, 622511);
    Test_CheckProps_RoomInfo("윰蘆콬⨸۫芁≲", 49504, 986078, 321608, MaybeOfString("ⴐ﯐"), false, 149817);
    Test_CheckProps_RoomInfo("那", 853156, 438676, 425498, MaybeOfString("툴䜮ᚗҳ충멵ᶼ覵鲃"), true, 719653);
    Test_CheckProps_RoomInfo("�拣䵱䌏", 433840, 983172, 771070, MaybeOfString("�㶈�㻡뼇"), true, 183274);
    Test_CheckProps_RoomInfo("鏓", 6143, 168768, 469338, MaybeOfString("ﺷ蹳姈⑻㤏�撵ߨ䯂"), true, 403182);
    Test_CheckProps_RoomInfo("䁏뤥蹪", 791515, 191510, 458500, MaybeOfString("僓揱"), false, 680656);
    Test_CheckProps_RoomInfo("皌撏랭즫ᇁ﹀", 945399, 696757, 381002, MaybeOfString("∁丟두㣦瘃빻"), true, 585012);
    Test_CheckProps_RoomInfo("阚⦈郶炼", 847011, 203213, 258145, MaybeOfString("턆뙚높䋪"), true, 816997);
    Test_CheckProps_RoomInfo("㩾껫墰菌㶑ꔘₜ齬", 469838, 153273, 853065, MaybeOfString(""), true, 927946);
    Test_CheckProps_RoomInfo("ꄻ滇�ꒉ㳀䈾뙱䕂", 212605, 773342, 705388, MaybeOfString("ᒚ레"), false, 215862);
    Test_CheckProps_RoomInfo("ୣ筃痒胊의䉶杻�죝", 392980, 565032, 395859, MaybeOfString("⯃쩆搊늜"), true, 546302);
    Test_CheckProps_RoomInfo("릈䨕＠߇₹紇秉ⵑ", 982620, 978653, 334968, MaybeOfString("ꎴ흨榼"), true, 30588);
    Test_CheckProps_RoomInfo("鶧ㆌ痒㇌⋛䨗ও�", 181358, 266408, 312816, MaybeOfString("夞䫿줯"), false, 597764);
    Test_CheckProps_RoomInfo("К߄뽇㪢㸿ᓮₙ묇", 22089, 401867, 691035, MaybeOfString("嫈룭밒᥃탃�刑ᅘ鳰"), true, 454352);
    Test_CheckProps_RoomInfo("㒴퟽ᗦ㴟봨ￊￔ쥲兆", 346182, 518141, 153623, MaybeOfString("疶뫰"), false, 772861);
    Test_CheckProps_RoomInfo("", 633088, 133172, 833723, MaybeOfString("횄俁鏟灭ᶳ"), true, 418900);
    Test_CheckProps_RoomInfo("큝", 67462, 782210, 808460, MaybeOfString("퉾돂띨體"), false, 973039);
    Test_CheckProps_RoomInfo("뼊谥缃ಟ킐", 679739, 182317, 694416, MaybeOfString("Ⲃ叼熃ᐳፎ䮐잝"), false, 439297);
    Test_CheckProps_RoomInfo("郫홟㕤㫛Ҹ", 850147, 565714, 497196, MaybeOfString("娗鿍섡⁏㸸㓌"), true, 40744);
    Test_CheckProps_RoomInfo("狥Ü매", 396785, 680498, 521868, MaybeOfString("흰姺"), true, 948170);
    Test_CheckProps_RoomInfo("㧯䦴귏毥᥃嗯䵌‱", 72793, 613923, 480081, MaybeOfString("⑼驏᩽嬨默䚥�糣㊊"), false, 438389);
    Test_CheckProps_RoomInfo("镧畉弐狝פ뤫硥홅惗", 143921, 645157, 901310, MaybeOfString("탎ॡ弨犳"), true, 684445);
    Test_CheckProps_RoomInfo("檣袿", 180139, 623725, 647698, MaybeOfString("쿆蕻﬏坊₰糣䱎쪓崉"), false, 140197);
    Test_CheckProps_RoomInfo("㗟豺댜￰귥", 990522, 133511, 930210, MaybeOfString("圙枩紂鯴떩ℭ"), true, 902045);
    Test_CheckProps_RoomInfo("骗뱼扟킋泎ⲅ朓复䚃", 40648, 927132, 650605, MaybeOfString(), true, 156441);
    Test_CheckProps_RoomInfo("嬑훃덙⋵", 969195, 468413, 455407, MaybeOfString("࣓렎䰩⮵⧿堫竎绒ㅠﻬ"), false, 900907);
    Test_CheckProps_RoomInfo("啕ኞ衍蛜", 289630, 747574, 598425, MaybeOfString("Ⰼᜤ朠㹒稃⤳늽"), true, 487252);
    Test_CheckProps_RoomInfo("揉筢㲸肅瞇", 614957, 798073, 766638, MaybeOfString("了椇榩맃漾"), true, 656430);
    Test_CheckProps_RoomInfo("⦥๤즿", 449432, 307209, 349405, MaybeOfString("셝"), true, 710061);
    Test_CheckProps_RoomInfo("⵪诨⥇Ш啞婓菨", 848668, 123956, 594259, MaybeOfString(), false, 684845);
    Test_CheckProps_RoomInfo("馸", 914746, 375598, 463792, MaybeOfString(), false, 442104);
    Test_CheckProps_RoomInfo("ᩖ彐쑥밃괦", 642519, 490417, 744440, MaybeOfString("ὥ股폰拉﫜"), true, 237947);
    Test_CheckProps_RoomInfo("", 541083, 185861, 605257, MaybeOfString("잔⿴㦺暄➍屴ଳ薭ᙐ댄"), false, 988634);
    Test_CheckProps_RoomInfo("抭␹鈖躇탩뿛ၲႪ㣕ದ", 383195, 209250, 50730, MaybeOfString("Ϡᱮዖ�"), true, 80069);
    Test_CheckProps_RoomInfo("㷀뵌慔駐윳陑镉⣀跺", 801061, 237337, 427811, MaybeOfString(), false, 56836);
    Test_CheckProps_RoomInfo("⛳唏⃙㾥", 905806, 387647, 160891, MaybeOfString("㘦恿땊₏텿霈"), true, 282186);
    Test_CheckProps_RoomInfo("挂ꁪ쥫�쭑뒱", 549837, 982839, 576372, MaybeOfString("ㅝ⧲"), false, 82673);
    Test_CheckProps_RoomInfo("￨℈⩝ꝶ擆⷗륶", 974617, 284426, 833786, MaybeOfString(), false, 120825);
    Test_CheckProps_RoomInfo("ậ", 343715, 576524, 931886, MaybeOfString("蓸�"), false, 999291);
    Test_CheckProps_RoomInfo("艍큋詁棐숢嗖", 153246, 608162, 262313, MaybeOfString(), true, 566801);
  }
  
  bool unitTestResults_RoomInfo_Getters = runAsync(Tests_RegisterAll_RoomInfo_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_RoomInfo_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_RoomInfo', UnitTest_OpEqSimple_RoomInfo);
  }
  
  RoomInfo@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in name, uint n_teams, uint n_players, uint player_limit, MaybeOfString@ join_code, bool is_public, uint ready_count) {
    RoomInfo@ o1 = RoomInfo(name, n_teams, n_players, player_limit, join_code, is_public, ready_count);
    RoomInfo@ o2 = RoomInfo(name, n_teams, n_players, player_limit, join_code, is_public, ready_count);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_RoomInfo() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", 393455, 392207, 212987, MaybeOfString("ᠺ먲梏뼂"), false, 217809);
    OpEqSimple_Check("蝔ᔁ䀓⃩쭶퍉첯", 535487, 148099, 713558, MaybeOfString("꒲풜豈窏ｅ"), true, 693970);
    OpEqSimple_Check("㵣䎵甄壝玃勑", 509350, 591080, 333816, MaybeOfString("뇊챾﩯ᘞ쉓㻇娍"), true, 112534);
    OpEqSimple_Check("垛峵כֿ鐄ℛݙᚬ", 226958, 44436, 222008, MaybeOfString(), false, 749954);
    OpEqSimple_Check("ᬤ쿊", 131073, 236713, 75537, MaybeOfString("忙凌띫趻䎕䝌"), true, 133463);
    OpEqSimple_Check("㞫䫆ើ鹆ʊ", 392143, 117677, 288195, MaybeOfString(), true, 531474);
    OpEqSimple_Check("횱宙홧㉜는ꒋ㑶", 504118, 316940, 401551, MaybeOfString("뼡㾢笏㶆ʱ"), false, 145172);
    OpEqSimple_Check("", 521707, 606939, 812991, MaybeOfString(""), true, 854015);
    OpEqSimple_Check("燵㪆汀ᆣ젙娣ʱᯜ", 840953, 20188, 208909, MaybeOfString("매㘆천⥠渠ᐢ㲛"), false, 68708);
    OpEqSimple_Check("픽鳐ꈉ", 718449, 909595, 422278, MaybeOfString("묺쥷"), false, 82116);
    OpEqSimple_Check("뻹", 629572, 333348, 4203, MaybeOfString("㫕崒⁗∾웇Ⓩᱭश"), true, 632609);
    OpEqSimple_Check("ሌ괙", 559404, 726400, 207068, MaybeOfString("룠డ㫠瀚䊠齦㑭"), false, 106515);
    OpEqSimple_Check("ા즣傪꼻ᨣ㤬", 6580, 997818, 438577, MaybeOfString("縠靿ᩬ"), true, 780762);
    OpEqSimple_Check("�둕껅汆", 671624, 984599, 716978, MaybeOfString("銄ធݤ謇"), false, 317042);
    OpEqSimple_Check("⩮�ώ꒏퓂䉰", 680607, 279276, 747775, MaybeOfString("�Њ"), false, 338788);
    OpEqSimple_Check("", 774359, 831018, 184179, MaybeOfString("׊�猋┕緰튅"), true, 522160);
    OpEqSimple_Check("⛲㕤�⧙", 105782, 132045, 929297, MaybeOfString("뱉᧡⬆ꁓ縬"), true, 636291);
    OpEqSimple_Check("墨큽咪઼側똶뙈", 601038, 673623, 105608, MaybeOfString("⥶批"), true, 937519);
    OpEqSimple_Check("", 759681, 255643, 98074, MaybeOfString(), true, 985987);
    OpEqSimple_Check("ࡀ컒�粄⅝", 157952, 475985, 789265, MaybeOfString("ޓ"), false, 381895);
    OpEqSimple_Check("", 433068, 667191, 144576, MaybeOfString("砟ᙵ굩ᱟ骲盼ﰢ"), false, 992454);
    OpEqSimple_Check("ⓟ娣ዯ﷤賚�", 370081, 554833, 356165, MaybeOfString("秲櫩䗥讖宦뻸᧊㑗"), true, 578377);
    OpEqSimple_Check("﨑", 48706, 794688, 783622, MaybeOfString(""), true, 417084);
    OpEqSimple_Check("띟璦Ⴗ婑遚㌌⻄㕹", 940369, 3945, 849219, MaybeOfString(), true, 284057);
    OpEqSimple_Check("", 296593, 97859, 343909, MaybeOfString(""), true, 609845);
    OpEqSimple_Check("텩㚽댯맑", 68111, 943082, 475754, MaybeOfString("銵뒮ꬴ새櫯쩈䰏禯"), true, 941752);
    OpEqSimple_Check("罚宿㝳䵉貟↟ڹ錠", 978412, 15728, 543714, MaybeOfString("�؁૰犮"), false, 284973);
    OpEqSimple_Check("", 548055, 421894, 463120, MaybeOfString("囈椐༁틋�鯺䅷⮙"), true, 46866);
    OpEqSimple_Check("㹪쉰龊〢ᔖ̉", 323966, 493150, 371477, MaybeOfString(""), false, 607334);
    OpEqSimple_Check("ﻯ機", 971400, 756593, 196654, MaybeOfString("ည葀՗鄱쭾炞푵묺"), false, 223128);
    OpEqSimple_Check("㙫姦䟧ఊꪫ㪛숬勯ﵜ", 69302, 707858, 1447, MaybeOfString(), true, 703199);
    OpEqSimple_Check("奋豮ⴈ֑", 80547, 56148, 836181, MaybeOfString(), false, 796197);
    OpEqSimple_Check("膞坫窀훱Ⅺ", 641360, 925617, 809472, MaybeOfString("些窩遜媿餧윭ࢫꂘび"), true, 612128);
    OpEqSimple_Check("֩੿퉛꿪⹳ꈰ", 533724, 926220, 696064, MaybeOfString("陉"), true, 331215);
    OpEqSimple_Check("䣇ᚇ梅翂㳕࢏", 806802, 867988, 950426, MaybeOfString("膃"), false, 250555);
    OpEqSimple_Check("韠፧迒䌡", 299172, 932418, 445761, MaybeOfString("憚邷塙ꢖ"), false, 111470);
    OpEqSimple_Check("馺൹貈垸뀰过�", 575927, 155319, 107419, MaybeOfString("龜릇v⍱隊Ⳃ"), true, 856521);
    OpEqSimple_Check("—뜔愄츿첣⦝", 734945, 255600, 512834, MaybeOfString("淨�"), true, 401557);
    OpEqSimple_Check("汶틤榸", 303267, 239582, 15682, MaybeOfString("∆ⴝ䨥踯龂Ƞ�뱄⯈"), true, 95772);
    OpEqSimple_Check("ﳌ祊⠤❮", 598605, 571849, 480850, MaybeOfString("⏕"), true, 233142);
    OpEqSimple_Check("암䢢갎穯쎙竗硨", 333940, 20634, 443493, MaybeOfString(""), false, 24041);
    OpEqSimple_Check("", 957356, 796492, 233572, MaybeOfString("㎐꟡썇"), true, 55892);
  }
  
  bool unitTestResults_RoomInfo_OpEq = runAsync(Tests_RegisterAll_RoomInfo_OpEq);
}
#endif