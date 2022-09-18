#if UNIT_TEST
namespace Test_Challenges {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_Challenges_CommonTesting() {
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
  
  bool unitTestResults_Challenges_CommonTesting = runAsync(Tests_RegisterAll_Challenges_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_Challenges_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_Challenges', UnitTest_ToJsonFromJson_Challenges);
  }
  
  bool Test_ToJsonFromJson_Check(const Challenge@[] &in challenges) {
    Challenges@ tmp = Challenges(challenges);
    assert(tmp == Challenges(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_Challenges() {
    Test_ToJsonFromJson_Check({});
    Test_ToJsonFromJson_Check({Challenge(620474, "雱燐꬝,汯粌", "饣ퟶ䳟", 292599, 141875, 331925), Challenge(129450, "㳋뽄旤ᮔ﵇獣ແ", "䃧쁐욘ᱶ谛䆳ꔼ躜ಙ㟊", 673390, 116343, 181454)});
    Test_ToJsonFromJson_Check({Challenge(62436, "䍕᫃ᔼ", "딢셐鐨⛦屻㚡딽", 656514, 85938, 501560), Challenge(289542, "큇玪䞫䂟礽ᚪ", "ᮃ놜冺햵ᤫ簔�", 272929, 232649, 316905)});
    Test_ToJsonFromJson_Check({Challenge(962581, "旰蓡", "봌彺য়ꬢ毝榆", 748773, 467498, 450229)});
    Test_ToJsonFromJson_Check({Challenge(107276, "頺⫛", "๏ᇠ炦♱", 507044, 850929, 947632), Challenge(451127, "ﵴ뙕统", "ἁ맱稜븯剬鯫ﾪ", 126516, 415853, 840322)});
    Test_ToJsonFromJson_Check({Challenge(474515, "↥", "ᄶ窐踎윉懜翊신꨻", 929417, 362775, 866688), Challenge(562436, "엣ᩁ㟅ഽᒽ罆鹌ﲒ咧놪", "⻖蚇ங⨗萃쎉뮏", 782152, 275663, 198407)});
    Test_ToJsonFromJson_Check({Challenge(38750, "", "뎧檺憃涳뛙", 660958, 402352, 706312)});
    Test_ToJsonFromJson_Check({Challenge(417442, "ꧾ큽ⷾ", "", 147453, 442122, 757477)});
    Test_ToJsonFromJson_Check({Challenge(948310, "삾�೻壎ⴍ", "ꢗ軤衜", 428532, 658855, 904752), Challenge(178195, "ཞꑓ뷾�뤴焦", "뚑簈㖻Ꙛំ", 296391, 575887, 254207), Challenge(108410, "转ᢶ퇈侘룒फᝌ", "ၰ㡽걅៵㓉", 916111, 436498, 261555)});
    Test_ToJsonFromJson_Check({Challenge(201380, "再섚ᘭ", "", 74150, 318565, 35974), Challenge(881761, "㢝蔹", "�郁❨鲶쐤얪", 235494, 8576, 23152), Challenge(758410, "", "瑁캳륣쑋쎧ᨘ퉁濑", 17181, 227340, 204841)});
    Test_ToJsonFromJson_Check({Challenge(692390, "", "䔻镩෾萫郅栗�᭩앋", 402836, 758944, 477212), Challenge(969638, "Ѯꤘ꭭䊘睈宥목簡॰", "¨믕鋜㩋뭪莮홣�", 636085, 569609, 929747), Challenge(188204, "ﭕ椅롥峡�쩇", "灩", 513397, 761826, 212735)});
    Test_ToJsonFromJson_Check({Challenge(526475, "䜋歹☰�ꢶ嗲聅䄳", "䐪䈞", 771523, 508457, 876283)});
    Test_ToJsonFromJson_Check({Challenge(66059, "馒扁", "矮冠", 120250, 568242, 791291), Challenge(377004, "鿬횊穧", "땓꟭뗏", 523510, 979765, 445787), Challenge(242290, "☳憱", "몒謒鞤ᶥ톪�湀녂", 883939, 997572, 197441), Challenge(615200, "啻", "כֿ昢Ｈ罧㣜樐㽼", 506081, 798401, 775867)});
    Test_ToJsonFromJson_Check({Challenge(489062, "㞥ۚ轔렫炙띤䮔", "꼵䁹呦㷽", 64905, 260294, 13752), Challenge(840907, "꺗⯒ꊑ䐁ߠɯ밥", "ೕ멨靮垆规☉᡽햅𤋮", 108577, 33888, 195672)});
    Test_ToJsonFromJson_Check({Challenge(741034, "撁銹瞝ۄ⢻疳", "Ⱆ", 995150, 898974, 582294)});
    Test_ToJsonFromJson_Check({Challenge(524348, "紣ㄷꀞ秇⋽吢ↈ種祶⯔", "耾㾃庅", 925671, 602002, 114641), Challenge(935263, "䊼", "⅟᥌⇝䱓䎸帍곔遲", 679849, 608847, 283554)});
    Test_ToJsonFromJson_Check({Challenge(558668, "�䍛쇈๛圀詓", "䇲", 472626, 829236, 590010), Challenge(607998, "㉹值ᶀ䍾㎦", "䲈㌒皬毸圌蒵⢢⣳", 276447, 482244, 61932), Challenge(943449, "", "쯕胫鍼륭朰ᆿᕃ藃", 542289, 129074, 323401)});
    Test_ToJsonFromJson_Check({Challenge(661932, "媴白矷", "⊐檢䩬", 432442, 20231, 116955), Challenge(892962, "䬼덃耕굗ご䎽붏", "ꓩꦼ�୹౺삯Ϩ죂갗", 176502, 230185, 173718)});
    Test_ToJsonFromJson_Check({Challenge(816642, "ᓒ潰Ⳉペ蛛", "穞煮㋬傁畧", 679612, 15344, 759884)});
    Test_ToJsonFromJson_Check({Challenge(685600, "温", "襶喩ᓅ䍕", 849459, 217180, 757733)});
    Test_ToJsonFromJson_Check({Challenge(957778, "", "亂귮", 259833, 106956, 933416), Challenge(837347, "샛Ꝩ騫㡪ῥ", "ࢧ믂⥖㈠", 968295, 98773, 636807)});
    Test_ToJsonFromJson_Check({Challenge(821203, "笘", "뼘㽗ⷻ찄", 734977, 771244, 845590), Challenge(373373, "狫", "买嗒쫑鋋", 378234, 512291, 769500)});
    Test_ToJsonFromJson_Check({Challenge(236794, "㈸襁盟駪", "쬣", 696880, 841284, 108896), Challenge(337199, "览", "ઋԞ൪ቄ忸៥", 59894, 921369, 637991), Challenge(324522, "껀썅虺艧", "ᆋ⍜༟", 884330, 482035, 708526)});
    Test_ToJsonFromJson_Check({Challenge(242717, "", "", 627628, 354961, 685120), Challenge(334991, "宕助鵒㼅ရ", "尰", 276151, 776921, 800492), Challenge(87298, "잜徺〶力෎턒柬઒궅抈", "", 715158, 536447, 742040)});
    Test_ToJsonFromJson_Check({Challenge(715590, "䕲璷瘑ᩰ넑", "ꕦ䝵龌ͨﯨ撦ꥯ얩倳䊜", 157374, 575994, 35733), Challenge(169314, "", "퀡ପ厐䗌", 692501, 707603, 106586), Challenge(203671, "⧐㗪ⲷ窕ꄧ迴", "�㚳쯕獎ﱴ", 21776, 136229, 798602)});
    Test_ToJsonFromJson_Check({Challenge(634373, "ಃ㍤냢랙곑凋�", "㰧໾趀㍟㤒居개⣪ꝯ", 581600, 728577, 436154), Challenge(311470, "빢毗咫㌊㧱疦鹰냣뷞", "ꠌ⋞ネ얽䦵೿", 248162, 83873, 453767), Challenge(681251, "Ҥ襤덌ῤ䐧", "꽻뺿쭠贑麏揅שּ㰄", 540486, 615506, 607971)});
    Test_ToJsonFromJson_Check({Challenge(32282, "咙䤔轃", "굾⧖妬聸", 905949, 815432, 459961)});
    Test_ToJsonFromJson_Check({Challenge(645752, "뾬䰦ⷅ뮹", "", 68906, 149252, 195022)});
    Test_ToJsonFromJson_Check({Challenge(216424, "咭詫界땆礷", "Ⴒ⍠⅍ᙄ", 272392, 451499, 314207), Challenge(226350, "閣崋", "鄃燵笖띖䈝╙鄩覇", 740992, 6063, 359040), Challenge(348543, "턬䵕廌邏", "톿ޜＶ쓎檃㘙搅쥢", 997042, 334943, 383204), Challenge(547939, "筺궜쁶", "䩶骵銶⮧", 134858, 840861, 313857)});
    Test_ToJsonFromJson_Check({Challenge(886948, "栎纰乩궕껒꾤嬔", "邝פᜃ梑蠰鸀臐ᙙ", 213526, 28880, 944920), Challenge(410454, "ခ툎妊", "툾ਫ਼騩ࡷ飵鍃", 402655, 369631, 651681), Challenge(818382, "폒", "뀧›䢬䟼ⶲ᝹糀", 49936, 600250, 741213), Challenge(228408, "", "盌", 233611, 788811, 485983)});
    Test_ToJsonFromJson_Check({Challenge(25286, "䄇䱱팝⑄䩘ᔼ", "ঽ瑧燽ຢ�臠㾼ూ莚", 181121, 68628, 888133), Challenge(411457, "蟃෵㥔̳姇", "", 83363, 905071, 960666), Challenge(203304, "ဠ☊", "ꚨវ毆㣥ዄ", 976713, 23857, 853388)});
    Test_ToJsonFromJson_Check({Challenge(957279, "逊퉈䨽", "瘏", 166255, 761946, 851937), Challenge(634986, "줏气ቮꓛᦱ軽", "", 225732, 258583, 586944), Challenge(279746, "䢎�殶빞紶忿뾙乜ꩰ䋢", "聇㻇ຫĽꪓ춒", 462465, 342527, 338469)});
    Test_ToJsonFromJson_Check({Challenge(254905, "", "쀇띧癤麉絯羚", 616485, 726475, 172377)});
    Test_ToJsonFromJson_Check({Challenge(756072, "縏맄ḅ♁뚌ⶣޯﮦ컻㴃", "堩", 256514, 393864, 502672), Challenge(351956, "軫ꕠ�䠴", "䒵춣閠쯨목楥", 44534, 927977, 393537), Challenge(233469, "ḡ핝쯜䨶堂", "麋�縣䉁ꨆ㏪", 717920, 510, 138003), Challenge(633479, "趰ꑘ嗀嬺", "쭗緞쐼ჲ쥟", 353933, 373576, 63877)});
    Test_ToJsonFromJson_Check({Challenge(600907, "됗", "ᆟ䭼䐘췱䬊礫庳勫딧", 193559, 683023, 92384), Challenge(343354, "运Ꝉꊁᖚ忝崖꒎ﺎ쵍", "⊂", 79705, 445080, 594832), Challenge(154834, "㋖忙暨埆岥ꞹ", "�쳾ૹ䱕", 395219, 996103, 775344), Challenge(340851, "댯洴ⵐ", "꛴늊Ʉ雤笽ᓴ猦⩋", 696672, 316638, 601213)});
    Test_ToJsonFromJson_Check({Challenge(343351, "ꀰ", "룮욏䩘꫕ૃ滛窖", 202070, 177646, 324715), Challenge(220922, "䞌锑敦暒쇠覡邯", "쫣娪颥驗䂨Ɱ✬맺�柚", 846003, 587926, 278526), Challenge(425509, "䕔誮", "∹ꛌ", 950017, 643452, 801136), Challenge(867719, "錛⧡碲䈩휲쾹짨뵅윪㧘", "鯇", 982115, 310009, 104684)});
    Test_ToJsonFromJson_Check({Challenge(550118, "", "Eா鑁Ƿ伹└㸸", 126523, 663313, 382113)});
    Test_ToJsonFromJson_Check({Challenge(890562, "鸚圲", "놬׺ㅯ껶祓䲛虋", 45789, 57175, 376945)});
    Test_ToJsonFromJson_Check({Challenge(112234, "", "䆪ֱ뺠ᶳ鵫᭡私솰", 950215, 996224, 443592), Challenge(432249, "㠉ៅ倖催셱嗽", "ᬏ뮩", 898056, 130085, 45065), Challenge(868033, "Ὥ", "뙱節ಒጒ翯㺘휍", 427051, 648142, 914703), Challenge(611693, "", "橒�彮", 668434, 288425, 251195)});
    Test_ToJsonFromJson_Check({Challenge(701883, "簬蘲擘粔ḁ㵎愆ꏞ", "臃龽⽓瞁絨㰵恕೹", 227706, 220793, 886074)});
    Test_ToJsonFromJson_Check({Challenge(742311, "뒠菱欴ᒐ", "砼밀㇇䱇ﺘ徳䉰", 331462, 940146, 366835), Challenge(624932, "羃࣯ࠨ龁", "䪴�", 991994, 339933, 4033), Challenge(758549, "觇ﵓ䋯섺㟷댜陆濲", "ƨ柠", 896362, 340949, 206112), Challenge(874187, "뒰ꗩᅙ鮶꽯씟묋", "㢥搩릟愰宫掽밣", 302305, 891202, 703569)});
    Test_ToJsonFromJson_Check({Challenge(232347, "傑㠒弱洊戌勳", "⺩뷗걲凌韵�升Ⴥ⬚唴", 87117, 763345, 181261), Challenge(825117, "힪", "", 671139, 417054, 638282), Challenge(840949, "", "櫤툈ᩅỺஒ", 764765, 958133, 714171)});
  }
  
  bool unitTestResults_Challenges_ToFromJSONObject = runAsync(Tests_RegisterAll_Challenges_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_Challenges_Getters() {
    RegisterUnitTest('UnitTest_Challenges_Getters', UnitTest_Challenges_Getters);
  }
  
  bool Test_CheckProps_Challenges(const Challenge@[] &in challenges) {
    Challenges@ tmp = Challenges(challenges);
    assert(challenges == tmp.challenges, 'field challenges');
    return true;
  }
  
  void UnitTest_Challenges_Getters() {
    Test_CheckProps_Challenges({});
    Test_CheckProps_Challenges({});
    Test_CheckProps_Challenges({Challenge(378961, "", "ӆ쟭⦀椖", 895509, 780361, 450822)});
    Test_CheckProps_Challenges({Challenge(372964, "۫芁≲彲", "콬", 49504, 986078, 321608), Challenge(813542, "﶑䙢꺰ꦞ", "㬪●ꜛ귦翮漽똮", 36088, 55244, 12605), Challenge(886792, "韋", "�싺콠旱疍鰉橿", 464786, 672947, 490383)});
    Test_CheckProps_Challenges({Challenge(763812, "ଧ", "ꠊ軈吪㧕ꊐ䧩㓅", 409053, 177289, 916179)});
    Test_CheckProps_Challenges({Challenge(425498, "", "豈", 224303, 788874, 44714)});
    Test_CheckProps_Challenges({Challenge(55266, "ሕﯷ⸱쁍冼ǻ쥝", "杢⅄⊫", 672021, 217370, 780640)});
    Test_CheckProps_Challenges({Challenge(381002, "珐瀮㍿웦쭜䢝䃙", "䵙", 264138, 345680, 37504), Challenge(985736, "㪂", "ᇁ﹀賊惍됞", 703391, 945399, 696757), Challenge(984066, "㔭묹", "缲䁏뤥蹪鈤", 791515, 191510, 458500), Challenge(168768, "儞", "揘", 401385, 290417, 254860)});
    Test_CheckProps_Challenges({Challenge(32083, "㺸切횾却㑆�ꢻ턆뙚높", "鉴㉙挶㊜䱁蝜炚年", 779184, 804972, 682153)});
    Test_CheckProps_Challenges({Challenge(184404, "鐷痚ꄻ滇�ꒉ㳀䈾", "枦", 89935, 469141, 215862)});
    Test_CheckProps_Challenges({Challenge(48810, "䥍ⅸ⯃쩆搊늜넚敦", "㫟슷崠ᕧ◃뽽�额", 772370, 442156, 835767), Challenge(947644, "", "䢁㗡築", 748967, 591760, 527405)});
    Test_CheckProps_Challenges({Challenge(266408, "묇森ⶍභࢆ⑧䩦뽼", "", 707776, 850420, 513331), Challenge(978653, "벷쨭욢璞", "䨗ও�휋", 27558, 40242, 181358)});
    Test_CheckProps_Challenges({Challenge(14195, "좗謧痀㬙", "䈀疶뫰줪쌽奚", 917537, 402613, 555689), Challenge(973491, "탃�刑ᅘ鳰Ԕࠆ祊藍", "湐ય⾬顎嫈룭밒", 997589, 343140, 669883)});
    Test_CheckProps_Challenges({Challenge(497196, "剟䝛튟뿎ວ扚듍꩐瘁쪟", "Ü", 761232, 396785, 680498), Challenge(783971, "覑甃", "ꃈ䮣ᬬ컵嶐녰ॐ", 309649, 850147, 565714), Challenge(108758, "ꕕ뉲�工턈", "뼊谥缃ಟ킐", 679739, 182317, 694416), Challenge(833723, "嶹堠鷦耢", "༏큝㫓", 67462, 782210, 808460)});
    Test_CheckProps_Challenges({Challenge(691833, "胣颡攤訞♹⑼驏᩽", "ᥕ剃爆爣膡꛶", 842721, 164200, 147686), Challenge(163833, "齶褱炋�Ժ蕧枪ⳳ흰", "℺꣺췽㇋嘘泅돖", 987805, 443541, 362144)});
    Test_CheckProps_Challenges({Challenge(407047, "꥞琷᯵テ䪮䅎", "嵐䓸瀓䳻Ჵ﨑ꁄ", 902045, 748571, 147555), Challenge(612954, "뉐㕋퇪㷗뚪䬹칭", "ጢ", 323729, 180108, 629317), Challenge(901310, "䞈䚴鵁틖", "妐檣袿칉谜訷໰胖", 180139, 623725, 647698)});
    Test_CheckProps_Challenges({Challenge(677985, "鲶헞雟❢�䖗�쁰ꢚﲆ", "", 895579, 267089, 447017)});
    Test_CheckProps_Challenges({Challenge(349405, "啞婓菨뻟௎餵긽榈", "溊䷡꬈फ़Ը㌲狊⵪诨⥇", 684845, 571451, 914746), Challenge(974829, "揉筢㲸", "穂Hᡶ⛥杭貴溪৥롰꬜", 717791, 449432, 307209), Challenge(900907, "啕ኞ衍蛜", "䃿fྔ㐔ᡄ鷂", 409258, 487252, 847881), Challenge(455407, "ꭢធ沈", "ꏛ", 575293, 650559, 361945)});
    Test_CheckProps_Challenges({Challenge(351745, "뮦놘蘜뗌", "쟹膗堳", 798750, 944378, 960197), Challenge(187198, "屴ଳ", "炦勭疺잔⿴㦺暄", 896621, 60867, 995994), Challenge(934111, "鉵朖Ⴈ", "䪨꒥䉊浊믪뙪", 640427, 717690, 141733), Challenge(559594, "틠䤙礎㋳숙෥즇졧娒", "捣嶟廌⁹掠욿Т᏾쟰", 801047, 65331, 583163)});
    Test_CheckProps_Challenges({Challenge(80069, "㷀뵌慔駐윳陑镉⣀跺", "⇐춻嶻", 56836, 500196, 187953)});
    Test_CheckProps_Challenges({Challenge(878758, "霈뼧꽾뢟⇇", "ꧼᖝ໵㘦恿땊₏", 408024, 951090, 629387)});
    Test_CheckProps_Challenges({Challenge(549837, "ᢦ폛⶯弸龭", "ꝶ擆⷗륶땣", 558790, 849193, 814728)});
    Test_CheckProps_Challenges({Challenge(171575, "η㝯ӧ㛏図䋘䮢", "ᝁﲏ牼똳䁶䉇ꖸ渡ꒋלּ", 240192, 803963, 257288), Challenge(547597, "뿗뒔ട墳", "ꀓ䤢౤ᅺ鑪", 680932, 945835, 836382)});
    Test_CheckProps_Challenges({Challenge(727307, "諪ﰞပ꙳㜢㠱", "嬫з漈ꑆ个幚뗔", 979742, 391279, 933285)});
    Test_CheckProps_Challenges({Challenge(843103, "浏඾繫䷩暻Эᳺ푰", "ｴ鼁", 207862, 97523, 970640), Challenge(614806, "ậ≲턺", "㟦兡䏰糗鿾돵傗䘠", 538331, 186260, 74594)});
    Test_CheckProps_Challenges({Challenge(967173, "罶㭹뱍᭲긞膐", "ĕ�뎿�ྊ", 830731, 630533, 716065)});
    Test_CheckProps_Challenges({Challenge(229264, "⪤�蝭靡힥虻", "茧餌僸", 692881, 34562, 961228)});
    Test_CheckProps_Challenges({Challenge(802021, "꜔䤩", "▦⼛傟ꕅ", 846078, 895695, 880971), Challenge(623797, "赯", "絵橱꧵钖", 242168, 146269, 71779)});
    Test_CheckProps_Challenges({Challenge(529932, "�駷�ℷ鼈㐏虒俀耥", "Ự篢㖦槔", 238565, 682815, 65598), Challenge(499359, "檹㪡㈥텒", "�ﮗ", 977444, 37441, 328511), Challenge(598321, "껗々Ꝺ", "뿤ᾖ뚬淾沁켻䊜", 420341, 183673, 171027)});
    Test_CheckProps_Challenges({Challenge(212796, "욤츙촐㲃朓紸늹鷲", "䥾箉穘ꇠ䫧䟧儷", 815651, 294566, 547396)});
    Test_CheckProps_Challenges({Challenge(5781, "姏ꎕ珳룹螈蘰⩉", "ᱳ磡栧ꝱ⺺Ҩ蓟㪽軔", 631692, 516165, 443536)});
    Test_CheckProps_Challenges({Challenge(667170, "浃፛", "�퓥숅", 295707, 573931, 113289), Challenge(12574, "眧畹㘅놔筶ꑢ", "ᒟ൒", 371733, 904542, 262511), Challenge(215935, "䗗ꕩ髽", "Ꝙﺿ", 248619, 192100, 791278)});
    Test_CheckProps_Challenges({Challenge(769082, "힢", "", 361763, 627436, 725374), Challenge(345955, "║ｷܫ䪡", "︍歳컧묈䳖", 873621, 191, 950331), Challenge(28052, "裘쾕䮝�દ咾釫", "ఽ슆", 674066, 241452, 155058), Challenge(493987, "罫䵮웤", "菽䡐膅⫳㸷앉뤸퉡", 504356, 400694, 363266)});
    Test_CheckProps_Challenges({Challenge(697413, "虋㖈ᘈ缥躒�펀ᯒ㙬", "锔ﴫ", 928807, 746986, 376450), Challenge(416819, "�獠", "窺◫Ī ", 972215, 813043, 492174), Challenge(209998, "▏�쒿뱴", "믅", 163447, 420662, 483076)});
    Test_CheckProps_Challenges({Challenge(224495, "쬂麻룯흹", "裂ﰹ槉꽽", 519644, 874871, 555939), Challenge(827382, "◚꒟�ῼ錦", "䵽为ぼ⎳퀳ﻴ", 540733, 243411, 426363), Challenge(34956, "㝲ࠩ᭵녱撅", "憧쀓", 745616, 176373, 226616), Challenge(102098, "衪蘒힄팁牛붔଴㏧汕", "㕿�슌욵ｪ餤１렏⢈", 127133, 482767, 613995)});
    Test_CheckProps_Challenges({Challenge(21914, "᤯", "睚혤薦䜾ຩῐ朿", 782099, 802745, 524932), Challenge(362400, "㶜⸉⁭䥉腪壋⣮坐", "樨", 94034, 565833, 682734)});
    Test_CheckProps_Challenges({Challenge(949125, "꾟눗ᠤጾ焤☜", "㔓襥⦠ᩏ歒", 561888, 684080, 802195), Challenge(681803, "偿紥ᩎ", "靍㱦ᇉ揄", 263706, 936413, 224748), Challenge(302803, "ꭸせ泴볹䰝Ḍ⁭", "敚ꊔ䝻ᗓ騵ꦎ鈌䧢", 559359, 996571, 165383)});
    Test_CheckProps_Challenges({Challenge(429359, "콖�纄솁᠃穊皚ᮎ", "㺽而텞줌벴ϱ", 87168, 50554, 657144), Challenge(2630, "쩰ᾑ笍ᐠꟊ䱤㖹鐶", "䄀ੱ࢟킱", 865735, 36494, 722458), Challenge(780395, "끕蘆㉰춈ꪦﵥ⁥㦠ꣃ", "ꏝ뙪", 126556, 599626, 996704), Challenge(232901, "⮲﫩ᬀ으ꦒᢆ民", "캠雜胅챉ﾸ൫䄼㓝칰", 123053, 453785, 703200)});
    Test_CheckProps_Challenges({Challenge(972802, "", "ﯔ۱ᔍ䲥␈䉁﬷휡", 836901, 142252, 115792)});
    Test_CheckProps_Challenges({Challenge(470856, "㙖", "榮阯魐節�믜耿ᨈ蒁", 262291, 613080, 503584), Challenge(22255, "耭䢒墻ߊ⭔䘷ⲧ", "斱送", 60414, 563838, 262377), Challenge(622834, "㲸", "큀鬏⾍塰祛壏ꗎ�", 38181, 302981, 155420)});
    Test_CheckProps_Challenges({Challenge(716841, "粼ò䙄䍩뼚", "ަᗱ⸡┎旺ഫ勺ݯ", 73212, 130189, 138870), Challenge(979016, "⦈⯮འ�鷵ኺ微ꋓ", "탑帆", 216244, 912688, 46547)});
    Test_CheckProps_Challenges({Challenge(745927, "േ歿", "᤹", 322060, 793727, 618572), Challenge(978008, "�ꖫ蘨ᐾዸꏔጴ燷缿", "䮅扌訧鍬⻜", 564555, 122443, 731185), Challenge(784379, "ੲ쟗퀵㙙頻宬畭㒈祀", "鈚횳襹젡", 506010, 814228, 336553)});
  }
  
  bool unitTestResults_Challenges_Getters = runAsync(Tests_RegisterAll_Challenges_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_Challenges_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_Challenges', UnitTest_OpEqSimple_Challenges);
  }
  
  Challenges@ lastChecked = null;
  
  bool OpEqSimple_Check(const Challenge@[] &in challenges) {
    Challenges@ o1 = Challenges(challenges);
    Challenges@ o2 = Challenges(challenges);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_Challenges() {
    OpEqSimple_Check({});
    OpEqSimple_Check({Challenge(509350, "", "", 591080, 333816, 159512), Challenge(535487, "਀ꩣ釪�麑遬徨탏", "壝玃勑뤋펍캒ᨶ", 526999, 962771, 489079), Challenge(393455, "ﷰ눵뭩㵷衟춗䵩", "쭶퍉첯㚥涬", 606964, 746965, 295268)});
    OpEqSimple_Check({Challenge(776509, "嗣ᮌ曄ꚉ桀楫뇊", "썷ᯱꛞ쏒㚉뙶娜ᣟ⫀", 156001, 536782, 810716)});
    OpEqSimple_Check({Challenge(208909, "䀐硩钗쏥䁏", "䀿虿", 624373, 718449, 909595), Challenge(521707, "ࠡ똮", "汀ᆣ젙娣ʱᯜ鱦", 468715, 840953, 20188), Challenge(531474, "횱宙홧㉜는ꒋ㑶", "⧝耏盧я␜῰蹎", 757154, 179642, 145172), Challenge(214810, "Ⓢꖠ⋳䝅攨鑽", "㞫䫆ើ鹆ʊ冿", 392143, 117677, 288195)});
    OpEqSimple_Check({Challenge(39414, "蟉꾋ྣ驣Ⴥ烶ꦴ휇", "靿ᩬ□", 952676, 610372, 610221), Challenge(92364, "డ㫠", "赬ى⢍奟㜫䞞祡͓墳", 411404, 87953, 691164), Challenge(785418, "㫕崒⁗∾웇Ⓩᱭश", "ﲁ들≱髀饁䱯淵", 411239, 791899, 539265), Challenge(861741, "", "䜧侉�尕놵", 304368, 940342, 430418)});
    OpEqSimple_Check({Challenge(853751, "뛰", "秨玹桗喐", 814326, 317042, 332229)});
    OpEqSimple_Check({Challenge(511824, "ﺵⰪ", "", 427331, 254977, 675579), Challenge(445348, "뱉᧡⬆ꁓ縬", "ၧᮑώᘢ㵅绰혏", 213686, 159354, 929569), Challenge(177035, "", "厙׊�猋┕", 258954, 854291, 590083), Challenge(657115, "侮ꀵ", "ЊЫᯱ睟娬", 819938, 501726, 884620)});
    OpEqSimple_Check({Challenge(840971, "共䳶넊ᙓࡀ컒", "", 475985, 789265, 36996)});
    OpEqSimple_Check({Challenge(728610, "ꙕ", "ꁟᾅ죐戃", 350295, 696778, 220644), Challenge(39828, "砟ᙵ굩ᱟ骲盼ﰢ࿏꘰଒", "揙�⺭é", 276400, 926264, 151322)});
    OpEqSimple_Check({Challenge(417084, "띟璦Ⴗ婑遚㌌⻄㕹", "䨾㶜☭ෳ", 284057, 296593, 97859), Challenge(690603, "螥㗓", "ᚭࣳ�﨑ğ", 794688, 783622, 424914)});
    OpEqSimple_Check({});
    OpEqSimple_Check({Challenge(31625, "閯ﺸ娂ᑠ쟀냖럢쩪", "愶彄纇鼗䘚秱ᗱ", 610831, 834401, 438887), Challenge(354108, "錠쟓쎭", "վ罚宿㝳䵉貟↟", 978412, 15728, 543714), Challenge(463281, "奺ဂ䳇텩㚽댯맑힊骝", "㎭啷⨍揉뭮", 203988, 773250, 395321)});
    OpEqSimple_Check({Challenge(37271, "", "Ô聈", 207505, 573410, 365268), Challenge(290586, "箆玬㖳驡囈椐", "义㗡뺅捻飰鵐", 490617, 436798, 235839)});
    OpEqSimple_Check({Challenge(263019, "", "넱�㙫", 707858, 1447, 703199), Challenge(196654, "랔ꖒ鬋", "쳮쬤﨣ኛ믒趰忳", 621920, 571138, 856391)});
    OpEqSimple_Check({Challenge(673138, "", "", 563843, 181762, 894415), Challenge(866437, "�瘣댮杣ඟ姡�럴", "媿餧윭ࢫꂘ", 665073, 666256, 890828), Challenge(116782, "狀䌤", "䊀덒턗屷硷ﵜ⫌Ꞻ⧙", 640546, 486696, 405550)});
    OpEqSimple_Check({Challenge(455033, "过�蝄合౜녜뎙㾣", "൹貈垸", 229473, 575927, 155319), Challenge(250555, "韠፧迒䌡", "녑", 445761, 857000, 976480), Challenge(926220, "ᄈ믋왚ꯂ喿�", "䣇ᚇ梅翂㳕࢏", 806802, 867988, 950426)});
    OpEqSimple_Check({Challenge(987346, "玗붐", "캨ᚠ듞莹桏져墩먘ꀛ", 684252, 121980, 421305), Challenge(968715, "礚쑲∆ⴝ", "⶯协⌜᳜", 246221, 571410, 302823), Challenge(496681, "歓퐍⟳庶✨", "⯈퀍낼민翍쵓㩌찚࿋", 970359, 225588, 654100), Challenge(375445, "v⍱隊", "㻢뜵㺸䞭촁챑ᩓ龜", 733738, 183627, 640719)});
    OpEqSimple_Check({Challenge(287102, "休ￏ墥ℓ", "렳墄䖢⊎�ꮏ", 38661, 223824, 454708), Challenge(504468, "✜ྦྷ", "낤햳釽⛧옩炰၃鉝", 471983, 508026, 929051), Challenge(233572, "⏏", "뀁م", 55892, 967496, 74974)});
    OpEqSimple_Check({Challenge(730255, "캑ﴆ牌핧ᾓ瞀鵰삫", "䐤ⴢ", 281669, 661859, 131224), Challenge(19538, "괮툘ꋧ", "", 206100, 90723, 516222), Challenge(506976, "෨끌", "潾쬨梖ᮺ勫Ꭼ頰", 424590, 422442, 62975), Challenge(975296, "食ꆔ뾘�浹珩", "뼄", 889660, 383038, 607898)});
    OpEqSimple_Check({Challenge(404813, "맖Ⴙ潊峼", "챞䢿眭᫜侯", 193240, 762141, 56696), Challenge(343457, "ﴗ๋", "攅樘犝ⳡ늵꜀㏔绨", 40693, 65114, 257186), Challenge(994879, "", "띴勇", 132420, 490476, 525549), Challenge(665455, "댬㾑ໞ탬", "䟫랴ퟭ씤�", 602322, 102070, 771852)});
    OpEqSimple_Check({Challenge(914953, "䇹筽㪥듚悕ﳊ", "灐퇽", 649821, 400151, 568006)});
    OpEqSimple_Check({Challenge(530481, "", "ἦ㰞�", 440082, 987124, 21957), Challenge(92494, "㫋�", "", 475261, 482596, 949698), Challenge(790689, "㴧튂䄕᳂꛰판눮㛆", "ꭰ", 41300, 364434, 611520), Challenge(407489, "蘁䞼壄桀蜿쾖", "鋩ඎ둪┉堼彠ृ䘄", 384006, 84112, 751776)});
    OpEqSimple_Check({Challenge(268716, "勣낉", "빂맴嗰荎觵緘顎ૢ", 834957, 117332, 199748), Challenge(918845, " 뭻䴹ﻲ扦", "藂Ԭ剻敝ﲁ", 990216, 985950, 652434), Challenge(120708, "㍙⊘�౟", "欣ﳋ乯", 59634, 83712, 793431), Challenge(387569, "檖ﰠ붺︈გ萩", "", 378286, 33190, 847424)});
    OpEqSimple_Check({Challenge(362238, "㫷ൈ�ぞᓺ", "棓쿏ϑ᠟釿뾂䌑ᕊ", 639128, 801694, 310993), Challenge(886773, "긺簼곽⺲", "㗲玬욢죚뫦号", 461071, 968142, 182715), Challenge(783001, "", "묽ᴂ㰶剎䌅糣Ӄഷঢ", 975752, 937115, 584989), Challenge(905196, "곞ᘾꃥ촄㍕札펂ឝ", "ᖃ䩷", 509669, 314865, 879936)});
    OpEqSimple_Check({Challenge(401111, "衈ܔ肽粪噷鼚", "㏙伥╙灌띎噋ꌲ皒퉰鞗", 669536, 82473, 209134), Challenge(41134, "�眊뭬甓阯য뗮訆脲", "", 493899, 174588, 79375)});
    OpEqSimple_Check({Challenge(33867, "", "⣻ّḧ", 847734, 537946, 938933), Challenge(279708, "㰯", "빑㛠஑뚀�⑴㤾", 481910, 863805, 189651)});
    OpEqSimple_Check({Challenge(698692, "", "ᴥ䂽ᧁ⬤믍ﭶ쭸吹꒝", 469495, 594293, 260748)});
    OpEqSimple_Check({Challenge(468193, "륑깾귵獦㣋幺ਗ਼", "昳占㵊㱲﹒푽씛듷", 59131, 661963, 896358), Challenge(59050, "ꕮ餗뼂�숣怣楊멕纍", "䋢ฅⴑ鋆㫊훝湕", 102446, 398466, 887225)});
    OpEqSimple_Check({});
    OpEqSimple_Check({Challenge(527494, "", "鉤⡄꺁佪솫劊좂響", 349531, 221720, 286849), Challenge(387499, "삓ȴ劗ᄼ잷輠", "ヸഫ傻䂓㯄좑", 926855, 163241, 178350), Challenge(892400, "쭖㟧⃟㢋ꮂ", "鷍뒦羊テ", 745545, 576553, 504590), Challenge(841605, "댓໵噫歪嵞䄁", "荏嬸", 811477, 597319, 699556)});
    OpEqSimple_Check({Challenge(262656, "鿸큿", "ी狲篌髋ᕀⲑ症", 194512, 944361, 723929), Challenge(217295, "", "疡谉闷䖕✚葝壜벦", 180207, 991643, 531510)});
    OpEqSimple_Check({Challenge(220919, "ॄ裗嵀崁尉ꊹ娷", "푔ﻖ䋘痡뗏�ᓀ", 538512, 664123, 769864), Challenge(59109, "䐙ꛎ葨皣懁夀", "齑간㴳鮙", 357258, 91002, 986695)});
    OpEqSimple_Check({Challenge(957251, "팰䎊葥汿뗼", "瑸ꤰזּ窞璫濝詼", 36685, 802978, 824489), Challenge(958803, "묻褹ꐶ⓴", "�❨膧郾ᨓ", 109779, 878374, 538187), Challenge(500992, "솹㵊ᬂ婤ૐ잂Ꞹꄧ岶", "系", 847615, 688227, 384502)});
    OpEqSimple_Check({Challenge(80386, "ᨑ垢ڡ", "ᔢ뉢ﬗ䩂ඛ뼧ￎ注࿍", 87934, 541446, 241389), Challenge(91594, "謏믷γѦ㙉", "扚彡㉆䥅", 867578, 298094, 378434)});
    OpEqSimple_Check({Challenge(41963, "〬绾褟修쩶ꏒ莰䍇", "镦䠉붪｡蟕", 177327, 764739, 28854), Challenge(921535, "", "嗊ዕ뻣႒鐽", 123157, 417823, 685504), Challenge(574364, "塨跤鼝흠", "எ⃳੫貺軁测", 763559, 26992, 625171)});
    OpEqSimple_Check({Challenge(42567, "砽ਞ杻", "ܱ症᯷람⃧旝疀", 386906, 981241, 471690), Challenge(921952, "", "氧﬷", 493338, 159456, 651067), Challenge(733623, "춂﹋�掌�", "虒擖ꖜ", 51877, 14487, 947670), Challenge(928239, "꽠枕뵷鉌", "퐌쮧㏡륳", 19759, 290517, 641927)});
    OpEqSimple_Check({Challenge(210946, "鑮㍴獭驩₄⭇", "䷪䶑輌ףּ䈫媃溼楌⟏", 273559, 251413, 354814), Challenge(660221, "ᣪ儺덥胹苢ꆟ栈詠彨", "", 199558, 405873, 659188)});
    OpEqSimple_Check({Challenge(766843, "끗각䴂〪", "듦ꪫ䥀袯⯇ﶤ", 132409, 960509, 187178), Challenge(88301, "ܨmꉎ�ﲾ⾻㍷", "缻猄鴀屒⋧怦", 51627, 654535, 752554)});
    OpEqSimple_Check({Challenge(3932, "奇进됭䆸ꇵ㳃턇", "祶�த⽥㑥ꉽ忂ᗉ", 727740, 453559, 399532), Challenge(425480, "", "⊣繽゠笂鍙櫇잋䔚", 541111, 742384, 297530), Challenge(625526, "뇗", "⩆⽖쿦眔䇚", 249795, 547714, 983582)});
    OpEqSimple_Check({Challenge(822689, "㭊ᐠ픲䖆", "卵哖ﺇ", 396963, 288244, 153608), Challenge(890087, "๰挎", "癣못餌礵쭁", 588408, 286536, 925194), Challenge(961271, "ש⴨֥嬼슷䮈柎縋", "阸报", 289992, 489314, 798513)});
    OpEqSimple_Check({Challenge(625359, "䐘♠넌抧홁貽⛅", "娮ഔ縒", 475815, 720915, 744270)});
    OpEqSimple_Check({Challenge(649254, "ᅸ뛦躌륕", "櫢潃뮚己唙淐挩㯂죷", 201767, 939115, 86434), Challenge(490787, "챃୺뀸", "๑ꇔ饭⠀径뤏㯛챃", 998691, 87802, 469561)});
  }
  
  bool unitTestResults_Challenges_OpEq = runAsync(Tests_RegisterAll_Challenges_OpEq);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_Challenges_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_Challenges', UnitTest_ToFromBuffer_Challenges);
  }
  
  bool Test_ToFromBuffer_Check(const Challenge@[] &in challenges) {
    Challenges@ tmp = Challenges(challenges);
    Buffer@ buf = Buffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _Challenges::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_Challenges() {
    Test_ToFromBuffer_Check({});
    Test_ToFromBuffer_Check({Challenge(860777, "攤룷ꠅ", "ൗ㬬䱿학钻ꂆࣤ㍅糳�", 760473, 549906, 156703), Challenge(798589, "ᄟ텻鯄ﴻ㑽沒", "咽糥疿눪ⶭ灁ᏹ㑚", 829354, 16729, 195527), Challenge(490366, "", "ᦞ壩괛�㸝赳粢ോ银浕", 208087, 184950, 608908)});
    Test_ToFromBuffer_Check({Challenge(183976, "쐖傒撵㠪긒译Ố椮㕋", "◎䀭鷥", 612011, 126838, 853771), Challenge(504678, "�", "㺒郊ᄾ䭖", 985997, 445973, 75186)});
    Test_ToFromBuffer_Check({Challenge(612549, "⣎녿썳쁇�圍", "蒔銥", 956474, 273215, 711944)});
    Test_ToFromBuffer_Check({Challenge(526802, "䅞嶗", "䔧ꦏ㚥≐Ỻ퍀", 440490, 112876, 53015), Challenge(386493, "☻ｲ㾔臰븊륅", "隕ᴋ쓣ã葙春裎⒉", 222696, 247284, 471718)});
    Test_ToFromBuffer_Check({Challenge(305848, "�髨", "缆罙푅인", 330939, 610901, 520261)});
    Test_ToFromBuffer_Check({Challenge(608966, "諍愥뻣쑶", "謎ㅩ顃쀒펧ຨの⧚", 172105, 400425, 502687), Challenge(981602, "㈳ឬᎉ뱵뒣퀢饮", "�ᵺ䣮", 709915, 790967, 316705), Challenge(525529, "", "峽ᱪⓣ䝚ࠌ臼", 921233, 36589, 432248)});
    Test_ToFromBuffer_Check({Challenge(537186, "캹㸪쑚ꍲ觇냐娫责", "氉恌⿇�뿿끄먫ᣆ抣", 473825, 7876, 56855), Challenge(349336, "쉫탑尴ᡰ傹", "", 764515, 954519, 85293)});
    Test_ToFromBuffer_Check({Challenge(633860, "໐㙿어瘠欧", "౜撷", 922608, 162188, 424265), Challenge(811015, "梱쒰ᘤ�6", "㢋뵈곋衫�鐭", 807307, 22035, 24133)});
    Test_ToFromBuffer_Check({Challenge(127483, "邯镇混�", "奡碧兇᤮㘄ᯈ", 508716, 796285, 186933), Challenge(131671, "嶈Қ⨏취ಗᨠﳄ�⃄", "", 328793, 438882, 795188), Challenge(781973, "魤ǫ䏆", "썍뻏", 773115, 465852, 638173), Challenge(877783, "軡", "Ŏ猥窣", 898687, 319491, 786352)});
    Test_ToFromBuffer_Check({Challenge(758127, "顂헧", "沪૔㠐ྉ�ፑ쯁欦뀃", 327246, 124661, 194583)});
    Test_ToFromBuffer_Check({Challenge(112592, "侇", "玶暤", 512740, 35511, 107080), Challenge(941100, "멬�", "䞌㧵ⷧ䨁", 155863, 983393, 49515)});
    Test_ToFromBuffer_Check({Challenge(205143, "繧ở蘝എ쾻骯䴳垇", "뵁ꔈ", 636794, 5605, 687254), Challenge(699561, "⺵䨝⤖❅", "뫛쫴곳焋ᙩ왟ɳ늂豿", 272999, 804771, 403951), Challenge(329669, "", "᮵樇", 10587, 438625, 784760), Challenge(36318, "", "⅘ﮪ䭐릇論扭︀", 138879, 263867, 27876)});
    Test_ToFromBuffer_Check({Challenge(692953, "隔䨓䐭ǘ钶옠挏", "鶑煮쨣雜蒘", 991105, 611797, 279996), Challenge(841223, "ힲ䜎", "｜ﭒ☏ꄳ醭獙", 849299, 534295, 545877)});
    Test_ToFromBuffer_Check({Challenge(893817, "ꆱ난", "ｹ䷿￫蕬翓", 480458, 109814, 434672)});
    Test_ToFromBuffer_Check({Challenge(790541, "ꚩ", "粙", 95161, 615343, 784257), Challenge(140266, "蓷璉ὕ᳊ꀕ绪됉韲媲", "쑶ⱽꊑ⏹㝣魠齁", 832092, 559458, 580200), Challenge(95318, "疭爿㰙ḋ뉠缾", "鼋皿ꮺ", 588519, 605952, 63954)});
    Test_ToFromBuffer_Check({Challenge(937372, "ⓑ�陻졠甹굱䈳", "箒Ừ⠹ꆥس尭뵂ִ譲里", 630421, 919574, 58327)});
    Test_ToFromBuffer_Check({Challenge(454262, "ӿ�괍퓋댳", "噖͍뤃蜥ࡆ掹᭚☰壖", 898463, 938465, 177702), Challenge(177518, "", "뾛㸜꘡⒙魨", 552342, 632030, 940477)});
    Test_ToFromBuffer_Check({Challenge(828324, "ᝐ", "Г竈", 561926, 911772, 292150), Challenge(458751, "혬ﱥꪒ�", "", 842066, 429722, 296154)});
    Test_ToFromBuffer_Check({Challenge(867334, "橸빾搊舴", "冹╁ⰾ쎃�ꓘ", 334089, 628340, 587594)});
    Test_ToFromBuffer_Check({Challenge(193093, "赘⯅㖰켤쵑", "왞澻誣లച㽺阣죸鉓", 314391, 263009, 331373), Challenge(904311, "ᔿꁓ瘻訶鼟鿂", "韁ꕾㇽ", 905653, 861072, 300849), Challenge(72860, "㈣虨", "軏⦲⭠㽴奙", 301442, 902628, 921825), Challenge(304872, "", "䛬᳝ٺᗮ�翊焤ᱺ", 591704, 157680, 25808)});
    Test_ToFromBuffer_Check({Challenge(891454, "Ʀᤍโ谗췵痡", "칫鰥쇪篬꠽㑂劲", 692579, 903648, 171714), Challenge(694044, "�䝡", "詙곈肧ధ", 393506, 179307, 707293)});
    Test_ToFromBuffer_Check({Challenge(661271, "漥⾝婒れ", "핶ᵇⒺ㤄嫅㠾", 60936, 983556, 939073), Challenge(578018, "㳵唵Ἐ痪", "咱↍ꇒ園喒躬ᚑ鈉", 821091, 893092, 84642), Challenge(198564, "砙", "ꕈت䠘鉄�ኸ陧", 387311, 663146, 332117), Challenge(682491, "돗左ᶢ繑⥦眣", "ձᲗ㹧⃯৐諾鉕湬", 485832, 215350, 322695)});
    Test_ToFromBuffer_Check({Challenge(700098, "㳖", "暻࢙⦩䚏쳂藏芗沆", 658856, 724290, 181266), Challenge(528211, "�আ䊫֨먯", "☉筛춨쥹", 226507, 942279, 961963), Challenge(903812, "갧鯄ⶢ�", "棄ꧠ裐㒤뱗�", 426616, 505308, 337066)});
    Test_ToFromBuffer_Check({Challenge(97791, "궪ⴙꨶ䑀鸱듾纖靉", "⩃᏾尡㢗推ᲃ", 946793, 758595, 858951), Challenge(301375, "⬧㇫㭩絹葅", "錉㖲怹毩棱", 940109, 702298, 460130), Challenge(839297, "㢒이隔扭", "ຽ", 793631, 617813, 425773), Challenge(566749, "ᛯ", "ﶤ墩⥊鮆ⰱ柨բ", 477899, 192473, 65209)});
    Test_ToFromBuffer_Check({Challenge(365783, "枢辱蚔⁃렵꼞ቼ", "ﴂ褘鐊䃦", 542573, 718838, 883758), Challenge(655924, "㰤ꏜ�ꄎ❒舖", "ኚ哱า畸ᘿ漵溋⽼仈", 622825, 1420, 42429)});
    Test_ToFromBuffer_Check({Challenge(622817, "꥘哙튷�", "₠", 50373, 601319, 274311)});
    Test_ToFromBuffer_Check({Challenge(377634, "䚡嬻", "襄口ǹ勆袣", 634415, 622358, 267306)});
    Test_ToFromBuffer_Check({Challenge(315810, "픓٘靭遹뵪딺", "戗涠″殺帤따䈫搪", 953883, 916517, 813256)});
    Test_ToFromBuffer_Check({Challenge(466950, "璡﷬燝툟䏣ئ㝡嘕쎍┖", "筞뫊뵈㟝縕", 717623, 457948, 291704), Challenge(235751, "⼗ぉଯ摔昛펬ﵩ夜땘", "嗳ㆧ䪅㹈", 793679, 638965, 196402)});
    Test_ToFromBuffer_Check({Challenge(839513, "筆��磖鄫뽂ꆀὲ鋞", "ꊃἱ⌿炵籠옴�ǲ숢낫", 636388, 428230, 688823), Challenge(865284, "ᕆ顇棗", "ㄔ荠ⵉ虇ꠠꅭ蚱眨", 116640, 963516, 984792), Challenge(125762, "", "숾", 704995, 318580, 479167)});
    Test_ToFromBuffer_Check({Challenge(714749, "ឞ瓧뤧薁俳ひኛ", "齛䳢蔐ꢥ才ẕ", 161551, 157026, 586115), Challenge(194349, "컡ᮕ셄婅䟙슽ȱ䞮ৄ", "➔⇐䦭駵夎", 745650, 382845, 743296)});
    Test_ToFromBuffer_Check({});
    Test_ToFromBuffer_Check({Challenge(453607, "欀댴", "焻꺚ꥆᠨ煚", 167143, 797565, 963699), Challenge(997735, "㺢ኼ", "Ɔ�ᕉ띤", 298466, 242683, 636788), Challenge(758099, "⨿茎烫⼟粠જ", "ꘉ쇣꣚司衢Ⱐ謹", 333868, 420491, 585475), Challenge(981212, "뼳ﻄ⮍⿦땄", "", 414569, 520514, 671757)});
    Test_ToFromBuffer_Check({Challenge(499056, "夐ဪ", "鉰憻窶鑪", 369244, 17258, 236044), Challenge(214148, "祦䛷", "큀굞ӝꠕ怰護顭", 978110, 191245, 49568), Challenge(912061, "拇탏敞윳", "㷨�ื㕌⮖ᵷ瀪⣝᫟", 380559, 3610, 913758)});
    Test_ToFromBuffer_Check({Challenge(166377, "凤쿹䲡ꔵ갵䭤鍗䯟", "昘㰻ᓈ⻂", 413688, 88634, 930187)});
    Test_ToFromBuffer_Check({Challenge(693362, "", "ၧ", 916838, 55332, 555512), Challenge(932904, "Ɠ蜿埻짤⫚⡩ࣰ鸡", "棿♥ፒ旜鈱", 433708, 615320, 698908), Challenge(970490, "箛⋀�", "洔ⱸ䵉룒㛈ᔟ", 998219, 911152, 649717)});
    Test_ToFromBuffer_Check({Challenge(316624, "ꡘ膷", "ᘌု瓌밶", 966773, 639112, 764215)});
    Test_ToFromBuffer_Check({Challenge(879977, "볲", "ໍ㲴⫲픢ಳ釖䮾", 268822, 139004, 149944), Challenge(240146, "ﴼ", "", 544499, 332412, 198400)});
    Test_ToFromBuffer_Check({Challenge(188388, "鄐", "꤭컍ଃ戓⤌뒀곗荸డ⟦", 609208, 611040, 588910), Challenge(233634, "艀�煍킠묞鈇ꬿ", "乻끦뷲縼ퟏ煛ꕄ裵", 460606, 911760, 838299), Challenge(716078, "ｪ纅⨕ࠅﶩ⹜⁌㚷⏤䴎", "榁翺靁ꂄ॔傕", 840653, 469428, 752682), Challenge(532333, "⤥䱋", "轈鐭賡韦", 108513, 982763, 599411)});
    Test_ToFromBuffer_Check({Challenge(131072, "ﱁ烔矈맫ᄱ鏌㧏Ꝡ", "丷剨鶟�鷥⍁♧꽮", 242064, 310827, 390119), Challenge(557879, "", "쑊鸳", 396190, 97732, 91510), Challenge(298352, "伔竊ꥢڹ", "镘்", 522768, 491466, 360325), Challenge(951666, "螗�̼ᩳ笰ꎋ", "铹辊Ⲍ搌謞", 911097, 688994, 854562)});
    Test_ToFromBuffer_Check({Challenge(346396, "", "㟕", 978219, 111663, 259351), Challenge(325711, "㓝�彑墻礜㈜㵻턘ﻜ灎", "浛쇡䓘", 719766, 780347, 885103)});
  }
  
  bool unitTestResults_Challenges_ToFromBuffer = runAsync(Tests_RegisterAll_Challenges_ToFromBuffer);
}
#endif