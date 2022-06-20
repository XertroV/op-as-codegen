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
    OpEqSimple_Check({Challenge(287102, "休ￏ墥ℓ", "렳墄䖢⊎�ꮏ", 38661, 223824, 454708), Challenge(504468, "✜ྦྷ", "낤햳釽⛧옩炰၃鉝", 471983, 508026, 929051), Challenge(233572, "⏏", "뀁م", 55892, 967496, 74974)});
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
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_Challenges_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_Challenges', UnitTest_SzThenUnSz_Challenges);
  }
  
  bool Test_SzThenUnSz_Check(const Challenge@[] &in challenges) {
    Challenges@ tmp = Challenges(challenges);
    assert(tmp == _Challenges::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_Challenges() {
    Test_SzThenUnSz_Check({});
    Test_SzThenUnSz_Check({});
    Test_SzThenUnSz_Check({Challenge(527623, "陏", "씠䪉Ꮢ榋", 705395, 18764, 852959), Challenge(555317, "ﲼ᭫뇾", "粯ꣿ僨躗괱韲", 131261, 366231, 796997), Challenge(34637, "赩ࡋ痋蒪䃜졂錭鿩꤉", "ř챉鋱Ʞ爇⼺鐸䨒", 311318, 690397, 585467), Challenge(275348, "�놮鿍ᔛ覎漸࿚팂툭뮊", "骈咮ﱴ㞩谶릚끣", 840437, 29355, 736349)});
    Test_SzThenUnSz_Check({Challenge(956732, "퍻䳥最徐㭾멭Პ䑰", "䟥ፕ⎃ﲀᦓ솛格둪", 234787, 700902, 853957), Challenge(949845, "Ὼ㐚ꂖ摇䞰鄕ꈽ洞⤦", "", 964248, 970574, 467845), Challenge(439305, "⏂ꥏ꼼砍띑䗇髣蘟", "鉓켯τ㪔ﻊ爛", 4343, 482726, 675803), Challenge(629002, "㠵ᢐၛⶍ쎦", "좳", 641708, 67877, 569276)});
    Test_SzThenUnSz_Check({Challenge(362888, "", "澸曂Ԧ懁ㅲ砤", 357453, 442238, 627991), Challenge(241793, "愵䗽ﵱꐎ", "ⓧ撲왭改ᢂ䙏", 976559, 150994, 558367), Challenge(480710, "훃�폡䐂᰾홗", "柊麑囼", 279372, 312200, 227617)});
    Test_SzThenUnSz_Check({Challenge(868449, "�〿Ꝼ샛ᣱ", "ӑ䞖猏鐪﹀ྏ䅳税", 729161, 92, 558576), Challenge(161330, "⻖㋽빽睍뉥", "雈皇殤膕躯蓬㥊", 820813, 647490, 647392)});
    Test_SzThenUnSz_Check({Challenge(704477, "Ṷ耦穰㢴", "ﳓ눼ᗿ鉞ꊵ㻛", 253805, 750292, 91371), Challenge(963710, "卹籫", "䗆ᵭ䠽읨", 632361, 22517, 361965)});
    Test_SzThenUnSz_Check({Challenge(824789, "樦", "Ꮪ猾ؙ太蠵", 99463, 860757, 909951)});
    Test_SzThenUnSz_Check({Challenge(904059, "ቔٺ", "歬痠", 249089, 840079, 628804), Challenge(6692, "�난ힼ떐砤늈ꆅ", "忖鯲人覚�", 35015, 1591, 338337)});
    Test_SzThenUnSz_Check({Challenge(834356, "ذ沶ꫴ痺ﾖ", "䶂簜饋᲏඿븹", 587261, 379807, 168286), Challenge(606450, "₺洉疧ꅦ뭲끀䗶찀믌", "㌲㯊䂁∐⒳伷鳯⽸︧濜", 247650, 379916, 770642)});
    Test_SzThenUnSz_Check({Challenge(901092, "ᐼ쳴䣹뒞듻", "ꊣǆ녃", 241326, 984560, 736725), Challenge(646739, "㙂詵", "妊嵚뻭ቡ", 593371, 777624, 10462), Challenge(560435, "ᄜ☝㺸긧�䵘㐯", "ꊓ�쳉⺋", 999224, 249786, 43724), Challenge(334072, "ﬗ炅⧬䥱", "આ騧➊皠㓧脺﫭", 396305, 730943, 49473)});
    Test_SzThenUnSz_Check({Challenge(263354, "箯浔陳᳚乹ﻺ鮷囫", "䮋", 745915, 315247, 912496), Challenge(808646, "㪁▫윁벼寥ﴋᮝ臢", "鲑頸헳ᑭᷡƫ믅༐", 880579, 464345, 505384)});
    Test_SzThenUnSz_Check({Challenge(711262, "㟧歒䉛笔ꦚ흯슍뾚ॄ", "紨⤦鄻隳砒긳佒", 655561, 826967, 255252)});
    Test_SzThenUnSz_Check({Challenge(354093, "낊㮄瓲ꔽ႙趹", "䚦럕ț頛臾ÍἩ", 168469, 571192, 936735), Challenge(532104, "궆暱여군햛蝅縰", "狤í똫俑ﷺ⋏晆뗭⴬", 635672, 394180, 207205)});
    Test_SzThenUnSz_Check({Challenge(682863, "ꤔ侂", "ஜ瑌탂븞觸", 833655, 636614, 245216), Challenge(733581, "헣⧾ﾊ驏שּׂ맳", "힫ʹ", 577770, 412880, 396732), Challenge(328156, "倽䨬㭺邇맣Լ颋骶熎", "퍒幽㔻", 399064, 523589, 79839)});
    Test_SzThenUnSz_Check({Challenge(266241, "", "ꇑﾷꃦꅕ", 808501, 953518, 283816), Challenge(427827, "챲퉗溕㹅灜桩弜", "蕹尷ꦾ첥⡵苨앶㴗ၖ忧", 571222, 581686, 977267), Challenge(385300, "", "뻗８ᦲ菬蜻췭栴省", 178803, 221120, 675410), Challenge(333008, "愤섉", "", 186040, 69951, 157313)});
    Test_SzThenUnSz_Check({Challenge(458420, "⸏윲氕繍廻䎎ਥ噚", "䄟", 268043, 850901, 454459), Challenge(665972, "떁", "ᶮ苿퍎ᇏ伅", 36375, 463622, 248976), Challenge(772770, "♭", "߀룞ꖭ", 316948, 157014, 260103)});
    Test_SzThenUnSz_Check({Challenge(181735, "ㆻಖⳡ忆", "蝶ꙵ隓臹⢺", 722283, 416051, 450180), Challenge(788899, "扎㹰㽙ᶝ㒾ⴙ", "�悝ㅍ➵", 763745, 133184, 698385)});
    Test_SzThenUnSz_Check({Challenge(642392, "蠡拉⢐쀌", "襜洞젶", 83850, 980557, 474286), Challenge(629344, "⯛婃ꬃ똊鱴䐡낀飻㥾", "㵛䓤≴ꠋ뽾緙", 362497, 172777, 816885), Challenge(897734, "臿陋㋫", "", 48336, 5749, 928098), Challenge(448848, "䭰�줖쵮ݯ滞觏퇌", "겋㞔鲱˯掑⺃爛ì", 350187, 935445, 663598)});
    Test_SzThenUnSz_Check({Challenge(352358, "⤫ꗱ᫞菓镫웤", "搯臕䘔꫈ᨋ》竫퓣䲊", 224416, 875242, 857629), Challenge(172416, "帻鈿橦衺㉹䧚炐▖䕥ϖ", "榄诶", 132876, 768987, 543580), Challenge(159848, "", "蠕续盲", 432129, 995984, 361102), Challenge(376242, "﫦㊷", "ഀ옉龞꺌ꭎ", 809611, 319210, 462891)});
    Test_SzThenUnSz_Check({Challenge(833852, "�梛怋컲쀕歛瓩O⁞鰎", "浗导�ṶԹ", 21513, 875535, 402199), Challenge(853320, "", "῀䬉ⱗꈣꗨ紓뻽龋", 552528, 616526, 274838)});
    Test_SzThenUnSz_Check({Challenge(967719, "闎࿎≮ㅻ", "", 470347, 773077, 164451), Challenge(385683, "쉅亠햇ᖇ⼏歖", "㡆햽㸞", 858641, 186903, 106182), Challenge(299030, "৸⑓", "뛼켄雝繗環錆㕟﵇", 235369, 775412, 329853)});
    Test_SzThenUnSz_Check({Challenge(588400, "뤔ྉ", "䯪", 225516, 605540, 347391), Challenge(368420, "੥룧큎仡�॑覿", "༳�튤眑冼", 467563, 598709, 626664), Challenge(869727, "㲡軖", "輐౟휐咒⣅꩹", 479336, 553341, 951269)});
    Test_SzThenUnSz_Check({Challenge(444800, "㭐銣콇ﲇ꽾", "皎䊭匑⩶妗�Ț釄툆", 279735, 981829, 706774), Challenge(32797, "", "⚷큙퐵儋䳆䦺謑膢֣ꤿ", 943138, 362458, 597302)});
    Test_SzThenUnSz_Check({Challenge(67457, "ᘎ耼⫰ﭒ䜹ᰯồ趌ݸﰙ", "鑛驖腙췍꽄꫻", 968174, 67155, 956741), Challenge(348131, "땲ꛠ瞣䔋黏੩鄭", "帜뇘룧김则", 285836, 135488, 487812), Challenge(742591, "⥽ꏗ謂㆞㒍眨釞", "", 124992, 930533, 225177)});
    Test_SzThenUnSz_Check({Challenge(237564, "諡畵䯖쫟艖佺", "﹊鴥묏⛿랥泘섆ۧꄕῗ", 960634, 536175, 493971), Challenge(756483, "븝弮�옚䬟", "", 876177, 635778, 984182)});
    Test_SzThenUnSz_Check({Challenge(496640, "", "꼈ꘁ﬩险檑�Ʋ", 441900, 62080, 769546)});
    Test_SzThenUnSz_Check({Challenge(1334, "肳圵놄欭愛", "�贲Ἴｃ鉃买㊜ꐶ塶", 727035, 239302, 354245), Challenge(844070, "", "矖", 759709, 762061, 243716), Challenge(265019, "ྕ㫐", "ე", 166520, 568742, 158127), Challenge(465913, "톽", "봫᧮Ἳ촷韄", 514223, 706528, 809621)});
    Test_SzThenUnSz_Check({Challenge(551008, "䷐ꌂ䈀菿ԏ�럔㼪쁉㪒", "샛煶끮悫뭶ዘ�", 949509, 968553, 558485), Challenge(498422, "ꟛ⧐䷔본촄益뎘", "詑脧坑遚∻", 908579, 497376, 417417)});
    Test_SzThenUnSz_Check({Challenge(251508, "둀魟䡏鉕�迬", "楟旒", 952811, 725125, 284960), Challenge(3276, "釕", "糢쨶波ፑ鄪厦ﴑ봭썏", 828621, 323283, 146610), Challenge(139818, "ዬ沛葄ད", "춙끬➒ᗽ}൳鸄ꋺ䨼", 122948, 926947, 848606), Challenge(434625, "ꦔ堦", "", 321371, 438846, 575999)});
    Test_SzThenUnSz_Check({Challenge(983140, "芢㏤깠", "萿�", 849105, 927472, 472625)});
    Test_SzThenUnSz_Check({Challenge(630552, "핍竉䃋", "䞹悩牪", 805392, 905573, 86768)});
    Test_SzThenUnSz_Check({Challenge(221693, "", "듒籍쬀ጫ㶾�嚦ޞ", 255012, 859595, 291541), Challenge(57045, "", "⹁ꈥ䗯ీ軧﮿", 1104, 916487, 427135), Challenge(34293, "享ኁ", "롧䱐Ė٬魒쪘퍓胾", 917862, 129611, 255304), Challenge(942857, "�쒒᲍鲈廘搝턣囬낌", "浿㯋ᩴ糺灮", 108419, 619400, 525975)});
    Test_SzThenUnSz_Check({Challenge(783215, "䭢 漓", "䨉", 57286, 328354, 976565), Challenge(750419, "픮똹₀㘞", "쉾캆", 507080, 606304, 61306)});
    Test_SzThenUnSz_Check({Challenge(290759, "ᇿ팑ퟞề딈㯪╴뽝", "햣䩝↡", 951108, 978517, 717017), Challenge(287847, "ꆾ", "謖䷅㔊㡟", 371522, 264447, 752411)});
    Test_SzThenUnSz_Check({Challenge(384104, "ꅒ豱숛᤻溜伔宜䷷랖ꛝ", "椐犀᝙뷟훇", 40915, 619666, 994180)});
    Test_SzThenUnSz_Check({Challenge(34528, "胆骡㹭騣냞黎ᶊ뮵", "迣媩캼卶肯쯑ޚⳋ塄", 135731, 890827, 617725), Challenge(814560, "꩖沀躁䢆⥳ﺯ籀ݍ枍", "穂゙뾙誜ὣ즷休彃쟝", 997117, 804301, 873428)});
    Test_SzThenUnSz_Check({Challenge(70124, "ᘒ", "뭜䳜͉跕睾鍛铫匃ԋ", 581368, 470748, 522343), Challenge(271507, "ᦵ㏶⚉", "ဘ蹄梉ᘂ됔﮲롲沞粍", 497787, 992700, 988040), Challenge(655784, "᧽�향醁줪Ф◩�雅", "ᅾ⇈䷫堧Ἶ", 335548, 840347, 175594)});
    Test_SzThenUnSz_Check({Challenge(392257, "켥碡榡儠ꚬ�ꯞ첧", "䘌ﲸ莖꠹䟄ꣃ㥾鯴ܗ", 914442, 753670, 413978)});
    Test_SzThenUnSz_Check({Challenge(217026, "", "믲떦ꭖ", 215975, 39885, 166725), Challenge(544748, "⫧Þ橒醟몾毭區", "砾裡恫唒鎣颿瑪쉗￣", 465965, 30508, 547864), Challenge(834812, "莕", "Ԡ귆㬈闄K宱轒", 844403, 566657, 738123), Challenge(705160, "洝忣�", "ꝝ", 258857, 200822, 391278)});
    Test_SzThenUnSz_Check({Challenge(329763, "牺㒢Њ鞍㭞", "䗘硓莜", 181493, 816799, 929973), Challenge(363028, "孱奒ㄴ퉳᠀㺍", "좆趚ꙷ騼ᰕ鴭伜蜸", 277545, 536336, 106082), Challenge(356473, "颒飗뉕镶", "�폤弹Ꮅ㝪", 38188, 714272, 805472), Challenge(361262, "罾䧼蔓ᦺ㷍ଚ쐯␂", "ޠﳻ됷躊낧�뷸堂", 869400, 909564, 566754)});
    Test_SzThenUnSz_Check({Challenge(770792, "", "䵹隐ﶚ", 281490, 648533, 877620), Challenge(18652, "�ꊪൔ絬茓㏿᪽嗈", "⸡Გ䅬權呋ᑎ藜즋ఠ킴", 932760, 420047, 255327), Challenge(878108, "༖ⓚ塋娽", "番횛", 768916, 646546, 869902), Challenge(928008, "䁬岚貈읫⃎눅伇", "鈠渔", 228966, 473050, 546662)});
  }
  
  bool unitTestResults_Challenges_RowSerialization = runAsync(Tests_RegisterAll_Challenges_RowSerialization);
}
#endif