#if UNIT_TEST
namespace Test_TrackOfTheDayEntry {
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
  
  bool unitTestResults_TrackOfTheDayEntry_CommonTesting = true
    && runAsync(CoroutineFunc(UnitTest_Common_Nop))
    ;
  
  /* Test // Mixin: ToFrom JSON Object */
  bool Test_ToJsonFromJson_Check(uint campaignId, const string &in mapUid, uint day, uint monthDay, const string &in seasonUid, uint startTimestamp, uint endTimestamp) {
    TrackOfTheDayEntry@ tmp = TrackOfTheDayEntry(campaignId, mapUid, day, monthDay, seasonUid, startTimestamp, endTimestamp);
    assert(tmp == TrackOfTheDayEntry(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_TrackOfTheDayEntry() {
    print('\\$26fUnit Test Start: UnitTest_ToJsonFromJson_TrackOfTheDayEntry (42 tests)');
    Test_ToJsonFromJson_Check(129450, "㳋뽄旤ᮔ﵇獣ແ", 191439, 86104, "䚏꼸䃧쁐", 673390, 116343);
    Test_ToJsonFromJson_Check(181454, "汯粌鉅", 259935, 975206, "䢕颒饣ퟶ䳟框雱", 292599, 141875);
    Test_ToJsonFromJson_Check(331925, "ᲊ̇॑", 138748, 606311, "摂ꖶ鍁紙", 957341, 711273);
    Test_ToJsonFromJson_Check(833828, "懇�客㒞᫯볠", 553541, 857256, "ࣅ䞚㌴⦱扬껰朣", 962581, 425743);
    Test_ToJsonFromJson_Check(228874, "봌彺য়ꬢ毝榆", 748773, 467498, "炤䩦ᛥ婫囼", 740990, 125510);
    Test_ToJsonFromJson_Check(201887, "렷뵫皼", 291599, 158796, "鞙栥唃徭ྈ佛ͽ", 562436, 192429);
    Test_ToJsonFromJson_Check(814563, "엣ᩁ㟅ഽ", 19141, 147800, "⻖蚇", 782152, 275663);
    Test_ToJsonFromJson_Check(198407, "懜翊신꨻በ↥鿊", 154767, 510442, "鶳ᄶ", 866688, 555417);
    Test_ToJsonFromJson_Check(38087, "퓹ꔴ㳇୭鹥灦", 304545, 64291, "ⷾ뮁d", 147453, 442122);
    Test_ToJsonFromJson_Check(757477, "ᣙ욗", 61424, 123025, "", 945480, 812588);
    Test_ToJsonFromJson_Check(609511, "⼸៯ꭍڑ쀈ⵗ㏬蠑", 960296, 368435, "饤浏䴾퍂蘇賻ᜳ벛ﳾ啃", 617347, 317170);
    Test_ToJsonFromJson_Check(959377, "ꒋ符䭭澀", 489123, 522901, "ᖦﭭ见禁䡼淣럸튦", 758410, 670355);
    Test_ToJsonFromJson_Check(378524, "쎧ᨘ퉁", 554346, 17181, "≨⢮舊┛輄虼裳엽", 817776, 776724);
    Test_ToJsonFromJson_Check(886650, "쐤", 235494, 8576, "쒜≁", 23152, 201380);
    Test_ToJsonFromJson_Check(603151, "龎쬩ꨝꮄ轓᧦㗭再섚", 703353, 123726, "豣閑㏲ᔲ逥좣㉒㇜ꗸ", 811960, 415355);
    Test_ToJsonFromJson_Check(760015, "馣谱蘄딙授↳웡꫎", 91151, 743344, "鈧䴨餶갯", 440156, 532804);
    Test_ToJsonFromJson_Check(34223, "颤짒傉", 285613, 999293, "恮뺪髷漻拹", 526475, 999438);
    Test_ToJsonFromJson_Check(811107, "숯䐪䈞䞞䜋歹☰�ꢶ", 771523, 508457, "来", 49476, 256248);
    Test_ToJsonFromJson_Check(250599, "ཎ؏쀯㖩ꅽ", 160914, 43093, "ħ蔋", 674608, 308745);
    Test_ToJsonFromJson_Check(376275, "㵗", 41873, 699484, "臋뽦殠齒䡬뾋뿰秮鿉", 390405, 245672);
    Test_ToJsonFromJson_Check(817303, "ᴼ馿ꞑ漆霋枒৹聸ᒢ", 615355, 929340, "", 512066, 850587);
    Test_ToJsonFromJson_Check(863576, "晵룅쪹", 859761, 840907, "꺗⯒ꊑ䐁ߠɯ밥", 457076, 470409);
    Test_ToJsonFromJson_Check(645878, "멨靮垆", 580415, 108577, "", 33888, 195672);
    Test_ToJsonFromJson_Check(489062, "㞥ۚ轔렫炙띤䮔", 235111, 448613, "⍗ꦘ疁", 260294, 13752);
    Test_ToJsonFromJson_Check(693335, "紇", 506204, 233926, "ᢰ靡ﮃ嚄", 681867, 170734);
    Test_ToJsonFromJson_Check(306458, "곔遲祆䊼Ꙕ맆晝", 147878, 934461, "䥮䒸龅鑭嵿釄⅟", 104905, 423624);
    Test_ToJsonFromJson_Check(900364, "ԈǶ봒❖耾㾃庅鿹紣ㄷ", 114641, 379745, "軬ꇈ퉿ማ鰜㞡吂檞", 918720, 181844);
    Test_ToJsonFromJson_Check(822200, "䴤䦳�榺骽䭄궉쎟", 621229, 452225, "㪏", 366477, 116611);
    Test_ToJsonFromJson_Check(406196, "㨵䓸뷐�댍〱둫鱆", 462683, 26762, "淮듑箩厈䃐᲎暓煆", 892962, 665571);
    Test_ToJsonFromJson_Check(156482, "", 688702, 40402, "ꓩꦼ�୹౺삯Ϩ죂갗", 176502, 230185);
    Test_ToJsonFromJson_Check(173718, "孃", 997977, 631049, "㞆豽몗䎇㤴諨⊐檢", 720361, 803992);
    Test_ToJsonFromJson_Check(583411, "蛢䲲", 804084, 767134, "೵횽祋阈熲", 890783, 322790);
    Test_ToJsonFromJson_Check(990125, "ᓅ䍕ꆹ温膀璠뎝⺧", 849459, 217180, "͢떳窖鬦歾䙖", 995705, 717574);
    Test_ToJsonFromJson_Check(333832, "婯맕赕磳섇邋�", 737608, 430147, "똼顯얮듖", 296220, 373373);
    Test_ToJsonFromJson_Check(471592, "Ŧ묓买嗒쫑鋋�", 769500, 821203, "笘", 818278, 885620);
    Test_ToJsonFromJson_Check(849916, "", 734977, 771244, "", 496057, 462708);
    Test_ToJsonFromJson_Check(692481, "㽇䙃珍㉡�郺黋▘녝裂", 245926, 621484, "⎈汼듿쩷ﾪ蛻紻ꕣ䞦〱", 163050, 978188);
    Test_ToJsonFromJson_Check(676260, "꜠㋆윊䰟爒ˣ", 254586, 205240, "⽊", 977269, 89105);
    Test_ToJsonFromJson_Check(814349, "℆☍஬街잜徺〶力", 334991, 935244, "鵒㼅", 98021, 676304);
    Test_ToJsonFromJson_Check(338922, "", 800492, 242717, "", 627628, 354961);
    Test_ToJsonFromJson_Check(685120, "ꮚ찌", 55990, 602416, "ⱪ탵", 394098, 183673);
    Test_ToJsonFromJson_Check(729860, "䋛頹", 903843, 272557, "黌", 82722, 754312);
    print('\\$2f6Unit Test Success: UnitTest_ToJsonFromJson_TrackOfTheDayEntry (42 tests)');
    return;
  }
  
  bool unitTestResults_TrackOfTheDayEntry_ToFromJSONObject = true
    && runAsync(CoroutineFunc(UnitTest_ToJsonFromJson_TrackOfTheDayEntry))
    ;
  
  /* Test // Mixin: Getters */
  bool Test_CheckProps_TrackOfTheDayEntry(uint campaignId, const string &in mapUid, uint day, uint monthDay, const string &in seasonUid, uint startTimestamp, uint endTimestamp) {
    TrackOfTheDayEntry@ tmp = TrackOfTheDayEntry(campaignId, mapUid, day, monthDay, seasonUid, startTimestamp, endTimestamp);
    assert(campaignId == tmp.campaignId, 'field campaignId with value `' + campaignId + '`');
    assert(mapUid == tmp.mapUid, 'field mapUid with value `' + mapUid + '`');
    assert(day == tmp.day, 'field day with value `' + day + '`');
    assert(monthDay == tmp.monthDay, 'field monthDay with value `' + monthDay + '`');
    assert(seasonUid == tmp.seasonUid, 'field seasonUid with value `' + seasonUid + '`');
    assert(startTimestamp == tmp.startTimestamp, 'field startTimestamp with value `' + startTimestamp + '`');
    assert(endTimestamp == tmp.endTimestamp, 'field endTimestamp with value `' + endTimestamp + '`');
    return true;
  }
  
  void UnitTest_TrackOfTheDayEntry_Getters() {
    print('\\$26fUnit Test Start: UnitTest_TrackOfTheDayEntry_Getters (42 tests)');
    Test_CheckProps_TrackOfTheDayEntry(394184, "馩", 888896, 284583, "⢢羋⽪㎜৏렊빬�", 252919, 886792);
    Test_CheckProps_TrackOfTheDayEntry(185139, "콠旱疍鰉橿蜽", 409104, 402441, "㘇힞", 464786, 672947);
    Test_CheckProps_TrackOfTheDayEntry(490383, "覧﶑䙢꺰ꦞᩘ鳔", 654758, 678612, "먳�⿵枵ⴾ㬪●ꜛ귦", 622511, 937581);
    Test_CheckProps_TrackOfTheDayEntry(265299, "蘆콬⨸۫", 49504, 986078, "㞪㷗᤾虝䰒ஷ", 149817, 853156);
    Test_CheckProps_TrackOfTheDayEntry(438676, "ꑙ尚豈젮훇懓奲쮄", 44714, 425650, "拣䵱䌏�㯂ᓭ", 433840, 983172);
    Test_CheckProps_TrackOfTheDayEntry(771070, "᧸䤩䇢�", 837902, 183274, "鏓", 6143, 168768);
    Test_CheckProps_TrackOfTheDayEntry(469338, "묹뭷┼쿽騍큋㈣揘䢊", 205984, 182859, "缲䁏뤥蹪鈤", 791515, 191510);
    Test_CheckProps_TrackOfTheDayEntry(458500, "賊惍됞ᨴ㪂ꦽ", 509010, 703391, "겯ƴ皌撏", 381002, 591738);
    Test_CheckProps_TrackOfTheDayEntry(926979, "䵙嗍珐瀮㍿웦쭜", 264138, 345680, "阚⦈", 847011, 203213);
    Test_CheckProps_TrackOfTheDayEntry(258145, "弊䮷⃷쨗", 816997, 96323, "㩾껫墰菌㶑ꔘ", 469838, 153273);
    Test_CheckProps_TrackOfTheDayEntry(853065, "�ꒉ㳀䈾뙱䕂륦홰", 611458, 678280, "ᤲ쯳枦섍鐷", 469141, 215862);
    Test_CheckProps_TrackOfTheDayEntry(388432, "䌽ୣ筃痒胊의䉶", 565032, 395859, "秉ⵑ᠟Ꮍ⁭豹理癙⤊", 681795, 802277);
    Test_CheckProps_TrackOfTheDayEntry(116042, "㆒刱❕騐헵�䉨⏋릈䨕", 978653, 334968, "⋛䨗ও�휋℃벷쨭욢", 27558, 40242);
    Test_CheckProps_TrackOfTheDayEntry(181358, "퍑", 315253, 970606, "森ⶍභࢆ", 742625, 707776);
    Test_CheckProps_TrackOfTheDayEntry(850420, "㦟茍沕К߄", 691035, 773592, "", 437549, 920471);
    Test_CheckProps_TrackOfTheDayEntry(402801, "Ι龲", 865586, 505425, "ￔ쥲兆崤颦", 124133, 762934);
    Test_CheckProps_TrackOfTheDayEntry(346182, "㱷ဥ院", 2628, 772861, "", 633088, 133172);
    Test_CheckProps_TrackOfTheDayEntry(833723, "嶹堠鷦耢", 418900, 147888, "칸ힼ㼓럮༏큝", 108758, 772472);
    Test_CheckProps_TrackOfTheDayEntry(107812, "谥缃ಟ킐⁮ꕕ뉲�工", 878595, 679739, "쌘㙛핺", 694416, 783971);
    Test_CheckProps_TrackOfTheDayEntry(913764, "Ҹꃈ䮣ᬬ컵嶐", 850147, 565714, "䝛튟뿎ວ扚듍꩐瘁쪟怢", 132029, 623932);
    Test_CheckProps_TrackOfTheDayEntry(761232, "聹匂仰䭬鹃ȟ薲", 885581, 948170, "㧯䦴귏毥᥃嗯䵌‱", 72793, 613923);
    Test_CheckProps_TrackOfTheDayEntry(480081, "㈾នﯸ滣轁竁怒ৈ", 623470, 438389, "镧畉弐狝פ뤫硥홅惗", 143921, 645157);
    Test_CheckProps_TrackOfTheDayEntry(901310, "䞈䚴鵁틖", 684445, 422863, "罽췜歵ȧㄚ�妐", 66200, 925238);
    Test_CheckProps_TrackOfTheDayEntry(582898, "㗟豺댜￰귥ጢ䨣뉐㕋", 990522, 133511, "", 930210, 897441);
    Test_CheckProps_TrackOfTheDayEntry(720999, "䚃ᖓ嵐䓸瀓", 303027, 462299, "扟", 965014, 40648);
    Test_CheckProps_TrackOfTheDayEntry(927132, "⋵隸꫍痈", 666968, 969195, "ꏛᐰꭢធ沈v鬕绽ᅧ", 575293, 650559);
    Test_CheckProps_TrackOfTheDayEntry(361945, "郉鷪", 753475, 684210, "䃿fྔ㐔ᡄ鷂", 409258, 487252);
    Test_CheckProps_TrackOfTheDayEntry(847881, "䮖揉筢㲸肅", 798073, 766638, "ᡶ⛥杭貴溪", 656430, 717791);
    Test_CheckProps_TrackOfTheDayEntry(449432, "긽榈俍埯퐥ঠ἗넾ᅳ", 710061, 517511, "फ़Ը㌲狊⵪诨⥇Ш啞", 594259, 142735);
    Test_CheckProps_TrackOfTheDayEntry(684845, "馸", 914746, 375598, "밃괦㮜䔐炒悄௶揸ꥒ叵", 802517, 603343);
    Test_CheckProps_TrackOfTheDayEntry(642519, "⏾齫ﾌ䳙䇶Ν曶됚简", 498609, 237947, "", 541083, 185861);
    Test_CheckProps_TrackOfTheDayEntry(605257, "铟Ꙓ鐻ų", 284881, 92853, "ದ鴆䟎他�", 412232, 772864);
    Test_CheckProps_TrackOfTheDayEntry(760754, "齪床὏勐Ⰶ�䅴抭", 80069, 437881, "嶻㐙㷀뵌慔駐윳陑镉", 237337, 427811);
    Test_CheckProps_TrackOfTheDayEntry(56836, "⛳唏⃙㾥", 905806, 387647, "쩢姽ἆ奨", 218247, 380243);
    Test_CheckProps_TrackOfTheDayEntry(958478, "솱挂ꁪ쥫�쭑뒱㵉", 549837, 982839, "⶯弸", 751600, 82673);
    Test_CheckProps_TrackOfTheDayEntry(881873, "灈￨℈⩝ꝶ擆", 284426, 833786, "蛫龆뇘ậ莻ጺ", 653535, 441910);
    Test_CheckProps_TrackOfTheDayEntry(285333, "", 999291, 706131, "詁棐", 153246, 608162);
    Test_CheckProps_TrackOfTheDayEntry(262313, "ᢿ砹罜䖈줍꾋", 727307, 109811, "", 39143, 299496);
    Test_CheckProps_TrackOfTheDayEntry(238728, "ꑆ个幚", 77285, 759445, "迪뢾풕", 391279, 933285);
    Test_CheckProps_TrackOfTheDayEntry(889541, "졠陨❝�⥉嫾쀵", 657129, 400651, "쪺⾉輖쀠껲", 810229, 594916);
    Test_CheckProps_TrackOfTheDayEntry(429882, "㘅驹劣", 478706, 227812, "", 429408, 429967);
    Test_CheckProps_TrackOfTheDayEntry(78422, "욀쿏靆ﰭᖦ涹", 967173, 36520, "ྊ䐊罶㭹뱍᭲", 530693, 384605);
    print('\\$2f6Unit Test Success: UnitTest_TrackOfTheDayEntry_Getters (42 tests)');
    return;
  }
  
  bool unitTestResults_TrackOfTheDayEntry_Getters = true
    && runAsync(CoroutineFunc(UnitTest_TrackOfTheDayEntry_Getters))
    ;
  
  /* Test // Mixin: Op Eq */
  TrackOfTheDayEntry@ lastChecked = null;
  
  bool OpEqSimple_Check(uint campaignId, const string &in mapUid, uint day, uint monthDay, const string &in seasonUid, uint startTimestamp, uint endTimestamp) {
    TrackOfTheDayEntry@ o1 = TrackOfTheDayEntry(campaignId, mapUid, day, monthDay, seasonUid, startTimestamp, endTimestamp);
    TrackOfTheDayEntry@ o2 = TrackOfTheDayEntry(campaignId, mapUid, day, monthDay, seasonUid, startTimestamp, endTimestamp);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_TrackOfTheDayEntry() {
    print('\\$26fUnit Test Start: UnitTest_OpEqSimple_TrackOfTheDayEntry (42 tests)');
    OpEqSimple_Check(393455, "ﷰ눵뭩㵷衟춗䵩", 631581, 217809, "蝔ᔁ䀓⃩쭶퍉첯", 535487, 148099);
    OpEqSimple_Check(713558, "釪�麑遬", 551494, 414864, "勑뤋펍캒", 526999, 962771);
    OpEqSimple_Check(489079, "", 509350, 591080, "璊诛퇟鯚핦壉", 643073, 272489);
    OpEqSimple_Check(645285, "כֿ鐄ℛݙᚬ", 804528, 226958, "밑幖許ᬤ쿊菆︐", 75537, 164045);
    OpEqSimple_Check(184471, "", 214810, 26440, "䫆ើ鹆ʊ冿�Ⓢꖠ⋳", 392143, 117677);
    OpEqSimple_Check(288195, "", 531474, 7923, "␜῰蹎쟳횱宙홧㉜는ꒋ", 541699, 822701);
    OpEqSimple_Check(757154, "ꨕẽ뮱", 812991, 511553, "汀ᆣ젙娣ʱᯜ鱦", 468715, 840953);
    OpEqSimple_Check(20188, "쏥䁏ਮ虴", 627814, 18103, "䀿虿", 624373, 718449);
    OpEqSimple_Check(909595, "쬟칁껁", 333641, 830012, "뻹媋", 629572, 333348);
    OpEqSimple_Check(4203, "櫇ꟙ栥鏡螫⃠嚅⒝ࣾ惝", 910388, 303381, "ꅯ껳ሌ", 726400, 207068);
    OpEqSimple_Check(397768, "꟤��뙑耽裮ዖ", 106515, 40481, "", 694261, 263);
    OpEqSimple_Check(6580, "괗饖㪟", 438577, 704848, "", 780762, 891985);
    OpEqSimple_Check(853751, "뛰", 984599, 716978, "秨玹", 814326, 317042);
    OpEqSimple_Check(332229, "ᔃ㣛צ츷⩮�ώ꒏퓂", 333922, 24944, "ᱧᫎ솠轼ⱬ褑ཧ捺슅엎", 457029, 770199);
    OpEqSimple_Check(522160, "⛲㕤�⧙", 105782, 132045, "瓪ﲥ疬᳢䩶㩒홌ꃢ｡", 364509, 925658);
    OpEqSimple_Check(909840, "콨�赭墨큽咪઼", 673623, 105608, "�丮祒蛕䥓佴", 98074, 985987);
    OpEqSimple_Check(656856, "♕共䳶넊ᙓࡀ컒�", 475985, 789265, "ꂋ", 322382, 381895);
    OpEqSimple_Check(433068, "鬻피䌱踀뤅芸", 829588, 992454, "ⓟ娣ዯ﷤賚�", 370081, 554833);
    OpEqSimple_Check(356165, "硬", 294139, 170604, "螥㗓꒭→⣦", 578377, 759825);
    OpEqSimple_Check(48706, "㕹બ⚟鰉ᡖ梉ᚭ", 877689, 112824, "㶜☭ෳ鈴띟璦", 849219, 284057);
    OpEqSimple_Check(296593, "멖�", 343909, 463281, "奺ဂ䳇텩㚽댯맑힊骝", 475754, 917838);
    OpEqSimple_Check(203988, "", 395321, 354108, "錠쟓쎭", 340979, 308928);
    OpEqSimple_Check(739364, "罚", 978412, 15728, "럢쩪媭䥿톤聿妒", 12316, 921986);
    OpEqSimple_Check(284973, "", 548055, 421894, "鬐鿹愶彄", 834401, 438887);
    OpEqSimple_Check(728516, "Ú銼", 305916, 46866, "㹪쉰龊〢ᔖ̉", 323966, 493150);
    OpEqSimple_Check(371477, "機稻�ꊈ", 971400, 756593, "믒趰忳쎓랔ꖒ鬋龕ຽҷ", 958667, 223128);
    OpEqSimple_Check(253073, "숬勯ﵜ", 263019, 69302, "圦긡㴽䷗", 1447, 703199);
    OpEqSimple_Check(927171, "濱놿宦奋豮ⴈ", 836181, 796197, "膞坫窀훱Ⅺ", 641360, 925617);
    OpEqSimple_Check(809472, "씅煍尪", 629633, 612128, "֩੿퉛꿪⹳ꈰ", 533724, 926220);
    OpEqSimple_Check(696064, "", 331215, 897341, "", 952064, 396754);
    OpEqSimple_Check(625699, "縰㷇ힾ䣇ᚇ", 250555, 553377, "枌녑埖韠፧迒", 445761, 857000);
    OpEqSimple_Check(976480, "녜뎙㾣咂", 111470, 573616, "൹貈垸뀰过", 229473, 575927);
    OpEqSimple_Check(155319, "暮㟄䷫킹륦了", 914453, 361374, "츿첣⦝脘곅䂃", 562413, 79137);
    OpEqSimple_Check(734945, "繶藩륍韚킉迊", 623898, 401557, "汶틤榸", 303267, 239582);
    OpEqSimple_Check(15682, "鍮幘滆旌Ⳮ禾ﾫ䅖", 38712, 95772, "ﳌ祊⠤❮", 598605, 571849);
    OpEqSimple_Check(480850, "ɯ䃟偶텒", 498402, 637479, "�암䢢갎穯쎙", 20634, 443493);
    OpEqSimple_Check(24041, "", 957356, 796492, "⏏᧎䫁詵䯻", 704430, 55892);
    OpEqSimple_Check(967496, "炰၃鉝✜ྦྷ擊㣙㾯", 558349, 380025, "", 544275, 930556);
    OpEqSimple_Check(471983, "沁", 287102, 274962, "休ￏ", 354149, 951957);
    OpEqSimple_Check(385338, "﷤枲ꩀ옲죥魍镠", 28598, 546073, "꼡姐䊂⤭�Ჺⅶ엱ǫ", 40492, 262430);
    OpEqSimple_Check(839490, "ꖙ∴簾", 407040, 674434, "摓릺칻", 210923, 189775);
    OpEqSimple_Check(849529, "ꍶ⨙獵鳙막퇭ꥑ", 813124, 679750, "ᨏ衔ΰ탡뒤엄闼", 74666, 414623);
    print('\\$2f6Unit Test Success: UnitTest_OpEqSimple_TrackOfTheDayEntry (42 tests)');
    return;
  }
  
  bool unitTestResults_TrackOfTheDayEntry_OpEq = true
    && runAsync(CoroutineFunc(UnitTest_OpEqSimple_TrackOfTheDayEntry))
    ;
  
  /* Test // Mixin: Row Serialization */
  bool Test_SzThenUnSz_Check(uint campaignId, const string &in mapUid, uint day, uint monthDay, const string &in seasonUid, uint startTimestamp, uint endTimestamp) {
    TrackOfTheDayEntry@ tmp = TrackOfTheDayEntry(campaignId, mapUid, day, monthDay, seasonUid, startTimestamp, endTimestamp);
    assert(tmp == _TrackOfTheDayEntry::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_TrackOfTheDayEntry() {
    print('\\$26fUnit Test Start: UnitTest_SzThenUnSz_TrackOfTheDayEntry (42 tests)');
    Test_SzThenUnSz_Check(823221, "�朹鎟ﳙ㻲翾鵜靀㍒", 141231, 325863, "藴킅Ề쯣欚엻렒哾๺⾖", 327500, 300954);
    Test_SzThenUnSz_Check(714358, "�밄ꊦ⊼", 262638, 498192, "", 179363, 144555);
    Test_SzThenUnSz_Check(409427, "瀹ፎ", 906038, 616400, "佪�", 263354, 427441);
    Test_SzThenUnSz_Check(565451, "蹟牪Ộ푲෗", 651288, 7008, "", 322150, 614406);
    Test_SzThenUnSz_Check(417104, "㯠쬙ꅇ᭧봅≹䎢竟", 337261, 394778, "㠵ᢐၛⶍ쎦㋥霈", 130027, 641708);
    Test_SzThenUnSz_Check(67877, "瞄", 207150, 392550, "ꥏ꼼砍", 966343, 542139);
    Test_SzThenUnSz_Check(990030, "⤦➦踆⌾ꎳ㏰鉓켯τ", 973529, 47392, "", 122428, 837623);
    Test_SzThenUnSz_Check(615687, "䩸Ὼ", 606676, 964248, "繤牉᳔䬳⑇勿", 490254, 320578);
    Test_SzThenUnSz_Check(583029, "솛格둪퍻䳥最徐㭾", 288796, 42061, "", 234787, 700902);
    Test_SzThenUnSz_Check(853957, "෌ᚸ", 761537, 579694, "昭剼", 896779, 485401);
    Test_SzThenUnSz_Check(405127, "궈䩓�魓쬣㸕", 227499, 571633, "ు盡ₜ阵璫⃔煡", 341399, 979997);
    Test_SzThenUnSz_Check(258409, "ѽ泡誄狋撧곟", 925854, 762338, "Țꡮ殴䉵庨", 161330, 809993);
    Test_SzThenUnSz_Check(973135, "⻖㋽", 344084, 240382, "膕躯", 991003, 730997);
    Test_SzThenUnSz_Check(820813, "ී쨳ㄤ䒹ਮ", 868449, 179302, "〿Ꝼ샛ᣱ", 881016, 266937);
    Test_SzThenUnSz_Check(914118, "㹎ӑ䞖猏", 92, 558576, "ꡃ", 297578, 12322);
    Test_SzThenUnSz_Check(613456, "殤掙얷ᐮጧ뎆", 573568, 464559, "죐ᓌﻸꚡ䯯", 300346, 447767);
    Test_SzThenUnSz_Check(195527, "樦纍ﲀ⧝�䄳", 759025, 99463, "", 909951, 951620);
    Test_SzThenUnSz_Check(840455, "䫚蜳㽤", 10849, 185372, "⯌憎祖羔ﾧ鋣ꊌ멉", 78147, 209790);
    Test_SzThenUnSz_Check(723283, "៳╝⁋컱", 830203, 657034, "찀믌聅똯샩愍", 651952, 806313);
    Test_SzThenUnSz_Check(330629, "", 116699, 616919, "㯊䂁∐⒳", 861580, 247650);
    Test_SzThenUnSz_Check(379916, "᤾", 770642, 834356, "ذ沶ꫴ痺ﾖ", 595771, 192620);
    Test_SzThenUnSz_Check(796856, "簜饋", 587261, 379807, "䷗鷪묡", 450685, 913447);
    Test_SzThenUnSz_Check(380426, "ԙꇖⲽ櫉疷", 884816, 252573, "", 449721, 421428);
    Test_SzThenUnSz_Check(437232, "Ⓘ", 360995, 43735, "䁣豅琧뗇躏òꘄ", 625722, 983651);
    Test_SzThenUnSz_Check(768217, "负釺", 477588, 555890, "麃犿", 923280, 929837);
    Test_SzThenUnSz_Check(487546, "檓㸠斻ை牖", 808646, 898762, "ﴋᮝ", 95401, 233228);
    Test_SzThenUnSz_Check(57986, "商ᅾ鲑頸헳ᑭᷡ", 505384, 263354, "箯浔陳᳚乹ﻺ鮷囫", 482962, 745915);
    Test_SzThenUnSz_Check(315247, "쎡韠ᣳ翠�", 15896, 937387, "�᧶륫삈켳劻�", 141403, 123480);
    Test_SzThenUnSz_Check(876501, "여군햛蝅縰�㔭", 558944, 587878, "ﷺ⋏晆뗭", 27512, 645217);
    Test_SzThenUnSz_Check(635672, "䞀�", 207205, 354093, "낊㮄瓲ꔽ႙趹", 680346, 153507);
    Test_SzThenUnSz_Check(335942, "䚦", 168469, 571192, "漎㛊�鉠託", 478307, 405974);
    Test_SzThenUnSz_Check(189578, "霭䞓", 148425, 947791, "鳊鍽扐肑レ", 896003, 238891);
    Test_SzThenUnSz_Check(267100, "屹팑龚", 552448, 416887, "㕋�鯃嘐ኽੱ晤斔�", 829491, 742412);
    Test_SzThenUnSz_Check(433578, "튤⟫", 333008, 445010, "", 252543, 401634);
    Test_SzThenUnSz_Check(764241, "㺡࣊砅", 385300, 285037, "뻗８ᦲ菬蜻췭栴省", 178803, 221120);
    Test_SzThenUnSz_Check(675410, "桩弜蛱왓", 717927, 8570, "ꦾ첥⡵苨앶㴗ၖ忧ⷾ챲", 87188, 226618);
    Test_SzThenUnSz_Check(571222, "饍㨋8辝쵌ᶬ놲싵", 93150, 98007, "㰿苨앛䡳␬鴎", 334966, 17733);
    Test_SzThenUnSz_Check(693496, "冁᯳Ⱄㄺ꛼㻔", 913943, 896342, "", 373048, 125776);
    Test_SzThenUnSz_Check(148525, "ꪐ脹窕ૐ취ꨟ泒擵䆲罋", 403152, 568649, "䲲옮伴ꁧⓚ紝쾲", 318654, 576027);
    Test_SzThenUnSz_Check(20949, "➵孞扎㹰㽙ᶝ㒾ⴙ荡옄", 763745, 133184, "ಖⳡ忆悑翐䈐풼仫", 985661, 412956);
    Test_SzThenUnSz_Check(219851, "ꙵ", 722283, 416051, "켊෦聁�诨", 550861, 181236);
    Test_SzThenUnSz_Check(462111, "憖ꀖ銱❕蒚ₖ", 293221, 133601, "灣眇죫ㅿ傴灲纹謐ሙ", 113139, 633845);
    print('\\$2f6Unit Test Success: UnitTest_SzThenUnSz_TrackOfTheDayEntry (42 tests)');
    return;
  }
  
  bool unitTestResults_TrackOfTheDayEntry_RowSerialization = true
    && runAsync(CoroutineFunc(UnitTest_SzThenUnSz_TrackOfTheDayEntry))
    ;
}
#endif