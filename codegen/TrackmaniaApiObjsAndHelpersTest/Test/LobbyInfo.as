#if UNIT_TEST
namespace Test_LobbyInfo {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_LobbyInfo_CommonTesting() {
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
  
  bool unitTestResults_LobbyInfo_CommonTesting = runAsync(Tests_RegisterAll_LobbyInfo_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_LobbyInfo_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_LobbyInfo', UnitTest_ToJsonFromJson_LobbyInfo);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in name, uint n_clients, uint n_rooms, uint n_public_rooms, const RoomInfo@[] &in rooms) {
    LobbyInfo@ tmp = LobbyInfo(name, n_clients, n_rooms, n_public_rooms, rooms);
    assert(tmp == LobbyInfo(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_LobbyInfo() {
    Test_ToJsonFromJson_Check("", 129450, 573551, 355425, {RoomInfo("䂟", 355942, 314713, 121822, MaybeOfString(""), true), RoomInfo("톶뜣힐", 481904, 681748, 661401, MaybeOfString("ᲊ̇॑"), true), RoomInfo("軻ᖧ⭾뒍뿣확庢", 331709, 704518, 900608, MaybeOfString(), true), RoomInfo("ﭤℊ䮇귂⎶", 44895, 413674, 458248, MaybeOfString("澯�჌江䚏꼸䃧"), true)});
    Test_ToJsonFromJson_Check("ᤫ", 816099, 752865, 87509, {RoomInfo("炤䩦ᛥ婫囼", 740990, 125510, 201887, MaybeOfString("꾜鏑郺ἁ맱稜"), false), RoomInfo("䞚㌴⦱扬", 962581, 425743, 228874, MaybeOfString("杒୒D䀗ꬨ憽畏"), true), RoomInfo("", 414406, 744556, 199466, MaybeOfString("딢셐鐨⛦屻㚡딽"), false)});
    Test_ToJsonFromJson_Check("�常", 158796, 236301, 772258, {RoomInfo("", 89463, 694964, 789918, MaybeOfString("窐踎윉懜翊신꨻በ"), true), RoomInfo("聍㚃⛨ஞ꽝", 50747, 471876, 115425, MaybeOfString("῏⻖"), false), RoomInfo("ᇠ炦", 809822, 507044, 850929, MaybeOfString("炄"), true)});
    Test_ToJsonFromJson_Check("", 361950, 760960, 38750, {RoomInfo("죤箖质ᣙ욗恦鬋鍡", 61424, 123025, 945480, MaybeOfString("됢菙ၰ㡽걅"), true), RoomInfo("ꨘ躀퓹ꔴ㳇୭鹥", 304545, 64291, 417442, MaybeOfString("㥱䙐禭홢"), true)});
    Test_ToJsonFromJson_Check("៯ꭍڑ쀈ⵗ㏬", 330434, 960296, 368435, {RoomInfo("", 342727, 17362, 228006, MaybeOfString("샞"), false)});
    Test_ToJsonFromJson_Check("萐뫉", 575887, 254207, 948310, {RoomInfo("∝", 489123, 522901, 419173, MaybeOfString("임㾂鴈臼瀙娎뉺ꢗ軤"), false)});
    Test_ToJsonFromJson_Check("瑁캳륣쑋쎧ᨘ퉁濑", 17181, 227340, 204841, {RoomInfo("睈", 551413, 573011, 871194, MaybeOfString("갯䘞턜㧷わ銂⧼馣"), true), RoomInfo("쩇쟬ﱩ媡요쉒▹", 949831, 896297, 175152, MaybeOfString("Ｅ澮촎姴䮪삒볜豣閑㏲"), true), RoomInfo("쭋胋젮Ⱑ", 419376, 245093, 672482, MaybeOfString("轓᧦㗭"), true), RoomInfo("뾟ૢ랶侥荽꜐丌ଌ", 188934, 214175, 87941, MaybeOfString("�"), true)});
    Test_ToJsonFromJson_Check("␁ﮛ", 692390, 858803, 605906, {RoomInfo("ཎ؏쀯㖩ꅽ", 160914, 43093, 618140, MaybeOfString(), false), RoomInfo("瑏求뺝숯", 508457, 876283, 49476, MaybeOfString("啻"), false), RoomInfo("ź恮뺪髷漻拹ⓨ淪", 526475, 999438, 811107, MaybeOfString("ꯥ끁롣௑㢭ꇔ"), true)});
    Test_ToJsonFromJson_Check("穏뫤࡙攴쑋㵗髍澇㤘", 801176, 883112, 765603, {RoomInfo("鿬횊穧", 733371, 931353, 523510, MaybeOfString(), true)});
    Test_ToJsonFromJson_Check("矮冠ឍ馒扁⫦㿕롔", 120250, 568242, 791291, {RoomInfo("왪噧㉊㚨줫⧑㙵覆", 195672, 489062, 158912, MaybeOfString("�ꐒ魋䭅"), true), RoomInfo("ꊑ䐁ߠɯ밥�틭姻", 78744, 313111, 457076, MaybeOfString("첕풠躹伲킬"), true)});
    Test_ToJsonFromJson_Check("꼵䁹呦㷽", 64905, 260294, 13752, {RoomInfo("⢻疳쨟", 477731, 947821, 507055, MaybeOfString("剈授䎫쉑ᢰ靡"), true)});
    Test_ToJsonFromJson_Check("�胛๫좧", 744885, 719322, 916975, {RoomInfo("쎟", 354693, 814831, 838411, MaybeOfString("䲈㌒皬毸圌蒵⢢⣳"), false), RoomInfo("吂檞ꨁ딣⍣�浥", 311819, 995447, 14342, MaybeOfString("௒ﴪỗᯁ蚧쯕胫"), true), RoomInfo("種", 900364, 662721, 992645, MaybeOfString("邽쪿"), true), RoomInfo("釄⅟᥌", 679849, 608847, 283554, MaybeOfString("濍γ"), false)});
    Test_ToJsonFromJson_Check("鱆㈹�䕋", 355681, 462683, 26762, {RoomInfo("˶鵺ﯶᲑ篥ɿ읒럕࠘", 231848, 206760, 489368, MaybeOfString("䲲闞ꩍ㨧㞆豽몗"), false), RoomInfo("騔덁闧⽺裰轛멭錰", 935082, 496130, 749041, MaybeOfString("ꓩꦼ�୹౺삯Ϩ죂갗"), true)});
    Test_ToJsonFromJson_Check("‚ᓒ潰Ⳉ", 700997, 188821, 679612, {RoomInfo("温膀璠뎝⺧䛙", 45787, 733079, 915433, MaybeOfString(""), false)});
    Test_ToJsonFromJson_Check("͢떳窖鬦歾䙖ᲀ㭔", 995705, 717574, 333832, {RoomInfo("ঈࢧ", 98773, 636807, 957778, MaybeOfString("뽶"), false)});
    Test_ToJsonFromJson_Check("⯉肱箉礠덡蟞躎㊭", 417989, 41675, 27384, {RoomInfo("뼘㽗ⷻ찄", 734977, 771244, 845590, MaybeOfString("虺艧늚�"), false), RoomInfo("", 653111, 144152, 378234, MaybeOfString("꬯ᑯ鶠褒ó퓓"), false)});
    Test_ToJsonFromJson_Check("▘녝裂ꦍ", 112610, 176037, 227185, {RoomInfo("蔝娞⠸จ͔䳠", 190769, 82552, 495317, MaybeOfString("⾤ᐺ罦ᘪꮚ"), true), RoomInfo("쨳〛ⵐ", 155432, 293496, 876293, MaybeOfString("尰"), false), RoomInfo("�ᑠ蜴쬣ܹ㈸襁盟", 108896, 294825, 334343, MaybeOfString("잜徺〶力෎턒柬઒궅抈"), true), RoomInfo("忸៥览䫞", 908975, 106381, 368576, MaybeOfString("盩鮕雮亦釪挨⎈汼"), false)});
    Test_ToJsonFromJson_Check("�㚳쯕獎ﱴ", 21776, 136229, 798602, {RoomInfo("깵黌壀唑骿", 754312, 960091, 15019, MaybeOfString("鸊䕲璷瘑"), true)});
    Test_ToJsonFromJson_Check("ૉ娐j⏣ꄺ暡欐", 504995, 769227, 320537, {RoomInfo("鰭∋擫đ益⬫꽎铖", 323688, 703275, 265097, MaybeOfString("⤑ﻂ殩姒糒ꃆ"), false), RoomInfo("룥끵꜐", 32241, 437178, 32450, MaybeOfString("ﱛಃ"), false), RoomInfo("줺ᠣᨲ瀔ሑ瘻嶰幃", 309855, 17883, 717439, MaybeOfString("⋞ネ얽䦵"), true), RoomInfo("鳲�怢팃쪶蒌惴", 182284, 453668, 559173, MaybeOfString("떜"), false)});
    Test_ToJsonFromJson_Check("⧖妬", 905949, 815432, 459961, {RoomInfo("鴈濙뾬䰦ⷅ뮹瀨砦", 68906, 149252, 195022, MaybeOfString("흯筺궜쁶縂⦠쮔᪝"), true)});
    Test_ToJsonFromJson_Check("伜", 743799, 704637, 700426, {RoomInfo("䩧톿ޜＶ쓎", 997042, 334943, 383204, MaybeOfString("埈핹腕励돠艄훔�웖륞"), false)});
    Test_ToJsonFromJson_Check("挡ﺜ쿝虘鄃", 359040, 216424, 875365, {RoomInfo("䯞髟螋뱏熫鏵", 904511, 913697, 587688, MaybeOfString("ਤ翉"), true)});
    Test_ToJsonFromJson_Check("⠔軙壑䘴", 228408, 132636, 233611, {RoomInfo("큝耷넲㴝", 834162, 292527, 397114, MaybeOfString("掗ν䗍郐≫"), false), RoomInfo("裴ⲍꨞ﷨뺛穿濶蝆쌥", 475809, 4522, 261620, MaybeOfString("껒꾤嬔䅒帆櫊䦚鶯짫"), true), RoomInfo("쮷몄껱詞磥벹靆", 287970, 760094, 736281, MaybeOfString("扦㿏Ⴇ⳵�뀧›"), true)});
    Test_ToJsonFromJson_Check("䋘Ը䘷쀞", 950346, 502516, 144237, {RoomInfo("倭䗷辣⇹鞫ᛙ牗", 776333, 8874, 36138, MaybeOfString("︈얖"), false)});
    Test_ToJsonFromJson_Check("탢輂䥻扩唃쟚뒍봴땉", 973202, 814806, 157319, {RoomInfo("餷褅吢㨞罱쏭�", 870024, 343513, 630321, MaybeOfString("檃添"), true), RoomInfo("ྸ쁝", 126546, 940520, 315446, MaybeOfString("�㥌쟍퐩㷬瘏�"), false), RoomInfo("툕翂斜⭝毡", 459217, 874064, 654238, MaybeOfString("ᦱ"), true), RoomInfo("鹬岣叫�鍺", 909769, 94877, 412185, MaybeOfString("ꪓ춒ⷸ䢎�殶"), false)});
    Test_ToJsonFromJson_Check("詖煎䟁穳冥�", 577773, 533219, 420887, {RoomInfo("ḅ♁뚌ⶣޯ", 944209, 256514, 393864, MaybeOfString("谅좦"), false), RoomInfo("", 927977, 393537, 756072, MaybeOfString("泩"), false), RoomInfo("牢஬麋�縣䉁ꨆ", 138003, 351956, 987749, MaybeOfString("谯絾搷窐梁�東巹걲�"), false), RoomInfo("緞쐼ჲ", 353933, 373576, 63877, MaybeOfString("ኂ〳螦䪾癌䠗夋"), true)});
    Test_ToJsonFromJson_Check("揪₃뒣筗鏖豺埞赱�暜", 169300, 628314, 956891, {RoomInfo("�쳾ૹ䱕", 395219, 996103, 775344, MaybeOfString("�ᆰ뜬٬ﻎ୑ﵶ溨콕"), false), RoomInfo("岥ꞹ쎼䁡ༀ", 635382, 994928, 921540, MaybeOfString(), true)});
    Test_ToJsonFromJson_Check("⦰⊂衤运Ꝉ", 445080, 594832, 600907, {RoomInfo("锑", 533815, 331757, 351989, MaybeOfString("沂䮄⍋�ꋊ"), false), RoomInfo("缜圆䐰饄音", 220922, 115342, 620086, MaybeOfString("굆"), false), RoomInfo("錛⧡碲䈩휲쾹짨뵅윪㧘", 359571, 982115, 310009, MaybeOfString("탫콫Ⴗ鲧핀"), true), RoomInfo("依⵶�伝猧䰑欔꨷舼驸", 40964, 273298, 972154, MaybeOfString("퉒"), true)});
    Test_ToJsonFromJson_Check("滛窖ꀰ又ꉂ节瓞맜", 38709, 284453, 365427, {RoomInfo("", 807355, 571537, 668434, MaybeOfString("侔坺䎶呃龡웞Ꜳ"), true), RoomInfo("ꞌ௣둪⸤Ὕ袧", 496723, 693592, 780123, MaybeOfString("뻾婣⦯撥鵁"), false), RoomInfo("ࣰ̺Eா", 663313, 382113, 162899, MaybeOfString("鸚圲"), true), RoomInfo("굄ᩞ꿻᱕⽲�鶩", 143619, 903769, 881839, MaybeOfString(), true)});
    Test_ToJsonFromJson_Check("䬇心뙱節ಒጒ翯", 914703, 432249, 339765, {RoomInfo("욘፟⩜頿邬︺핬⤔臃", 959028, 848468, 781780, MaybeOfString("搩릟愰宫掽밣燭"), true), RoomInfo("粔ḁ㵎愆ꏞ餩ꐅ刹", 801785, 494223, 121892, MaybeOfString(), false), RoomInfo("朊⼵ﶾ䝩ᘘ", 357292, 874139, 6350, MaybeOfString("䠄ᣊ䁿잸嘼"), false), RoomInfo("愴讲댮섐裔", 763220, 316229, 315516, MaybeOfString("舉紋휅嘙ℊꆥ"), true)});
    Test_ToJsonFromJson_Check("隄ꜳ⣯苒漒꤇ᨫ࿪", 118561, 220570, 714445, {RoomInfo("砼밀㇇䱇ﺘ徳䉰", 331462, 940146, 366835, MaybeOfString("�啵⸁"), false), RoomInfo("緄덯ꙛ骦敁", 742311, 998459, 395904, MaybeOfString(), false), RoomInfo("灛揩�", 340949, 206112, 624932, MaybeOfString("⡶㵮섋螴磢"), true), RoomInfo("䋯", 920437, 166449, 242571, MaybeOfString("㮍"), false)});
    Test_ToJsonFromJson_Check("", 455930, 176866, 312293, {RoomInfo("略铃롒匴撘膺였睯", 74689, 961755, 904844, MaybeOfString(""), false), RoomInfo("ඌᘅǆ칁柴떦瘸鍶", 226312, 939964, 15544, MaybeOfString(), false), RoomInfo("唴ꭄ", 631761, 301415, 369523, MaybeOfString("盧ｊ㸦צ袍਍罹"), false), RoomInfo("贳﩯", 825117, 414015, 671139, MaybeOfString("綾屇貉聯⥋숟䎜"), true)});
    Test_ToJsonFromJson_Check("뭷ݏ괎崵�", 431764, 761357, 640058, {RoomInfo("岷", 940712, 175854, 77517, MaybeOfString("ᮼ"), true), RoomInfo("ᕲￄ蒨䢒ō", 71277, 406331, 945623, MaybeOfString("荠ݲ"), true), RoomInfo("닡ᒳ銵〉⍶릅眹", 874819, 388217, 619643, MaybeOfString("㮽싙ᜋѥ厏埏⡓桾"), false)});
    Test_ToJsonFromJson_Check("㬹⽞ꡪᾓꢔ", 818363, 876806, 595964, {RoomInfo("࿣珟눛ᡕ顕﮽紒", 721646, 609529, 974481, MaybeOfString("혘䂹⋁㒛漏좇뀠"), true), RoomInfo("鰔艗읝蝨䧌㟤麻蒮๢", 710445, 408487, 69099, MaybeOfString(""), false)});
    Test_ToJsonFromJson_Check("諹淩Ṟ阯�", 96998, 372715, 254697, {RoomInfo("", 597741, 454421, 39125, MaybeOfString("輱껼㓨鎓粐偝焥爅"), true), RoomInfo("葛", 47617, 162364, 456569, MaybeOfString("怰䏪ㄸ걹䏿͑遒੆"), true), RoomInfo("旣", 207061, 220554, 725799, MaybeOfString("땹搿鿄鄮絠畂ꈼ"), false)});
    Test_ToJsonFromJson_Check("䊕꺥鶻箼楳", 763851, 314817, 542955, {RoomInfo("䐍", 829197, 472220, 959038, MaybeOfString("齫ﭔ哙큐뤨"), true), RoomInfo("輎︗﷋", 161827, 765214, 813784, MaybeOfString("ᠹᾝ퐻㪧�㼠布뷵넴"), false), RoomInfo("᲍冚刻鯀ᛷ䘉꩏", 841450, 945229, 550672, MaybeOfString("峑뷸⛤ܔ⽣僅㒔署"), false)});
    Test_ToJsonFromJson_Check("甉訳徐碹咷烦�ᄌ詨", 227847, 175735, 680802, {RoomInfo("죯긮爫士0Ḱ角", 149724, 905974, 962395, MaybeOfString("굵ߤ"), true), RoomInfo("�卐", 903037, 200770, 698895, MaybeOfString(), true)});
    Test_ToJsonFromJson_Check("⏙㞐�큱", 841713, 816341, 305101, {RoomInfo("觰㌓浦姰頙", 315603, 362969, 232454, MaybeOfString("ꗿ鶀쇓ㆋ꾅ꆇ跿良徊"), true)});
    Test_ToJsonFromJson_Check("梁䴧롷饧눇䜆", 570253, 387141, 436072, {RoomInfo("Ｏ◨", 804408, 277156, 370015, MaybeOfString("摀"), false), RoomInfo("桖햫뽁㠶퀆곰㬿誝", 478380, 958767, 808947, MaybeOfString("‎爉щ㜔龓Ⱳ"), false), RoomInfo("⍭聓埝詬", 43158, 353324, 417219, MaybeOfString(), false)});
    Test_ToJsonFromJson_Check("柟饤禅㒕⑅횿퐔�聚", 924485, 531747, 931348, {RoomInfo("嵠渌篟宀", 195897, 516126, 851367, MaybeOfString("ꃖ섷"), true)});
    Test_ToJsonFromJson_Check("ꀢ톺鈷쉄냼", 932204, 791721, 480764, {RoomInfo("餤䂒䥢㦕�룝紜攁䖦", 965049, 211509, 979943, MaybeOfString(), true)});
    Test_ToJsonFromJson_Check("ﬔἏ濒㛖ꨚ剧뉧", 136123, 294106, 78236, {RoomInfo("✮ᵑ", 392820, 38915, 865898, MaybeOfString("๾쪺灷뛪拸ㇵ䂺㾣ꀈ"), false), RoomInfo("꒳ၳ甘ꞻ잛촵㹾⩽", 398669, 834405, 865780, MaybeOfString(), false), RoomInfo("ಫ꾁䉚簯", 86954, 429342, 374739, MaybeOfString("７鲨㫠㚚ح뀇"), false)});
  }
  
  bool unitTestResults_LobbyInfo_ToFromJSONObject = runAsync(Tests_RegisterAll_LobbyInfo_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_LobbyInfo_Getters() {
    RegisterUnitTest('UnitTest_LobbyInfo_Getters', UnitTest_LobbyInfo_Getters);
  }
  
  bool Test_CheckProps_LobbyInfo(const string &in name, uint n_clients, uint n_rooms, uint n_public_rooms, const RoomInfo@[] &in rooms) {
    LobbyInfo@ tmp = LobbyInfo(name, n_clients, n_rooms, n_public_rooms, rooms);
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(n_clients == tmp.n_clients, 'field n_clients with value `' + n_clients + '`');
    assert(n_rooms == tmp.n_rooms, 'field n_rooms with value `' + n_rooms + '`');
    assert(n_public_rooms == tmp.n_public_rooms, 'field n_public_rooms with value `' + n_public_rooms + '`');
    assert(rooms == tmp.rooms, 'field rooms');
    return true;
  }
  
  void UnitTest_LobbyInfo_Getters() {
    Test_CheckProps_LobbyInfo("�￿躮䮠馩�", 980813, 825164, 378662, {RoomInfo("ᒄ暭쑁㚷￣", 87722, 931445, 242516, MaybeOfString("漽똮覧﶑䙢꺰ꦞᩘ"), true), RoomInfo("븺寔옛", 397204, 920219, 842266, MaybeOfString(), true)});
    Test_CheckProps_LobbyInfo("﹞ඵ壿綊蕣Ѳ䊣�갏", 644216, 655667, 310766, {RoomInfo("�拺윰", 321608, 715346, 402362, MaybeOfString("ⴐ"), false)});
    Test_CheckProps_LobbyInfo("듡鷰那춴庂ᄼﵰ", 438676, 425498, 985047, {RoomInfo("膅๴޷Მᑨ쾳", 83749, 89913, 741566, MaybeOfString("賊惍됞ᨴ㪂ꦽ"), true), RoomInfo("퐫帧�", 780640, 56077, 281728, MaybeOfString("묹뭷┼쿽騍큋㈣揘䢊"), false), RoomInfo("ǻ쥝ꋟ툴䜮ᚗҳ충", 424950, 842424, 443180, MaybeOfString("䤩䇢�뽥"), true)});
    Test_CheckProps_LobbyInfo("蚂㢲蘆鞆㤨ॽ簊ឞ", 471452, 881735, 81777, {RoomInfo("ꒉ㳀䈾뙱", 611458, 678280, 212605, MaybeOfString("틑吲炔ᒚ레휺堷"), false), RoomInfo("過", 153273, 853065, 927946, MaybeOfString(), true), RoomInfo("ꔘₜ齬聎雄攩澴䶩", 135571, 428782, 785817, MaybeOfString("鉴㉙"), false), RoomInfo("嗍珐瀮㍿웦", 585012, 264138, 345680, MaybeOfString("높䋪㋘늒竛뗧"), true)});
    Test_CheckProps_LobbyInfo("䌽ୣ筃痒胊의䉶", 565032, 395859, 848880, {RoomInfo("", 871160, 252345, 927020, MaybeOfString(""), true)});
    Test_CheckProps_LobbyInfo("⬋㫟슷", 442156, 835767, 597733, {RoomInfo("崤颦蚕蔟Ι龲ꇗ⡔", 529329, 83328, 124133, MaybeOfString("奚좗謧痀㬙菣꿫"), false), RoomInfo("묇森ⶍභࢆ⑧䩦뽼", 742625, 707776, 850420, MaybeOfString("ᅘ鳰Ԕࠆ祊藍藄ஙᆴ"), false), RoomInfo("벷쨭욢璞�ᐡ", 30588, 515696, 406688, MaybeOfString("༻耓봸鱚뿽룣ӟꓟ"), true)});
    Test_CheckProps_LobbyInfo("ᔻἚ쫉䶶꣰䃹눭쯺튯", 833723, 27085, 506361, {RoomInfo("ᩳ삝뵶鳱㶋硂银撸", 508311, 552893, 698153, MaybeOfString(), false), RoomInfo("ᐳፎ䮐잝鮴", 706225, 550359, 228846, MaybeOfString(), false), RoomInfo("攇뽿퉾돂", 285594, 730044, 27157, MaybeOfString("۟弜쌘㙛핺﫽㑪㿊"), true), RoomInfo("嚱ᇊᙷ펁佗횄俁", 809718, 23260, 500301, MaybeOfString(), false)});
    Test_CheckProps_LobbyInfo("⁏㸸", 692850, 61779, 302773, {RoomInfo("ꭉ狥", 396785, 680498, 521868, MaybeOfString("흰姺"), true)});
    Test_CheckProps_LobbyInfo("‱䘢", 731067, 366682, 72793, {RoomInfo("攤訞♹⑼驏᩽嬨", 598243, 733567, 350936, MaybeOfString("跏㜤샱镧畉"), true), RoomInfo("꣺", 987805, 443541, 362144, MaybeOfString(""), false)});
    Test_CheckProps_LobbyInfo("", 818681, 436748, 524758, {RoomInfo("袿칉谜訷໰胖�䞈䚴", 180139, 623725, 647698, MaybeOfString("쿆蕻﬏坊₰糣䱎쪓崉"), false)});
    Test_CheckProps_LobbyInfo("ጢ", 323729, 180108, 629317, {RoomInfo("�쁰ꢚﲆ䉳诲뺔", 483553, 895579, 267089, MaybeOfString("鬕"), true), RoomInfo("ﶊ响⮷�쒢ﻖ쾁᳓", 542178, 457180, 755226, MaybeOfString("䚃ᖓ嵐䓸瀓"), false)});
    Test_CheckProps_LobbyInfo("࣓렎䰩⮵⧿堫竎绒ㅠﻬ", 326415, 528855, 882201, {RoomInfo("퐥ঠ἗넾ᅳꙬꇰ⦥", 349405, 96082, 300778, MaybeOfString(""), false), RoomInfo("", 766638, 562111, 491704, MaybeOfString("㯴︺了椇"), true), RoomInfo("䃿fྔ㐔ᡄ鷂啕", 409258, 487252, 847881, MaybeOfString("嶽衃鳱䊞챆맰쵛"), false)});
    Test_CheckProps_LobbyInfo("⵪诨⥇Ш啞婓菨", 848668, 123956, 594259, {RoomInfo("", 640427, 717690, 141733, MaybeOfString("慺㗻壺旻슽铟Ꙓ鐻"), true), RoomInfo("捣嶟廌⁹掠욿Т", 801047, 65331, 583163, MaybeOfString("睊�澎낭荸〈韴๠"), false), RoomInfo("㐺䗎稦⡠", 428969, 263376, 559594, MaybeOfString("밃괦㮜䔐炒悄௶揸ꥒ叵"), false)});
    Test_CheckProps_LobbyInfo("䲥ꂵ꛽빗�厷ア炦勭", 514035, 709313, 996607, {RoomInfo("", 427811, 56836, 500196, MaybeOfString("뢟⇇씓欭矻쏖㤝搰Ѕ"), true), RoomInfo("阊", 437881, 957451, 439545, MaybeOfString("죨枂᜕嫀᮶๑"), false), RoomInfo("Ⰶ�", 50730, 70608, 196783, MaybeOfString(""), true)});
    Test_CheckProps_LobbyInfo("ﺏ柙㕤쩢", 380243, 958478, 282186, {RoomInfo("渡ꒋלּ⚶η㝯ӧ", 439306, 861730, 269596, MaybeOfString("砹罜䖈줍"), true), RoomInfo("ꀓ䤢౤ᅺ鑪", 680932, 945835, 836382, MaybeOfString("ᘖ᮳➄䛳碸䀠"), false), RoomInfo("脟篱꯫慙㘊", 177629, 279781, 547597, MaybeOfString("ᑝ쨀飞륍"), false), RoomInfo("⌁읚罻�", 629387, 861971, 206838, MaybeOfString("ᢦ폛⶯"), false)});
    Test_CheckProps_LobbyInfo("窸䃿ﲩ�脰矫蛼䚼炈䑚", 705336, 676684, 816426, {RoomInfo("쪺⾉輖쀠껲﹍룦蟄", 810229, 594916, 429882, MaybeOfString("浏඾繫䷩暻Эᳺ푰"), true), RoomInfo("ڄ课幝", 889541, 778262, 501081, MaybeOfString("傗䘠桌ậ"), false)});
    Test_CheckProps_LobbyInfo("㵲�", 332001, 561537, 422362, {RoomInfo("嵭ｼ筬薥㤌", 229264, 390755, 954060, MaybeOfString(), true), RoomInfo("ꢍ灰㩈㉡", 819909, 895348, 346080, MaybeOfString("ĕ�뎿�"), false)});
    Test_CheckProps_LobbyInfo("⪤�蝭", 567517, 377168, 692881, {RoomInfo("桅꣒뙤偌눘胪", 146269, 71779, 802021, MaybeOfString("暪棱館迠祠斄ᘫ턒ዳ"), false), RoomInfo("푍봴�⿎譟䏭哧", 623797, 996815, 657076, MaybeOfString("노闗彎⬟"), false)});
    Test_CheckProps_LobbyInfo("턴䅕ℶ", 979748, 654928, 693750, {RoomInfo("껗々Ꝺ", 486894, 581962, 340029, MaybeOfString("锏▽ꇲ䱐敫뒦숾䚙剠ﺯ"), false)});
    Test_CheckProps_LobbyInfo("", 499359, 987325, 927154, {RoomInfo("鳼", 456013, 272284, 335879, MaybeOfString("滔㘎ᔳ"), true), RoomInfo("쓼", 410924, 483718, 182271, MaybeOfString("�駷�ℷ鼈㐏虒俀耥"), true)});
    Test_CheckProps_LobbyInfo("", 236077, 527817, 419668, {RoomInfo("ꎕ", 458208, 407207, 215478, MaybeOfString("銌꼾ǋ"), true), RoomInfo("Ṑ蝫", 359901, 882723, 5781, MaybeOfString("쓟쓄퇗"), false), RoomInfo("←", 316700, 872577, 344381, MaybeOfString("묁폹"), true)});
    Test_CheckProps_LobbyInfo("ꥒﮉ⣞Բᱳ", 443536, 239218, 799355, {RoomInfo("Ꝙﺿю䗗", 248619, 192100, 791278, MaybeOfString("퀒᯺싵뚔챔"), false)});
    Test_CheckProps_LobbyInfo("擝ֈ胑苒ᒟ൒閪", 667170, 70395, 615405, {RoomInfo("뤸", 567491, 95998, 232714, MaybeOfString("侵㾔ඛ䈱"), false), RoomInfo("燥킅₎", 543725, 336679, 60944, MaybeOfString("脍䣢椃錂ᶨ"), false)});
    Test_CheckProps_LobbyInfo("薁飏婆づ뮔죯뱿锄�ꦸ", 314689, 981069, 130045, {RoomInfo("킦", 344417, 371580, 246135, MaybeOfString("║ｷܫ䪡"), true)});
    Test_CheckProps_LobbyInfo("衴", 130942, 583514, 251270, {RoomInfo("쟵㖥蚭㔃좓툛", 373873, 648048, 42780, MaybeOfString("㝎那끧߿栚䌒胐瘿"), false), RoomInfo("쬇", 769082, 882101, 92892, MaybeOfString("∗楦鷞≦烛"), false)});
    Test_CheckProps_LobbyInfo("㝩Ꞿ", 18020, 332778, 680617, {RoomInfo("豫鰏솞䡖", 115083, 615038, 802924, MaybeOfString("ぼ⎳퀳ﻴ뚓◚"), true), RoomInfo("쎉䥰�䳷쾞ꚛ", 77124, 71326, 676911, MaybeOfString(""), true), RoomInfo("㍠종ᕉ豼೵㧑", 638707, 393001, 753390, MaybeOfString("�슌욵ｪ餤１"), true), RoomInfo("ᘈ缥躒�펀ᯒ㙬ͳ", 204177, 329666, 221147, MaybeOfString("刻�"), false)});
    Test_CheckProps_LobbyInfo("쥎洺", 363604, 983241, 616920, {RoomInfo("ꄀ䇿ʇ⽕鯪", 84853, 724128, 969997, MaybeOfString("ᾠ唏ࠔ㥳"), true), RoomInfo("ᄝ畨폮哨ꛪṻ", 499798, 520928, 880448, MaybeOfString("朿丯᤯쁣귊ꮅ螯"), true), RoomInfo("槉꽽还쬂麻룯흹댒䌤∇", 190362, 519644, 874871, MaybeOfString("坐풗䯻犖"), false)});
    Test_CheckProps_LobbyInfo("ꭸせ泴볹䰝Ḍ⁭", 261816, 469386, 614186, {RoomInfo("弑쥶뙎䈢䞨泿쥄뒅蕾쪊", 563010, 126483, 300080, MaybeOfString("᪊靍㱦ᇉ"), true)});
    Test_CheckProps_LobbyInfo("崵崜뼺", 242925, 30247, 738440, {RoomInfo("�⸆", 540215, 9209, 37037, MaybeOfString("㖹鐶鉥蟎⅒蓉"), false), RoomInfo("ဣ", 924553, 705023, 855864, MaybeOfString("끕蘆㉰춈ꪦﵥ⁥"), false), RoomInfo("隌셑�ᜯ䜲횧", 194684, 833524, 516599, MaybeOfString(""), true), RoomInfo("Ж꾟눗ᠤጾ焤", 753522, 778649, 561888, MaybeOfString("ᢆ民⏩㶏娠趯"), false)});
    Test_CheckProps_LobbyInfo("㹽筶렷圞", 213947, 864904, 36783, {RoomInfo("", 622834, 213334, 858572, MaybeOfString("�偣鍝帽䟚顑"), false), RoomInfo("쵑쌂�恜", 892341, 604216, 484140, MaybeOfString("黟ⶔ⭓Ϗ䦵ﯔ۱ᔍ䲥"), false), RoomInfo("콖�纄솁᠃穊皚ᮎ", 956196, 729010, 87168, MaybeOfString(), true), RoomInfo("㡙噬�", 865735, 36494, 722458, MaybeOfString(), false)});
    Test_CheckProps_LobbyInfo("尛ᬜ", 22255, 494827, 273664, {RoomInfo("拽롳魧톯̽䋏臁絸ퟃ", 528943, 643924, 667281, MaybeOfString(""), false)});
    Test_CheckProps_LobbyInfo("떕걒Њ薋⛢�", 356005, 979016, 869240, {RoomInfo("ફ筌杷譛諉ମ鉤", 817370, 485225, 957812, MaybeOfString(""), false)});
    Test_CheckProps_LobbyInfo("猸湍깿䇆尟ႄ鄠", 776192, 433339, 102014, {RoomInfo("췮玙ަ", 138870, 158391, 891045, MaybeOfString("ੲ쟗퀵㙙頻宬畭㒈祀"), true)});
    Test_CheckProps_LobbyInfo("㏆铵", 843521, 942156, 86566, {RoomInfo("", 322060, 793727, 618572, MaybeOfString("☉惝溙෋᭩⥼ᶈꗏ"), true), RoomInfo("뎃럑㗱䮅扌訧鍬⻜醪", 731185, 745927, 665655, MaybeOfString("뵚ㄲꞨ欸龲旆"), true), RoomInfo("�ᎆ䉫ᶉ␠", 336553, 978008, 458079, MaybeOfString("촒塯별໅ᷚ"), false)});
    Test_CheckProps_LobbyInfo("ᩲ茴锨꒘ꑸ剟", 205656, 28118, 80022, {RoomInfo("ꢐፕ꿖嗯♓⺔ⓗ픞䋭㷀", 577768, 187845, 944086, MaybeOfString("ꁴ벘"), false), RoomInfo("띠Ҵ偨륷왟跢뀳祐䊃眏", 666869, 890128, 531034, MaybeOfString(), false), RoomInfo("팻ꠣꦡ궈鶨�䖉몖⮂", 889035, 362539, 610269, MaybeOfString("⛁匚"), false)});
    Test_CheckProps_LobbyInfo("Ӯ绰ሤ粼䊍檭祬훼▜ऺ", 711918, 62484, 172081, {RoomInfo("瓐醘쥓㷹簝执쀰", 460842, 775944, 57749, MaybeOfString("�氁貓﾿꓾"), false), RoomInfo("", 691571, 867767, 215556, MaybeOfString("⤏둢饒籗鈊踜㲭"), false), RoomInfo("裏鵟榠", 735878, 292039, 585295, MaybeOfString("鎶术"), false), RoomInfo("ꆢ鷺䇊Ᏽ⼐㫎ⵋ", 36076, 473204, 873919, MaybeOfString("畑�咞繜"), false)});
    Test_CheckProps_LobbyInfo("₡쵱﫮౛閔힒握荑", 103806, 574564, 174949, {RoomInfo("�밪䇎藢窱", 590747, 515012, 390973, MaybeOfString(), false), RoomInfo("ퟷ점型噑灊鶢씧", 663108, 664882, 344178, MaybeOfString("䙟㠆ꧻ"), true), RoomInfo("亖䎜滺涸ⲩ墚찀�", 481013, 906881, 638773, MaybeOfString(), true), RoomInfo("觛᮵瓚뮒", 348306, 926406, 80996, MaybeOfString("棶"), true)});
    Test_CheckProps_LobbyInfo("ᔋ辥嬋", 809599, 999056, 658571, {RoomInfo("赟ꫤ揩価柅㥴抽�犏潯", 237212, 468954, 380763, MaybeOfString("䂤㶆�╞"), false), RoomInfo("廑소", 456430, 329261, 877241, MaybeOfString("죚佊꾈켽�"), true)});
    Test_CheckProps_LobbyInfo("", 12788, 195689, 190240, {RoomInfo("㒿콇娤嬟삩뛋呠撠", 534216, 7422, 179902, MaybeOfString("뗻ஹ誼䌵盅唄"), false)});
    Test_CheckProps_LobbyInfo("誆ﰉ狄崗", 602832, 815476, 384138, {RoomInfo("�璕橅", 17839, 779308, 778520, MaybeOfString(), false), RoomInfo("蛱弰뀿屑", 150950, 733330, 69358, MaybeOfString(), true), RoomInfo("ꭹꙅ轄绰", 644394, 886014, 412603, MaybeOfString("ᅭᜢ"), true), RoomInfo("빐骡ퟟਖ਼䞯", 180786, 312131, 175202, MaybeOfString("ធ뀣봌⾂ꘋ耬ꅿ"), true)});
    Test_CheckProps_LobbyInfo("", 364787, 244588, 41745, {RoomInfo("곽薐멈", 723955, 826022, 308232, MaybeOfString("ꛠꅨ撠"), false), RoomInfo("㭠쎾", 852873, 556798, 57061, MaybeOfString(), true), RoomInfo("ၑᅵ镙꧙렍閨", 39635, 814924, 850628, MaybeOfString("峡䎁ᴄ"), true), RoomInfo("ᛲ孮", 263833, 331783, 880554, MaybeOfString("릃⃶㨀幺՜硃Ј"), false)});
    Test_CheckProps_LobbyInfo("䶍ꉭ❯❵置瘉", 312956, 336239, 975471, {RoomInfo("湠", 311306, 303210, 480116, MaybeOfString("虽ﾧ㤌"), true), RoomInfo("龺搛κ훡楃ꤢ㟽", 832906, 317934, 730875, MaybeOfString("뜡睰㢑荙ԇ쁰㡩"), true), RoomInfo("궥鹖��ᵤ薝焷燀川蠪", 432224, 866985, 933327, MaybeOfString("٨蛎"), true)});
  }
  
  bool unitTestResults_LobbyInfo_Getters = runAsync(Tests_RegisterAll_LobbyInfo_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_LobbyInfo_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_LobbyInfo', UnitTest_OpEqSimple_LobbyInfo);
  }
  
  LobbyInfo@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in name, uint n_clients, uint n_rooms, uint n_public_rooms, const RoomInfo@[] &in rooms) {
    LobbyInfo@ o1 = LobbyInfo(name, n_clients, n_rooms, n_public_rooms, rooms);
    LobbyInfo@ o2 = LobbyInfo(name, n_clients, n_rooms, n_public_rooms, rooms);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_LobbyInfo() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", 393455, 392207, 212987, {RoomInfo("㻇娍쪁ᆬ鬹⁺詘렰", 776509, 60415, 479941, MaybeOfString("כֿ鐄ℛݙᚬ"), true), RoomInfo("ᛱ떡ꖯ", 511262, 903418, 366202, MaybeOfString("킅�叴뢦"), true), RoomInfo("䉍ዯ", 214613, 999074, 684010, MaybeOfString("਀"), true), RoomInfo("", 499239, 803100, 310539, MaybeOfString("蝔ᔁ䀓⃩쭶퍉첯"), false)});
    OpEqSimple_Check("㚉뙶娜", 631652, 156001, 536782, {RoomInfo("똮ꨕẽ", 812991, 511553, 854015, MaybeOfString("霍뗒떚核륙"), true), RoomInfo("␜῰蹎쟳횱宙홧㉜는", 541699, 822701, 757154, MaybeOfString("ꔬ"), true), RoomInfo("뭀ꃲ썵㞫", 117677, 288195, 531474, MaybeOfString(""), false), RoomInfo("䝅攨鑽烆ঙﶇ䚱", 133463, 481225, 673451, MaybeOfString("ꂅ䔲"), false)});
    OpEqSimple_Check("ਮ虴簪䤀揾噚셑燵", 610006, 627814, 18103, {RoomInfo("ﲁ들≱髀饁䱯淵", 411239, 791899, 539265, MaybeOfString("໿ꍱ꟤��뙑"), true), RoomInfo("श胤Ⲟ", 187689, 106739, 181998, MaybeOfString(), false), RoomInfo("䜧侉�尕놵", 304368, 940342, 430418, MaybeOfString("岁ꮸ㏧"), true), RoomInfo("", 455759, 221419, 524421, MaybeOfString("쬟칁껁⣣뾈噦颤픽"), true)});
    OpEqSimple_Check("错캈⧥疡赬ى⢍奟㜫", 786095, 880649, 365576, {RoomInfo("⛲㕤�⧙", 105782, 132045, 929297, MaybeOfString("뱉᧡⬆ꁓ縬"), true), RoomInfo("", 909926, 457029, 770199, MaybeOfString(), false), RoomInfo("䉰ꋗ嗳ರ", 631334, 680607, 279276, MaybeOfString("㽘웆覕䃄�ЊЫᯱ"), true), RoomInfo("통�ﭝ豲氹", 780762, 891985, 853751, MaybeOfString("ݤ謇든㣗짰ꌂ"), true)});
    OpEqSimple_Check("큽咪઼側똶뙈", 360988, 601038, 673623, {RoomInfo("춣ꯎ竚ꂠꋽঞ꼥ᗁ", 183287, 39828, 481138, MaybeOfString(), false), RoomInfo("ミօ⥶批钅", 511824, 897962, 427331, MaybeOfString(), false)});
    OpEqSimple_Check("砟ᙵ굩ᱟ骲盼ﰢ", 303636, 575611, 276400, {RoomInfo("", 296593, 97859, 343909, MaybeOfString(""), true), RoomInfo("", 877689, 112824, 776355, MaybeOfString("郹똹텽㙝㉻�냀"), false), RoomInfo("ğ", 48706, 794688, 783622, MaybeOfString(""), true), RoomInfo("ⴿ㓶ࣛﬣ�⟹驵盲ⓟ", 356165, 177350, 294139, MaybeOfString("秲櫩䗥讖宦"), true)});
    OpEqSimple_Check("텩㚽댯맑힊", 68111, 943082, 475754, {RoomInfo("聈厳눟ਵ⺊�半⩩⁦", 207505, 573410, 365268, MaybeOfString("믒趰忳쎓랔ꖒ鬋龕ຽҷ"), false), RoomInfo("驡囈椐༁틋�鯺䅷⮙ꥁ", 800931, 634867, 888785, MaybeOfString("Ȃ㹪쉰龊"), true), RoomInfo("", 884034, 6880, 361522, MaybeOfString("彄纇鼗䘚秱"), true), RoomInfo("銵뒮ꬴ새櫯쩈䰏禯", 560452, 404367, 586787, MaybeOfString("�⁔վ罚宿㝳"), true)});
    OpEqSimple_Check("", 79195, 89486, 787386, {RoomInfo("宦奋豮ⴈ֑⡋늟", 80547, 56148, 836181, MaybeOfString(), false), RoomInfo("䟧ఊꪫ㪛", 69302, 707858, 1447, MaybeOfString(), true)});
    OpEqSimple_Check("�鸋₫", 796197, 147837, 128962, {RoomInfo("䟒⹗㭁", 419277, 223235, 178912, MaybeOfString("韠፧迒䌡"), false), RoomInfo("⏭", 199578, 42866, 410482, MaybeOfString(""), false), RoomInfo("퐔䝈⊻弋ꑓ踠", 878514, 492262, 172612, MaybeOfString(""), false), RoomInfo("ࢫꂘび�瘣댮", 665073, 666256, 890828, MaybeOfString("䛳啨ꋸ艌֩੿퉛꿪⹳"), true)});
    OpEqSimple_Check("▴", 338233, 198145, 244123, {RoomInfo("⦝脘곅", 651960, 562413, 79137, MaybeOfString("淨�薮쮮磫呃温뗝쥨"), false), RoomInfo("挧ﳗ졝", 107419, 915066, 603924, MaybeOfString("龜릇v"), true), RoomInfo("녜뎙㾣咂ﱉ皾澐", 111470, 573616, 37300, MaybeOfString("຿゠礊"), false)});
    OpEqSimple_Check("磶▧汶틤榸倢슭", 303267, 239582, 15682, {RoomInfo("䨥踯龂Ƞ�뱄", 362536, 476823, 147507, MaybeOfString("ﳌ祊⠤❮"), true)});
    OpEqSimple_Check("㩧⏕Ҭ辙巴⶯", 571410, 302823, 987346, {RoomInfo("륳", 55892, 967496, 74974, MaybeOfString("碫烆寮侬䐾ʌ蛆鼞輋斍"), true), RoomInfo("扁拚ꑧ⩱ꛏ�암", 443493, 24041, 47111, MaybeOfString("�ᜯ㧳西뙶븳"), false)});
    OpEqSimple_Check("", 544275, 930556, 471983, {RoomInfo("埔캫뼄쳌食ꆔ", 889660, 383038, 607898, MaybeOfString("븥ꖙ∴簾뱟"), true), RoomInfo("蜢穽ᓪ辜榡㌼瑨ᘂ", 214799, 831702, 803513, MaybeOfString("ǫ揆쟶孛"), true), RoomInfo("䆀", 109996, 258463, 149093, MaybeOfString(""), false)});
    OpEqSimple_Check("潾쬨梖ᮺ勫Ꭼ頰", 424590, 422442, 62975, {RoomInfo("衔ΰ탡뒤엄闼嵞뿭燨ꍶ", 517655, 74666, 414623, MaybeOfString("䐤ⴢ摅캑ﴆ牌핧ᾓ"), false)});
    OpEqSimple_Check("ໞ탬鏩Ⓜ恇闥媰", 765188, 346449, 602322, {RoomInfo("髩浙䭬ࡸ廌ढ़秘号麼", 887256, 269383, 284635, MaybeOfString("侯억맖Ⴙ"), false), RoomInfo("鑽", 108210, 759338, 191343, MaybeOfString("ﴗ๋"), false), RoomInfo("౵泐詝", 817337, 56189, 335875, MaybeOfString("띴勇"), true)});
    OpEqSimple_Check("儦飼", 464965, 121879, 914953, {RoomInfo("鼹冥풭樮쟓銀氢봃", 187265, 471978, 737398, MaybeOfString(""), false)});
    OpEqSimple_Check("", 979110, 433206, 911862, {RoomInfo("⨎", 539629, 789431, 747418, MaybeOfString("눮㛆຺拇씌"), true), RoomInfo("⬄䴎뚶豗馌⬝ᒄᤊ䳥", 975449, 762468, 473475, MaybeOfString("딠㶷蠃ᚙ鋩"), false)});
    OpEqSimple_Check("떩煤⼉", 953245, 218550, 692957, {RoomInfo("ㆎ棌�곔櫽ꐫ␓", 144455, 463234, 88005, MaybeOfString("⊘�౟锜ᤩᕓℶ换"), false), RoomInfo("덷", 21957, 60435, 28953, MaybeOfString("萩➽縴邾"), true), RoomInfo("Ꮪ⹅", 530481, 340379, 536663, MaybeOfString(), true), RoomInfo("鉨恁", 41300, 364434, 611520, MaybeOfString("�晚"), false)});
    OpEqSimple_Check("旺沣￟㸄ໟ䄺ꐶ", 450585, 891430, 652705, {RoomInfo("䓓潶꜓⵬㊇ᖕ⺸⣥", 684592, 618548, 878200, MaybeOfString(), true), RoomInfo("勣낉婡ᩥἙ훬랅灪藂Ԭ", 270500, 720254, 854985, MaybeOfString("扐葁霤黟ꮪ"), true), RoomInfo("ﻲ扦ㄤ䣛䯬䴻", 721879, 494954, 933997, MaybeOfString("톓췾"), true)});
    OpEqSimple_Check("拳沈", 708753, 678575, 745629, {RoomInfo("㰶剎", 975752, 937115, 584989, MaybeOfString("꣜ᆐ첧첽賂둁圡芪ȯ"), false)});
    OpEqSimple_Check("軪砦濾㗲玬", 461071, 968142, 182715, {RoomInfo("", 174588, 79375, 401111, MaybeOfString("ꓛ廉ཝݿ厪ꎢң"), false), RoomInfo("䱨换ᵘ蒭ᦇ䳖뻏䞒㴭䔥", 187048, 735419, 948256, MaybeOfString("䞸鄈鲤戙᤿䜦鈷"), false), RoomInfo("堹", 294880, 121888, 445108, MaybeOfString(""), true)});
    OpEqSimple_Check("㏙伥╙灌띎噋ꌲ皒", 669536, 82473, 209134, {RoomInfo("짉⣻ّḧ魯멅", 938933, 884991, 453659, MaybeOfString("ᧁ⬤믍ﭶ"), true), RoomInfo("㤾䝤㰯", 968112, 262452, 458117, MaybeOfString("䆎䧱돉㘖惢"), false)});
    OpEqSimple_Check("즹", 761889, 639847, 59050, {RoomInfo("", 453397, 260611, 730443, MaybeOfString(), false), RoomInfo("୬堜ꗞ룝烀ꡕ휊魔吓", 466985, 360170, 760874, MaybeOfString("幺ਗ਼ᓊ鹿ݚ띤⻧⾁ᱡ"), true)});
    OpEqSimple_Check("胕库⇬뺏㨫Ꝫ缬컥", 58084, 869993, 321879, {RoomInfo("噫歪", 556133, 532394, 922379, MaybeOfString("煺"), false)});
    OpEqSimple_Check("姭", 597319, 699556, 892400, {RoomInfo("Һᶌ唤槷", 34644, 844730, 459806, MaybeOfString("烖ᩬ䎠찇ꑆ"), false)});
    OpEqSimple_Check("쫓됻⯌ꯘ眝بᱜꍗ⟷", 841672, 585579, 908199, {RoomInfo("힢✷㎾腒鸒닞鉤⡄", 318429, 919121, 55493, MaybeOfString("ᔲ疡谉闷䖕✚葝壜"), false), RoomInfo("⅒瓮", 178350, 527494, 804569, MaybeOfString("臨쬩"), true)});
    OpEqSimple_Check("㑯", 382292, 441708, 750443, {RoomInfo("༙㭮嗷㠽", 181749, 203441, 984216, MaybeOfString("韼쑜"), false), RoomInfo("㆒衐", 723929, 715890, 336965, MaybeOfString(""), false)});
    OpEqSimple_Check("㱈ᦦ�辎晇巒쮭龥俩", 826335, 635044, 159208, {RoomInfo("蕛⑰ㆤ", 560777, 802910, 544950, MaybeOfString("⍽䪅Ș焸镄辠"), false), RoomInfo("", 896538, 516893, 185454, MaybeOfString("汿뗼Ⲉꅩ糧⪮�"), true), RoomInfo("캊偛ᖧ⠀㲰ڣ", 31576, 129914, 725477, MaybeOfString("樥猚誟婢㭖"), false), RoomInfo("", 832754, 538512, 664123, MaybeOfString("뎲풴ㄛ"), true)});
    OpEqSimple_Check("氫", 91594, 189023, 293731, {RoomInfo("႒鐽⍒싊딯", 954369, 138013, 123157, MaybeOfString("釛ｂꝞ冷硃⶘"), false), RoomInfo("费", 574364, 520926, 983193, MaybeOfString("⿄䅓ﷇ⾂啷熖뤶底⼖"), true), RoomInfo("廚", 3612, 376259, 137895, MaybeOfString(), false), RoomInfo("膑", 169558, 983090, 77710, MaybeOfString(""), false)});
    OpEqSimple_Check("〬绾褟修쩶ꏒ莰", 498049, 520321, 684093, {RoomInfo("륳덏꽠枕", 121160, 19759, 290517, MaybeOfString("껃Ú웪ᦱ塉䂎"), true), RoomInfo("", 693141, 199060, 928239, MaybeOfString(""), true)});
    OpEqSimple_Check("耝뼮鑟➙虒擖ꖜ鹷", 921952, 584901, 546128, {RoomInfo("䷪", 273559, 251413, 354814, MaybeOfString("ܨmꉎ�ﲾ⾻㍷㚭ﲌ"), true), RoomInfo("₄⭇鯸䓚Ꝁ嬴㷊", 699724, 436916, 187315, MaybeOfString("♺摵ဢ珤㖫듣"), false), RoomInfo("닭", 954272, 880535, 660221, MaybeOfString("苶闔화᪢⁕虉੪謾䖰"), true), RoomInfo("ﴽ⃾땗뎨", 967547, 885993, 483834, MaybeOfString("᯷람⃧旝"), true)});
    OpEqSimple_Check("罛搷衏홌", 467571, 293754, 399209, {RoomInfo("陇듦ꪫ䥀袯⯇", 132409, 960509, 187178, MaybeOfString("霁쥟퐢℣努蝴"), false), RoomInfo("", 752554, 766843, 497681, MaybeOfString(""), false)});
    OpEqSimple_Check("뢭痔䬰鐾㌉앷貶鍓", 187517, 645777, 454006, {RoomInfo("笂鍙", 256051, 541111, 742384, MaybeOfString(), true)});
    OpEqSimple_Check("핦", 540193, 645478, 461735, {RoomInfo("̡䅝", 320678, 711565, 961271, MaybeOfString("鈔箲ჭ꿣꾶Ƞ"), false), RoomInfo("ෳ曽曰", 463075, 417007, 10985, MaybeOfString(), false)});
    OpEqSimple_Check("믦ݭ䣞�劔錵阸报琰", 798513, 890087, 79959, {RoomInfo("狞", 307062, 625359, 790121, MaybeOfString(), false), RoomInfo("఺쿔芽␸䑩˨忩", 719137, 218903, 358869, MaybeOfString("ưᢘ墇᎒햐⦀"), false), RoomInfo("냁헭츽", 962127, 694453, 863258, MaybeOfString("㦍"), true)});
    OpEqSimple_Check("ഔ縒Ԃ䐘♠넌", 475815, 720915, 744270, {RoomInfo("ᔅ휢䝨Π๑ꇔ", 87802, 469561, 649254, MaybeOfString(), true), RoomInfo("뀸�", 11692, 39657, 719855, MaybeOfString("좑"), true)});
    OpEqSimple_Check("쯢ᅸ뛦躌륕", 425670, 302337, 860238, {RoomInfo("ᙥ줊", 537566, 855703, 855553, MaybeOfString("䪌㷳缣紉ࢼ薷ඕ럥"), false), RoomInfo("漖ꄃ跚", 587251, 927919, 155983, MaybeOfString("钐╆哫�ښԸ鋸"), true), RoomInfo("", 562853, 767524, 658570, MaybeOfString("黛磍再倮ፆძ놈⸨"), true), RoomInfo("ᷜᔋᨈ", 948683, 328144, 964695, MaybeOfString("⅘솅俳蓋䛨鹭혈"), true)});
    OpEqSimple_Check("꣔ᙑ鋃姸Ұ咍", 41625, 796854, 159332, {RoomInfo("홨ꁾ齬✌凈️ḿ⭢炙⸤", 728432, 69024, 625199, MaybeOfString("ࢃ㑡큘䉙㨤泄쓣"), false), RoomInfo("ၠ", 95686, 634199, 13915, MaybeOfString("쏽㩍刱"), false), RoomInfo("ﮣﱔ抃໊뛵溭ᲊ", 999075, 975896, 675843, MaybeOfString("㜬쇅轓봫"), false), RoomInfo("쟅橊蓲", 796834, 848642, 714415, MaybeOfString("؎覸쩡䖓젝�"), true)});
    OpEqSimple_Check("죰�⒰끮ᯍई︜", 999446, 858476, 139778, {RoomInfo("陉⚏됡낷㪶堵", 430931, 379645, 170567, MaybeOfString(), false), RoomInfo("驚්﫣烎ぬః뙏콪飁", 351053, 88920, 252332, MaybeOfString("㏺욊僡�쫫퇊糐꽀ႈ"), true)});
    OpEqSimple_Check("寧", 755395, 653997, 352798, {RoomInfo("됈३纵", 158213, 641759, 979116, MaybeOfString("૖콃䐝〣꥙깖耫沦밑㐥"), false), RoomInfo("�๠䬮颼贩羊鰫鹰䊦", 98752, 645649, 377273, MaybeOfString("撎涯밅᪬콝㟟"), false), RoomInfo("븀⹀휤ꪅ醨", 214205, 19445, 952081, MaybeOfString(), false)});
    OpEqSimple_Check("苍Д㒱⎚箶쭀쫵", 959332, 355650, 780936, {RoomInfo("房撻淆崰陞驿㘸", 259347, 361852, 497879, MaybeOfString("औꁶ騼푯䅕苻໷"), true)});
    OpEqSimple_Check("", 527262, 73703, 209157, {RoomInfo("澸奩꩏缷π呖㨈뒡", 108979, 6172, 971850, MaybeOfString("ｷ쾷舷嬝ࠡ蒠ﱰ㢣੖"), false)});
  }
  
  bool unitTestResults_LobbyInfo_OpEq = runAsync(Tests_RegisterAll_LobbyInfo_OpEq);
}
#endif