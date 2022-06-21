#if UNIT_TEST
namespace Test_TotdMonth {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_TotdMonth_CommonTesting() {
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
  
  bool unitTestResults_TotdMonth_CommonTesting = runAsync(Tests_RegisterAll_TotdMonth_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_TotdMonth_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_TotdMonth', UnitTest_ToJsonFromJson_TotdMonth);
  }
  
  bool Test_ToJsonFromJson_Check(uint year, uint month, uint lastDay, const TrackOfTheDayEntry@[] &in days) {
    TotdMonth@ tmp = TotdMonth(year, month, lastDay, days);
    assert(tmp == TotdMonth(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_TotdMonth() {
    Test_ToJsonFromJson_Check(129450, 573551, 355425, {TrackOfTheDayEntry(391029, "பꋣ䡓兡↉딢", 318015, 914935, "ꬨ", 882972, 710663), TrackOfTheDayEntry(355942, "簔�좕큇", 816099, 752865, "䍕᫃ᔼꊛ⍛謢䔩ᮃ", 290914, 936174), TrackOfTheDayEntry(331709, "돻딘ꃺ", 475975, 84558, "䌭덉羌ฬ擪孻", 289542, 908450), TrackOfTheDayEntry(690814, "㹦ꑳﭤℊ", 458248, 251313, "⽊럮ᬃ觱ʀሯ搑�", 587832, 695394)});
    Test_ToJsonFromJson_Check(614947, 228090, 882946, {TrackOfTheDayEntry(293608, "咧놪☼앇炄㐕", 814563, 839750, "ᩁ㟅", 357741, 149912), TrackOfTheDayEntry(8357, "䦋쁗缧ⱊﱻ狀ꆟ", 700350, 291599, "ͽ텫", 238755, 689542)});
    Test_ToJsonFromJson_Check(19141, 147800, 307977, {TrackOfTheDayEntry(568426, "뤗慵", 694964, 789918, "鵸詤ぐӵ", 321492, 361950)});
    Test_ToJsonFromJson_Check(760960, 38750, 781176, {TrackOfTheDayEntry(959377, "ꒋ符䭭澀", 489123, 522901, "ᖦﭭ见禁䡼淣럸튦", 758410, 670355), TrackOfTheDayEntry(609511, "⼸៯ꭍڑ쀈ⵗ㏬蠑", 960296, 368435, "饤浏䴾퍂蘇賻ᜳ벛ﳾ啃", 617347, 317170), TrackOfTheDayEntry(757477, "ᣙ욗", 61424, 123025, "", 945480, 812588), TrackOfTheDayEntry(899539, "Ηꨘ", 64291, 417442, "ꧾ큽ⷾ", 147453, 442122)});
    Test_ToJsonFromJson_Check(378524, 468463, 312335, {TrackOfTheDayEntry(619890, "蓼﫤䄉ꆢ귐쩱柝뙋招", 10192, 188851, "ૢ랶侥", 7765, 188934)});
    Test_ToJsonFromJson_Check(214175, 87941, 364162, {TrackOfTheDayEntry(811960, "꺒Ｅ澮", 272504, 610207, "⧼馣谱蘄딙授", 91151, 743344), TrackOfTheDayEntry(318565, "", 35974, 954857, "ᔲ逥좣㉒㇜ꗸ롼ᬁ籕", 798815, 951763), TrackOfTheDayEntry(8576, "쒜≁", 23152, 201380, "再섚ᘭ", 928935, 74150)});
    Test_ToJsonFromJson_Check(44570, 56280, 561047, {TrackOfTheDayEntry(775867, "☳憱딅", 497867, 275567, "謒鞤ᶥ톪�", 883939, 997572), TrackOfTheDayEntry(270298, "苅", 831374, 934467, "Ｈ罧", 506081, 798401), TrackOfTheDayEntry(497081, "", 131607, 237800, "䗶瘬黊ᇴ뚖ꯥ", 245860, 81540), TrackOfTheDayEntry(692390, "", 858803, 605906, "響醖첎䔻镩෾萫郅", 650080, 328084)});
    Test_ToJsonFromJson_Check(197441, 377004, 916802, {TrackOfTheDayEntry(60272, "⯒ꊑ䐁ߠɯ", 78744, 313111, "ೕ멨靮垆规☉᡽햅𤋮", 108577, 33888), TrackOfTheDayEntry(929340, "", 512066, 850587, "晵룅쪹꨽ꩾ", 859761, 840907), TrackOfTheDayEntry(245672, "ᒢ湾", 12880, 621120, "霋", 442711, 615355)});
    Test_ToJsonFromJson_Check(195672, 489062, 158912, {TrackOfTheDayEntry(826832, "濍", 466997, 726580, "", 899003, 10972), TrackOfTheDayEntry(898974, "�胛๫좧", 744885, 719322, "豦偮縼", 552097, 123526), TrackOfTheDayEntry(707791, "ጦٛꦺᙱ", 291881, 477731, "撁銹瞝", 26511, 995150), TrackOfTheDayEntry(7076, "", 974359, 382427, "", 117543, 434202)});
    Test_ToJsonFromJson_Check(887527, 241249, 846903, {TrackOfTheDayEntry(452225, "㪏", 366477, 116611, "鱆㈹�䕋", 355681, 462683), TrackOfTheDayEntry(379745, "軬ꇈ퉿ማ鰜㞡吂檞", 918720, 181844, "䦳�榺骽䭄궉쎟鷬", 788089, 621229)});
    Test_ToJsonFromJson_Check(26762, 578239, 536202, {TrackOfTheDayEntry(590010, "", 935082, 496130, "犆뗄㿻", 749041, 506709)});
    Test_ToJsonFromJson_Check(476766, 749228, 869677, {TrackOfTheDayEntry(988710, "㤴諨⊐", 20231, 116955, "⏰‖馞褗蛢䲲闞ꩍ", 302662, 890783), TrackOfTheDayEntry(192767, "蜰ộ念ꓩ", 230185, 173718, "孃", 997977, 631049)});
    Test_ToJsonFromJson_Check(322790, 990125, 709068, {TrackOfTheDayEntry(506613, "흨ﰿᭊ初�", 38087, 214393, "୅샛Ꝩ騫㡪ῥ舙鬱", 599454, 210682)});
    Test_ToJsonFromJson_Check(330876, 968295, 98773, {TrackOfTheDayEntry(653111, "똛엫ᦡ⯓Ŧ묓", 821203, 506456, "ⷻ찄䛉", 849916, 316711), TrackOfTheDayEntry(737608, "踉弹", 421799, 936335, "ꙡꐳ볶烓퉨똼", 172674, 49348)});
    Test_ToJsonFromJson_Check(734977, 771244, 845590, {TrackOfTheDayEntry(841284, "䅣", 294825, 334343, "㲠嘁첱", 822008, 371018), TrackOfTheDayEntry(106381, "⸰", 59894, 921369, "ܹ㈸襁盟駪᷑铁뮱", 609576, 696880), TrackOfTheDayEntry(324522, "껀썅虺艧", 603639, 884330, "䫞쪯㦮尭칉桸", 715973, 908975)});
    Test_ToJsonFromJson_Check(91250, 334547, 6459, {TrackOfTheDayEntry(43683, "", 627628, 354961, "ᐺ罦ᘪꮚ찌䅏᷄ꘖ", 55990, 602416), TrackOfTheDayEntry(742040, "宕助鵒㼅ရ", 676304, 338922, "", 800492, 242717)});
    Test_ToJsonFromJson_Check(833884, 394098, 183673, {TrackOfTheDayEntry(923723, "鸊䕲", 310510, 497370, "ͨﯨ", 898206, 860289), TrackOfTheDayEntry(798602, "ପ厐䗌�䫁", 692501, 707603, "耵", 715590, 185410)});
    Test_ToJsonFromJson_Check(157374, 575994, 35733, {TrackOfTheDayEntry(83873, "", 634373, 82787, "냢랙곑凋", 830567, 581720), TrackOfTheDayEntry(540486, "ᠮ裡͆⩒轖", 712383, 486223, "䦵೿緋빢毗咫㌊㧱", 823493, 248162), TrackOfTheDayEntry(681251, "Ҥ襤덌ῤ䐧", 433737, 262440, "麏", 482143, 130869)});
    Test_ToJsonFromJson_Check(582937, 514184, 119086, {TrackOfTheDayEntry(134858, "邏協걚膦", 532621, 332422, "�蛳×ᜨ稡䩧톿ޜ", 94574, 130572), TrackOfTheDayEntry(779349, "⦠쮔᪝萢䉄嗝嵾ⶻ姾큚", 698795, 443206, "⮧흯筺", 601813, 454139), TrackOfTheDayEntry(815432, "뫑不ዂ䊜봂﴿⩚�", 962674, 954905, "ꓦ挱嘏", 783074, 519114), TrackOfTheDayEntry(419168, "", 267833, 323688, "聸顤咙䤔轃�鮧ײַं〮", 861154, 905949)});
    Test_ToJsonFromJson_Check(267507, 547046, 711783, {TrackOfTheDayEntry(207714, "䍅Ꝙ袘䯞髟", 587688, 321450, "୵㘱䢨", 228408, 132636), TrackOfTheDayEntry(668195, "埈핹", 37056, 432533, "鏵밃碻ᶁ쑷폺뮾眲", 587058, 763193)});
    Test_ToJsonFromJson_Check(233611, 788811, 485983, {TrackOfTheDayEntry(15795, "넲㴝ส뺔툰氃Ꮸ㐐", 834162, 292527, "果", 535538, 260377), TrackOfTheDayEntry(865608, "㥄縄썗겼ႝ엃븸⦽擱", 498626, 121045, "鮳裴ⲍꨞ﷨뺛穿濶", 4522, 261620)});
    Test_ToJsonFromJson_Check(834404, 138067, 760178, {TrackOfTheDayEntry(157319, "茾", 926335, 29842, "臘톸", 521412, 15466), TrackOfTheDayEntry(927132, "", 913860, 390837, "馤", 973202, 814806), TrackOfTheDayEntry(650221, "倭䗷辣⇹鞫ᛙ", 776333, 8874, "呻ꆠ䆖", 179847, 20018), TrackOfTheDayEntry(560035, "", 398893, 188284, "닢", 218039, 799550)});
    Test_ToJsonFromJson_Check(725515, 556412, 89070, {TrackOfTheDayEntry(172722, "斜⭝毡쵴", 459217, 874064, "", 500669, 138574)});
    Test_ToJsonFromJson_Check(464106, 126546, 940520, {TrackOfTheDayEntry(353933, "䨶堂ú锖疊索퐔㿥ᢧ맦", 87997, 954580, "牢஬麋�縣䉁ꨆ", 138003, 351956), TrackOfTheDayEntry(921056, "灙䒷�", 451753, 310565, "쥟뽿趰", 863382, 374360), TrackOfTheDayEntry(519206, "틟ẚꙝῷ", 903474, 589811, "", 343244, 691293), TrackOfTheDayEntry(586944, "ᄙ", 717251, 825583, "�㥌쟍퐩㷬瘏�", 761946, 851937)});
    Test_ToJsonFromJson_Check(987749, 64367, 572988, {TrackOfTheDayEntry(627616, "멥阊谅좦㔧ꛝ隗", 237556, 523912, "笽ᓴ猦⩋ᗐ", 406236, 696672), TrackOfTheDayEntry(545581, "⇼鈉谯絾搷窐梁", 938543, 767444, "믥ፙ�动楚驈ⓓ꛶", 548009, 330653)});
    Test_ToJsonFromJson_Check(316638, 601213, 154834, {TrackOfTheDayEntry(213737, "ڎ⣑뿇쳚醤稡依", 301478, 994884, "䈩휲", 727473, 120797), TrackOfTheDayEntry(825455, "男�ᆰ뜬", 374434, 884509, "驸ﰹ珛㸤⇢㫢긩保", 669562, 174011), TrackOfTheDayEntry(649165, "㉐漊쎽怴闛ꈘᵮ", 292130, 298748, "〿", 533747, 910428)});
    Test_ToJsonFromJson_Check(359571, 982115, 310009, {TrackOfTheDayEntry(860234, "瑢탫콫Ⴗ鲧", 234949, 858090, "蔷核", 955505, 644419)});
    Test_ToJsonFromJson_Check(761491, 258944, 152002, {});
    Test_ToJsonFromJson_Check(351989, 507599, 783504, {TrackOfTheDayEntry(382113, "", 162899, 796322, "௣둪⸤Ὕ袧拣㰂岈", 496723, 693592), TrackOfTheDayEntry(572181, "伹└㸸", 321243, 740264, "", 126523, 663313), TrackOfTheDayEntry(873915, "㕓��㱎⃯ꎊ쀃", 181292, 805981, "⽲�鶩�頌�蘃ꞌ", 602598, 550118)});
    Test_ToJsonFromJson_Check(780123, 677191, 254849, {TrackOfTheDayEntry(69762, "ⰻ㒥ӝ�⁸�돑뻾", 695100, 897533, "呃龡웞Ꜳ噅䪂ᄞ", 9553, 802124)});
    Test_ToJsonFromJson_Check(367556, 700682, 458924, {TrackOfTheDayEntry(78749, "", 32399, 134062, "휅嘙ℊꆥ鎰쥯ⴷE", 130085, 45065), TrackOfTheDayEntry(427051, "⎜", 432249, 339765, "倖催셱", 646791, 405657)});
    Test_ToJsonFromJson_Check(112234, 465807, 467636, {TrackOfTheDayEntry(494223, "", 121892, 445243, "", 227706, 220793), TrackOfTheDayEntry(357292, "ꇽᶅ쟂ꥪ", 337131, 785572, "愆ꏞ餩ꐅ刹糝", 733367, 801785)});
    Test_ToJsonFromJson_Check(886074, 381838, 959028, {TrackOfTheDayEntry(616386, "燭뒰ꗩᅙ", 897586, 563027, "썃�㢥搩릟", 703569, 758549)});
    Test_ToJsonFromJson_Check(126303, 371445, 219428, {TrackOfTheDayEntry(214532, "硿ᨍ鲪Ω櫴븸搇娏", 908068, 382837, "픻䬔驱", 432303, 181073), TrackOfTheDayEntry(778164, "橖୪꽼", 152271, 620791, "⡶㵮섋螴磢턖灜毗ᔉ幕", 346562, 467022)});
    Test_ToJsonFromJson_Check(275368, 544196, 693177, {});
    Test_ToJsonFromJson_Check(524293, 855345, 352350, {TrackOfTheDayEntry(226312, "撘膺였睯੄莄㾡琎鱡", 464803, 72735, "қ", 961755, 904844), TrackOfTheDayEntry(181261, "", 285382, 792171, "ᘅǆ칁柴", 305212, 455742), TrackOfTheDayEntry(417054, "戌勳ꕭ㤂", 642079, 63831, "⺩뷗걲凌韵�升Ⴥ⬚唴", 87117, 763345), TrackOfTheDayEntry(417457, "ᩅ", 902883, 764765, "�滹꫺簴贳", 414015, 671139)});
    Test_ToJsonFromJson_Check(800521, 970832, 913223, {TrackOfTheDayEntry(797719, "ᖼ", 987751, 585259, "ᕲￄ蒨䢒ō", 71277, 406331), TrackOfTheDayEntry(766280, "蘨Íᦊ漋돴ὕ๒", 195095, 975712, "ਕ�䳈닡ᒳ銵", 415918, 211321)});
    Test_ToJsonFromJson_Check(945623, 36196, 264128, {TrackOfTheDayEntry(538951, "좻︀牥", 372715, 254697, "", 627880, 459048), TrackOfTheDayEntry(873516, "기禹푔簵罬m녹桏", 94448, 848695, "᭚ᐻ껚ꗻퟤ䲩㻂�", 979426, 811926), TrackOfTheDayEntry(143007, "鰔艗읝蝨䧌㟤麻蒮๢", 710445, 408487, "诫", 56294, 683680), TrackOfTheDayEntry(696747, "☮緌ꂉ쨶", 188563, 369631, "鯫鴾굋䌹，㬿뜪", 953624, 724569)});
    Test_ToJsonFromJson_Check(148563, 57403, 658389, {TrackOfTheDayEntry(456569, "㮉꤅犫壘㵺㊕", 168559, 597741, "甴四�ૐ쐓揗鿽꥟", 317842, 472463), TrackOfTheDayEntry(207061, "഍ᤵ襝籪浴腫", 66650, 541806, "葛", 47617, 162364)});
    Test_ToJsonFromJson_Check(710890, 450809, 576254, {TrackOfTheDayEntry(410682, "嶴ବ᜺䋉Ị㾹怑輎︗", 142114, 806210, "", 948879, 890722), TrackOfTheDayEntry(176599, "冚刻鯀ᛷ䘉꩏⊳巵䉌", 841450, 945229, "䥹�ᗸ뮒綳忪豘虝", 885799, 917701)});
    Test_ToJsonFromJson_Check(469870, 580434, 829197, {TrackOfTheDayEntry(217364, "㚚骋빇φล", 841997, 139538, "", 815135, 732909), TrackOfTheDayEntry(787165, "ㆥ", 647364, 528590, "齫ﭔ哙", 728028, 457624)});
    Test_ToJsonFromJson_Check(914849, 903037, 200770, {TrackOfTheDayEntry(776679, "䴧롷饧눇䜆㬸퐞", 570253, 387141, "雳ⱅ록톇伙", 760018, 457084), TrackOfTheDayEntry(960324, "觰㌓浦", 315603, 362969, "ｼ䉔㰗", 112706, 989720), TrackOfTheDayEntry(163963, "ᓍ雏댇ꭞ㇋갗畴", 216083, 310955, "샘טּ�ጔ剼 �曲ᩞ굵", 378197, 145210)});
  }
  
  bool unitTestResults_TotdMonth_ToFromJSONObject = runAsync(Tests_RegisterAll_TotdMonth_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_TotdMonth_Getters() {
    RegisterUnitTest('UnitTest_TotdMonth_Getters', UnitTest_TotdMonth_Getters);
  }
  
  bool Test_CheckProps_TotdMonth(uint year, uint month, uint lastDay, const TrackOfTheDayEntry@[] &in days) {
    TotdMonth@ tmp = TotdMonth(year, month, lastDay, days);
    assert(year == tmp.year, 'field year with value `' + year + '`');
    assert(month == tmp.month, 'field month with value `' + month + '`');
    assert(lastDay == tmp.lastDay, 'field lastDay with value `' + lastDay + '`');
    assert(days == tmp.days, 'field days');
    return true;
  }
  
  void UnitTest_TotdMonth_Getters() {
    Test_CheckProps_TotdMonth(394184, 158696, 888896, {TrackOfTheDayEntry(275550, "뢖棱꡺鼀ൃ橗븺", 738538, 868175, "暭", 87722, 931445), TrackOfTheDayEntry(388682, "", 89158, 895509, "ᣖ", 450822, 852539)});
    Test_CheckProps_TotdMonth(242516, 292448, 340145, {TrackOfTheDayEntry(438676, "ꑙ尚豈젮훇懓奲쮄", 44714, 425650, "拣䵱䌏�㯂ᓭ", 433840, 983172), TrackOfTheDayEntry(265299, "蘆콬⨸۫", 49504, 986078, "㞪㷗᤾虝䰒ஷ", 149817, 853156), TrackOfTheDayEntry(704714, "覧", 654758, 678612, "먳�⿵枵ⴾ㬪●ꜛ귦", 622511, 937581)});
    Test_CheckProps_TotdMonth(771070, 736302, 999977, {TrackOfTheDayEntry(672021, "撇寤퐫", 56077, 281728, "姈⑻㤏�撵ߨ䯂䭱", 143135, 998389)});
    Test_CheckProps_TotdMonth(838871, 271115, 83749, {TrackOfTheDayEntry(96314, "滇�", 611458, 678280, "ᤲ쯳枦섍鐷", 469141, 215862), TrackOfTheDayEntry(96323, "㩾껫墰菌㶑ꔘ", 469838, 153273, "륦홰떌䱇盰", 184404, 428390), TrackOfTheDayEntry(381002, "珐瀮㍿웦쭜䢝䃙", 585012, 264138, "蝢ᳳ쁼﬩阚⦈郶", 702564, 816997), TrackOfTheDayEntry(791515, "ꦽ㎀꿈�", 680656, 509010, "撏랭", 945399, 696757)});
    Test_CheckProps_TotdMonth(388432, 275775, 494491, {TrackOfTheDayEntry(233096, "夞䫿줯", 224795, 109476, "뼗␺", 635272, 363094), TrackOfTheDayEntry(835767, "죋穽", 161933, 299639, "ꓟ砥㜬⋣亶", 142433, 234266), TrackOfTheDayEntry(591760, "搊늜넚敦壁", 871160, 252345, "㫟슷崠ᕧ◃", 772370, 442156)});
    Test_CheckProps_TotdMonth(30355, 547373, 973491, {TrackOfTheDayEntry(506361, "嶹堠", 418900, 147888, "칸ힼ㼓럮༏큝", 108758, 772472), TrackOfTheDayEntry(454352, "㒴퟽ᗦ㴟봨ￊￔ쥲兆", 346182, 518141, "ᔻἚ쫉䶶꣰䃹눭쯺튯", 833723, 27085), TrackOfTheDayEntry(401867, "ソ⿈鄠", 920471, 402801, "Ι龲", 865586, 505425)});
    Test_CheckProps_TotdMonth(107812, 154650, 973039, {TrackOfTheDayEntry(849286, "㭐ᩳ삝뵶", 508311, 552893, "", 698153, 646593), TrackOfTheDayEntry(730044, "쮽񜋑⊳汧載ﵩ䡎ꋐﰸ", 719941, 357930, "Ⲃ叼熃ᐳፎ䮐잝", 630116, 438415)});
    Test_CheckProps_TotdMonth(694348, 348045, 7310, {TrackOfTheDayEntry(162544, "", 40744, 132029, "Ü", 761232, 396785)});
    Test_CheckProps_TotdMonth(680498, 521868, 335576, {TrackOfTheDayEntry(659923, "ნ꫃뻪㬲Մ쪬ᥕ", 753018, 694438, "紸?탎ॡ", 336464, 11378), TrackOfTheDayEntry(23189, "嬨默䚥�糣㊊Ⲕ℺", 949885, 434223, "胣颡", 733567, 350936), TrackOfTheDayEntry(740899, "ⳳ", 823370, 6804, "돖꺭齶褱炋", 573283, 272553)});
    Test_CheckProps_TotdMonth(893367, 620249, 972876, {TrackOfTheDayEntry(361945, "郉鷪", 753475, 684210, "䃿fྔ㐔ᡄ鷂", 409258, 487252), TrackOfTheDayEntry(927132, "⋵隸꫍痈", 666968, 969195, "ꏛᐰꭢធ沈v鬕绽ᅧ", 575293, 650559), TrackOfTheDayEntry(720999, "䚃ᖓ嵐䓸瀓", 303027, 462299, "扟", 965014, 40648), TrackOfTheDayEntry(582898, "㗟豺댜￰귥ጢ䨣뉐㕋", 990522, 133511, "", 930210, 897441)});
    Test_CheckProps_TotdMonth(847881, 974829, 739154, {TrackOfTheDayEntry(220917, "헜㘴䉌셝凐퓿ￅ촨", 392138, 447727, "㣄咊ꟁ䣝泵", 182673, 598027), TrackOfTheDayEntry(245770, "榩맃漾骞詻栞嶽衃", 440819, 488851, "", 42325, 763780)});
    Test_CheckProps_TotdMonth(644586, 329998, 428969, {TrackOfTheDayEntry(489560, "他�慺㗻壺旻슽", 988634, 633121, "躇탩뿛ၲႪ㣕", 760754, 963563), TrackOfTheDayEntry(498609, "澎낭荸〈韴", 926444, 679346, "⿳훿☸꤫睊", 605257, 915086), TrackOfTheDayEntry(375598, "밃괦㮜䔐炒悄௶揸ꥒ叵", 802517, 603343, "曶됚简贙殺뱆", 490417, 744440)});
    Test_CheckProps_TotdMonth(383195, 209250, 50730, {TrackOfTheDayEntry(842384, "꽾뢟⇇씓欭矻쏖", 604829, 579821, "ꧼᖝ໵㘦恿땊₏", 408024, 951090), TrackOfTheDayEntry(960197, "肬區뫴ᵼ뾆ᛷ䩶Ϡᱮ", 56846, 536509, "᷸໗䅿ꦧ죨枂᜕", 757638, 685441)});
    Test_CheckProps_TotdMonth(629387, 861971, 206838, {TrackOfTheDayEntry(366742, "ᢦ폛", 82673, 881873, "灈￨℈⩝ꝶ擆", 284426, 833786)});
    Test_CheckProps_TotdMonth(120825, 886726, 873724, {TrackOfTheDayEntry(269596, "蹘ŷ뇉ᝁ", 257288, 868628, "", 967723, 55659), TrackOfTheDayEntry(680932, "蓸�舆", 542936, 5170, "⚶η", 439306, 861730)});
    Test_CheckProps_TotdMonth(200019, 690154, 271911, {TrackOfTheDayEntry(889541, "졠陨❝�⥉嫾쀵", 657129, 400651, "쪺⾉輖쀠껲", 810229, 594916), TrackOfTheDayEntry(238728, "ꑆ个幚", 77285, 759445, "迪뢾풕", 391279, 933285)});
    Test_CheckProps_TotdMonth(429882, 475422, 89833, {TrackOfTheDayEntry(550737, "洂겿躂노闗", 208373, 659544, "ᘫ턒ዳ纉彾࿅ఱꉦ咙㡺", 595033, 77878), TrackOfTheDayEntry(567517, "鰸ꆕ⺕缫茧餌", 34562, 961228, "ᆵ춳Ầ", 632578, 795357), TrackOfTheDayEntry(346080, "됧ꖮꔂઆ雀", 125245, 384998, "靡힥虻鸞儸呔嵭", 563227, 406325), TrackOfTheDayEntry(854823, "㕵ｴ鼁蓔浏඾繫", 97523, 970640, "ꢍ灰㩈㉡", 819909, 895348)});
    Test_CheckProps_TotdMonth(517551, 459941, 598321, {TrackOfTheDayEntry(833518, "쓼", 410924, 483718, "", 514523, 660373), TrackOfTheDayEntry(3143, "�䂁ㅽ", 549334, 948044, "廒ㇱ팜锏▽ꇲ", 77868, 431019)});
    Test_CheckProps_TotdMonth(762405, 237771, 175415, {TrackOfTheDayEntry(934864, "Ṑ蝫", 359901, 882723, "룹螈蘰⩉呢", 480955, 259244), TrackOfTheDayEntry(483702, "欬ጪ쥒", 81624, 316700, "", 872577, 344381), TrackOfTheDayEntry(216093, "땳쎢䓲", 65598, 209302, "", 657445, 404414)});
    Test_CheckProps_TotdMonth(458208, 407207, 215478, {TrackOfTheDayEntry(550387, "췥뾴ⴾ愫팹룼崬銌", 647747, 215935, "䗗ꕩ髽", 176023, 248619)});
    Test_CheckProps_TotdMonth(192100, 791278, 12574, {TrackOfTheDayEntry(314689, "푥ఽ슆즠裘쾕䮝�દ", 241452, 155058, "屳", 345955, 654464), TrackOfTheDayEntry(95998, "", 442167, 504356, "�ꦸ슇", 363266, 28052), TrackOfTheDayEntry(510246, "᪄녪꒻⼧闂Ꭴ", 493987, 994988, "퉡ꥍ罫䵮", 794865, 567491), TrackOfTheDayEntry(843363, "跰䃟삢〨휓퀒᯺", 776838, 914143, "₎ㄊፂ�꿘腷頀", 918951, 77409)});
    Test_CheckProps_TotdMonth(858338, 16302, 218359, {TrackOfTheDayEntry(204177, "⑾⿚锔ﴫ", 376450, 425535, "종ᕉ", 638707, 393001), TrackOfTheDayEntry(382892, "窺◫Ī ", 972215, 813043, "㙬ͳ邊迬", 973286, 978830), TrackOfTheDayEntry(923497, "�だ⾗믅⌌▏�쒿뱴", 163447, 420662, "㝎那끧߿栚", 559176, 215951), TrackOfTheDayEntry(583514, "", 251270, 850515, "鷞≦烛ྦ蠔嬙వ", 182052, 209998)});
    Test_CheckProps_TotdMonth(753390, 647034, 50284, {TrackOfTheDayEntry(482767, "", 34956, 88304, "", 31858, 26954)});
    Test_CheckProps_TotdMonth(142000, 90852, 949284, {TrackOfTheDayEntry(565833, "螯ꢁ", 21914, 119397, "薦䜾ຩῐ朿丯", 325561, 367419), TrackOfTheDayEntry(863518, "䗜띪", 708222, 362400, "㶜⸉⁭䥉腪壋⣮坐", 200762, 94034), TrackOfTheDayEntry(616920, "பY壂㖖", 60574, 518716, "辞羡褡✸", 781467, 275720), TrackOfTheDayEntry(649645, "�졪᤼蟋嵨㟠㕆蔎", 615038, 802924, "쥎洺툯࠙㯫榲⒦䂮", 363604, 983241)});
    Test_CheckProps_TotdMonth(782099, 802745, 524932, {TrackOfTheDayEntry(459353, "Ж꾟눗ᠤጾ焤", 753522, 778649, "ѳ㣄쌀㷨䓜诽舁", 892101, 852114), TrackOfTheDayEntry(681803, "偿紥ᩎ", 950475, 77927, "⑹箜芘뱷᪊", 224748, 949125), TrackOfTheDayEntry(302803, "ꭸせ泴볹䰝Ḍ⁭", 261816, 469386, "惺敚ꊔ䝻", 996571, 165383)});
    Test_CheckProps_TotdMonth(32181, 657970, 732857, {TrackOfTheDayEntry(87168, "恜퉜", 475748, 957885, "ണ�拼ᤩㄛ嶂�浼", 942830, 950069), TrackOfTheDayEntry(865735, "皚ᮎ씮䡨瞠ⶐᮌ翪ৢ", 509571, 477762, "纄", 956196, 729010), TrackOfTheDayEntry(316128, "䇑홂᫐퓙쌄", 2630, 182479, "봣쩰ᾑ笍", 710033, 151001), TrackOfTheDayEntry(324463, "", 934737, 123053, "ﵥ⁥㦠ꣃ뛉椪ƫ镆", 152597, 493238)});
    Test_CheckProps_TotdMonth(241230, 693739, 622834, {TrackOfTheDayEntry(412371, "�偣鍝帽䟚顑", 609392, 103591, "榮￬뜙吖", 279761, 849949)});
    Test_CheckProps_TotdMonth(48039, 694053, 196907, {TrackOfTheDayEntry(129909, "횳襹젡䒲ੲ쟗퀵㙙頻", 882374, 506010, "�ᎆ䉫ᶉ␠", 336553, 978008), TrackOfTheDayEntry(319728, "귎⛻鯋፮곫퉥ᐶ", 317721, 103831, "邩䘸", 784379, 293743), TrackOfTheDayEntry(842090, "筌杷譛", 817370, 485225, "鄠殺⤎", 946422, 58037), TrackOfTheDayEntry(563838, "耿ᨈ蒁Ʞ㙖㲶㙢", 333280, 262291, "똭丢먊ਏ�", 512181, 619737)});
    Test_CheckProps_TotdMonth(458079, 851878, 721384, {TrackOfTheDayEntry(433043, "뵚ㄲꞨ欸龲旆͍褓", 776262, 366119, "᭩⥼ᶈꗏ噹嫔ꫲ솬뮟袢", 652023, 663073), TrackOfTheDayEntry(603892, "娟聣쵑", 4577, 377251, "쁘旨", 831714, 844363)});
    Test_CheckProps_TotdMonth(386831, 474189, 967453, {TrackOfTheDayEntry(205656, "", 80022, 359111, "瑄ଁ騊㷘鰹", 678298, 558358)});
    Test_CheckProps_TotdMonth(54167, 231467, 217880, {TrackOfTheDayEntry(172081, "靐�昂㉆⭺쌵䫲鈅", 554498, 55690, "繜㤨젬", 179703, 651305), TrackOfTheDayEntry(944086, "", 567314, 362508, "Ӯ绰ሤ粼䊍檭祬훼▜ऺ", 711918, 62484), TrackOfTheDayEntry(710139, "♓⺔ⓗ", 998215, 368372, "", 577768, 187845), TrackOfTheDayEntry(161390, "왟跢뀳祐䊃眏妀켛", 815126, 613560, "玼勢넕ꕿ䗲鞼⠆띠", 531034, 924690)});
    Test_CheckProps_TotdMonth(635631, 847697, 271016, {TrackOfTheDayEntry(775944, "ᢩ龎꽃魝愯兝⢛", 808693, 862152, "随₡쵱﫮", 574564, 174949), TrackOfTheDayEntry(215556, "閫ጒ쿟�蠝⍸⭫", 743803, 65936, "", 831613, 460842), TrackOfTheDayEntry(735878, "౟稵愫뿱悜놁해", 324832, 563040, "", 691571, 867767)});
    Test_CheckProps_TotdMonth(450009, 641966, 644681, {TrackOfTheDayEntry(344178, "밪䇎藢窱ﯜ㤽婑䈅쯇", 590747, 515012, "蓮ᔋ辥嬋첪哻", 809599, 999056), TrackOfTheDayEntry(568999, "웍錻ഝ上亖䎜滺", 906881, 638773, "ퟷ점型噑灊鶢씧邜", 663108, 664882)});
    Test_CheckProps_TotdMonth(658571, 956855, 591297, {TrackOfTheDayEntry(677003, "ﺶ솊姿㋿", 380763, 265731, "", 843069, 12788), TrackOfTheDayEntry(456430, "蹛㪵⭍ȃ䞋ቭ괟헽", 564560, 939514, "抽�", 676238, 250613)});
    Test_CheckProps_TotdMonth(195689, 190240, 192597, {TrackOfTheDayEntry(815476, "観諧靂腏ૃ", 424238, 82251, "ꘋ耬ꅿ顿칆䢛쌂겉뇶", 474703, 433103), TrackOfTheDayEntry(52125, "⬿፮覦꧛㒿콇娤嬟삩뛋", 824434, 98643, "캶痉כᜄ", 354376, 602832)});
    Test_CheckProps_TotdMonth(634476, 915909, 877485, {TrackOfTheDayEntry(338547, "쓰蠸皁ꙻ쑴≻尺㝁ࡍ", 982442, 518483, "", 479399, 262868), TrackOfTheDayEntry(666497, "㬾㼱艻㋌⳹갨㠸", 104943, 445151, "릃⃶㨀幺՜硃Ј", 591780, 80829), TrackOfTheDayEntry(787742, "゚轋蛱弰뀿屑", 69358, 118685, "ꀊಷࡑઙ⶛�璕", 778520, 625641)});
    Test_CheckProps_TotdMonth(18887, 132753, 773745, {TrackOfTheDayEntry(70746, "Ț庅뜡睰㢑荙", 784328, 44581, "ﾧ㤌�瞼煮前", 458846, 696321), TrackOfTheDayEntry(536643, "澻換٨蛎찥쟟憒", 484295, 114022, "ᤗ柶濿璕㩀", 172600, 701190), TrackOfTheDayEntry(312956, "椢졻ꔱ浓巚೚㇢", 65090, 593609, "", 961392, 451485), TrackOfTheDayEntry(57061, "�", 723955, 826022, "爤ᅌଃ", 191243, 164378)});
    Test_CheckProps_TotdMonth(198776, 745667, 618069, {TrackOfTheDayEntry(629178, "䀾챹鄎汧", 767536, 106401, "ۙㅱ", 339552, 213273), TrackOfTheDayEntry(959484, "犎㚌", 705480, 521770, "ﻳ㭕㐄鶽�", 81470, 381849), TrackOfTheDayEntry(71514, "紙", 85457, 158264, "", 734619, 350284)});
    Test_CheckProps_TotdMonth(349632, 181844, 420578, {TrackOfTheDayEntry(703669, "콁梯ᨛᒍ", 769397, 486166, "伐", 519461, 816223)});
    Test_CheckProps_TotdMonth(323527, 937474, 844201, {TrackOfTheDayEntry(818325, "짼퉧ۇ㘻�龈ĕ怋", 179836, 612335, "睇֖蕫卮ﷁ퇮瘌", 469325, 793180), TrackOfTheDayEntry(132655, "劢鰇ꅏ䨽唱�욟묙", 139690, 662073, "㊯轈ﲄᱰُྞᰉ", 908265, 339277), TrackOfTheDayEntry(30670, "彧�騺索㤓늗쥠", 319478, 681394, "ᮠ", 82664, 54002), TrackOfTheDayEntry(119678, "쌂", 516796, 384092, "毨悌", 752191, 599090)});
    Test_CheckProps_TotdMonth(443819, 932960, 445031, {TrackOfTheDayEntry(277194, "켿චჼ䆱⤙夙䦛፜", 684782, 808359, "୘⫞嗚톔�枎낀�", 585555, 539488), TrackOfTheDayEntry(757781, "멖闬胨굮ⲇ婗뿳ꇥ", 656419, 663540, "㗲믐贶䭴횥弞", 277147, 433592)});
    Test_CheckProps_TotdMonth(692906, 17065, 602137, {TrackOfTheDayEntry(152116, "�", 276178, 676994, "꽎", 595820, 993529)});
  }
  
  bool unitTestResults_TotdMonth_Getters = runAsync(Tests_RegisterAll_TotdMonth_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_TotdMonth_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_TotdMonth', UnitTest_OpEqSimple_TotdMonth);
  }
  
  TotdMonth@ lastChecked = null;
  
  bool OpEqSimple_Check(uint year, uint month, uint lastDay, const TrackOfTheDayEntry@[] &in days) {
    TotdMonth@ o1 = TotdMonth(year, month, lastDay, days);
    TotdMonth@ o2 = TotdMonth(year, month, lastDay, days);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_TotdMonth() {
    OpEqSimple_Check(393455, 392207, 212987, {TrackOfTheDayEntry(60415, "怉嗣ᮌ曄ꚉ桀楫", 142480, 260320, "ᯱꛞ쏒", 631652, 156001), TrackOfTheDayEntry(366202, "풜ᬃ⿠", 75238, 601448, "쪁ᆬ鬹⁺詘", 940382, 776509), TrackOfTheDayEntry(684010, "", 66438, 618336, "呝쵄ᛱ떡", 511262, 903418), TrackOfTheDayEntry(860435, "ỉ꟢펫픶ᠺ먲", 26686, 665920, "", 214613, 999074)});
    OpEqSimple_Check(536782, 810716, 833738, {TrackOfTheDayEntry(7923, "␜῰蹎쟳횱宙홧㉜는ꒋ", 541699, 822701, "", 179642, 145172), TrackOfTheDayEntry(26440, "䫆ើ鹆ʊ冿�Ⓢꖠ⋳", 392143, 117677, "鎤쎣", 288195, 531474)});
    OpEqSimple_Check(521707, 606939, 812991, {TrackOfTheDayEntry(106739, "≱髀饁䱯淵す㫕", 336680, 741928, "⤓", 791899, 539265), TrackOfTheDayEntry(468333, "䜧侉", 304368, 940342, "胤ⲞꫢᲉ䞧શ�䔘", 379761, 187689), TrackOfTheDayEntry(765765, "매㘆천⥠", 629307, 455759, "藹㴮ｃ⳺뚁ޜ慹﮽ꫤ", 609141, 876624), TrackOfTheDayEntry(999207, "霍뗒떚核륙", 502024, 391329, "꛴倒஢旨", 658055, 862477)});
    OpEqSimple_Check(92364, 884234, 211191, {TrackOfTheDayEntry(106515, "ા즣傪꼻ᨣ㤬", 6580, 997818, "", 438577, 704848)});
    OpEqSimple_Check(780762, 891985, 853751, {TrackOfTheDayEntry(716907, "䯲⏔銄ធݤ謇든㣗", 833194, 657115, "侮ꀵ", 695267, 925392)});
    OpEqSimple_Check(535344, 527857, 819938, {TrackOfTheDayEntry(774359, "ᱧᫎ솠轼ⱬ", 457029, 770199, "�⧙", 358437, 432666)});
    OpEqSimple_Check(105782, 132045, 929297, {TrackOfTheDayEntry(350295, "᧊㑗蟒⌧", 694240, 310600, "鎘⠨ᄇឰ졸畞锑", 800263, 642478), TrackOfTheDayEntry(753539, "�⺭é췍砟ᙵ굩", 276400, 926264, "殺荼", 627673, 959091), TrackOfTheDayEntry(897962, "ঞ꼥ᗁቲ堽ᬵ꽧ﺵ", 27811, 783297, "扮깡㸵괬춣", 39828, 481138), TrackOfTheDayEntry(243032, "㵅绰혏牒", 594924, 97497, "ꨉ�툱ฃ爯䑫ⵙස銰ၧ", 929569, 511824)});
    OpEqSimple_Check(569423, 617826, 568502, {TrackOfTheDayEntry(112824, "㶜☭ෳ鈴띟璦", 849219, 284057, "", 296593, 97859)});
    OpEqSimple_Check(343909, 463281, 327759, {TrackOfTheDayEntry(6880, "૰", 361522, 557596, "啴㟡䂸☸便", 33842, 410162), TrackOfTheDayEntry(62424, "ꡂ၌鳿윀꡴⻜銵뒮", 217154, 766948, "㴱皀", 69729, 884034), TrackOfTheDayEntry(410731, "쎑ˬ퍪", 211152, 705593, "栭", 582502, 171082)});
    OpEqSimple_Check(835211, 290586, 543146, {TrackOfTheDayEntry(253073, "숬勯ﵜ", 263019, 69302, "圦긡㴽䷗", 1447, 703199), TrackOfTheDayEntry(371477, "機稻�ꊈ", 971400, 756593, "믒趰忳쎓랔ꖒ鬋龕ຽҷ", 958667, 223128), TrackOfTheDayEntry(305916, "輨", 460774, 574276, "", 323966, 493150)});
    OpEqSimple_Check(927171, 714203, 948126, {TrackOfTheDayEntry(35384, "飼膃峧䟒⹗㭁왓ꄟ", 43563, 696392, "", 57002, 584081), TrackOfTheDayEntry(894415, "弋ꑓ踠䦺褃", 878514, 492262, "쾙樂⏭⾗꟬陉", 42866, 410482), TrackOfTheDayEntry(572024, "媿餧윭ࢫꂘ", 665073, 666256, "䮰䗦悛燓", 563843, 181762), TrackOfTheDayEntry(708209, "䊀덒턗屷硷ﵜ⫌", 640546, 486696, "ඟ姡�럴咨ᮭ岾＄", 292877, 851901)});
    OpEqSimple_Check(341514, 338233, 198145, {TrackOfTheDayEntry(445761, "녜뎙㾣咂ﱉ皾澐", 111470, 573616, "൹貈垸뀰过", 229473, 575927)});
    OpEqSimple_Check(155319, 107419, 915066, {TrackOfTheDayEntry(640719, "줼歓퐍⟳庶✨淨�薮", 554187, 837917, "", 971554, 693589), TrackOfTheDayEntry(735085, "龜릇v", 386263, 469778, "㻢뜵㺸䞭", 733738, 183627)});
    OpEqSimple_Check(71603, 151434, 970359, {TrackOfTheDayEntry(74974, "", 504468, 932869, "낤햳釽⛧옩炰၃鉝✜", 471983, 508026), TrackOfTheDayEntry(47111, "䫁詵䯻꼊赖뇁", 652683, 462606, "뀁م", 55892, 967496), TrackOfTheDayEntry(838732, "", 406292, 109178, "扁拚ꑧ⩱ꛏ�암", 443493, 24041), TrackOfTheDayEntry(677295, "❮뙡여䯥鍮幘滆", 986198, 598605, "ɯ䃟偶텒綒搅聍", 498402, 637479)});
    OpEqSimple_Check(929051, 287102, 274962, {TrackOfTheDayEntry(361318, "勫Ꭼ頰ㇹ", 949731, 981280, "﨡鐹潾쬨", 62975, 19538), TrackOfTheDayEntry(975296, "食ꆔ뾘�浹珩", 605805, 889660, "䉕ꐡ딞눼诠ﱐ윍", 506976, 595630), TrackOfTheDayEntry(149093, "瑨ᘂㄺƫ", 357193, 869994, "岳뗭蜢穽ᓪ", 831702, 803513)});
    OpEqSimple_Check(996245, 955059, 917233, {TrackOfTheDayEntry(994879, "", 512875, 164296, "๋캌涒誀叞㇘㌬酉", 83341, 728813), TrackOfTheDayEntry(765047, "�房댬㾑ໞ탬鏩Ⓜ", 346449, 602322, "", 102070, 771852), TrackOfTheDayEntry(114857, "", 353682, 951824, "ἄ辰思莽䱪㪪䀷픿ᨏ", 121859, 894972)});
    OpEqSimple_Check(537856, 297461, 629495, {TrackOfTheDayEntry(571385, "驠⟉灐퇽멱䇹筽㪥듚", 400151, 568006, "馌⬝ᒄᤊ䳥㳏", 847887, 496040), TrackOfTheDayEntry(776699, "吏뽑Ϣ儦", 464965, 121879, "�ڻ", 914953, 242423), TrackOfTheDayEntry(911530, "譁⻌閉笢뾊", 269383, 284635, "ꚍꖂ翏", 103144, 71814)});
    OpEqSimple_Check(670646, 967331, 975449, {TrackOfTheDayEntry(28953, "곔櫽ꐫ␓쌍油蒨騵岌", 718283, 904672, "ڷ寀�", 294580, 411439), TrackOfTheDayEntry(611520, "Ꮪ⹅㫋�べ", 530481, 340379, "毰덷僀ᖊ", 21957, 60435), TrackOfTheDayEntry(814427, "�쓩�噊딠㶷蠃ᚙ", 790689, 201495, "ꭰ蘣㴧튂䄕᳂꛰판눮", 41300, 364434)});
    OpEqSimple_Check(825471, 178160, 509565, {TrackOfTheDayEntry(829967, "踝悐䷴╱赏", 59634, 83712, "ﻲ扦ㄤ䣛䯬䴻", 721879, 494954)});
    OpEqSimple_Check(933997, 635474, 104954, {TrackOfTheDayEntry(818533, "况脪㢒⻋忡過", 936371, 854275, "ᇭ묽ᴂ㰶", 937115, 584989), TrackOfTheDayEntry(59051, "Ỵ莙▸뇺扐葁", 905196, 734911, "ꃥ촄", 209115, 19479), TrackOfTheDayEntry(974123, "ᘟ", 995308, 374859, "ீ憨ቒ녈㰚", 804429, 929767)});
    OpEqSimple_Check(886773, 93883, 600996, {TrackOfTheDayEntry(508756, "푅集ꦫ", 207888, 977132, "朲쪗ࡤዒ桠", 131544, 294880)});
    OpEqSimple_Check(121888, 445108, 938316, {TrackOfTheDayEntry(958543, "㤾䝤㰯䕼", 192506, 968112, "㛠஑뚀�", 458117, 481910), TrackOfTheDayEntry(363250, "�黾ᔏ셂몚첈㋨츌䞸", 913031, 382766, "沗怛쯂Ӑ铨䄴ꓛ廉ཝ", 416888, 38977), TrackOfTheDayEntry(639128, "", 310993, 540887, "鈷兔呃율ᤞ鍜ꆟ翌", 717346, 22390)});
    OpEqSimple_Check(863805, 189651, 33867, {TrackOfTheDayEntry(504893, "ᴥ䂽", 469495, 594293, "", 822586, 163966), TrackOfTheDayEntry(2664, "", 950231, 698692, "", 396623, 154699)});
    OpEqSimple_Check(255579, 106280, 354006, {TrackOfTheDayEntry(576553, "烖ᩬ䎠", 138796, 152750, "", 302345, 926855), TrackOfTheDayEntry(556133, "ퟄ䬰왊姭칲ﲤ荏嬸虶", 507012, 415114, "쭖㟧", 649838, 745545), TrackOfTheDayEntry(122070, "昳占㵊㱲﹒푽씛듷", 59131, 661963, "ᆠ", 841605, 196061), TrackOfTheDayEntry(671591, "ᱝꕮ餗", 734449, 710152, "ᓊ鹿ݚ띤⻧⾁ᱡ䋢ฅ", 569972, 753179)});
    OpEqSimple_Check(163241, 178350, 527494, {TrackOfTheDayEntry(723929, "棁༙㭮嗷㠽�", 203441, 984216, "晇巒쮭龥俩嬬≵疯", 613868, 157093), TrackOfTheDayEntry(983930, "ᔲ疡谉", 991643, 531510, "狲篌髋ᕀⲑ症鿸큿㱘", 194512, 944361), TrackOfTheDayEntry(704184, "ʏ㾕臨", 56177, 217295, "", 399294, 140854)});
    OpEqSimple_Check(984573, 826335, 635044, {TrackOfTheDayEntry(59487, "띣莹⫖㺄録캊偛", 830229, 323301, "ࠄ裞ꥭ峘갤噴崤", 896538, 516893), TrackOfTheDayEntry(300386, "葎푔ﻖ䋘", 664123, 769864, "⽷먍汃", 265046, 188794)});
    OpEqSimple_Check(185454, 594357, 679607, {TrackOfTheDayEntry(197788, "廚", 3612, 376259, "쏳费糸荺伡燌௏", 520926, 983193), TrackOfTheDayEntry(878180, "䷀㨌�", 7114, 525746, "璡⩘烈ઓ籎뵡㨸", 77710, 829453), TrackOfTheDayEntry(957251, "팰䎊葥汿뗼", 572803, 675697, "镄辠㼉瑸ꤰזּ窞璫", 802978, 824489)});
    OpEqSimple_Check(265388, 257623, 65901, {TrackOfTheDayEntry(76141, "끭嚵陲�耝뼮鑟➙", 295517, 493338, "ਞ杻뾬℟맏ি䋫鬿鯪", 87241, 285003), TrackOfTheDayEntry(685121, "퐌쮧㏡륳덏꽠枕뵷", 19759, 290517, "�掌�ﮁ�", 154919, 743061), TrackOfTheDayEntry(524957, "䱹頶ꂨ걜㨧⯾淂꒟", 65485, 622874, "츀М符푰", 199060, 928239), TrackOfTheDayEntry(348126, "㥻䴚꒦틆⿄", 488582, 686960, "⶘⁌뙦鰠ﰁど谙퉑", 723337, 749701)});
    OpEqSimple_Check(814048, 386906, 981241, {TrackOfTheDayEntry(659188, "䓚", 878331, 240064, "", 436916, 187315), TrackOfTheDayEntry(880535, "덥胹苢ꆟ栈詠彨⭿띄", 915457, 621326, "", 199558, 405873)});
    OpEqSimple_Check(620479, 212585, 795230, {TrackOfTheDayEntry(412341, "倏叉檩浐瞹◌욡", 777220, 88301, "ܨmꉎ�ﲾ⾻㍷", 77271, 322016)});
    OpEqSimple_Check(981507, 51627, 654535, {TrackOfTheDayEntry(38045, "뽋矧炋", 919408, 185475, "셎㖉뭣粒䠖ꢜ鸑ᬙ", 137666, 198709)});
    OpEqSimple_Check(885643, 625526, 737538, {TrackOfTheDayEntry(320678, "縋餠펜銆꼡ѣ把䰱", 800825, 436848, "֥嬼", 344855, 322917), TrackOfTheDayEntry(171983, "ꪞ⹥돝鹁ྈ杫૳ꁦɹ�", 314680, 525116, "➤⛄䇼�ෳ", 219612, 166271), TrackOfTheDayEntry(762781, "䬰鐾㌉앷", 874590, 187517, "垶훪롾㐱ం⮌", 346122, 806940)});
    OpEqSimple_Check(935893, 616967, 289992, {TrackOfTheDayEntry(592747, "﷜ᬁ", 581327, 90446, "ⲛ㱡鷊좑袆뷢斩", 8704, 51681), TrackOfTheDayEntry(307062, "넌抧홁貽⛅엋駛㯰", 183023, 109757, "綎씃めᢑ娮", 720915, 744270), TrackOfTheDayEntry(863258, "䑩˨忩膃㿲", 480662, 719137, "�黢翦㡏錅蠉", 259922, 282697), TrackOfTheDayEntry(305383, "ᷢᆱ", 833648, 177339, "냁헭츽", 962127, 694453)});
    OpEqSimple_Check(696390, 250041, 821759, {TrackOfTheDayEntry(86434, "욌尽⪬ꇱ椳轣", 430012, 502923, "혈篏", 210910, 414281), TrackOfTheDayEntry(469561, "ￏ뚽㾰", 996753, 273166, "櫢潃뮚己唙淐挩㯂죷", 201767, 939115)});
    OpEqSimple_Check(350915, 652191, 919770, {TrackOfTheDayEntry(892586, "뉒例鰘덆鱤濫", 388976, 537566, "", 855703, 855553), TrackOfTheDayEntry(767524, "启ࢥ龇ᕞ웸ꣴ動⹠햲贌", 428834, 638894, "竖췸ܫከꔙ", 155983, 436729)});
    OpEqSimple_Check(785062, 37279, 687338, {TrackOfTheDayEntry(466142, "馻筺䆈ᚬ攔ﮣﱔ抃໊", 675843, 810041, "픏ᡱ篢", 802189, 95686), TrackOfTheDayEntry(579628, "홆綷謀㾜쟶췾쬡啨", 796834, 848642, "⢵佫예ꓜ饿嫟剾܃", 627110, 384585)});
    OpEqSimple_Check(634199, 13915, 608387, {TrackOfTheDayEntry(152034, "﫣烎ぬః뙏콪", 351053, 88920, "鳆轘觛ړ", 481090, 123723), TrackOfTheDayEntry(297341, "㑡큘䉙㨤泄", 884321, 440191, "˂ૂ▴퀷ሱ줝", 329992, 622667), TrackOfTheDayEntry(40055, "", 976693, 90850, "䟥ꃰ邳俎䒺藒�챱䋸�", 246916, 858530)});
    OpEqSimple_Check(639212, 835286, 360878, {TrackOfTheDayEntry(855547, "䬮", 83585, 98752, "ᗆ", 377273, 721250), TrackOfTheDayEntry(631942, "븀⹀휤ꪅ醨", 214205, 19445, "䊦䠏ૹᎌ〭", 802081, 494059), TrackOfTheDayEntry(715020, "䦄㢼㩒껸琗", 387658, 974833, "坈య榒㐄杭", 896142, 960794)});
    OpEqSimple_Check(138204, 43502, 388640, {TrackOfTheDayEntry(901796, "湾㓋逽氤옣귥嚕䰡", 604987, 736502, "驿㘸�删", 640358, 768161), TrackOfTheDayEntry(148110, "", 970231, 922608, "〣꥙깖耫沦", 585495, 673361)});
    OpEqSimple_Check(259347, 361852, 497879, {TrackOfTheDayEntry(848368, "ꖗ漣鐯", 80331, 503273, "䵼뉭듓︣泻", 330338, 766357), TrackOfTheDayEntry(86254, "㐭ﭚᕦ⩳짌", 6172, 971850, "軎껬ヰ∨켈놳뎮⥇䦴", 828388, 583370), TrackOfTheDayEntry(867287, "ᄷ섴쵦औꁶ騼푯䅕", 950827, 234815, "π呖㨈뒡", 513764, 381679)});
    OpEqSimple_Check(576081, 766000, 104690, {TrackOfTheDayEntry(759423, "웠�䙾", 359815, 639548, "昔", 890370, 717596), TrackOfTheDayEntry(987204, "", 366403, 781222, "ᵘ⮋벅", 664080, 370719)});
    OpEqSimple_Check(880561, 915887, 661478, {TrackOfTheDayEntry(648519, "◰癞ꩶᓥ悀㥉癿씻翿ღ", 94206, 538830, "Ȯ刚㈎녀৉", 127002, 259150), TrackOfTheDayEntry(507230, "퍶᮳", 662366, 349569, "ᢇ憖䯞愒ㄟ⯧", 208301, 213801)});
  }
  
  bool unitTestResults_TotdMonth_OpEq = runAsync(Tests_RegisterAll_TotdMonth_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_TotdMonth_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_TotdMonth', UnitTest_SzThenUnSz_TotdMonth);
  }
  
  bool Test_SzThenUnSz_Check(uint year, uint month, uint lastDay, const TrackOfTheDayEntry@[] &in days) {
    TotdMonth@ tmp = TotdMonth(year, month, lastDay, days);
    assert(tmp == _TotdMonth::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_TotdMonth() {
    Test_SzThenUnSz_Check(823221, 663647, 352245, {TrackOfTheDayEntry(349825, "覎漸࿚", 791017, 113001, "谶릚끣郣", 160627, 311834)});
    Test_SzThenUnSz_Check(840437, 29355, 736349, {TrackOfTheDayEntry(616400, "佪�", 263354, 427441, "蔃", 198964, 365118), TrackOfTheDayEntry(327500, "ꊦ⊼⿕氎", 605220, 262638, "賄�匼뒱릩䊮", 826942, 906038)});
    Test_SzThenUnSz_Check(964654, 651288, 7008, {TrackOfTheDayEntry(852959, "圭", 678759, 935802, "괰襧魒뭺鍪㤅쏦", 178321, 145385), TrackOfTheDayEntry(796997, "", 891100, 744130, "씠䪉Ꮢ榋", 705395, 18764)});
    Test_SzThenUnSz_Check(342094, 694614, 367326, {TrackOfTheDayEntry(4920, "䩸Ὼ㐚ꂖ摇", 606676, 964248, "繤牉᳔䬳⑇勿", 490254, 320578), TrackOfTheDayEntry(83184, "ﻊ爛⏂ꥏ꼼", 552233, 216820, "⤦➦踆⌾ꎳ㏰", 973529, 47392)});
    Test_SzThenUnSz_Check(583029, 191146, 951853, {TrackOfTheDayEntry(979339, "牐ዻ꼾労樔彭㉮ꇊ疶", 833014, 139588, "糶킢␌窖팿贅", 28064, 49272)});
    Test_SzThenUnSz_Check(140532, 49662, 661734, {TrackOfTheDayEntry(571633, "ు盡ₜ阵璫⃔煡", 341399, 979997, "뙸줒女ѽ泡誄狋撧곟", 356559, 161330), TrackOfTheDayEntry(485401, "", 405127, 314974, "䩓�魓쬣", 129142, 227499)});
    Test_SzThenUnSz_Check(809993, 973135, 540022, {TrackOfTheDayEntry(91371, "뱆鳌춸�⡛", 612172, 30265, "㧟訩逎", 6692, 648132), TrackOfTheDayEntry(22517, "া", 702708, 743612, "ᗿ鉞ꊵ㻛踴Ṷ耦", 253805, 750292), TrackOfTheDayEntry(154873, "庚䛥嶿路꒵혘", 812057, 963710, "卹籫", 116704, 632361), TrackOfTheDayEntry(447567, "欍匝ۢራ滕윑ᄃ毃", 267031, 884892, "넺硫銚䋱垇ᒋ젔", 539543, 854039)});
    Test_SzThenUnSz_Check(718544, 751060, 162893, {TrackOfTheDayEntry(876904, "븹䤭ذ沶ꫴ", 796856, 120221, "銢᜼錢樆䶂", 168286, 980432), TrackOfTheDayEntry(769796, "∐", 840501, 861580, "仅䃜쪪", 770642, 834356), TrackOfTheDayEntry(271620, "", 651952, 806313, "濜ḟ₺洉疧", 116699, 616919), TrackOfTheDayEntry(652149, "⁋컱ⳃ㩄앪衚ध⿺", 859526, 830203, "꩸㸵", 606450, 478495)});
    Test_SzThenUnSz_Check(494166, 450685, 913447, {TrackOfTheDayEntry(557752, "", 668538, 623212, "�䵘㐯㾙ɂ䂟籱ჟ杗", 640399, 462625)});
    Test_SzThenUnSz_Check(805167, 411531, 999224, {TrackOfTheDayEntry(395131, "ꏔ箯浔陳᳚乹ﻺ鮷", 482962, 745915, "", 912496, 258633), TrackOfTheDayEntry(808646, "㪁▫윁벼寥ﴋᮝ臢", 233228, 57986, "商ᅾ鲑頸헳ᑭᷡ", 505384, 263354), TrackOfTheDayEntry(559916, "푔⼧巇麃", 923280, 929837, "⊂", 487546, 504451), TrackOfTheDayEntry(896339, "쎆㊆⯟骙䁣", 983651, 768217, "负釺", 477588, 555890)});
    Test_SzThenUnSz_Check(295400, 15896, 937387, {TrackOfTheDayEntry(934577, "笔", 949213, 240441, "紨⤦鄻隳砒긳", 655561, 826967)});
    Test_SzThenUnSz_Check(255252, 893171, 630514, {TrackOfTheDayEntry(491930, "욜푭沈ĉ漎", 189578, 148425, "", 947791, 66053), TrackOfTheDayEntry(885846, "", 47427, 680346, "鱫댫䚦럕ț頛臾", 281680, 40045), TrackOfTheDayEntry(865162, "뗭⴬똣궆暱여", 27512, 645217, "믔ы䞀�ᐑꖢ䞶ꡡ훅", 354093, 59229)});
    Test_SzThenUnSz_Check(821243, 312859, 716, {TrackOfTheDayEntry(79839, "헣⧾ﾊ驏שּׂ맳站둨", 370248, 538568, "ᆻ�圜苨ꮸ", 675616, 713480)});
    Test_SzThenUnSz_Check(654607, 212628, 177422, {TrackOfTheDayEntry(742412, "韭쟰튤⟫砚", 999603, 252543, "", 186040, 69951)});
    Test_SzThenUnSz_Check(157313, 385300, 285037, {TrackOfTheDayEntry(927069, "◛歴", 790340, 302162, "", 26840, 545496), TrackOfTheDayEntry(30298, "鏰ᕑ쥋", 952806, 152050, "会루ᙧ譛ⲡ퟊", 95259, 409949), TrackOfTheDayEntry(108423, "夫뚟詸쮺꡽", 77008, 115796, "ꓫ츭", 234951, 997572)});
    Test_SzThenUnSz_Check(468068, 465736, 127425, {TrackOfTheDayEntry(219851, "ꙵ", 722283, 416051, "켊෦聁�诨", 550861, 181236), TrackOfTheDayEntry(20949, "➵孞扎㹰㽙ᶝ㒾ⴙ荡옄", 763745, 133184, "ಖⳡ忆悑翐䈐풼仫", 985661, 412956), TrackOfTheDayEntry(148525, "ꪐ脹窕ૐ취ꨟ泒擵䆲罋", 403152, 568649, "䲲옮伴ꁧⓚ紝쾲", 318654, 576027), TrackOfTheDayEntry(17733, "Ⱄㄺ꛼㻔㴕", 618972, 913943, "魶㭷栳ﮂ窗䊨㎠", 373048, 125776)});
    Test_SzThenUnSz_Check(462111, 975084, 231318, {TrackOfTheDayEntry(359796, "ìҏ", 652584, 968986, "濖෷൹袴義겋㞔鲱", 222029, 61248)});
    Test_SzThenUnSz_Check(818218, 978008, 379909, {TrackOfTheDayEntry(938700, "὏鞳鿔힢ꤪ㙖࡮�", 112382, 755332, "j좠⵲贉韽벻", 813063, 803259)});
    Test_SzThenUnSz_Check(674290, 314257, 695590, {TrackOfTheDayEntry(314116, "瘃⍴", 142993, 950657, "䖧骤㛦샚娄奾鴄", 959424, 603884), TrackOfTheDayEntry(873590, "繖䡬ٍ눘ꇰ࡞", 385761, 995570, "㵌⏭슒鷖ꩰ﵄", 940280, 974716), TrackOfTheDayEntry(69620, "�臘༝", 803062, 209586, "盘譊桍䭜䨄쪆锍ⶀ", 284152, 908119), TrackOfTheDayEntry(611777, "꣠㤽襜洞젶⊫蠡", 474286, 659378, "绨亁㸂厊ধ媟魾", 15023, 401824)});
    Test_SzThenUnSz_Check(853320, 636474, 179745, {TrackOfTheDayEntry(862762, "�", 412916, 692155, "쉭邀", 959717, 827282)});
    Test_SzThenUnSz_Check(387499, 263097, 603237, {TrackOfTheDayEntry(314889, "偆㊺噙ꙕኤꤌ馅㕴ꈽ", 297433, 723615, "", 980896, 869727), TrackOfTheDayEntry(811487, "〹㏮랬쉰", 249007, 467039, "⩧݄觤", 970884, 879589), TrackOfTheDayEntry(900439, "眭", 534423, 507167, "㏁", 738210, 810198), TrackOfTheDayEntry(709771, "翇첵㼭浗导�ṶԹ카�", 875535, 402199, "ꊣ⑏냏說䏿븮赡", 974649, 282138)});
    Test_SzThenUnSz_Check(300035, 728099, 506470, {TrackOfTheDayEntry(941798, "櫳挧盬", 32797, 118284, "퐵儋䳆䦺謑膢֣", 262457, 175643), TrackOfTheDayEntry(87582, "鯉罨婽搅", 521630, 322390, "풦䦵亰絽࢜", 725908, 60001), TrackOfTheDayEntry(243548, "苕覾", 731491, 41462, "┗�莘럜", 280138, 458087)});
    Test_SzThenUnSz_Check(943138, 362458, 597302, {TrackOfTheDayEntry(59231, "⨈キ퍰蔍궆넺", 761385, 90957, "⥽ꏗ", 124992, 930533), TrackOfTheDayEntry(449756, "", 142009, 652408, "", 401760, 410374), TrackOfTheDayEntry(20491, "", 203544, 564864, "跇�娯딉슝拓䥵", 327162, 374909)});
    Test_SzThenUnSz_Check(225177, 348131, 33566, {TrackOfTheDayEntry(635778, "艖佺䀒䍊빇", 724134, 823505, "੉諡", 916666, 664136), TrackOfTheDayEntry(540743, "㮼쓎憷Ὄဨ㘳顫踠䙲", 916384, 756483, "븝弮�옚䬟", 361747, 876177), TrackOfTheDayEntry(655057, "㌼㏖⼇䋯줪꿙找쯡", 52221, 296737, "ᐱ", 19966, 818431)});
    Test_SzThenUnSz_Check(816274, 509939, 797218, {TrackOfTheDayEntry(192100, "�꒭ɞ�斧晛昱", 207043, 626469, "﷨津䮵嬂줾㓒셡㿸", 781312, 119192), TrackOfTheDayEntry(806546, "ك", 850352, 683597, "乍拢줊∣", 318853, 898567), TrackOfTheDayEntry(62080, "", 769546, 639897, "蔘赩ﻔ", 621112, 556897), TrackOfTheDayEntry(425594, "�ꑷ堓儝맒샭넗", 496640, 239049, "ꘁ﬩险檑�", 404141, 441900)});
    Test_SzThenUnSz_Check(481657, 917376, 127628, {TrackOfTheDayEntry(243716, "愛쫿", 645572, 163036, "ꐶ塶靖肳", 172725, 276095)});
    Test_SzThenUnSz_Check(496962, 68866, 727035, {TrackOfTheDayEntry(876539, "뭶ዘ�㷣䷐ꌂ䈀", 964441, 353001, "悷姩麟ᠺ嵜㰙", 968553, 558485), TrackOfTheDayEntry(4118, "⧐䷔본촄益뎘嵖體峊瀏", 559282, 106187, "䳨⼨늾쏲⦜냍䖨", 199589, 987772)});
    Test_SzThenUnSz_Check(33883, 759363, 973625, {TrackOfTheDayEntry(284960, "坤痒", 222277, 736962, "膋ᢒ罯髗ɸ", 108619, 869473), TrackOfTheDayEntry(146610, "�迬�", 655210, 251377, "춶堢쟔楟旒笟둀", 952811, 725125), TrackOfTheDayEntry(848606, "썏곑釕쒮狛", 739183, 762638, "糢쨶波ፑ", 828621, 323283), TrackOfTheDayEntry(321371, "沛葄ད�ኈ椉ૻ", 82774, 126019, "〗춙끬➒ᗽ}൳鸄", 122948, 926947)});
    Test_SzThenUnSz_Check(798386, 942423, 332730, {TrackOfTheDayEntry(748809, "欼炼⬊鍦幨⪓�", 57045, 121162, "젒҃⹁ꈥ䗯ీ", 427135, 221693), TrackOfTheDayEntry(619400, "⿅ﭪ", 525975, 34293, "享ኁ", 955242, 736008), TrackOfTheDayEntry(122038, "", 942857, 796402, "灮⸽�쒒᲍鲈廘搝턣", 980174, 108419), TrackOfTheDayEntry(699856, "�", 440747, 240032, "䈊", 890146, 24316)});
    Test_SzThenUnSz_Check(983580, 673801, 456894, {TrackOfTheDayEntry(147648, "쮜먏핝祰䧈躺줘웎", 346112, 927486, "豯�쉾캆㠷픮똹₀㘞�", 606304, 61306)});
    Test_SzThenUnSz_Check(783215, 582181, 224304, {TrackOfTheDayEntry(282466, "밌ᇿ", 984768, 951108, "ໞ鹻凉Ǥ貉蛒︴", 498132, 745654), TrackOfTheDayEntry(889944, "�", 371522, 264447, "", 290759, 64229), TrackOfTheDayEntry(388105, "奁뛏ꍝٺ", 670511, 287847, "ꆾ", 461355, 180666)});
    Test_SzThenUnSz_Check(474730, 215796, 181277, {});
    Test_SzThenUnSz_Check(974017, 962956, 397246, {TrackOfTheDayEntry(855456, "ⳋ塄㐿胆骡㹭", 145074, 853521, "홱뽥䮌ڛ鈧뼞迣媩캼", 617725, 138812), TrackOfTheDayEntry(264329, "즷休彃", 65793, 728794, "��粡刮؉", 28442, 941016), TrackOfTheDayEntry(719147, "ﺯ籀ݍ", 725412, 732117, "", 484239, 371973), TrackOfTheDayEntry(334369, "㮊䔽", 32500, 497045, "", 743513, 814560)});
    Test_SzThenUnSz_Check(490875, 552523, 448076, {TrackOfTheDayEntry(740624, "ဘ蹄梉ᘂ됔﮲", 497787, 992700, "䈈춃☴ʍ︠", 153177, 992714), TrackOfTheDayEntry(376448, "ᅾ⇈䷫堧Ἶ贖᧽�", 335548, 840347, "㏶⚉諍㓥٧", 570496, 194897)});
    Test_SzThenUnSz_Check(214595, 113491, 621062, {TrackOfTheDayEntry(780255, "", 579494, 836264, "榡儠ꚬ�ꯞ첧�즯⨻", 314910, 923136)});
    Test_SzThenUnSz_Check(569385, 672962, 898832, {TrackOfTheDayEntry(726327, "밈䘒䃨櫓", 495034, 993846, "䟋", 996191, 705160)});
    Test_SzThenUnSz_Check(671095, 258857, 200822, {TrackOfTheDayEntry(734411, "ꨔ轮", 296865, 990300, "Ꝙ❬", 719728, 816765), TrackOfTheDayEntry(464000, "", 671139, 541598, "檢랳ꤼﲸ遗畊跨乤", 688999, 576885)});
    Test_SzThenUnSz_Check(605835, 117180, 252476, {TrackOfTheDayEntry(496154, "᫢痜颷嬮", 242465, 832404, "䮒换", 589869, 829061), TrackOfTheDayEntry(656698, "ꌰእﯴ�쓏`냢", 150351, 631603, "庅㚺䇸", 170614, 439993)});
    Test_SzThenUnSz_Check(575792, 471649, 586716, {TrackOfTheDayEntry(1437, "∼퇓儻惈�폤弹", 363028, 610902, "孱奒ㄴ퉳᠀", 783455, 295194)});
    Test_SzThenUnSz_Check(277545, 536336, 106082, {TrackOfTheDayEntry(702962, "ꚨ㏨嘁﷕貾瀍叶┛", 666488, 727845, "騂邉젝皎먳", 402160, 928008)});
    Test_SzThenUnSz_Check(282021, 660128, 544225, {TrackOfTheDayEntry(783624, "", 716456, 465989, "ꞁ屵펽", 701760, 647193)});
    Test_SzThenUnSz_Check(799669, 550782, 264903, {TrackOfTheDayEntry(932760, "㙏槉㵭㲗", 255327, 770792, "", 169728, 602754), TrackOfTheDayEntry(18652, "�ꊪൔ絬茓㏿᪽嗈", 645330, 227230, "䅬權呋ᑎ藜즋", 603608, 899606)});
  }
  
  bool unitTestResults_TotdMonth_RowSerialization = runAsync(Tests_RegisterAll_TotdMonth_RowSerialization);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_TotdMonth_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_TotdMonth', UnitTest_ToFromBuffer_TotdMonth);
  }
  
  bool Test_ToFromBuffer_Check(uint year, uint month, uint lastDay, const TrackOfTheDayEntry@[] &in days) {
    TotdMonth@ tmp = TotdMonth(year, month, lastDay, days);
    Buffer@ buf = Buffer();
    print('buf size pre: ' + buf.GetSize());
    tmp.WriteToBuffer(buf);
    print('buf size post: ' + buf.GetSize());
    buf.Seek(0, 0);
    print('buf size post seek: ' + buf.GetSize());
    assert(tmp == _TotdMonth::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_TotdMonth() {
    Test_ToFromBuffer_Check(823221, 663647, 352245, {TrackOfTheDayEntry(349825, "覎漸࿚", 791017, 113001, "谶릚끣郣", 160627, 311834)});
    Test_ToFromBuffer_Check(840437, 29355, 736349, {TrackOfTheDayEntry(616400, "佪�", 263354, 427441, "蔃", 198964, 365118), TrackOfTheDayEntry(327500, "ꊦ⊼⿕氎", 605220, 262638, "賄�匼뒱릩䊮", 826942, 906038)});
    Test_ToFromBuffer_Check(964654, 651288, 7008, {TrackOfTheDayEntry(852959, "圭", 678759, 935802, "괰襧魒뭺鍪㤅쏦", 178321, 145385), TrackOfTheDayEntry(796997, "", 891100, 744130, "씠䪉Ꮢ榋", 705395, 18764)});
    Test_ToFromBuffer_Check(342094, 694614, 367326, {TrackOfTheDayEntry(4920, "䩸Ὼ㐚ꂖ摇", 606676, 964248, "繤牉᳔䬳⑇勿", 490254, 320578), TrackOfTheDayEntry(83184, "ﻊ爛⏂ꥏ꼼", 552233, 216820, "⤦➦踆⌾ꎳ㏰", 973529, 47392)});
    Test_ToFromBuffer_Check(583029, 191146, 951853, {TrackOfTheDayEntry(979339, "牐ዻ꼾労樔彭㉮ꇊ疶", 833014, 139588, "糶킢␌窖팿贅", 28064, 49272)});
    Test_ToFromBuffer_Check(140532, 49662, 661734, {TrackOfTheDayEntry(571633, "ు盡ₜ阵璫⃔煡", 341399, 979997, "뙸줒女ѽ泡誄狋撧곟", 356559, 161330), TrackOfTheDayEntry(485401, "", 405127, 314974, "䩓�魓쬣", 129142, 227499)});
    Test_ToFromBuffer_Check(809993, 973135, 540022, {TrackOfTheDayEntry(91371, "뱆鳌춸�⡛", 612172, 30265, "㧟訩逎", 6692, 648132), TrackOfTheDayEntry(22517, "া", 702708, 743612, "ᗿ鉞ꊵ㻛踴Ṷ耦", 253805, 750292), TrackOfTheDayEntry(154873, "庚䛥嶿路꒵혘", 812057, 963710, "卹籫", 116704, 632361), TrackOfTheDayEntry(447567, "欍匝ۢራ滕윑ᄃ毃", 267031, 884892, "넺硫銚䋱垇ᒋ젔", 539543, 854039)});
    Test_ToFromBuffer_Check(718544, 751060, 162893, {TrackOfTheDayEntry(876904, "븹䤭ذ沶ꫴ", 796856, 120221, "銢᜼錢樆䶂", 168286, 980432), TrackOfTheDayEntry(769796, "∐", 840501, 861580, "仅䃜쪪", 770642, 834356), TrackOfTheDayEntry(271620, "", 651952, 806313, "濜ḟ₺洉疧", 116699, 616919), TrackOfTheDayEntry(652149, "⁋컱ⳃ㩄앪衚ध⿺", 859526, 830203, "꩸㸵", 606450, 478495)});
    Test_ToFromBuffer_Check(494166, 450685, 913447, {TrackOfTheDayEntry(557752, "", 668538, 623212, "�䵘㐯㾙ɂ䂟籱ჟ杗", 640399, 462625)});
    Test_ToFromBuffer_Check(805167, 411531, 999224, {TrackOfTheDayEntry(395131, "ꏔ箯浔陳᳚乹ﻺ鮷", 482962, 745915, "", 912496, 258633), TrackOfTheDayEntry(808646, "㪁▫윁벼寥ﴋᮝ臢", 233228, 57986, "商ᅾ鲑頸헳ᑭᷡ", 505384, 263354), TrackOfTheDayEntry(559916, "푔⼧巇麃", 923280, 929837, "⊂", 487546, 504451), TrackOfTheDayEntry(896339, "쎆㊆⯟骙䁣", 983651, 768217, "负釺", 477588, 555890)});
    Test_ToFromBuffer_Check(295400, 15896, 937387, {TrackOfTheDayEntry(934577, "笔", 949213, 240441, "紨⤦鄻隳砒긳", 655561, 826967)});
    Test_ToFromBuffer_Check(255252, 893171, 630514, {TrackOfTheDayEntry(491930, "욜푭沈ĉ漎", 189578, 148425, "", 947791, 66053), TrackOfTheDayEntry(885846, "", 47427, 680346, "鱫댫䚦럕ț頛臾", 281680, 40045), TrackOfTheDayEntry(865162, "뗭⴬똣궆暱여", 27512, 645217, "믔ы䞀�ᐑꖢ䞶ꡡ훅", 354093, 59229)});
    Test_ToFromBuffer_Check(821243, 312859, 716, {TrackOfTheDayEntry(79839, "헣⧾ﾊ驏שּׂ맳站둨", 370248, 538568, "ᆻ�圜苨ꮸ", 675616, 713480)});
    Test_ToFromBuffer_Check(654607, 212628, 177422, {TrackOfTheDayEntry(742412, "韭쟰튤⟫砚", 999603, 252543, "", 186040, 69951)});
    Test_ToFromBuffer_Check(157313, 385300, 285037, {TrackOfTheDayEntry(927069, "◛歴", 790340, 302162, "", 26840, 545496), TrackOfTheDayEntry(30298, "鏰ᕑ쥋", 952806, 152050, "会루ᙧ譛ⲡ퟊", 95259, 409949), TrackOfTheDayEntry(108423, "夫뚟詸쮺꡽", 77008, 115796, "ꓫ츭", 234951, 997572)});
    Test_ToFromBuffer_Check(468068, 465736, 127425, {TrackOfTheDayEntry(219851, "ꙵ", 722283, 416051, "켊෦聁�诨", 550861, 181236), TrackOfTheDayEntry(20949, "➵孞扎㹰㽙ᶝ㒾ⴙ荡옄", 763745, 133184, "ಖⳡ忆悑翐䈐풼仫", 985661, 412956), TrackOfTheDayEntry(148525, "ꪐ脹窕ૐ취ꨟ泒擵䆲罋", 403152, 568649, "䲲옮伴ꁧⓚ紝쾲", 318654, 576027), TrackOfTheDayEntry(17733, "Ⱄㄺ꛼㻔㴕", 618972, 913943, "魶㭷栳ﮂ窗䊨㎠", 373048, 125776)});
    Test_ToFromBuffer_Check(462111, 975084, 231318, {TrackOfTheDayEntry(359796, "ìҏ", 652584, 968986, "濖෷൹袴義겋㞔鲱", 222029, 61248)});
    Test_ToFromBuffer_Check(818218, 978008, 379909, {TrackOfTheDayEntry(938700, "὏鞳鿔힢ꤪ㙖࡮�", 112382, 755332, "j좠⵲贉韽벻", 813063, 803259)});
    Test_ToFromBuffer_Check(674290, 314257, 695590, {TrackOfTheDayEntry(314116, "瘃⍴", 142993, 950657, "䖧骤㛦샚娄奾鴄", 959424, 603884), TrackOfTheDayEntry(873590, "繖䡬ٍ눘ꇰ࡞", 385761, 995570, "㵌⏭슒鷖ꩰ﵄", 940280, 974716), TrackOfTheDayEntry(69620, "�臘༝", 803062, 209586, "盘譊桍䭜䨄쪆锍ⶀ", 284152, 908119), TrackOfTheDayEntry(611777, "꣠㤽襜洞젶⊫蠡", 474286, 659378, "绨亁㸂厊ধ媟魾", 15023, 401824)});
    Test_ToFromBuffer_Check(853320, 636474, 179745, {TrackOfTheDayEntry(862762, "�", 412916, 692155, "쉭邀", 959717, 827282)});
    Test_ToFromBuffer_Check(387499, 263097, 603237, {TrackOfTheDayEntry(314889, "偆㊺噙ꙕኤꤌ馅㕴ꈽ", 297433, 723615, "", 980896, 869727), TrackOfTheDayEntry(811487, "〹㏮랬쉰", 249007, 467039, "⩧݄觤", 970884, 879589), TrackOfTheDayEntry(900439, "眭", 534423, 507167, "㏁", 738210, 810198), TrackOfTheDayEntry(709771, "翇첵㼭浗导�ṶԹ카�", 875535, 402199, "ꊣ⑏냏說䏿븮赡", 974649, 282138)});
    Test_ToFromBuffer_Check(300035, 728099, 506470, {TrackOfTheDayEntry(941798, "櫳挧盬", 32797, 118284, "퐵儋䳆䦺謑膢֣", 262457, 175643), TrackOfTheDayEntry(87582, "鯉罨婽搅", 521630, 322390, "풦䦵亰絽࢜", 725908, 60001), TrackOfTheDayEntry(243548, "苕覾", 731491, 41462, "┗�莘럜", 280138, 458087)});
    Test_ToFromBuffer_Check(943138, 362458, 597302, {TrackOfTheDayEntry(59231, "⨈キ퍰蔍궆넺", 761385, 90957, "⥽ꏗ", 124992, 930533), TrackOfTheDayEntry(449756, "", 142009, 652408, "", 401760, 410374), TrackOfTheDayEntry(20491, "", 203544, 564864, "跇�娯딉슝拓䥵", 327162, 374909)});
    Test_ToFromBuffer_Check(225177, 348131, 33566, {TrackOfTheDayEntry(635778, "艖佺䀒䍊빇", 724134, 823505, "੉諡", 916666, 664136), TrackOfTheDayEntry(540743, "㮼쓎憷Ὄဨ㘳顫踠䙲", 916384, 756483, "븝弮�옚䬟", 361747, 876177), TrackOfTheDayEntry(655057, "㌼㏖⼇䋯줪꿙找쯡", 52221, 296737, "ᐱ", 19966, 818431)});
    Test_ToFromBuffer_Check(816274, 509939, 797218, {TrackOfTheDayEntry(192100, "�꒭ɞ�斧晛昱", 207043, 626469, "﷨津䮵嬂줾㓒셡㿸", 781312, 119192), TrackOfTheDayEntry(806546, "ك", 850352, 683597, "乍拢줊∣", 318853, 898567), TrackOfTheDayEntry(62080, "", 769546, 639897, "蔘赩ﻔ", 621112, 556897), TrackOfTheDayEntry(425594, "�ꑷ堓儝맒샭넗", 496640, 239049, "ꘁ﬩险檑�", 404141, 441900)});
    Test_ToFromBuffer_Check(481657, 917376, 127628, {TrackOfTheDayEntry(243716, "愛쫿", 645572, 163036, "ꐶ塶靖肳", 172725, 276095)});
    Test_ToFromBuffer_Check(496962, 68866, 727035, {TrackOfTheDayEntry(876539, "뭶ዘ�㷣䷐ꌂ䈀", 964441, 353001, "悷姩麟ᠺ嵜㰙", 968553, 558485), TrackOfTheDayEntry(4118, "⧐䷔본촄益뎘嵖體峊瀏", 559282, 106187, "䳨⼨늾쏲⦜냍䖨", 199589, 987772)});
    Test_ToFromBuffer_Check(33883, 759363, 973625, {TrackOfTheDayEntry(284960, "坤痒", 222277, 736962, "膋ᢒ罯髗ɸ", 108619, 869473), TrackOfTheDayEntry(146610, "�迬�", 655210, 251377, "춶堢쟔楟旒笟둀", 952811, 725125), TrackOfTheDayEntry(848606, "썏곑釕쒮狛", 739183, 762638, "糢쨶波ፑ", 828621, 323283), TrackOfTheDayEntry(321371, "沛葄ད�ኈ椉ૻ", 82774, 126019, "〗춙끬➒ᗽ}൳鸄", 122948, 926947)});
    Test_ToFromBuffer_Check(798386, 942423, 332730, {TrackOfTheDayEntry(748809, "欼炼⬊鍦幨⪓�", 57045, 121162, "젒҃⹁ꈥ䗯ీ", 427135, 221693), TrackOfTheDayEntry(619400, "⿅ﭪ", 525975, 34293, "享ኁ", 955242, 736008), TrackOfTheDayEntry(122038, "", 942857, 796402, "灮⸽�쒒᲍鲈廘搝턣", 980174, 108419), TrackOfTheDayEntry(699856, "�", 440747, 240032, "䈊", 890146, 24316)});
    Test_ToFromBuffer_Check(983580, 673801, 456894, {TrackOfTheDayEntry(147648, "쮜먏핝祰䧈躺줘웎", 346112, 927486, "豯�쉾캆㠷픮똹₀㘞�", 606304, 61306)});
    Test_ToFromBuffer_Check(783215, 582181, 224304, {TrackOfTheDayEntry(282466, "밌ᇿ", 984768, 951108, "ໞ鹻凉Ǥ貉蛒︴", 498132, 745654), TrackOfTheDayEntry(889944, "�", 371522, 264447, "", 290759, 64229), TrackOfTheDayEntry(388105, "奁뛏ꍝٺ", 670511, 287847, "ꆾ", 461355, 180666)});
    Test_ToFromBuffer_Check(474730, 215796, 181277, {});
    Test_ToFromBuffer_Check(974017, 962956, 397246, {TrackOfTheDayEntry(855456, "ⳋ塄㐿胆骡㹭", 145074, 853521, "홱뽥䮌ڛ鈧뼞迣媩캼", 617725, 138812), TrackOfTheDayEntry(264329, "즷休彃", 65793, 728794, "��粡刮؉", 28442, 941016), TrackOfTheDayEntry(719147, "ﺯ籀ݍ", 725412, 732117, "", 484239, 371973), TrackOfTheDayEntry(334369, "㮊䔽", 32500, 497045, "", 743513, 814560)});
    Test_ToFromBuffer_Check(490875, 552523, 448076, {TrackOfTheDayEntry(740624, "ဘ蹄梉ᘂ됔﮲", 497787, 992700, "䈈춃☴ʍ︠", 153177, 992714), TrackOfTheDayEntry(376448, "ᅾ⇈䷫堧Ἶ贖᧽�", 335548, 840347, "㏶⚉諍㓥٧", 570496, 194897)});
    Test_ToFromBuffer_Check(214595, 113491, 621062, {TrackOfTheDayEntry(780255, "", 579494, 836264, "榡儠ꚬ�ꯞ첧�즯⨻", 314910, 923136)});
    Test_ToFromBuffer_Check(569385, 672962, 898832, {TrackOfTheDayEntry(726327, "밈䘒䃨櫓", 495034, 993846, "䟋", 996191, 705160)});
    Test_ToFromBuffer_Check(671095, 258857, 200822, {TrackOfTheDayEntry(734411, "ꨔ轮", 296865, 990300, "Ꝙ❬", 719728, 816765), TrackOfTheDayEntry(464000, "", 671139, 541598, "檢랳ꤼﲸ遗畊跨乤", 688999, 576885)});
    Test_ToFromBuffer_Check(605835, 117180, 252476, {TrackOfTheDayEntry(496154, "᫢痜颷嬮", 242465, 832404, "䮒换", 589869, 829061), TrackOfTheDayEntry(656698, "ꌰእﯴ�쓏`냢", 150351, 631603, "庅㚺䇸", 170614, 439993)});
    Test_ToFromBuffer_Check(575792, 471649, 586716, {TrackOfTheDayEntry(1437, "∼퇓儻惈�폤弹", 363028, 610902, "孱奒ㄴ퉳᠀", 783455, 295194)});
    Test_ToFromBuffer_Check(277545, 536336, 106082, {TrackOfTheDayEntry(702962, "ꚨ㏨嘁﷕貾瀍叶┛", 666488, 727845, "騂邉젝皎먳", 402160, 928008)});
    Test_ToFromBuffer_Check(282021, 660128, 544225, {TrackOfTheDayEntry(783624, "", 716456, 465989, "ꞁ屵펽", 701760, 647193)});
    Test_ToFromBuffer_Check(799669, 550782, 264903, {TrackOfTheDayEntry(932760, "㙏槉㵭㲗", 255327, 770792, "", 169728, 602754), TrackOfTheDayEntry(18652, "�ꊪൔ絬茓㏿᪽嗈", 645330, 227230, "䅬權呋ᑎ藜즋", 603608, 899606)});
  }
  
  bool unitTestResults_TotdMonth_ToFromBuffer = runAsync(Tests_RegisterAll_TotdMonth_ToFromBuffer);
}
#endif