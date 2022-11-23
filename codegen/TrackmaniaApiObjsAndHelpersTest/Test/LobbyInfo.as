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
    Test_ToJsonFromJson_Check("", 129450, 573551, 355425, {RoomInfo("簔�좕큇", 816099, 752865, 87509, MaybeOfString("暂"), false, 316905), RoomInfo("뜣힐", 481904, 681748, 661401, MaybeOfString("ᲊ̇॑"), true, 355942), RoomInfo("땶烈軻", 331709, 704518, 900608, MaybeOfString(), true, 755012), RoomInfo("ﭤℊ䮇귂⎶", 44895, 413674, 458248, MaybeOfString("澯�჌江䚏꼸䃧"), true, 587832)});
    Test_ToJsonFromJson_Check("㚡딽蔭䍕᫃ᔼꊛ", 936174, 391029, 656514, {RoomInfo("㌴", 962581, 425743, 228874, MaybeOfString("杒୒D䀗ꬨ憽畏"), true, 450229)});
    Test_ToJsonFromJson_Check("ﱻ狀ꆟ㾩炤䩦ᛥ婫", 201887, 700350, 291599, {RoomInfo("", 681635, 943851, 305673, MaybeOfString("엣ᩁ㟅ഽ"), false, 115425), RoomInfo("ᇠ炦♱솎", 809822, 507044, 850929, MaybeOfString("炄"), true, 932520)});
    Test_ToJsonFromJson_Check("뤗慵뽳掗ￊ", 694964, 789918, 70765, {RoomInfo("更든Ηꨘ躀퓹ꔴ", 417442, 351797, 529015, MaybeOfString("䙐"), true, 147453), RoomInfo("鶳ᄶ窐踎윉懜翊", 555417, 38087, 419346, MaybeOfString(), true, 106792)});
    Test_ToJsonFromJson_Check("鍡轔", 757477, 61319, 220027, {RoomInfo("ཞꑓ뷾�뤴焦", 342727, 17362, 228006, MaybeOfString("샞"), false, 296391), RoomInfo("㓉⩊转ᢶ퇈侘룒फᝌᣇ", 6572, 600826, 26129, MaybeOfString("蠑坖"), true, 178195)});
    Test_ToJsonFromJson_Check("萋笩萐", 986174, 40651, 714151, {RoomInfo("淣", 646581, 490369, 936231, MaybeOfString("ᴝ삱鄎吐�Ͼ斐임㾂"), true, 554346)});
    Test_ToJsonFromJson_Check("엽뷗뢑", 227340, 204841, 881761, {RoomInfo("", 545124, 658366, 636085, MaybeOfString("겶຾"), false, 692390), RoomInfo("", 969638, 148290, 551413, MaybeOfString("딙"), false, 604406), RoomInfo("號㪳ᒶ퐞也툃뻬笜", 122713, 436624, 188204, MaybeOfString("豣閑㏲ᔲ逥좣㉒㇜ꗸ"), false, 212735), RoomInfo("ૢ랶侥", 7765, 188934, 214175, MaybeOfString("ঽ"), false, 944723)});
    Test_ToJsonFromJson_Check("", 858803, 605906, 692982, {RoomInfo("髍澇㤘▝ħ蔋팪絠촊", 41873, 699484, 548088, MaybeOfString("횊穧돤魣䐵뒠빖裮"), false, 245672), RoomInfo("求뺝숯䐪䈞䞞", 771523, 508457, 876283, MaybeOfString("罧㣜樐㽼㿝啻苅㍧"), true, 160914), RoomInfo("漻拹ⓨ", 643309, 111365, 526475, MaybeOfString("㢭ꇔ格湴"), false, 844727)});
    Test_ToJsonFromJson_Check("ᒢ湾", 12880, 621120, 992957, {RoomInfo("첕풠躹伲킬簱", 248233, 513580, 543139, MaybeOfString(""), true, 352251), RoomInfo("馒扁", 853246, 408753, 120250, MaybeOfString("䐁ߠɯ밥�틭姻韷ሸ蜰"), true, 611399)});
    Test_ToJsonFromJson_Check("綐⨱㇟ꪒ", 364627, 7076, 974359, {RoomInfo("ᢰ靡ﮃ嚄", 681867, 170734, 306458, MaybeOfString("胛๫"), false, 935263), RoomInfo("꼵䁹呦㷽", 64905, 260294, 13752, MaybeOfString("⢻疳쨟ጦ"), true, 233926)});
    Test_ToJsonFromJson_Check("䊼", 804780, 477471, 147878, {RoomInfo("⏎늻텿錈솢", 237140, 380994, 958812, MaybeOfString("㕚别꼭㗶澃軬ꇈ"), false, 607998), RoomInfo("濍γ曘⮢꓾ȝ䨕碣", 466997, 726580, 59326, MaybeOfString("耾㾃庅鿹紣ㄷꀞ秇"), false, 846903)});
    Test_ToJsonFromJson_Check("㉹值ᶀ䍾㎦", 11650, 345755, 314499, {RoomInfo("䎇", 20231, 116955, 720361, MaybeOfString("Ⳉペ蛛᠓"), true, 767134), RoomInfo("蜰ộ念ꓩ", 230185, 173718, 661932, MaybeOfString("昡˶鵺ﯶ"), true, 432442), RoomInfo("淮듑箩厈䃐᲎暓煆펾", 892962, 665571, 156482, MaybeOfString("젾늇媎笖瞽犆"), true, 192767), RoomInfo("", 116611, 406196, 62621, MaybeOfString("詓鐋"), false, 462683)});
    Test_ToJsonFromJson_Check("೵횽祋阈熲", 890783, 322790, 990125, {RoomInfo("允틼潨ⶌ㚍뾮", 208414, 969882, 793999, MaybeOfString("힒뼘㽗"), false, 123307), RoomInfo("", 259833, 106956, 933416, MaybeOfString(), false, 194770), RoomInfo("ঈࢧ", 98773, 636807, 957778, MaybeOfString("뽶"), false, 503046), RoomInfo("ᭊ初�䯊ךּ", 161281, 712655, 38087, MaybeOfString("酒袑橒檡͢떳窖鬦歾"), false, 599454)});
    Test_ToJsonFromJson_Check("�巸", 324522, 829574, 458811, {RoomInfo("෎턒柬઒궅", 767208, 348687, 748249, MaybeOfString("쨳〛ⵐ"), false, 935244), RoomInfo("塻盩鮕雮亦釪挨⎈", 676260, 84621, 798623, MaybeOfString("殱壘䅣�"), false, 204640), RoomInfo("㽇䙃珍㉡�郺黋▘녝裂", 245926, 621484, 523884, MaybeOfString("Ԟ൪"), true, 515698)});
    Test_ToJsonFromJson_Check("鵒㼅", 98021, 676304, 338922, {RoomInfo("⧐㗪ⲷ窕ꄧ迴", 527472, 344585, 32769, MaybeOfString("ⱪ탵"), false, 136229), RoomInfo("䳠", 831451, 730312, 609876, MaybeOfString("䅏᷄ꘖ蚜"), false, 203671)});
    Test_ToJsonFromJson_Check("ꆑ榻秱�", 491580, 455245, 692501, {RoomInfo("뺿쭠贑麏揅שּ㰄⅝Ҥ襤", 130869, 540486, 615506, MaybeOfString("蛅䬈줺ᠣᨲ瀔ሑ瘻"), false, 788234), RoomInfo("걗�埈㩜ﾴ连㻰쮛䣔搵", 519051, 164551, 322748, MaybeOfString("蒌惴礰튫탱ⶽន焦藒ꕦ"), false, 471185)});
    Test_ToJsonFromJson_Check("ꠌ⋞ネ얽䦵೿", 248162, 83873, 453767, {RoomInfo("妬聸顤咙䤔", 905949, 815432, 459961, MaybeOfString(""), false, 989527), RoomInfo("", 267833, 323688, 703275, MaybeOfString("ꃆ塀"), false, 975179), RoomInfo("ꇵ", 32450, 990759, 881222, MaybeOfString("໾趀㍟㤒居개"), false, 419168)});
    Test_ToJsonFromJson_Check("廔授뫑", 514111, 906765, 973371, {RoomInfo("埈핹", 37056, 432533, 668463, MaybeOfString("汫ㇵ⇖"), true, 286439), RoomInfo("٧Ⅲꂐ硘우梨", 429305, 732290, 358371, MaybeOfString(""), false, 668195), RoomInfo("伜", 743799, 704637, 700426, MaybeOfString(), true, 789300), RoomInfo("尊䉸䅐⮱苸", 149252, 195022, 302371, MaybeOfString("筺궜쁶"), false, 315557)});
    Test_ToJsonFromJson_Check("䯞髟螋뱏熫鏵", 904511, 913697, 587688, {RoomInfo("偀茹庱釚왗꜖ਤ", 47059, 309385, 321872, MaybeOfString("ᄯ⫼䇤屴"), true, 865608)});
    Test_ToJsonFromJson_Check("㥄縄썗겼ႝ엃븸⦽擱", 498626, 121045, 995393, {RoomInfo("ほ跱倭䗷辣⇹鞫", 776333, 8874, 36138, MaybeOfString("︈얖"), false, 179847), RoomInfo("砐ᤌ�媓㊵覞잰聡", 800187, 218039, 799550, MaybeOfString(), true, 475412), RoomInfo("ᰪ栎纰乩궕", 789834, 505958, 901982, MaybeOfString("癱뎫"), false, 944920), RoomInfo("騩ࡷ飵", 619631, 402655, 369631, MaybeOfString("氃Ꮸ㐐혆한팬"), false, 289997)});
    Test_ToJsonFromJson_Check("唃쟚뒍봴", 913860, 390837, 52290, {RoomInfo("�臠㾼ూ", 83683, 125148, 181121, MaybeOfString(""), false, 756055)});
    Test_ToJsonFromJson_Check("ᶜ㮉嵥ꨜ鹬", 452588, 146125, 172722, {RoomInfo("㫨὇ų᫝檃添쏯籰", 921056, 910510, 633479, MaybeOfString("㫟멠䮇潍"), true, 594783), RoomInfo("瘏�逊퉈", 166255, 761946, 851937, MaybeOfString("⌞餷褅吢"), false, 272044), RoomInfo("춙K䱯㨯葄㿮쇴聇㻇", 924168, 134123, 365100, MaybeOfString("태�별Ἰ絽ㄆ"), true, 717251)});
    Test_ToJsonFromJson_Check("᝹쭗緞쐼", 373576, 63877, 233469, {RoomInfo("ኂ〳螦䪾癌", 396074, 602825, 608199, MaybeOfString(), true, 949154)});
    Test_ToJsonFromJson_Check("搷窐梁�東巹걲�᾽羊", 431292, 21587, 517810, {RoomInfo("祝ꠋ��", 799321, 649165, 291812, MaybeOfString("䲩ꌲ⿰�쳾ૹ䱕᛺"), false, 533747), RoomInfo("㿮", 393864, 502672, 684342, MaybeOfString("猦⩋ᗐ댯洴"), true, 169300), RoomInfo("쏁ŵ", 114684, 841147, 789280, MaybeOfString("�"), false, 256514)});
    Test_ToJsonFromJson_Check("٬ﻎ୑ﵶ溨", 885090, 629058, 258985, {RoomInfo("鼏", 815094, 145929, 162138, MaybeOfString("及帾衞틢"), false, 860234), RoomInfo("蕢ᆟ䭼䐘췱䬊礫", 193559, 683023, 92384, MaybeOfString("뵅윪㧘ڎ⣑"), false, 741968), RoomInfo("衤", 649819, 79705, 445080, MaybeOfString("驸ﰹ珛㸤⇢"), false, 245375)});
    Test_ToJsonFromJson_Check("瑢탫콫Ⴗ鲧", 234949, 858090, 597958, {RoomInfo("뺦疂纑긶嘍", 622649, 391788, 690690, MaybeOfString(), true, 493940), RoomInfo("꫕ૃ滛窖", 365427, 216222, 204974, MaybeOfString(), false, 177646), RoomInfo("✬맺�柚촵䞌锑敦暒", 507599, 783504, 553517, MaybeOfString("�㱎⃯ꎊ쀃䩏沂"), false, 679391)});
    Test_ToJsonFromJson_Check("鸚圲枴Іﰹ奡Ṵሗ", 523522, 91131, 354071, {RoomInfo("逬빡￥ࢽ㺸仝觪蜌", 611693, 807355, 571537, MaybeOfString("කꪓ"), false, 668434)});
    Test_ToJsonFromJson_Check("춼Ὥ鬎紩泶ꏟ", 389563, 673062, 486925, {RoomInfo("簬蘲擘粔ḁ㵎愆ꏞ", 494223, 121892, 445243, MaybeOfString("侺"), false, 220793), RoomInfo("ס겫", 589215, 698485, 357292, MaybeOfString("복䠄ᣊ䁿잸嘼挜䆪ֱ"), false, 701883), RoomInfo("딙", 315516, 283138, 536334, MaybeOfString("嘙"), false, 599752), RoomInfo("箿䩢灁딟榗", 969712, 494694, 934480, MaybeOfString("줙㠉ៅ倖"), true, 316229)});
    Test_ToJsonFromJson_Check("욘፟⩜頿", 959028, 848468, 781780, {RoomInfo("ࠨ龁氌犍卣", 138179, 493396, 811745, MaybeOfString("娏ꚉ㣩ⵅ�"), true, 742311), RoomInfo("䋯", 920437, 166449, 242571, MaybeOfString("㮍"), false, 896362), RoomInfo("㢥搩릟愰宫掽밣", 302305, 891202, 703569, MaybeOfString("㫤涶隄ꜳ"), true, 126303)});
    Test_ToJsonFromJson_Check("뒠菱欴ᒐ", 983380, 705632, 883591, {RoomInfo("힪", 414015, 671139, 417054, MaybeOfString("�嘇ಝർ綾屇貉聯⥋숟"), true, 301415), RoomInfo("ᩅ", 902883, 764765, 958133, MaybeOfString("⇀"), false, 825117), RoomInfo("敲Þ욎ä픻", 181073, 275368, 544196, MaybeOfString("Ｌ䀞졡焎耥"), true, 417457)});
    Test_ToJsonFromJson_Check("⺩뷗걲凌韵", 87117, 763345, 181261, {RoomInfo("", 766280, 972627, 319200, MaybeOfString("뿱춟쨗퍑짏虲棖჻"), true, 874819), RoomInfo("䌬耓톴", 930126, 414408, 433970, MaybeOfString("腎罈퀮鐘㬸"), true, 783888), RoomInfo("", 30160, 583173, 797416, MaybeOfString("睯੄莄㾡琎鱡튃ඌ"), true, 248168)});
    Test_ToJsonFromJson_Check("ਕ", 21687, 415918, 211321, {RoomInfo("诫镤牗蓤Ẹ儂즀룗鰔艗", 56294, 683680, 873516, MaybeOfString("뀠혦璊闛䒛鮱ξ脏"), false, 232360), RoomInfo("䌹", 241950, 951804, 653056, MaybeOfString("햙Ⅱ㞩ꚗ옴鬸蝸꺲"), false, 511626), RoomInfo("ୄ蟖溚荠ݲ₶᰸鍠", 743175, 10048, 188563, MaybeOfString("�ᾥ"), true, 955293), RoomInfo("", 483226, 502276, 677329, MaybeOfString(), true, 810727)});
    Test_ToJsonFromJson_Check("Ṟ阯�䅏᭚ᐻ껚ꗻퟤ䲩", 538951, 938533, 96998, {RoomInfo("賕䩬식㾓툓詸懜", 473847, 813723, 822275, MaybeOfString("뮒綳忪豘虝冀ꂔɦ჊"), false, 974666), RoomInfo("䶂쩪靚甴四�ૐ쐓揗鿽", 710890, 450809, 576254, MaybeOfString("ᐤ"), true, 542955), RoomInfo("ඃጱꚏ។왼", 456569, 117415, 62675, MaybeOfString("瘁펑"), false, 454421), RoomInfo("ؐ랓嚸繂�", 207061, 220554, 725799, MaybeOfString("땹搿鿄鄮絠畂ꈼ"), false, 428219)});
    Test_ToJsonFromJson_Check("槵롤㎓荮൑邿峑뷸⛤ܔ", 222696, 47831, 719670, {RoomInfo("ߤ杖Ա䉘૜ᄀᓍ", 900361, 138184, 806988, MaybeOfString("雼ꖰ埗"), false, 145210), RoomInfo("", 680802, 295798, 885713, MaybeOfString("᜾ꅢ캮猫존툘"), false, 403684), RoomInfo("�ᄌ詨俫럷ሇ穗", 542000, 552512, 345225, MaybeOfString(), false, 227847), RoomInfo("致", 469870, 580434, 829197, MaybeOfString("뤨ㆥ췥"), false, 286278)});
    Test_ToJsonFromJson_Check("觰㌓浦姰頙", 315603, 362969, 232454, {RoomInfo("쇓ㆋ꾅ꆇ跿良徊", 949533, 271519, 232665, MaybeOfString("饧눇"), true, 839534)});
    Test_ToJsonFromJson_Check("⿟垏蓍衕馢", 299973, 481194, 253752, {RoomInfo("税䟗ꪻ㼸᏾ꛄ", 288488, 103182, 549499, MaybeOfString("屧孽끌䦅"), false, 175446)});
    Test_ToJsonFromJson_Check("猭", 310466, 581206, 794214, {RoomInfo("䦘", 323170, 561761, 263874, MaybeOfString("窑ꩫ"), false, 225808), RoomInfo("䆼᷃柟饤禅㒕", 924485, 531747, 931348, MaybeOfString("趑"), false, 972857)});
    Test_ToJsonFromJson_Check("駨", 70330, 989022, 271319, {RoomInfo("ꑿ᮰刮ढ़쌻뜢", 203991, 277289, 21909, MaybeOfString("뉧樂穢�㆝䗆"), false, 7625)});
    Test_ToJsonFromJson_Check("滚彧쓣ŰﴏÅΉ", 940421, 574159, 68491, {RoomInfo("", 804706, 661526, 196969, MaybeOfString("ז꒳ၳ甘ꞻ잛"), false, 592254), RoomInfo("떌", 232575, 716807, 799164, MaybeOfString(""), false, 414732)});
    Test_ToJsonFromJson_Check("걳冯ㅕ쏬ᙶﵡ凞獇쎦", 362026, 566751, 88926, {RoomInfo("矓颀闋啪℘⬊郅筹", 9858, 253922, 500811, MaybeOfString("ㄵ隟퍬䴐"), false, 231903)});
    Test_ToJsonFromJson_Check("ᗢ葫㠵䯾", 248519, 809712, 676678, {RoomInfo("풫�稽픺⡤⎰", 859185, 31792, 406374, MaybeOfString("놬"), true, 120847)});
    Test_ToJsonFromJson_Check("甎ӝ㲵佢䦡醮", 750765, 833467, 294621, {RoomInfo("뚁", 746516, 409004, 668740, MaybeOfString("涒"), true, 499696), RoomInfo("韶怘�稲온", 930951, 170271, 933322, MaybeOfString("浶弗䒽丗"), false, 927224)});
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
    Test_CheckProps_LobbyInfo("�￿躮䮠馩�", 980813, 825164, 378662, {RoomInfo("쿵ᒄ暭쑁㚷", 87722, 931445, 242516, MaybeOfString("漽똮覧﶑䙢꺰ꦞᩘ"), true, 845199), RoomInfo("븺寔옛", 397204, 920219, 842266, MaybeOfString(), true, 738538)});
    Test_CheckProps_LobbyInfo("Ѳ䊣", 260232, 290772, 765075, {RoomInfo("拺윰蘆콬⨸۫芁", 986078, 321608, 715346, MaybeOfString("䧩㓅磃ଧⴐ﯐"), false, 149817)});
    Test_CheckProps_LobbyInfo("那", 853156, 438676, 425498, {RoomInfo("帧�㶈�㻡뼇ṽ杢", 780640, 56077, 281728, MaybeOfString("묹뭷┼쿽騍큋㈣揘䢊"), false, 998389), RoomInfo("䜮ᚗҳ충멵ᶼ覵", 55266, 412334, 429159, MaybeOfString("拣䵱"), true, 443180)});
    Test_CheckProps_LobbyInfo("޷Მ", 271115, 83749, 89913, {RoomInfo("弊䮷⃷쨗蝢ᳳ쁼", 816997, 96323, 378630, MaybeOfString("鉴㉙挶㊜䱁蝜炚"), false, 153273), RoomInfo("쭜䢝", 363342, 361241, 585012, MaybeOfString("轈ꭾﯗ"), true, 37504), RoomInfo("ꦽ㎀꿈�", 680656, 509010, 703391, MaybeOfString("뵋榟蚂㢲蘆鞆"), false, 591738)});
    Test_CheckProps_LobbyInfo("륦홰떌䱇盰", 184404, 428390, 96314, {RoomInfo("넚敦壁ꦏ썱줖", 874548, 871160, 252345, MaybeOfString("߇"), true, 401776), RoomInfo("레휺堷䑵蚖䜙莬晰", 251911, 725799, 706228, MaybeOfString("胊의䉶杻"), false, 748967)});
    Test_CheckProps_LobbyInfo("⽍捲껠ﲜቚ⬋㫟", 597733, 906029, 246229, {RoomInfo("벷쨭욢璞", 30588, 515696, 406688, MaybeOfString("༻耓봸鱚뿽룣ӟꓟ"), true, 312816)});
    Test_CheckProps_LobbyInfo("", 970606, 35581, 597764, {RoomInfo("⒄색", 149066, 399166, 823384, MaybeOfString("Ⴒ嶹"), true, 809718), RoomInfo("꿫琢췹", 724656, 653215, 669169, MaybeOfString("쫉䶶꣰䃹눭쯺튯㱷ဥ"), false, 555689), RoomInfo("", 77000, 83132, 874988, MaybeOfString("颦蚕"), true, 581447), RoomInfo("걍퐮뼗", 363094, 30355, 547373, MaybeOfString("⭉ソ⿈鄠짭㦟茍沕"), true, 244633)});
    Test_CheckProps_LobbyInfo("퉾돂띨體륯幈᠀㯱", 285594, 730044, 27157, {RoomInfo("㻗﬽팊�슍郫홟㕤㫛", 497196, 724861, 452001, MaybeOfString("齜圓涾⚬娗鿍"), true, 623932), RoomInfo("็۟弜쌘㙛핺﫽㑪", 783971, 913764, 883796, MaybeOfString("쪄"), false, 983400)});
    Test_CheckProps_LobbyInfo("ȟ薲ꭉ", 680498, 521868, 335576, {RoomInfo("弨犳㮲ნ꫃뻪㬲Մ", 107715, 150513, 313986, MaybeOfString("ㄚ�妐檣袿칉谜訷"), true, 893367), RoomInfo("�", 691833, 949885, 434223, MaybeOfString("镧畉弐狝פ뤫硥홅惗"), true, 842721), RoomInfo("齶褱炋�Ժ蕧枪ⳳ", 970711, 573283, 272553, MaybeOfString("⍪⧞"), false, 443541)});
    Test_CheckProps_LobbyInfo("崉懮�", 972876, 36717, 572159, {RoomInfo("啕ኞ衍蛜", 289630, 747574, 598425, MaybeOfString("Ⰼᜤ朠㹒稃⤳늽"), true, 487252), RoomInfo("嬑훃덙⋵", 969195, 468413, 455407, MaybeOfString("࣓렎䰩⮵⧿堫竎绒ㅠﻬ"), false, 900907), RoomInfo("骗뱼扟킋泎ⲅ朓复䚃", 40648, 927132, 650605, MaybeOfString(), true, 156441), RoomInfo("㗟豺댜￰귥", 990522, 133511, 930210, MaybeOfString("圙枩紂鯴떩ℭ"), true, 902045)});
    Test_CheckProps_LobbyInfo("揉筢㲸肅瞇", 614957, 798073, 766638, {RoomInfo("㧝䅴헜", 447727, 324005, 106890, MaybeOfString("꬈फ़Ը㌲"), true, 598027), RoomInfo("贈憚苣㯴︺了椇榩맃", 220917, 728517, 49619, MaybeOfString("榈俍"), true, 688307)});
    Test_CheckProps_LobbyInfo("拓㐺䗎稦⡠式", 263376, 559594, 120678, {RoomInfo("밃괦㮜䔐炒悄௶揸", 802517, 603343, 642519, MaybeOfString("禧ᝃ沕�씼旝吾捣嶟"), true, 498609)});
    Test_CheckProps_LobbyInfo("澎낭荸〈韴", 926444, 679346, 541083, {RoomInfo("댄⯤槯梾⛬", 187198, 207929, 711529, MaybeOfString(), true, 928835)});
    Test_CheckProps_LobbyInfo("厷ア炦勭疺잔", 60867, 995994, 351745, {RoomInfo("㷀뵌慔駐윳陑镉⣀跺", 801061, 237337, 427811, MaybeOfString(), false, 56836), RoomInfo("鈖", 963563, 383195, 209250, MaybeOfString("ዖ�匶⨏"), false, 80069)});
    Test_CheckProps_LobbyInfo("⛳唏⃙㾥", 905806, 387647, 160891, {RoomInfo("뿗", 688748, 728971, 224387, MaybeOfString("蛫龆뇘"), false, 836382), RoomInfo("㘊荏픽�ㅝ⧲卨펟", 742877, 267481, 920512, MaybeOfString("虋陱濣灈￨"), false, 321742), RoomInfo("텿霈", 673537, 116595, 853742, MaybeOfString("솱挂ꁪ쥫�쭑뒱㵉"), false, 206838)});
    Test_CheckProps_LobbyInfo("蓸", 542936, 5170, 395220, {RoomInfo("諪ﰞပ꙳㜢㠱", 238728, 687975, 193210, MaybeOfString("Ჿ䟪롶꠸텤"), false, 391279), RoomInfo("ည쥙鎫籄", 262313, 646611, 566801, MaybeOfString("蹘ŷ뇉"), true, 727307)});
    Test_CheckProps_LobbyInfo("ꑐ횹ڄ课幝젟�", 778262, 501081, 742990, {RoomInfo("퇷慉炷軫锸뺢鰸", 218602, 711427, 398345, MaybeOfString("⌊핤촆᠅絵橱꧵钖勸"), false, 212632), RoomInfo("됧ꖮꔂઆ雀", 125245, 384998, 229264, MaybeOfString("딳落᤼擭硈勋⊲ǫ礳"), true, 692881), RoomInfo("㩈㉡㘬䑰끰㕵ｴ", 442199, 819909, 895348, MaybeOfString(), true, 346080), RoomInfo("㟦兡䏰糗鿾돵傗䘠", 538331, 186260, 74594, MaybeOfString("㳲嘁�Ȩ㘅驹劣"), false, 841486)});
    Test_CheckProps_LobbyInfo("", 659544, 25802, 150520, {RoomInfo("票彣饽", 3143, 604029, 254338, MaybeOfString("歽፦뿤ᾖ뚬淾沁"), true, 926072), RoomInfo("䤩卑̐", 56786, 772844, 155241, MaybeOfString("暪棱館迠"), false, 170971)});
    Test_CheckProps_LobbyInfo("廒ㇱ팜锏▽", 77868, 431019, 833518, {RoomInfo("銇", 404414, 483702, 958467, MaybeOfString("䟧儷墽"), true, 316700), RoomInfo("虒俀耥౩ꡯ᧠苶缶ϱ�", 436507, 588224, 848364, MaybeOfString("떵�鷜™櫃諄垇"), false, 422368)});
    Test_CheckProps_LobbyInfo("", 872577, 344381, 934864, {RoomInfo("愫팹룼崬銌꼾ǋ鯮镘", 292558, 647747, 215935, MaybeOfString("襎鿎"), true, 176023), RoomInfo("븇괘摄䃜鬲", 45846, 363061, 126802, MaybeOfString("ꎕ"), true, 638305)});
    Test_CheckProps_LobbyInfo("", 248619, 192100, 791278, {RoomInfo("삢〨휓퀒᯺싵뚔", 776838, 914143, 859667, MaybeOfString("浃፛"), false, 664163)});
    Test_CheckProps_LobbyInfo("꒻⼧闂Ꭴ詓燥", 60944, 671671, 493987, {RoomInfo("킮㴗퍶碂뾆", 699301, 751134, 568489, MaybeOfString(""), false, 344417), RoomInfo("뭇⅖픻脍", 586115, 473488, 77247, MaybeOfString("づ뮔죯뱿锄�ꦸ슇훃�"), false, 369053)});
    Test_CheckProps_LobbyInfo("␁", 371580, 246135, 804316, {RoomInfo("║ｷܫ", 16302, 218359, 873621, MaybeOfString(""), false, 191)});
    Test_CheckProps_LobbyInfo("쀞镸", 769082, 882101, 92892, {RoomInfo("虋㖈ᘈ缥躒", 221147, 407516, 928807, MaybeOfString("砎끸쁂"), true, 183001), RoomInfo("◫Ī ↥�獠罠", 972215, 813043, 492174, MaybeOfString("쐱ꥵ썳"), true, 973286), RoomInfo("뱴墆�∗楦鷞≦", 634565, 214250, 163447, MaybeOfString("㹆㦌"), false, 483076)});
    Test_CheckProps_LobbyInfo("", 638707, 393001, 753390, {RoomInfo("", 426363, 224495, 444321, MaybeOfString("鈛"), false, 147982), RoomInfo("꒟�ῼ錦鳕஋Ɂ", 670703, 295740, 740829, MaybeOfString("距쥎"), false, 243411), RoomInfo("", 142000, 90852, 949284, MaybeOfString("嵨㟠㕆蔎椑豫"), true, 176373), RoomInfo("�슌욵ｪ餤", 778449, 127133, 482767, MaybeOfString("㒴캹차쎉䥰"), false, 26954)});
    Test_CheckProps_LobbyInfo("ﰹ槉", 519644, 874871, 555939, {RoomInfo("螯ꢁ", 21914, 119397, 683862, MaybeOfString("�․"), false, 697943), RoomInfo("坐풗", 674031, 466166, 200762, MaybeOfString(), false, 565833)});
    Test_CheckProps_LobbyInfo("睚혤", 782099, 802745, 524932, {RoomInfo("⑹箜芘뱷᪊", 224748, 949125, 459353, MaybeOfString("ꔛ覩䢕槓"), true, 690759), RoomInfo("惺敚ꊔ䝻", 996571, 165383, 681803, MaybeOfString("鏉쫿뙡쀿蚺輂"), true, 77927), RoomInfo("碻", 457328, 699410, 699358, MaybeOfString("醈�铙ឡ"), false, 469386)});
    Test_CheckProps_LobbyInfo("㔓襥⦠ᩏ歒", 561888, 684080, 802195, {RoomInfo("㡙噬�䄀ੱ", 865735, 36494, 722458, MaybeOfString(), false, 403193), RoomInfo("䇑홂᫐퓙", 2630, 182479, 721285, MaybeOfString("工"), true, 710033), RoomInfo("椪", 556563, 896246, 710665, MaybeOfString("⸆ẜꄅ混ᮧ芋곰"), true, 126556), RoomInfo("", 372917, 112138, 611139, MaybeOfString("쨉�똣럴舟滐隌셑�"), false, 703200)});
    Test_CheckProps_LobbyInfo("", 377939, 509571, 477762, {RoomInfo("⼗낂ؿ兩", 849949, 48039, 694053, MaybeOfString("㙖㲶㙢벾㄄"), false, 643924), RoomInfo("䟚顑惱", 462149, 629139, 609392, MaybeOfString("ꝃ尛"), true, 12789), RoomInfo("", 610847, 215650, 836901, MaybeOfString("ݜ撌窘룛擤"), true, 109733), RoomInfo("镊", 452727, 182791, 11096, MaybeOfString("嶂�浼쵑쌂�恜퉜푖"), true, 937428)});
    Test_CheckProps_LobbyInfo("蒢僟", 954538, 686259, 910162, {RoomInfo("邩䘸", 784379, 293743, 129909, MaybeOfString(), true, 551120), RoomInfo("鄠殺⤎", 946422, 58037, 319728, MaybeOfString("玙ަᗱ⸡┎旺ഫ勺"), true, 103831), RoomInfo("ਏ�勀", 347109, 3983, 28272, MaybeOfString("탑帆褀⦈⯮འ�鷵ኺ"), false, 485225)});
    Test_CheckProps_LobbyInfo("襹젡䒲ੲ쟗퀵", 882374, 506010, 814228, {RoomInfo("ꠣꦡ궈鶨", 889035, 362539, 610269, MaybeOfString("⛁匚"), false, 216094), RoomInfo("댨洶햏﫟펇☉惝溙෋", 474189, 967453, 96448, MaybeOfString("騊㷘鰹癏빇⿜೚�"), true, 92954), RoomInfo("Ꞩ欸龲旆͍褓ᾎ䟱", 808863, 776262, 366119, MaybeOfString("ⵙ꫒ࣀ⒔舒勴⽭"), false, 719858), RoomInfo("쌅鏺봡塌鿌蕎農ⓛ枈", 985933, 194368, 603892, MaybeOfString("뎃럑㗱䮅扌訧鍬⻜醪"), false, 831714)});
    Test_CheckProps_LobbyInfo("왟跢뀳祐䊃", 815126, 613560, 75986, {RoomInfo("⦩䐃켚蕁ᡵ윩嶮", 243516, 754077, 164575, MaybeOfString("䎋ⱦ枒ﱑ瓐ꢐፕ꿖嗯♓"), false, 667325)});
    Test_CheckProps_LobbyInfo("", 871897, 27808, 711115, {RoomInfo("젬몥", 188820, 234988, 179703, MaybeOfString(), true, 651305), RoomInfo("珉Ӯ绰ሤ粼䊍檭祬훼▜", 711918, 62484, 172081, MaybeOfString("螩ꆢ鷺䇊Ᏽ⼐㫎ⵋ絷"), false, 554498)});
    Test_CheckProps_LobbyInfo("", 635631, 847697, 271016, {RoomInfo("冉瓐醘", 775944, 57749, 827177, MaybeOfString(), true, 528052), RoomInfo("ᥒ簟", 256541, 816797, 743803, MaybeOfString(""), false, 831613), RoomInfo("해쁯", 585295, 639190, 405481, MaybeOfString(""), false, 105840)});
    Test_CheckProps_LobbyInfo("荑ᢩ龎", 862152, 253381, 346426, {RoomInfo("밪䇎藢窱ﯜ㤽婑䈅쯇", 590747, 515012, 390973, MaybeOfString(), false, 364869), RoomInfo("鶢씧邜玢㲳踮ꑃ웍", 233631, 523099, 663108, MaybeOfString(""), true, 344178), RoomInfo("찀�퐁쩊鄞", 568999, 891728, 321545, MaybeOfString(), false, 481013), RoomInfo("㉂噼傗쬄", 639328, 399175, 500719, MaybeOfString("菫觘฼῜"), false, 80996)});
    Test_CheckProps_LobbyInfo("젮遧玷￱챜蓮ᔋ辥", 658571, 956855, 591297, {RoomInfo("㋿赟ꫤ揩価柅", 237212, 468954, 380763, MaybeOfString("䂤㶆�╞"), false, 12788), RoomInfo("蹛㪵⭍ȃ䞋ቭ괟헽鞒", 564560, 939514, 694228, MaybeOfString(), false, 188371)});
    Test_CheckProps_LobbyInfo("瓤��耎珎霑้悶", 529597, 604286, 109256, {RoomInfo("፮覦", 824434, 98643, 534292, MaybeOfString("㴺郘�"), false, 602832)});
    Test_CheckProps_LobbyInfo("靂腏ૃㇿ墀", 920980, 424238, 82251, {RoomInfo("", 850198, 835102, 813810, MaybeOfString(""), true, 69358), RoomInfo("⊌헥⤒娸곓͟湖瓞", 644394, 886014, 412603, MaybeOfString("ᅭᜢ"), true, 769922)});
    Test_CheckProps_LobbyInfo("ઙ⶛�璕橅ߓ", 17839, 779308, 778520, {RoomInfo("㭠쎾", 852873, 556798, 57061, MaybeOfString(), true, 728149), RoomInfo("汈铅", 778106, 753240, 658617, MaybeOfString(), true, 29192), RoomInfo("䯏䱋ࣲⰇ☑ᾉ�", 107317, 903711, 293237, MaybeOfString(), false, 39635), RoomInfo("珸뀮ﭞ귪�쵅", 529470, 966517, 263833, MaybeOfString(), true, 880554)});
    Test_CheckProps_LobbyInfo("薐", 723955, 826022, 308232, {RoomInfo("睌棫楺龺搛", 730875, 88552, 968827, MaybeOfString("ꌢȚ庅뜡睰"), true, 311306), RoomInfo("÷궥鹖��ᵤ薝", 866985, 933327, 11730, MaybeOfString("ᕢ柪澻換"), false, 615684), RoomInfo("鲤닐↕屩芧卥㉥ꛠꅨ", 816374, 406187, 100389, MaybeOfString("썚椢졻ꔱ"), false, 126461)});
    Test_CheckProps_LobbyInfo("萸�㖙ꮄ㱾暍ꛠ�喬羊", 71514, 999909, 85457, {RoomInfo("థ鰣麛䴓헟퍙ꕘ", 538471, 379572, 196515, MaybeOfString("芻뻣䡚QႯ"), true, 947122), RoomInfo("", 485751, 774655, 765765, MaybeOfString(), true, 584073), RoomInfo("ⷶꎚ赻", 354054, 383651, 663687, MaybeOfString(""), false, 536890), RoomInfo("뗐荢", 130852, 128699, 809362, MaybeOfString(), false, 968420)});
    Test_CheckProps_LobbyInfo("梯ᨛ", 769397, 486166, 955756, {RoomInfo("", 389399, 840403, 879602, MaybeOfString("ꑾ훾ྮ埒怢⌕봤"), true, 516796)});
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
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", 393455, 392207, 212987, {RoomInfo("쪁ᆬ鬹⁺詘", 940382, 776509, 60415, MaybeOfString("ℛݙᚬ쇳"), false, 142480), RoomInfo("呝쵄ᛱ떡", 511262, 903418, 366202, MaybeOfString("킅�叴뢦"), true, 601448), RoomInfo("", 214613, 999074, 684010, MaybeOfString("਀"), true, 618336), RoomInfo("", 499239, 803100, 310539, MaybeOfString("蝔ᔁ䀓⃩쭶퍉첯"), false, 665920)});
    OpEqSimple_Check("㚉뙶娜", 631652, 156001, 536782, {RoomInfo("燵㪆汀ᆣ젙娣ʱᯜ", 840953, 20188, 208909, MaybeOfString("매㘆천⥠渠ᐢ㲛"), false, 68708), RoomInfo("", 757154, 179642, 145172, MaybeOfString("﵀쨔븬ଏ늭豈"), true, 854015), RoomInfo("䝕", 288195, 531474, 7923, MaybeOfString("鍚뵭�싙䲛ก撿怸"), false, 541699), RoomInfo("䝅攨鑽烆ঙﶇ䚱", 133463, 481225, 673451, MaybeOfString("ꂅ䔲"), false, 392143)});
    OpEqSimple_Check("픽鳐ꈉ", 718449, 909595, 422278, {RoomInfo("㫕崒⁗∾웇Ⓩᱭश", 172033, 153090, 765227, MaybeOfString("こꅯ껳"), false, 411239), RoomInfo("", 876624, 468333, 37294, MaybeOfString("᪮壐辡�"), true, 785418)});
    OpEqSimple_Check("齦㑭畼", 539265, 92364, 884234, {RoomInfo("ꈾ⩡秨玹桗", 317042, 332229, 631334, MaybeOfString(), true, 680607), RoomInfo("괗饖㪟", 438577, 704848, 780762, MaybeOfString("윝뺭눎㋨⮴"), false, 984599), RoomInfo("ټ໿ꍱ꟤", 40481, 694261, 263, MaybeOfString(), false, 6580)});
    OpEqSimple_Check("褑ཧ捺슅엎筄䄗灰ᔃ㣛", 184179, 843670, 909926, {RoomInfo("쐔扮깡", 39828, 481138, 753539, MaybeOfString("ዯ﷤賚�챀曹䚨篱"), true, 151322), RoomInfo("ঞ꼥ᗁቲ堽ᬵ꽧ﺵⰪ௝", 697224, 27811, 783297, MaybeOfString(""), false, 183287), RoomInfo("㵅绰혏牒", 594924, 97497, 213686, MaybeOfString("䥓佴ꛬ苵䎥�쭲鄻"), true, 929569), RoomInfo("�蛖ꬹ耐厙׊", 590083, 445348, 985182, MaybeOfString("䩶"), true, 243032)});
    OpEqSimple_Check("戃䶆ꙕ殺", 350295, 696778, 220644, {RoomInfo("띟璦Ⴗ婑", 940369, 3945, 849219, MaybeOfString(), true, 284057), RoomInfo("螥㗓꒭→⣦", 578377, 759825, 48706, MaybeOfString("퇎赊ﴋ鎘"), false, 877689)});
    OpEqSimple_Check("", 296593, 97859, 343909, {RoomInfo("쎑ˬ퍪쉹٥", 211152, 705593, 415571, MaybeOfString("⨍"), false, 582502)});
    OpEqSimple_Check("꡴⻜銵뒮ꬴ새", 560452, 404367, 586787, {RoomInfo("㹪쉰龊〢ᔖ̉", 323966, 493150, 371477, MaybeOfString(""), false, 607334), RoomInfo("", 548055, 421894, 463120, MaybeOfString("囈椐༁틋�鯺䅷⮙"), true, 46866), RoomInfo("罚宿", 978412, 15728, 543714, MaybeOfString("�؁૰犮"), false, 284973)});
    OpEqSimple_Check("ﻯ機", 971400, 756593, 196654, {RoomInfo("䊀덒턗屷硷ﵜ⫌", 640546, 486696, 405550, MaybeOfString("剈䴲膞坫窀훱"), true, 851901), RoomInfo("췲룮ྮ韑ଵ峎㐇苘殾", 265296, 981223, 533390, MaybeOfString("豮ⴈ"), true, 708209), RoomInfo("՗鄱쭾炞푵", 284852, 481893, 79195, MaybeOfString("숬勯ﵜ쳮"), false, 763064)});
    OpEqSimple_Check("些窩遜媿餧윭ࢫꂘび", 666256, 890828, 673138, {RoomInfo("韠፧迒䌡", 299172, 932418, 445761, MaybeOfString("憚邷塙ꢖ"), false, 111470), RoomInfo("", 806802, 867988, 950426, MaybeOfString("膃"), false, 250555), RoomInfo("ᄈ믋왚ꯂ喿�", 897341, 155958, 952064, MaybeOfString(""), false, 375620), RoomInfo("", 138540, 801560, 533724, MaybeOfString("帷"), false, 926220)});
    OpEqSimple_Check("馺൹貈垸뀰过�", 575927, 155319, 107419, {RoomInfo("⌻礚쑲∆ⴝ䨥踯", 479567, 126660, 527516, MaybeOfString("偶텒綒"), false, 571410), RoomInfo("줼歓퐍⟳庶✨淨�薮", 554187, 837917, 742931, MaybeOfString("禾ﾫ䅖ꏊ軃頴"), true, 225588), RoomInfo("v⍱隊", 909262, 800191, 386263, MaybeOfString("ṱ帮—뜔愄츿첣⦝脘"), false, 640719)});
    OpEqSimple_Check("㼉媻뉾ᮈⵌ", 40671, 948715, 130604, {RoomInfo("뀁م", 55892, 967496, 74974, MaybeOfString("碫烆寮侬䐾ʌ蛆鼞輋斍"), true, 518616), RoomInfo("拚ꑧ⩱", 443493, 24041, 47111, MaybeOfString("�ᜯ㧳西뙶븳"), false, 462606)});
    OpEqSimple_Check("�ⷀ듅㡐沁祿⑝낤", 274962, 997288, 354149, {RoomInfo("岳뗭蜢穽ᓪ辜榡", 831702, 803513, 975296, MaybeOfString("Ჺⅶ엱ǫ揆"), true, 889660)});
    OpEqSimple_Check("䉕ꐡ딞눼诠ﱐ윍", 506976, 595630, 361318, {RoomInfo("摓릺칻", 210923, 189775, 849529, MaybeOfString("ꋧ힂汀䤦岐Ч"), true, 679750)});
    OpEqSimple_Check("ᨏ衔ΰ탡뒤엄闼", 74666, 414623, 704580, {RoomInfo("髩浙䭬ࡸ廌ढ़秘号麼", 887256, 269383, 284635, MaybeOfString("侯억맖Ⴙ"), false, 71814), RoomInfo("", 759338, 191343, 812598, MaybeOfString(), false, 72590), RoomInfo("媸項投᮪쥕箏", 817193, 817337, 56189, MaybeOfString("㌬酉띴勇啸"), true, 796634), RoomInfo("摅캑", 281669, 661859, 131224, MaybeOfString("�房댬㾑ໞ탬鏩Ⓜ"), true, 229280)});
    OpEqSimple_Check("ڻ﹉䱋饔吏뽑Ϣ儦飼", 914953, 242423, 571385, {RoomInfo("", 550126, 747140, 491136, MaybeOfString("豊ǌ皁꺼㲇߇⾕嚪"), true, 751776), RoomInfo("핋", 520596, 979110, 433206, MaybeOfString("㳏⽀"), false, 582402), RoomInfo("", 70990, 583293, 276945, MaybeOfString(), true, 471978)});
    OpEqSimple_Check("຺拇씌ည햍�쓩", 151634, 31709, 376248, {RoomInfo("╱赏欣ﳋ乯댌", 59634, 83712, 793431, MaybeOfString("၁᫄鍹䨢䵟ۄꤢ"), false, 933997), RoomInfo("仫힒", 847424, 120708, 360974, MaybeOfString(), true, 218100), RoomInfo("嵠﬙⹰럠靫", 19644, 11266, 387569, MaybeOfString("�곔櫽ꐫ␓쌍"), false, 378286), RoomInfo("喭﬚﹢멊┰ಂℳ", 36947, 531572, 516653, MaybeOfString("㰞�躌續Ꮪ⹅㫋"), true, 803603)});
    OpEqSimple_Check("藂Ԭ剻敝ﲁ", 990216, 985950, 652434, {RoomInfo("㢒", 879936, 783001, 936371, MaybeOfString("憝"), false, 854275), RoomInfo("곞ᘾꃥ촄㍕札펂ឝ", 19479, 818533, 190141, MaybeOfString(), true, 509669), RoomInfo("辝뙉錃ீ憨ቒ녈", 929767, 59051, 943847, MaybeOfString("⵬㊇ᖕ⺸⣥꽈쐦㊓"), false, 905196)});
    OpEqSimple_Check("ᇭ묽ᴂ㰶", 937115, 584989, 886773, {RoomInfo("䳖", 41134, 187048, 735419, MaybeOfString("鄈鲤戙᤿䜦鈷兔"), true, 174588), RoomInfo("ͽ畺�堹朲", 121888, 445108, 938316, MaybeOfString(), true, 616953), RoomInfo("ᆐ첧첽賂", 508756, 697242, 500238, MaybeOfString("媉軪砦濾"), true, 4313)});
    OpEqSimple_Check("衈ܔ肽粪噷鼚㏊뙓ⴀ", 342734, 903288, 356714, {RoomInfo("ꏳ沗", 416888, 38977, 958543, MaybeOfString("�鍴뢬垑"), false, 262452)});
    OpEqSimple_Check("✷㈳﷥똭퓄﮵", 189651, 33867, 718284, {RoomInfo("苔ꆡ郮", 760874, 789707, 886905, MaybeOfString(), false, 415284), RoomInfo("吓ꈾ孈틕଀蒍⸜፡", 354006, 629327, 89860, MaybeOfString("湕ᱝꕮ"), true, 466985), RoomInfo("膥␲浧뭧", 400381, 396623, 154699, MaybeOfString(""), true, 469495)});
    OpEqSimple_Check("潟⧑", 400064, 733780, 453397, {RoomInfo("䄁緯壣媂", 196061, 556133, 532394, MaybeOfString(), true, 638577), RoomInfo("﹒푽씛듷륑", 941312, 710424, 134924, MaybeOfString("胕库"), false, 896358)});
    OpEqSimple_Check("왊姭칲ﲤ荏", 699556, 892400, 507012, {RoomInfo("ʏ㾕臨", 56177, 217295, 172280, MaybeOfString("㉫"), false, 140854), RoomInfo("쫓됻⯌ꯘ眝بᱜ", 841672, 585579, 908199, MaybeOfString("쭂槶ﾽ꒿㣶喒⅒瓮㫬"), false, 704184), RoomInfo("Һᶌ", 34644, 844730, 459806, MaybeOfString("烖ᩬ䎠찇ꑆ"), false, 878556)});
    OpEqSimple_Check("疡谉闷䖕", 991643, 531510, 262656, {RoomInfo("먍", 265046, 188794, 59487, MaybeOfString("系㍲솹㵊ᬂ婤"), false, 323301), RoomInfo("", 288208, 257053, 300386, MaybeOfString("銮ﺑḄ箿ﹸ髕"), true, 964169), RoomInfo("㴳鮙쒽䐙ꛎ葨皣", 609031, 923235, 357258, MaybeOfString("晇巒쮭龥俩嬬"), true, 574339), RoomInfo("윶￪욱崙浱�ﵿ쀡宰", 243426, 772816, 826472, MaybeOfString(""), false, 397942)});
    OpEqSimple_Check("ࠄ裞ꥭ峘갤噴崤", 896538, 516893, 185454, {RoomInfo("ꅩ糧⪮", 957251, 17652, 513362, MaybeOfString("픢㻯蕛⑰"), false, 542855)});
    OpEqSimple_Check("", 36685, 802978, 824489, {RoomInfo("塾ᨑ垢ڡꇹ귬", 114951, 180939, 805078, MaybeOfString("쏳费糸荺伡燌௏"), true, 828792), RoomInfo("㙉ﰵ", 202075, 927238, 558579, MaybeOfString("烈ઓ"), true, 298094)});
    OpEqSimple_Check("☷�", 476024, 651593, 111578, {RoomInfo("", 875341, 939420, 810750, MaybeOfString("耝뼮鑟➙虒擖ꖜ鹷"), false, 764358), RoomInfo("", 71072, 995936, 780398, MaybeOfString("⫰䈬퐌쮧㏡륳덏꽠"), true, 849370), RoomInfo("褟修쩶ꏒ莰䍇औᇆ", 960593, 3896, 829421, MaybeOfString("丟娜츀М符푰뽲㰩貧"), false, 884959), RoomInfo("틍", 921535, 954369, 138013, MaybeOfString("鰠ﰁ"), false, 417823)});
    OpEqSimple_Check("땗뎨๯엔", 474827, 185511, 967547, {RoomInfo("㍷㚭ﲌ楪窏䄍倏叉檩浐", 43019, 961165, 1174, MaybeOfString("搷衏홌蹙"), false, 981507), RoomInfo("㖫듣蜤", 85087, 412341, 302678, MaybeOfString(), true, 385478), RoomInfo("苶闔화᪢", 455279, 427989, 521564, MaybeOfString(""), true, 841050), RoomInfo("ܱ症᯷람⃧旝疀", 386906, 981241, 471690, MaybeOfString("栈詠彨⭿띄騣"), true, 160864)});
    OpEqSimple_Check("〪散қșചᅉ寬뭛ɩ翚", 497681, 867245, 588350, {RoomInfo("핦炀", 540193, 645478, 461735, MaybeOfString("䇼�ෳ曽曰ꖦ"), true, 832233), RoomInfo("", 928144, 793545, 542664, MaybeOfString("氅巃阴븣"), true, 742384), RoomInfo("⽖쿦", 249795, 547714, 983582, MaybeOfString(), false, 425480), RoomInfo("屦셎㖉", 885643, 625526, 737538, MaybeOfString(), true, 588542)});
    OpEqSimple_Check("醅祶�", 727740, 453559, 399532, {RoomInfo("粁㦍㚈ꊼ瘙ꎜ䁃", 822689, 520049, 803490, MaybeOfString("翦㡏錅蠉l豠徴఺쿔芽"), true, 396963), RoomInfo("", 890087, 79959, 814430, MaybeOfString("냁헭츽"), true, 258559), RoomInfo("柎縋餠펜", 436848, 828828, 668152, MaybeOfString("騶ɣ໨ꝁ�"), true, 489314)});
    OpEqSimple_Check("왆郼ꈝ쒜타ưᢘ", 196605, 614494, 489980, {RoomInfo("ⲛ", 8704, 51681, 696390, MaybeOfString("䎫帄ັ�᤺"), false, 382032), RoomInfo("씃めᢑ娮ഔ縒Ԃ䐘♠", 475815, 720915, 744270, MaybeOfString("챃疵챃୺뀸�"), true, 322820)});
    OpEqSimple_Check("ꎷ镹뫮난", 373878, 863609, 529427, {RoomInfo("紉ࢼ薷ඕ럥鸂ᬓ鵨꾀", 579628, 445771, 153963, MaybeOfString(), false, 179358), RoomInfo("钐╆哫�ښԸ鋸", 146193, 642016, 584572, MaybeOfString(), true, 455186), RoomInfo("訳ᙉ⅘솅俳蓋", 530271, 965323, 997605, MaybeOfString("竖췸ܫከꔙ漖ꄃ跚㴺"), true, 810439), RoomInfo("潃뮚己唙淐", 201767, 939115, 86434, MaybeOfString("ဍ蹲쾔噪묶ꃀ﷤ꔶƉ"), false, 210910)});
    OpEqSimple_Check("蓲໱⳽�홆綷謀", 796834, 848642, 714415, {RoomInfo("妣햂ࢃ㑡", 113775, 71768, 982777, MaybeOfString("撫䙑簤䱛↠�湱咚㺲�"), false, 623305), RoomInfo("䟥ꃰ邳俎䒺藒�챱䋸�", 246916, 858530, 297341, MaybeOfString(""), false, 89801), RoomInfo("㜬쇅轓봫᲍咴㹺歝", 251523, 745747, 726575, MaybeOfString("塗™ૢྪ"), true, 90850), RoomInfo("", 967007, 79117, 901513, MaybeOfString("໊뛵溭ᲊﰙ"), false, 460421)});
    OpEqSimple_Check("驚", 351053, 88920, 252332, {RoomInfo("糐꽀", 210643, 415422, 625128, MaybeOfString("⚏됡낷㪶堵⒥헻"), true, 610668)});
    OpEqSimple_Check("㐄杭ৎ疭⨔뉒뛰䦄", 113328, 303814, 896142, {RoomInfo("⌋껚挷螴쁄ꅚ鋆", 299620, 745947, 607928, MaybeOfString("๠䬮颼"), true, 395089)});
    OpEqSimple_Check("礚㓮餠ై桋䂝嵐", 234342, 864464, 564137, {RoomInfo("㠆ℬ顉㥘ᐔ䕝ᴈ", 311921, 923522, 317775, MaybeOfString("퉮"), true, 867287), RoomInfo("㒱⎚箶쭀쫵漸歇", 883641, 959332, 355650, MaybeOfString("哅પ"), true, 855916), RoomInfo("⏥뚢ൻ됈३", 979116, 127725, 86474, MaybeOfString("〣꥙깖耫沦"), false, 680960)});
    OpEqSimple_Check("ᄷ섴쵦औꁶ騼푯䅕", 950827, 234815, 604595, {RoomInfo("ｷ쾷舷嬝ࠡ蒠ﱰ㢣੖", 668405, 221970, 435983, MaybeOfString("ꖗ漣鐯"), false, 586147), RoomInfo("䍝悓彚聻긜셎蛊₈", 282182, 617217, 192766, MaybeOfString(), true, 762358)});
    OpEqSimple_Check("먦驋", 127274, 495971, 208920, {RoomInfo("㩤쿉䩘氌믎纷⢋㝗䈖", 914220, 460501, 43225, MaybeOfString("님"), false, 765333), RoomInfo("", 576081, 766000, 104690, MaybeOfString("헧ꘂ瑉倜뼔穕"), false, 121362)});
    OpEqSimple_Check("䡐ꦦ䡗捧⢳", 986151, 662366, 349569, {RoomInfo("蒋눳惢ꪜ脺䷲", 92546, 716276, 818301, MaybeOfString("◰癞ꩶᓥ悀㥉癿씻翿ღ"), true, 853196)});
    OpEqSimple_Check("ḗ嘃", 280731, 799028, 640434, {RoomInfo("ꆵ٪至颓ᙃ씕", 203331, 166063, 188204, MaybeOfString("崣鳳⭊ܒ"), true, 669840), RoomInfo("왊櫒徼倱", 400702, 580987, 788366, MaybeOfString("韺"), false, 915615)});
    OpEqSimple_Check("渌쓘⏑␔ູᲴ䮻颱", 162674, 629315, 63840, {RoomInfo("砌", 860931, 10948, 636965, MaybeOfString("谽丝�窖眄冷⼈"), true, 246677), RoomInfo("闤", 361869, 231729, 132133, MaybeOfString(""), true, 959228)});
    OpEqSimple_Check("㳭䚦덓蝶킐ᆝ荲᛺", 170293, 194804, 89873, {RoomInfo("ꀬ紦諒毄✂", 564257, 383637, 83470, MaybeOfString("䳜剬鿼튂"), false, 166543)});
  }
  
  bool unitTestResults_LobbyInfo_OpEq = runAsync(Tests_RegisterAll_LobbyInfo_OpEq);
}
#endif