#if UNIT_TEST
namespace Test_Competition {
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
  
  bool unitTestResults_Competition_CommonTesting = true
    && runAsync(CoroutineFunc(UnitTest_Common_Nop))
    ;
  
  /* Test // Mixin: ToFrom JSON Object */
  bool Test_ToJsonFromJson_Check(uint id, const string &in liveId, const string &in name, uint startDate, uint endDate, uint matchesGenerationDate, uint nbPlayers, uint leaderboardId) {
    Competition@ tmp = Competition(id, liveId, name, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId);
    assert(tmp == Competition(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_Competition() {
    print('\\$26fUnit Test Start: UnitTest_ToJsonFromJson_Competition (42 tests)');
    Test_ToJsonFromJson_Check(129450, "㳋뽄旤ᮔ﵇獣ແ", "䃧쁐욘ᱶ谛䆳ꔼ躜ಙ㟊", 673390, 116343, 181454, 620474, 767667);
    Test_ToJsonFromJson_Check(671952, "ퟶ䳟框雱燐꬝,", "", 292599, 141875, 331925, 541297, 727978);
    Test_ToJsonFromJson_Check(990778, "堉", "ｓ", 853398, 34736, 880999, 957341, 711273);
    Test_ToJsonFromJson_Check(833828, "懇�客㒞᫯볠", "朣뵧칒튪윷窋澵", 842264, 774112, 962581, 425743, 228874);
    Test_ToJsonFromJson_Check(545237, "봌彺য়ꬢ毝", "▏᯿", 8357, 740990, 125510, 201887, 700350);
    Test_ToJsonFromJson_Check(291599, "ͽ텫", "唃徭ྈ", 293608, 562436, 192429, 814563, 839750);
    Test_ToJsonFromJson_Check(493396, "", "뮏엣", 19141, 147800, 307977, 782152, 275663);
    Test_ToJsonFromJson_Check(198407, "懜翊신꨻በ↥鿊", "ᄶ窐踎", 362775, 866688, 555417, 38087, 419346);
    Test_ToJsonFromJson_Check(503262, "ꔴ㳇", "든Ηꨘ躀", 417442, 351797, 529015, 147453, 442122);
    Test_ToJsonFromJson_Check(757477, "ᣙ욗", "趀絀죤箖", 123025, 945480, 812588, 609511, 60203);
    Test_ToJsonFromJson_Check(361688, "ڑ쀈ⵗ", "벛ﳾ啃둸瀀⼸៯", 698297, 625858, 828508, 617347, 317170);
    Test_ToJsonFromJson_Check(959377, "ꒋ符䭭澀", "�", 522901, 419173, 213551, 646581, 490369);
    Test_ToJsonFromJson_Check(936231, "ᨘ퉁濑੉Ⱬꖗ႘", "뢑㖄瑁캳륣쑋", 227340, 204841, 881761, 817776, 776724);
    Test_ToJsonFromJson_Check(886650, "쐤", "쒜≁隵ꄻ�ঽ㎒�郁❨", 23152, 201380, 603151, 496393, 391375);
    Test_ToJsonFromJson_Check(928935, "ꮄ轓", "", 35974, 954857, 703353, 123726, 235631);
    Test_ToJsonFromJson_Check(777047, "閑㏲ᔲ逥좣㉒", "삒볜", 811960, 415355, 760015, 272504, 610207);
    Test_ToJsonFromJson_Check(687318, "갯䘞턜㧷わ銂⧼馣谱蘄", "䴨", 440156, 532804, 34223, 734280, 226201);
    Test_ToJsonFromJson_Check(285613, "漻拹ⓨ", "恮뺪", 526475, 999438, 811107, 354192, 471506);
    Test_ToJsonFromJson_Check(827710, "", "䐪䈞䞞䜋", 771523, 508457, 876283, 49476, 256248);
    Test_ToJsonFromJson_Check(250599, "ཎ؏쀯㖩ꅽ", "絠촊枤", 618140, 674608, 308745, 376275, 607426);
    Test_ToJsonFromJson_Check(41873, "秮鿉穏뫤", "讈䗺⼎Ԍ臋뽦殠齒䡬뾋", 245672, 817303, 44522, 911772, 12880);
    Test_ToJsonFromJson_Check(621120, "霋", "춤ᴼ馿ꞑ", 929340, 235459, 512066, 850587, 863576);
    Test_ToJsonFromJson_Check(553871, "룅", "蜰晵", 840907, 60272, 245929, 656011, 421056);
    Test_ToJsonFromJson_Check(78744, "靮垆规☉᡽햅𤋮柅", "噧㉊㚨줫⧑㙵覆ೕ", 195672, 489062, 158912, 156113, 507600);
    Test_ToJsonFromJson_Check(235111, "꼵䁹呦", "", 64905, 260294, 13752, 693335, 143856);
    Test_ToJsonFromJson_Check(506204, "ʢ", "ᢰ靡ﮃ嚄", 681867, 170734, 306458, 632656, 652417);
    Test_ToJsonFromJson_Check(740388, "祆䊼Ꙕ", "᥌⇝䱓䎸帍곔", 679849, 608847, 283554, 524348, 300962);
    Test_ToJsonFromJson_Check(104905, "", "秇⋽吢", 662721, 992645, 925671, 602002, 114641);
    Test_ToJsonFromJson_Check(379745, "軬ꇈ퉿ማ鰜㞡吂檞", "꼭㗶", 181844, 822200, 152001, 825672, 354693);
    Test_ToJsonFromJson_Check(814831, "", "쳷계쳣㪏汄ガ", 116611, 406196, 62621, 355681, 462683);
    Test_ToJsonFromJson_Check(26762, "淮듑箩厈䃐᲎暓煆", "ご䎽붏矓暴颙", 156482, 901422, 688702, 40402, 438512);
    Test_ToJsonFromJson_Check(740039, "念ꓩꦼ�୹౺삯Ϩ", "뷌齟蜰", 997977, 631049, 988710, 432442, 20231);
    Test_ToJsonFromJson_Check(116955, "⏰‖馞褗蛢䲲闞ꩍ", "೵횽祋阈熲", 890783, 322790, 990125, 709068, 645113);
    Test_ToJsonFromJson_Check(685600, "温", "襶喩ᓅ䍕", 849459, 217180, 757733, 361553, 195560);
    Test_ToJsonFromJson_Check(995705, "ᆄ浸酒袑", "婯맕赕磳섇邋�", 737608, 430147, 952656, 421799, 936335);
    Test_ToJsonFromJson_Check(748477, "狫ꙡꐳ볶烓퉨", "买嗒쫑鋋", 378234, 512291, 769500, 821203, 506456);
    Test_ToJsonFromJson_Check(763501, "뼘㽗ⷻ찄", "騀♖쥁", 462708, 692481, 250992, 112610, 176037);
    Test_ToJsonFromJson_Check(227185, "", "", 245926, 621484, 523884, 535483, 376339);
    Test_ToJsonFromJson_Check(278929, "⎈汼듿", "뀀ᵧ塻盩鮕雮亦釪", 676260, 84621, 798623, 171101, 369123);
    Test_ToJsonFromJson_Check(318861, "抈⽊얳礞", "徺〶力෎턒柬઒", 748249, 341415, 715158, 536447, 742040);
    Test_ToJsonFromJson_Check(334991, "宕助鵒㼅ရ", "尰", 276151, 776921, 800492, 242717, 43683);
    Test_ToJsonFromJson_Check(627628, "䅏᷄ꘖ蚜", "⾤ᐺ罦ᘪꮚ", 55990, 602416, 833884, 394098, 183673);
    print('\\$2f6Unit Test Success: UnitTest_ToJsonFromJson_Competition (42 tests)');
    return;
  }
  
  bool unitTestResults_Competition_ToFromJSONObject = true
    && runAsync(CoroutineFunc(UnitTest_ToJsonFromJson_Competition))
    ;
  
  /* Test // Mixin: Getters */
  bool Test_CheckProps_Competition(uint id, const string &in liveId, const string &in name, uint startDate, uint endDate, uint matchesGenerationDate, uint nbPlayers, uint leaderboardId) {
    Competition@ tmp = Competition(id, liveId, name, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId);
    assert(id == tmp.id, 'field id with value `' + id + '`');
    assert(liveId == tmp.liveId, 'field liveId with value `' + liveId + '`');
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(startDate == tmp.startDate, 'field startDate with value `' + startDate + '`');
    assert(endDate == tmp.endDate, 'field endDate with value `' + endDate + '`');
    assert(matchesGenerationDate == tmp.matchesGenerationDate, 'field matchesGenerationDate with value `' + matchesGenerationDate + '`');
    assert(nbPlayers == tmp.nbPlayers, 'field nbPlayers with value `' + nbPlayers + '`');
    assert(leaderboardId == tmp.leaderboardId, 'field leaderboardId with value `' + leaderboardId + '`');
    return true;
  }
  
  void UnitTest_Competition_Getters() {
    print('\\$26fUnit Test Start: UnitTest_Competition_Getters (42 tests)');
    Test_CheckProps_Competition(394184, "馩", "躮", 980813, 825164, 378662, 252919, 886792);
    Test_CheckProps_Competition(185139, "콠旱疍鰉橿蜽", "�싺", 464786, 672947, 490383, 813542, 54851);
    Test_CheckProps_Competition(704714, "覧", "枵ⴾ㬪●ꜛ귦翮漽똮", 12605, 372964, 622511, 937581, 265299);
    Test_CheckProps_Competition(476140, "콬⨸", "�拺윰", 321608, 715346, 402362, 548490, 493314);
    Test_CheckProps_Competition(149817, "那", "젮훇懓奲쮄⸔옯듡", 985047, 224303, 788874, 44714, 425650);
    Test_CheckProps_Competition(719653, "�拣䵱䌏", "ᇡᒧឝ", 983172, 771070, 736302, 999977, 502172);
    Test_CheckProps_Competition(837902, "儞祹㚏풓鏓윃", "揘", 401385, 290417, 254860, 984066, 544625);
    Test_CheckProps_Competition(205984, "蹪鈤ꦀ", "㎀꿈�ᴶ๏㕭∸缲䁏", 972616, 680656, 509010, 703391, 945399);
    Test_CheckProps_Competition(696757, "瀮㍿웦쭜䢝䃙�׭駭", "", 585012, 264138, 345680, 37504, 847011);
    Test_CheckProps_Competition(203213, "蝢", "弊䮷⃷", 816997, 96323, 378630, 208375, 135571);
    Test_CheckProps_Competition(428782, "옡뭱過ଚ㩕ၪ㩾", "뙱䕂륦홰떌䱇盰쩑", 428390, 96314, 704214, 611458, 678280);
    Test_CheckProps_Competition(212605, "쯳枦섍", "의䉶杻�죝ᝫ᥾鼾㮦窘", 494491, 392980, 565032, 395859, 848880);
    Test_CheckProps_Competition(330938, "Ꮍ⁭豹", "릈䨕＠߇₹紇秉ⵑ", 982620, 978653, 334968, 390076, 565396);
    Test_CheckProps_Competition(988735, "䨗ও�휋℃", "ꗸ鶧ㆌ痒㇌", 266408, 312816, 315253, 970606, 35581);
    Test_CheckProps_Competition(597764, "К߄뽇㪢㸿ᓮₙ묇", "ソ⿈鄠짭㦟茍", 920471, 402801, 865586, 505425, 454352);
    Test_CheckProps_Competition(78530, "ғ㒴퟽ᗦ㴟봨ￊￔ쥲", "쯺튯㱷ဥ院崢ꊵ", 772861, 633088, 133172, 833723, 27085);
    Test_CheckProps_Competition(506361, "嶹堠", "༏큝㫓", 67462, 782210, 808460, 108758, 772472);
    Test_CheckProps_Competition(107812, "谥缃ಟ킐⁮ꕕ뉲�工", "۟弜쌘㙛핺﫽㑪㿊", 694416, 783971, 913764, 883796, 488370);
    Test_CheckProps_Competition(949203, "", "郫홟㕤㫛Ҹ", 850147, 565714, 497196, 724861, 452001);
    Test_CheckProps_Competition(447526, "狥Ü매剟䝛튟뿎ວ", "聹匂仰䭬鹃ȟ薲", 885581, 948170, 333021, 731067, 366682);
    Test_CheckProps_Competition(72793, "⍪⧞픭蚏", "轁竁怒", 812325, 623470, 438389, 805260, 752226);
    Test_CheckProps_Competition(396439, "�淲ﺆ跏㜤샱镧畉弐", "틖ꎀ", 357901, 952652, 684445, 422863, 180139);
    Test_CheckProps_Competition(623725, "퇪㷗뚪䬹칭烈罽", "쯰㗟豺댜￰귥ጢ䨣뉐", 990522, 133511, 930210, 897441, 720999);
    Test_CheckProps_Competition(402357, "扟킋泎ⲅ朓复䚃ᖓ", "", 40648, 927132, 650605, 961252, 156441);
    Test_CheckProps_Competition(490015, "嚖竝嬑훃", "沈v鬕绽ᅧ猣", 534398, 575293, 650559, 361945, 900907);
    Test_CheckProps_Competition(753475, "鷂啕ኞ", "늋鯪섎఍䃿fྔ㐔", 487252, 847881, 974829, 739154, 174998);
    Test_CheckProps_Competition(551557, "⛥杭貴溪৥롰꬜䮖", "H", 656430, 717791, 449432, 307209, 349405);
    Test_CheckProps_Competition(96082, "⥇Ш啞婓菨뻟௎餵", "⵪", 848668, 123956, 594259, 142735, 684845);
    Test_CheckProps_Competition(571451, "", "膎", 375598, 463792, 482375, 442104, 534976);
    Test_CheckProps_Competition(802517, "䇶Ν曶됚简贙殺뱆ᩖ", "⏾齫ﾌ", 498609, 237947, 84409, 926444, 679346);
    Test_CheckProps_Competition(541083, "�ࠫ⿳훿", "铟Ꙓ鐻ų", 284881, 92853, 841821, 795081, 988634);
    Test_CheckProps_Competition(633121, "躇탩뿛ၲႪ㣕", "抭␹", 383195, 209250, 50730, 70608, 196783);
    Test_CheckProps_Competition(80069, "㷀뵌慔駐윳陑镉⣀跺", "⇐춻嶻", 56836, 500196, 187953, 516520, 961253);
    Test_CheckProps_Competition(905806, "剭ﺏ柙㕤쩢姽ἆ奨啈", "뒱㵉ꙙꌗ枚", 400614, 951189, 894450, 549837, 982839);
    Test_CheckProps_Competition(576372, "⶯", "⷗륶땣ᢦ", 163735, 364364, 558790, 849193, 814728);
    Test_CheckProps_Competition(974617, "", "ᑝ쨀飞륍虋", 833786, 120825, 886726, 873724, 994918);
    Test_CheckProps_Competition(343715, "䛳碸䀠열腺蛫", "鎫籄艍큋詁棐숢嗖ᘖ᮳", 608162, 262313, 646611, 566801, 68507);
    Test_CheckProps_Competition(524510, "ပ꙳㜢㠱뮄ᢿ砹", "뗔ゃ諪", 687975, 193210, 192542, 77285, 759445);
    Test_CheckProps_Competition(979742, "젟󇸷쾨쯚迪", "ڄ课", 889541, 778262, 501081, 742990, 906532);
    Test_CheckProps_Competition(84793, "缰", "", 400651, 599112, 304460, 19455, 910563);
    Test_CheckProps_Competition(810229, "灤览", "㘅驹劣", 478706, 227812, 429408, 429967, 78422);
    Test_CheckProps_Competition(172744, "쿏靆ﰭᖦ", "욀", 967173, 36520, 955306, 202414, 395680);
    print('\\$2f6Unit Test Success: UnitTest_Competition_Getters (42 tests)');
    return;
  }
  
  bool unitTestResults_Competition_Getters = true
    && runAsync(CoroutineFunc(UnitTest_Competition_Getters))
    ;
  
  /* Test // Mixin: Row Serialization */
  bool Test_SzThenUnSz_Check(uint id, const string &in liveId, const string &in name, uint startDate, uint endDate, uint matchesGenerationDate, uint nbPlayers, uint leaderboardId) {
    Competition@ tmp = Competition(id, liveId, name, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId);
    assert(tmp == Competition::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_Competition() {
    print('\\$26fUnit Test Start: UnitTest_SzThenUnSz_Competition (42 tests)');
    Test_SzThenUnSz_Check(823221, "�朹鎟ﳙ㻲翾鵜靀㍒", "ﰙ⠁玭텆", 325863, 922558, 661263, 436830, 437979);
    Test_SzThenUnSz_Check(281428, "⿕氎꼻㤚藴킅", "섌ሥ�밄ꊦ", 179363, 144555, 409427, 826942, 906038);
    Test_SzThenUnSz_Check(616400, "佪�", "㻥잒묑", 565451, 198964, 365118, 964654, 651288);
    Test_SzThenUnSz_Check(7008, "", "竟潔箯㉽貺ᠤᝯ", 547338, 697340, 334487, 93517, 356308);
    Test_SzThenUnSz_Check(723328, "�ౝ", "ᢐၛⶍ쎦㋥", 130027, 641708, 67877, 569276, 439305);
    Test_SzThenUnSz_Check(207150, "ﻊ爛⏂ꥏ꼼砍띑", "⤦➦踆⌾ꎳ㏰鉓켯τ", 973529, 47392, 4920, 122428, 837623);
    Test_SzThenUnSz_Check(615687, "䩸Ὼ", "", 964248, 970574, 467845, 956732, 101415);
    Test_SzThenUnSz_Check(490254, "퍻䳥最徐㭾멭Პ", "䟥ፕ⎃ﲀᦓ솛格", 234787, 700902, 853957, 759104, 336591);
    Test_SzThenUnSz_Check(877257, "᪲ꮚ", "", 45702, 896779, 485401, 405127, 314974);
    Test_SzThenUnSz_Check(151896, "巖ㅡ螘笣䨯䄸㻘궈", "⃔煡", 974529, 908297, 233268, 471390, 341399);
    Test_SzThenUnSz_Check(979997, "뙸줒女ѽ泡誄狋撧곟", "Țꡮ殴䉵庨", 161330, 809993, 973135, 540022, 466577);
    Test_SzThenUnSz_Check(344084, "殤膕躯蓬", "虻雈", 647490, 647392, 868449, 179302, 165205);
    Test_SzThenUnSz_Check(610030, "税�", "", 266937, 914118, 841929, 127972, 729161);
    Test_SzThenUnSz_Check(92, "挤", "鑚ൃ䶀椼ズꡃ᫔躹", 613456, 548818, 848229, 992004, 999781);
    Test_SzThenUnSz_Check(841877, "䯯桾뭎挘殤", "嬚魯ᄍ噕죐ᓌﻸ", 492035, 824789, 700839, 759025, 99463);
    Test_SzThenUnSz_Check(860757, "傩Ἂ嚓", "䫚蜳㽤", 10849, 185372, 191913, 58657, 652149);
    Test_SzThenUnSz_Check(575382, "", "ⳃ㩄앪衚", 128346, 859526, 830203, 657034, 818624);
    Test_SzThenUnSz_Check(606450, "₺洉疧ꅦ뭲끀䗶찀믌", "㌲㯊䂁∐⒳伷鳯⽸︧濜", 247650, 379916, 770642, 834356, 876904);
    Test_SzThenUnSz_Check(384560, "樆䶂簜饋᲏඿븹䤭ذ", "銢᜼", 168286, 980432, 494166, 450685, 913447);
    Test_SzThenUnSz_Check(380426, "ԙꇖⲽ櫉疷", "ꘓ", 252573, 449721, 421428, 437232, 360995);
    Test_SzThenUnSz_Check(43735, "䁣豅琧뗇躏òꘄ", "㊆⯟", 983651, 768217, 477588, 555890, 559916);
    Test_SzThenUnSz_Check(78214, "农陣띰摼푔⼧巇", "㸠斻ை牖Ⲋ䆮", 808646, 898762, 882280, 290313, 95401);
    Test_SzThenUnSz_Check(233228, "㌠商ᅾ鲑頸헳ᑭᷡƫ믅", "乹ﻺ鮷囫я戵", 63460, 433202, 482962, 745915, 315247);
    Test_SzThenUnSz_Check(912496, "�桮럫憍ᕝ芜쎡韠", "", 577624, 959424, 779544, 141403, 123480);
    Test_SzThenUnSz_Check(876501, "여군햛蝅縰�㔭", "ﷺ⋏晆뗭⴬똣궆", 27512, 645217, 635672, 394180, 207205);
    Test_SzThenUnSz_Check(354093, "낊㮄瓲ꔽ႙趹", "䚦럕ț頛臾ÍἩ", 168469, 571192, 936735, 281680, 40045);
    Test_SzThenUnSz_Check(491930, "욜푭沈ĉ漎", "仚饩�Ꮚ혹霭䞓盅", 66053, 821243, 312859, 716, 435581);
    Test_SzThenUnSz_Check(786075, "⿞䅰ꡉፀ븯扻ꋨ䳘쏡", "ﶾ鞞㉪屹팑", 552448, 416887, 193882, 131058, 392530);
    Test_SzThenUnSz_Check(320323, "䞓㕋", "砚乸̛瀎ᭆ", 433604, 275588, 333008, 445010, 999603);
    Test_SzThenUnSz_Check(252543, "", "㺡࣊砅", 385300, 285037, 446104, 946732, 159725);
    Test_SzThenUnSz_Check(498260, "왓꿨᳁ْଠ墻ἰ쟽뻗", "챲퉗溕㹅灜桩弜", 940335, 406575, 727940, 382451, 621003);
    Test_SzThenUnSz_Check(307142, "尷", "놲싵뇵쯷", 581686, 977267, 266241, 93150, 98007);
    Test_SzThenUnSz_Check(808501, "앛䡳", "䕯橄�㰿", 17733, 693496, 428419, 383891, 633990);
    Test_SzThenUnSz_Check(194991, "๥Ⲣ⪒冁᯳", "㭷栳ﮂ窗䊨", 373048, 125776, 148525, 409650, 374108);
    Test_SzThenUnSz_Check(989899, "쾲铃켴돺븍닑ꪐ脹窕", "옮伴ꁧⓚ", 599225, 318654, 576027, 20949, 788899);
    Test_SzThenUnSz_Check(733049, "㽙ᶝ", "", 133036, 763745, 133184, 698385, 181735);
    Test_SzThenUnSz_Check(501513, "蝶ꙵ隓臹⢺鏿ㆻಖⳡ", "�诨苵跗뼍掰圷", 605519, 420611, 454112, 550861, 181236);
    Test_SzThenUnSz_Check(462111, "憖ꀖ銱❕蒚ₖ", "纹謐ሙ䪩引", 569819, 104612, 454613, 524341, 113139);
    Test_SzThenUnSz_Check(633845, "벵殨䡍愆ᗓ", "ꤪ㙖࡮�䢌", 608287, 118864, 299984, 112382, 755332);
    Test_SzThenUnSz_Check(87422, "贉韽", "곐캼뎻튓뗽j좠", 674290, 314257, 695590, 585317, 715650);
    Test_SzThenUnSz_Check(126346, "䬦ᕴ", "氊듳쎴妓�鎐", 107095, 376242, 894787, 897768, 698855);
    Test_SzThenUnSz_Check(640500, "옉", "ᵽ쫯", 319210, 462891, 159848, 432129, 995984);
    print('\\$2f6Unit Test Success: UnitTest_SzThenUnSz_Competition (42 tests)');
    return;
  }
  
  bool unitTestResults_Competition_RowSerialization = true
    && runAsync(CoroutineFunc(UnitTest_SzThenUnSz_Competition))
    ;
}
#endif