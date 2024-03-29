#if UNIT_TEST
namespace Test_CompRoundMatches {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_CompRoundMatches_CommonTesting() {
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
  
  bool unitTestResults_CompRoundMatches_CommonTesting = runAsync(Tests_RegisterAll_CompRoundMatches_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_CompRoundMatches_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_CompRoundMatches', UnitTest_ToJsonFromJson_CompRoundMatches);
  }
  
  bool Test_ToJsonFromJson_Check(const CompRoundMatch@[] &in matches) {
    CompRoundMatches@ tmp = CompRoundMatches(matches);
    assert(tmp == CompRoundMatches(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_CompRoundMatches() {
    Test_ToJsonFromJson_Check({});
    Test_ToJsonFromJson_Check({CompRoundMatch(584806, 263483, true, "澯�჌", "�"), CompRoundMatch(129450, 573551, false, "ﭤℊ䮇귂⎶越⫺녺ࡏ쌳", "�勩ִ嬂㹦")});
    Test_ToJsonFromJson_Check({CompRoundMatch(587832, 695394, true, "䢕颒饣ퟶ䳟框雱", "救솳棈")});
    Test_ToJsonFromJson_Check({CompRoundMatch(811618, 178687, false, "눪꽏뛧䁖ؐ杒୒", "븯剬鯫ﾪ঒ﵴ뙕"), CompRoundMatch(936174, 391029, false, "ࣅ䞚㌴⦱扬껰朣", "毝榆旰蓡柿"), CompRoundMatch(880999, 957341, false, "ꊛ⍛謢䔩", "딽蔭䍕᫃"), CompRoundMatch(661401, 441237, true, "紙㕿ｓ褨堉⍴ᲊ̇", "")});
    Test_ToJsonFromJson_Check({CompRoundMatch(694964, 789918, true, "窐踎윉懜翊신꨻በ", "충왦굸褢鶳"), CompRoundMatch(357741, 149912, false, "嗍䘢封", "뤗慵뽳掗ￊ"), CompRoundMatch(11124, 681635, false, "ᒽ罆", "ᩁ㟅"), CompRoundMatch(291599, 158796, true, "ᇠ炦♱솎", "꽝낸똞ꚣ筣")});
    Test_ToJsonFromJson_Check({CompRoundMatch(781176, 45802, false, "Ηꨘ", "�ꧾ큽ⷾ뮁d更")});
    Test_ToJsonFromJson_Check({CompRoundMatch(547273, 969783, false, "⏓箝썷ꧮ搢趀絀죤箖质", "㜣뗃")});
    Test_ToJsonFromJson_Check({CompRoundMatch(26129, 916111, true, "⼸៯ꭍڑ쀈ⵗ㏬蠑", "벛ﳾ啃둸")});
    Test_ToJsonFromJson_Check({CompRoundMatch(342727, 17362, true, "螝⬣홭ᢻ샞饤", "ꒋ符䭭澀⽹ᱶ")});
    Test_ToJsonFromJson_Check({CompRoundMatch(348997, 47391, false, "┛輄", "쐤얪㵁㢝蔹ｽ≨⢮舊"), CompRoundMatch(758410, 670355, true, "�", "招곢贕没�ᴝ삱鄎"), CompRoundMatch(714151, 936398, true, "淣", "ᖦﭭ见禁")});
    Test_ToJsonFromJson_Check({CompRoundMatch(795861, 949831, true, "ᔲ逥좣", ""), CompRoundMatch(23152, 201380, false, "퐞也툃", "쟬ﱩ媡요쉒▹ﯖ號㪳"), CompRoundMatch(188934, 214175, false, "ঽ", "욉쒜≁隵ꄻ")});
    Test_ToJsonFromJson_Check({CompRoundMatch(91151, 743344, true, "", "冋"), CompRoundMatch(212735, 969638, true, "꺒Ｅ澮", "馣谱蘄딙授↳웡꫎")});
    Test_ToJsonFromJson_Check({CompRoundMatch(508457, 876283, false, "罧㣜樐㽼㿝啻苅㍧", "嗟徤澌כֿ昢"), CompRoundMatch(402836, 758944, true, "ꢶ嗲聅䄳ㆳ尉", "瑏求뺝숯䐪䈞䞞䜋歹☰"), CompRoundMatch(440156, 532804, false, "", "䔻镩෾萫郅栗�᭩앋")});
    Test_ToJsonFromJson_Check({CompRoundMatch(883939, 997572, false, "ᾬ 讈䗺⼎Ԍ臋뽦殠", "霋枒৹聸ᒢ"), CompRoundMatch(674608, 308745, false, "ᶥ톪�湀녂릊", "몒謒")});
    Test_ToJsonFromJson_Check({CompRoundMatch(150690, 80314, true, "墍믙㬢娵ⵌ⫿鰰⇹숄ꙍ", "伲킬簱ᡋ"), CompRoundMatch(799482, 639800, false, "咷㟞曘靳ԝ", "꨽ꩾ哻")});
    Test_ToJsonFromJson_Check({CompRoundMatch(506204, 233926, false, "뼣撁銹", "7䳟盒繕﷑㯌ﯵ"), CompRoundMatch(382427, 5176, false, "疁꼵", "答㺳萵ꊕᑑ球⍗ꦘ"), CompRoundMatch(24547, 424004, false, "飗✧캵܍俷큥ꄓ", "ꐒ魋䭅Ⅸ佰綐⨱㇟")});
    Test_ToJsonFromJson_Check({CompRoundMatch(740388, 935263, true, "됶豦偮縼矢遲੿ᥫ虝", "䨕")});
    Test_ToJsonFromJson_Check({CompRoundMatch(846903, 199973, true, "", ""), CompRoundMatch(283554, 524348, false, "�ࣔ潛픔綽傍ᙏ젙", "邽쪿淬ฏ垄塍嵓")});
    Test_ToJsonFromJson_Check({CompRoundMatch(297509, 237140, true, "꼭㗶澃軬ꇈ퉿ማ鰜", "鷬헡㕚别")});
    Test_ToJsonFromJson_Check({CompRoundMatch(116611, 406196, false, "詓鐋䎶", "䇲�䍛쇈๛"), CompRoundMatch(218910, 494262, true, "", "쳷계쳣㪏汄ガ")});
    Test_ToJsonFromJson_Check({CompRoundMatch(749041, 506709, false, "念ꓩꦼ�୹౺삯Ϩ", "뷌齟蜰"), CompRoundMatch(536202, 814596, true, "䦳翧⤅쎊騔덁闧⽺", "犆뗄㿻")});
    Test_ToJsonFromJson_Check({CompRoundMatch(472287, 626295, false, "㋬傁畧‚ᓒ潰", "ꃜ誉穞"), CompRoundMatch(419462, 98371, false, "⊐檢䩬", "闞ꩍ㨧㞆豽몗䎇㤴")});
    Test_ToJsonFromJson_Check({CompRoundMatch(990125, 709068, true, "ᭊ初�䯊ךּ", "至쐱ྟ찕崾흨")});
    Test_ToJsonFromJson_Check({CompRoundMatch(599454, 210682, true, "弹겸뽶婯맕赕磳", "똼顯얮듖"), CompRoundMatch(361553, 195560, false, "Ꝩ騫", "୅")});
    Test_ToJsonFromJson_Check({CompRoundMatch(194770, 417989, false, "Ŧ묓买嗒쫑鋋�", "똛엫ᦡ")});
    Test_ToJsonFromJson_Check({CompRoundMatch(692481, 250992, false, "㦮尭칉桸", "忸៥览䫞"), CompRoundMatch(793999, 467193, true, "騀♖쥁", "⇹瓒")});
    Test_ToJsonFromJson_Check({CompRoundMatch(977269, 89105, true, "Ქ쬣ナᱽ⁚", "쨳〛ⵐ"), CompRoundMatch(759835, 321923, false, "礞䛜꜠㋆윊䰟", "⽊"), CompRoundMatch(535483, 376339, false, "⸰", "᷑铁뮱ོ再푷")});
    Test_ToJsonFromJson_Check({CompRoundMatch(750458, 527472, true, "ⶇ�髀ⱪ탵Ⰽ妬눌", "頹㱭汦陚"), CompRoundMatch(627628, 354961, false, "", "ⲷ窕ꄧ迴锃�ꚴ램"), CompRoundMatch(859739, 493846, false, "䔂旓", ""), CompRoundMatch(921210, 100569, false, "璟", "烷")});
    Test_ToJsonFromJson_Check({CompRoundMatch(703842, 454857, true, "ꥯ", "ͨﯨ"), CompRoundMatch(455245, 692501, true, "垑", "埈㩜ﾴ连㻰쮛䣔")});
    Test_ToJsonFromJson_Check({CompRoundMatch(140354, 307753, true, "", ""), CompRoundMatch(788234, 347957, true, "꺼乧홻", "끵꜐"), CompRoundMatch(201817, 29713, true, "떜饚兓꽻뺿쭠贑麏揅", "鹰냣뷞ᠮ裡͆⩒"), CompRoundMatch(275134, 825879, true, "탱ⶽន", "怢팃쪶蒌惴礰")});
    Test_ToJsonFromJson_Check({CompRoundMatch(264554, 645752, true, "廔授뫑", "ꓦ挱嘏"), CompRoundMatch(812709, 861154, false, "琜䰶韧୊", ""), CompRoundMatch(581600, 728577, true, "鮧ײַं〮맒꺧", "咙䤔轃"), CompRoundMatch(437178, 32450, true, "ﱛಃ", "㰧໾趀㍟㤒居개⣪")});
    Test_ToJsonFromJson_Check({CompRoundMatch(395907, 642233, true, "폺뮾眲餻Ჩ栬飒홟", "뱏熫鏵밃碻ᶁ"), CompRoundMatch(700426, 957934, true, "䩧톿ޜＶ쓎", "텃閣崋쥙�蛳×ᜨ"), CompRoundMatch(956184, 601813, true, "腬킰", "⧚ᕱ㇦ᘄ躙"), CompRoundMatch(68906, 149252, true, "䉄嗝嵾", "흯筺궜쁶縂⦠쮔᪝")});
    Test_ToJsonFromJson_Check({CompRoundMatch(664378, 843584, false, "卌硚鮳裴ⲍꨞ﷨뺛", "혆한팬೻偉㝙"), CompRoundMatch(287970, 760094, true, "›䢬䟼", "⧔扦㿏Ⴇ⳵�"), CompRoundMatch(132636, 233611, true, "", "쮷몄껱詞磥벹靆"), CompRoundMatch(524090, 846347, true, "̭郑", "ﱬ⠔軙壑䘴୵㘱")});
    Test_ToJsonFromJson_Check({CompRoundMatch(398893, 188284, false, "㣥", "毆"), CompRoundMatch(260377, 834404, true, "뚇မ", "覞잰聡ﳆ"), CompRoundMatch(449216, 372019, true, "뫯꪿䒼큝耷넲㴝ส", "횏ᩅ果룗")});
    Test_ToJsonFromJson_Check({CompRoundMatch(926335, 29842, false, "ᶜ㮉嵥ꨜ鹬岣", ""), CompRoundMatch(629363, 457718, true, "㭹", "茾⷗냱뾯抃䱈೵"), CompRoundMatch(618854, 157929, true, "෵㥔̳", "燤⟐䶢⍈놋勊︈얖鍀㇕")});
    Test_ToJsonFromJson_Check({CompRoundMatch(606587, 616253, true, "樐툕翂斜⭝", "")});
    Test_ToJsonFromJson_Check({CompRoundMatch(802097, 798627, true, "쀇띧癤麉絯羚", ""), CompRoundMatch(315446, 37274, false, "瘏", "ฑ舩쿋��㥌쟍퐩"), CompRoundMatch(634986, 924168, false, "ྸ쁝ᴱ퐴", "태�별Ἰ絽ㄆ")});
    Test_ToJsonFromJson_Check({CompRoundMatch(373576, 63877, true, "ኂ〳螦䪾癌䠗夋", "곎推杪䊫纂"), CompRoundMatch(420887, 143587, true, "緞쐼ჲ", "᝹"), CompRoundMatch(691293, 921056, false, "潍ෂꉫ닏詖", "")});
    Test_ToJsonFromJson_Check({CompRoundMatch(256514, 393864, false, "谅좦", "ⵐ멥"), CompRoundMatch(938543, 767444, true, "", "ᘟ縏맄ḅ♁뚌"), CompRoundMatch(138003, 351956, true, "東巹걲�᾽", "⇼鈉谯絾搷窐梁")});
    Test_ToJsonFromJson_Check({CompRoundMatch(316638, 601213, false, "", "쎽怴闛ꈘᵮ�㟇䬦"), CompRoundMatch(158154, 370041, true, "雤笽ᓴ猦", "旝꛴늊")});
    Test_ToJsonFromJson_Check({CompRoundMatch(700205, 224660, false, "됗", "ᆟ䭼䐘췱䬊礫庳勫딧"), CompRoundMatch(529338, 395219, false, "٬ﻎ୑ﵶ溨콕ʔ镸", "넍颓ヂ�蜷輶男�ᆰ뜬")});
    Test_ToJsonFromJson_Check({CompRoundMatch(145929, 162138, false, "及帾衞틢", "₏蛉"), CompRoundMatch(40964, 273298, false, "㸁橏퉒⑧", "㌒줃鼏၌戙")});
  }
  
  bool unitTestResults_CompRoundMatches_ToFromJSONObject = runAsync(Tests_RegisterAll_CompRoundMatches_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_CompRoundMatches_Getters() {
    RegisterUnitTest('UnitTest_CompRoundMatches_Getters', UnitTest_CompRoundMatches_Getters);
  }
  
  bool Test_CheckProps_CompRoundMatches(const CompRoundMatch@[] &in matches) {
    CompRoundMatches@ tmp = CompRoundMatches(matches);
    assert(matches == tmp.matches, 'field matches');
    return true;
  }
  
  void UnitTest_CompRoundMatches_Getters() {
    Test_CheckProps_CompRoundMatches({});
    Test_CheckProps_CompRoundMatches({});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(378961, 333764, true, "빬�￿", "羋⽪㎜৏")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(464786, 672947, true, "礃ឝਛ轱蚴", "䊣�갏䭯岊⒆肭꘤쥹变"), CompRoundMatch(450822, 852539, true, "韋�", "�싺콠旱疍鰉橿")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(425498, 985047, true, "충멵", "ꋟ툴䜮ᚗ"), CompRoundMatch(48204, 763812, false, "ﵰ㞪", "⸔옯듡鷰那춴庂ᄼ"), CompRoundMatch(55244, 12605, true, "", "݋隘诹謁")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(49582, 433840, false, "㻡뼇ṽ杢⅄", "퐫帧�㶈�")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(6143, 168768, true, "姈⑻㤏�撵ߨ䯂䭱", "뇎≌膅๴޷Მᑨ쾳ﺷ")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(363342, 361241, true, "뗧돥轈ꭾﯗ歡洔", "䋪㋘늒"), CompRoundMatch(608473, 553221, true, "�׭駭겯ƴ皌", "쭜䢝"), CompRoundMatch(191510, 458500, true, "僓揱", "楚㔊夷郥")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(252345, 927020, false, "", "㆒刱❕騐헵�䉨⏋릈䨕"), CompRoundMatch(388432, 275775, false, "ꦏ썱줖睪授", "䥍ⅸ⯃쩆搊늜넚敦"), CompRoundMatch(779184, 804972, true, "滇�ꒉ㳀䈾뙱䕂륦", "᥾鼾㮦窘ᤲ쯳枦섍鐷痚"), CompRoundMatch(816997, 96323, true, "鉴㉙挶㊜䱁蝜炚年", "ꟗ唡")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(315253, 970606, false, "ᤳ⠤迤빩", "걍퐮뼗"), CompRoundMatch(246229, 161933, true, "�휋℃벷", "퍑ꗸ鶧ㆌ痒㇌⋛䨗")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(78530, 529329, true, "", "꿫琢췹"), CompRoundMatch(294837, 742358, false, "蚕蔟Ι龲ꇗ", ""), CompRoundMatch(850420, 513331, true, "藄ங", "ࠆ祊")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(346182, 518141, false, "閜䈀疶뫰", "⒄색Ї쑅")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(719941, 357930, false, "覑甃", "ꃈ䮣ᬬ컵嶐녰ॐ"), CompRoundMatch(431245, 878595, false, "", "�⊳"), CompRoundMatch(23260, 500301, true, "工", "ꕕ뉲"), CompRoundMatch(506361, 903157, false, "ᇊᙷ", "᠀㯱偙߿")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(40744, 132029, false, "튜좎㜶", "♤"), CompRoundMatch(849286, 520163, false, "쪟怢瞱㻗﬽팊�슍郫", "뿎ວ扚듍꩐")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(659923, 207875, false, "틖ꎀ�淲ﺆ跏㜤", "袿칉谜訷໰胖�䞈䚴"), CompRoundMatch(623470, 438389, true, "", "爣膡꛶ᅑ"), CompRoundMatch(6804, 91659, false, "⧞픭蚏ࣼ䪞㧯䦴귏", "㈾នﯸ滣轁竁怒ৈ"), CompRoundMatch(335576, 485202, true, "ⳳ", "")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(407047, 990522, false, "떩ℭﶊ响⮷", ""), CompRoundMatch(893367, 620249, true, "뚪䬹칭烈", "豺댜￰귥ጢ䨣뉐㕋퇪")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(794190, 137515, true, "揉筢㲸", "穂Hᡶ⛥杭貴溪৥롰꬜"), CompRoundMatch(753475, 684210, false, "", "늽趽ማ鐆ᒓ俲⼿"), CompRoundMatch(483553, 895579, true, "ꏛᐰꭢធ沈v鬕绽ᅧ", "犌郉鷪䈥⏀淓둬ਈ"), CompRoundMatch(402357, 902045, true, "䢝", "�쁰ꢚﲆ䉳诲뺔")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(42325, 763780, false, "긽榈俍埯퐥ঠ἗넾ᅳ", "婓菨뻟௎")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(375598, 463792, true, "掠욿Т᏾쟰囍틠䤙礎", "捣嶟廌"), CompRoundMatch(324005, 106890, true, "꬈फ़Ը㌲", "㠇趣馸揉᪥溊")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(527111, 100049, true, "⿳훿☸꤫睊�", "铟Ꙓ鐻ų⊺�"), CompRoundMatch(490417, 744440, false, "ὥ股폰拉﫜", "鉵朖")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(372956, 963317, false, "㐙㷀뵌慔駐윳陑镉⣀", "㾥괶됼헽⇐춻"), CompRoundMatch(772864, 760754, true, "膗堳뾒뮦", "ዖ�匶⨏"), CompRoundMatch(970757, 928835, true, "ದ鴆䟎他�", "ၲႪ")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(284426, 833786, true, "묒ꀓ䤢౤ᅺ", "蓸�舆"), CompRoundMatch(754646, 758908, true, "擆⷗륶땣", "灈￨℈⩝"), CompRoundMatch(958478, 282186, true, "罻�ꨯ", "卨펟漜႔婴矲깒켳⌁"), CompRoundMatch(685441, 842384, false, "絊앨", "剭ﺏ柙㕤쩢姽ἆ奨啈")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(238728, 687975, false, "Ჿ䟪롶꠸텤㦺", "塀"), CompRoundMatch(240192, 803963, true, "ᢿ", "諪ﰞပ꙳㜢㠱"), CompRoundMatch(999291, 706131, false, "똳䁶䉇ꖸ渡ꒋלּ⚶η㝯", "ﲏ")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(895348, 346080, false, "ĕ�뎿�", "൓⾽㖉"), CompRoundMatch(78422, 172744, true, "㩈㉡㘬䑰끰㕵", "粓䞎⨞ꢍ"), CompRoundMatch(186260, 74594, true, "㳲嘁�Ȩ㘅驹劣", "젽ઌ"), CompRoundMatch(933285, 889541, false, "돵傗䘠桌ậ≲턺ᐅ", "簵㟦兡䏰糗")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(229264, 390755, true, "擭硈勋⊲ǫ", "⼝줠딳落")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(25802, 150520, true, "▦⼛傟ꕅ⊥꜔䤩卑̐", "턴䅕ℶ࠿ㆸ"), CompRoundMatch(623797, 996815, true, "闗彎⬟⬆餽", "㡫ꮬ拓൑孳洂겿躂"), CompRoundMatch(692881, 34562, false, "", "")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(341477, 604882, false, "㈥텒툨", "棼檹"), CompRoundMatch(598321, 526053, true, "�騆�䂁ㅽ遦ﾅ", "ꇲ䱐敫뒦숾䚙剠")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(344381, 934864, true, "鬲㋔", "괘摄"), CompRoundMatch(527817, 419668, false, "←ꠣ", "�᩺"), CompRoundMatch(588224, 848364, false, "떵�鷜™櫃諄垇", "朓紸늹鷲尣"), CompRoundMatch(410924, 483718, false, "耥౩", "ℷ鼈㐏虒")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(292558, 647747, false, "䍷㥴岊隸蟅襎鿎⌯醞ᢂ", "뚔챔튡᷿㒶欳"), CompRoundMatch(609059, 480955, true, "嫊冠愃躊", "愫팹룼崬銌꼾ǋ鯮")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(225063, 478027, true, "벾䎺訮⧏跰䃟삢", "₎ㄊፂ�꿘腷頀")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(504356, 400694, false, "簜", "濾庰⮁됨㾕"), CompRoundMatch(45409, 295707, false, "罫䵮웤꼰괘᪄녪꒻⼧", "菽䡐膅⫳㸷앉뤸퉡")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(163447, 420662, true, "Ꞿ☵旌愦︱㹆", "޵㟂⤚힆頓礅"), CompRoundMatch(361763, 627436, false, "▏�쒿뱴墆�∗楦", "믅"), CompRoundMatch(599679, 7799, false, "콪䛆䎼︍歳컧", "わ힢啽ᕇ쬇쀞镸ﶩ掜"), CompRoundMatch(981069, 130045, true, "弆≷␁퀞�킦﵌", "᧫垃배⒔ퟭ焿◰熇髾")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(393001, 753390, true, "�슌욵ｪ餤１", "푻郿"), CompRoundMatch(315667, 608860, true, "종ᕉ豼೵㧑훷뢱⃹⑾⿚", "몳덞帪㶩ꦿ㺕"), CompRoundMatch(813043, 492174, false, "쐱ꥵ썳", "␱ᄴꨛ㧛�庁")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(343050, 19941, false, "ࣴ㦎䵽为", "룯흹댒䌤∇�넢ꉥꚰ"), CompRoundMatch(142000, 90852, true, "᤼蟋嵨㟠㕆蔎椑豫鰏", "䂮뾟ᕫꕷ韭쿡塸��"), CompRoundMatch(635918, 240742, true, "녱撅턒", "᭵")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(401137, 84853, false, "ᾠ唏ࠔ㥳x䝦绅", ""), CompRoundMatch(21914, 119397, true, "ʇ⽕鯪�․嵉", ""), CompRoundMatch(745607, 82105, true, "퀫樨櫬㶜⸉⁭䥉腪", "螯ꢁ"), CompRoundMatch(68936, 73444, false, "锓仡婧裂ﰹ", "⺫赪湥㠇쟰")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(788000, 733152, true, "쐐", "ᩎζ훴"), CompRoundMatch(457328, 699410, false, "醈�铙ឡ撨㱫㻃", "⶯铊氓貥喅")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(300080, 642390, true, "靍", "⭽뉔汅ᡀ⑹箜芘뱷")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(892101, 852114, false, "䄼㓝칰懌⮲﫩ᬀ으ꦒ", "胅챉ﾸ"), CompRoundMatch(622606, 372801, true, "⦠ᩏ歒Ж꾟", "쌀㷨䓜诽舁楍㔓")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(493238, 316128, false, "猉즊镴型", ""), CompRoundMatch(516599, 710959, false, "ﵥ⁥㦠ꣃ뛉椪ƫ镆", "끕蘆㉰춈")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(182479, 721285, true, "工", "㶴象랖鉏箩")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(604216, 484140, false, "黟ⶔ⭓Ϗ䦵ﯔ۱ᔍ䲥", "�︧ꖀ"), CompRoundMatch(452727, 182791, false, "퉜푖鑶㺽而", "浼쵑쌂�"), CompRoundMatch(865735, 36494, false, "鰳삋쌶ඨ╋ꦩ䁿ﯹឿ", "镊")});
    Test_CheckProps_CompRoundMatches({CompRoundMatch(979016, 869240, true, "", "ફ筌杷譛諉ମ鉤"), CompRoundMatch(60414, 563838, false, "�ᰯ蒢僟鴆큓禥�拽", "⋔ှ瀞山떕걒Њ薋"), CompRoundMatch(279761, 849949, false, "斱送", "┄"), CompRoundMatch(858572, 135642, true, "懵�偣鍝帽䟚", "榮￬뜙吖隊鷺")});
  }
  
  bool unitTestResults_CompRoundMatches_Getters = runAsync(Tests_RegisterAll_CompRoundMatches_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_CompRoundMatches_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_CompRoundMatches', UnitTest_OpEqSimple_CompRoundMatches);
  }
  
  CompRoundMatches@ lastChecked = null;
  
  bool OpEqSimple_Check(const CompRoundMatch@[] &in matches) {
    CompRoundMatches@ o1 = CompRoundMatches(matches);
    CompRoundMatches@ o2 = CompRoundMatches(matches);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_CompRoundMatches() {
    OpEqSimple_Check({});
    OpEqSimple_Check({CompRoundMatch(526999, 962771, false, "詘렰佹膴ᳲ풜ᬃ⿠왾", "﩯ᘞ쉓㻇娍쪁ᆬ鬹"), CompRoundMatch(26686, 665920, false, "਀ꩣ釪�麑遬徨탏핈霋", "壝玃勑뤋펍캒ᨶ"), CompRoundMatch(393455, 392207, true, "펫픶ᠺ먲梏뼂铠駆蕥", "珱姢抳滛ỉ")});
    OpEqSimple_Check({CompRoundMatch(631652, 156001, false, "䚱윲冥㶶밑", "⋳䝅攨鑽烆ঙ"), CompRoundMatch(645285, 112534, true, "⫀怉嗣ᮌ", "㚉뙶娜")});
    OpEqSimple_Check({CompRoundMatch(392143, 117677, true, "쮟허", "怸፦⺑띌렯岺"), CompRoundMatch(386748, 32507, true, "", "")});
    OpEqSimple_Check({CompRoundMatch(521707, 606939, true, "떚核륙呷良ꥰ﵀쨔", "ᜇꩥ᫦霍"), CompRoundMatch(709967, 554651, false, "", "뮱"), CompRoundMatch(690858, 504118, true, "", "ʱ䄔")});
    OpEqSimple_Check({CompRoundMatch(97839, 885000, false, "", "쬟칁껁"), CompRoundMatch(840953, 20188, false, "천⥠渠ᐢ㲛㧣⿾", "ꫤⅥȩ매")});
    OpEqSimple_Check({CompRoundMatch(4203, 147695, false, "崒⁗∾웇Ⓩᱭ", "饁䱯淵す"), CompRoundMatch(468333, 37294, false, "᪮壐辡�", "岁ꮸ㏧")});
    OpEqSimple_Check({CompRoundMatch(726400, 207068, true, "룠డ㫠瀚䊠齦㑭", "奟㜫䞞祡͓")});
    OpEqSimple_Check({CompRoundMatch(275713, 164360, true, "汆講㓤통", "뛰�둕"), CompRoundMatch(263, 6580, false, "驣", "□ꮟ蟉꾋")});
    OpEqSimple_Check({CompRoundMatch(680607, 279276, true, "㽘웆覕䃄�ЊЫᯱ", "┕緰튅"), CompRoundMatch(74999, 428886, true, "퓂䉰ꋗ嗳ರꈾ", "ώ")});
    OpEqSimple_Check({CompRoundMatch(457029, 770199, true, "蛖ꬹ", "㳹")});
    OpEqSimple_Check({CompRoundMatch(132045, 929297, false, "뱉᧡⬆ꁓ縬", "ၧᮑώᘢ㵅绰혏")});
    OpEqSimple_Check({CompRoundMatch(601038, 673623, false, "Ⱚ௝ミօ⥶批钅ೢ", "꼥ᗁቲ堽ᬵ꽧")});
    OpEqSimple_Check({CompRoundMatch(753539, 798270, false, "娣ዯ﷤賚�챀曹䚨", "⟹驵盲"), CompRoundMatch(131924, 157952, true, "쐔扮깡", "଒嬋笩讏")});
    OpEqSimple_Check({CompRoundMatch(296593, 97859, true, "ˬ퍪쉹٥駹휋䇨", "䍇ﷰ"), CompRoundMatch(788261, 338120, true, "䈒䨾", ""), CompRoundMatch(578377, 759825, false, "꜓ᵃ퇎赊ﴋ鎘⠨ᄇ", "薾ꔲ"), CompRoundMatch(350295, 696778, false, "→⣦룎ⶳ洂", "螥㗓")});
    OpEqSimple_Check({CompRoundMatch(800931, 634867, true, "図罛⢲Ȃ㹪쉰龊〢", "扆"), CompRoundMatch(921986, 284973, false, "啴㟡䂸☸便", "驡囈椐༁틋�鯺䅷⮙ꥁ"), CompRoundMatch(766948, 69729, true, "톤", "냖럢쩪媭"), CompRoundMatch(917838, 203988, true, "⻜銵뒮ꬴ", "뮓荔ꡂ၌鳿윀")});
    OpEqSimple_Check({CompRoundMatch(265296, 981223, true, "奋豮ⴈ֑", "일ٸ顚辑죹⪱濱놿"), CompRoundMatch(968043, 958667, false, "ﰃ҅飛曀푧鯄꟒䠂桁", "췲룮ྮ韑ଵ峎㐇苘"), CompRoundMatch(37271, 606490, false, "䋰ꭔ䧂脑囲ﻯ機稻", "ຽ")});
    OpEqSimple_Check({CompRoundMatch(363319, 594375, false, "䗦悛燓뢅䃐ೃḡ些窩", "譇橾⻊䮰"), CompRoundMatch(486696, 405550, true, "剈䴲膞坫窀훱", "尪읒")});
    OpEqSimple_Check({CompRoundMatch(950426, 250555, true, "", ""), CompRoundMatch(410482, 35384, false, "", "縰㷇"), CompRoundMatch(926220, 696064, false, "陉", "嫲�쓋쾙樂⏭⾗")});
    OpEqSimple_Check({CompRoundMatch(946673, 299172, false, "ꢖ嶰읦逕礸蟽袸", "憚邷")});
    OpEqSimple_Check({CompRoundMatch(111470, 573616, true, "튵", "꠹款晏픪຿゠")});
    OpEqSimple_Check({CompRoundMatch(867098, 87920, true, "踯龂", ""), CompRoundMatch(640719, 496681, false, "磶▧汶틤榸倢슭", "ꏊ軃頴罩"), CompRoundMatch(603924, 608672, true, "㻢뜵㺸䞭촁챑ᩓ龜", "쥨뽙瀸ㅾ")});
    OpEqSimple_Check({CompRoundMatch(333940, 20634, true, "ᇳ때캨ᚠ듞莹桏져", "㧳西뙶븳㊯갘"), CompRoundMatch(571410, 302823, true, "", "갎"), CompRoundMatch(508624, 38712, false, "⌜᳜⌻", "㩧⏕Ҭ辙巴⶯")});
    OpEqSimple_Check({CompRoundMatch(357193, 869994, false, "﷤枲ꩀ옲죥魍镠", "揆쟶"), CompRoundMatch(544275, 930556, true, "얖闻鷝䆀䫸", "ƫ㪙뇞轓"), CompRoundMatch(695104, 240354, false, "⛧옩炰", ""), CompRoundMatch(652683, 462606, false, "斍⏀쌛Ⓛ薚懙룙㎐", "")});
    OpEqSimple_Check({CompRoundMatch(210923, 189775, true, "﨡鐹", "괮툘ꋧ힂汀䤦岐"), CompRoundMatch(186066, 605805, true, "뱟땈ᛁ�捐챵ꏹ꼡姐䊂", "摓릺칻啗븥ꖙ∴簾")});
    OpEqSimple_Check({CompRoundMatch(796634, 108210, false, "๋캌涒", "ⳡ늵꜀㏔绨ᵬﴗ"), CompRoundMatch(346449, 602322, true, "౵泐詝潑", "뎎⒲鸅煾❴⎋︡﹭Ѩ타"), CompRoundMatch(877000, 119122, true, "⹄", "房댬㾑ໞ탬鏩Ⓜ恇闥"), CompRoundMatch(114857, 353682, true, "ᾓ瞀鵰삫ᾄ龲尬度ⶰ", "牌")});
    OpEqSimple_Check({CompRoundMatch(433206, 911862, true, "馌⬝ᒄᤊ䳥㳏", "꺼㲇߇⾕嚪랄⬄䴎뚶"), CompRoundMatch(914953, 242423, true, "鼹冥풭樮쟓銀氢봃", "ⵜ㲰핋嶣䇙寇"), CompRoundMatch(90062, 243828, false, "飼鯵駥鷠뿹ꚍ", "ڻ﹉䱋饔吏뽑Ϣ"), CompRoundMatch(39926, 769047, true, "Ư⥣䞘询獽", "�")});
    OpEqSimple_Check({CompRoundMatch(601748, 19644, true, "油蒨騵岌ഠ", "ㆎ棌�곔櫽ꐫ␓쌍"), CompRoundMatch(92494, 619517, false, "᱀ꪙ韓㉲�", "럠靫ѫﶝ鍏"), CompRoundMatch(218550, 692957, true, "ꗭ뙌鉨恁䄈", "辞妝㩁⸳≚輒"), CompRoundMatch(84112, 751776, true, "㚡�闧㼅﬎梡깺", "演읎떩煤⼉岁岮")});
    OpEqSimple_Check({CompRoundMatch(33190, 847424, true, "ꫀ缎", "ⵡ㽀ᴧ")});
    OpEqSimple_Check({CompRoundMatch(324633, 722610, true, "㸄ໟ", "⠋젿糖앻嶚旺沣")});
    OpEqSimple_Check({CompRoundMatch(117332, 199748, false, "펂ឝ뙽랂", "ꃥ촄㍕"), CompRoundMatch(225358, 115423, true, "맴嗰荎", "쐦㊓킑�"), CompRoundMatch(918845, 694666, true, "췾热⹉㊘၁᫄", "㰚ㇿ떶⨨ᘟ戣⦻䭋")});
    OpEqSimple_Check({CompRoundMatch(461071, 968142, true, "堹朲", "絵舸ͽ畺"), CompRoundMatch(760347, 43964, false, "긺簼", "㗲玬욢죚뫦号"), CompRoundMatch(854275, 840058, true, "", "ȯ딝륷䲛ꌲ쫣"), CompRoundMatch(965210, 582156, true, "⻋忡", "ഷঢ㻀⼚况脪")});
    OpEqSimple_Check({CompRoundMatch(342734, 903288, true, "졻ꏳ沗怛쯂Ӑ", "鲅昿ⅵ"), CompRoundMatch(623056, 157370, false, "뙓", "衈ܔ肽粪噷鼚"), CompRoundMatch(948256, 136633, true, "", "㋨츌䞸鄈鲤戙"), CompRoundMatch(707067, 93566, false, "溷䱨换ᵘ蒭ᦇ䳖뻏䞒㴭", "阯য뗮訆")});
    OpEqSimple_Check({CompRoundMatch(400381, 396623, false, "㼳쬺義", "ﶼ즹␥"), CompRoundMatch(718284, 847734, false, "浧", "膥"), CompRoundMatch(665958, 781217, true, "஑뚀�", "⠟፤✷㈳﷥똭퓄﮵빑")});
    OpEqSimple_Check({CompRoundMatch(163966, 255579, false, "餗뼂�숣怣楊멕", "ฅⴑ鋆㫊훝湕ᱝ")});
    OpEqSimple_Check({CompRoundMatch(674568, 941312, false, "嬫嗶胕库⇬뺏", "攃ꃶ"), CompRoundMatch(979674, 415284, false, "귵獦㣋幺ਗ਼ᓊ鹿ݚ", "듷륑깾")});
    OpEqSimple_Check({CompRoundMatch(196061, 556133, false, "⦐煺霍ํ", "⧹")});
    OpEqSimple_Check({CompRoundMatch(507012, 415114, false, "Һᶌ", "鎌㲊覌筎ⶩ")});
    OpEqSimple_Check({CompRoundMatch(504590, 387499, false, "嵫", "")});
    OpEqSimple_Check({CompRoundMatch(981931, 158297, true, "㌅닯薾뼁곒윶￪욱", "圚"), CompRoundMatch(318429, 919121, false, "疡谉闷䖕✚葝壜벦", "鿸큿㱘嚶溇Ჶᔲ"), CompRoundMatch(420926, 941915, true, "鉤⡄꺁佪솫劊좂響", "✷㎾腒鸒"), CompRoundMatch(138796, 152750, true, "轭", "飸⣌䂜쾣㐚")});
    OpEqSimple_Check({CompRoundMatch(538512, 664123, false, "뎲풴ㄛ", "솹㵊ᬂ婤ૐ잂Ꞹꄧ岶"), CompRoundMatch(826335, 635044, true, "", "ﻖ䋘痡"), CompRoundMatch(357258, 91002, false, "㱈ᦦ�辎晇巒쮭龥俩", ""), CompRoundMatch(137701, 983615, false, "鮙쒽䐙", "齑간")});
    OpEqSimple_Check({CompRoundMatch(679607, 652939, false, "瑸ꤰזּ窞璫濝詼憐팰䎊", "⍽䪅Ș焸镄辠"), CompRoundMatch(958803, 243436, true, "⮖铢뢇懅⧈碴熭", "翝"), CompRoundMatch(51680, 830229, true, "猚誟婢", "")});
  }
  
  bool unitTestResults_CompRoundMatches_OpEq = runAsync(Tests_RegisterAll_CompRoundMatches_OpEq);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_CompRoundMatches_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_CompRoundMatches', UnitTest_ToFromBuffer_CompRoundMatches);
  }
  
  bool Test_ToFromBuffer_Check(const CompRoundMatch@[] &in matches) {
    CompRoundMatches@ tmp = CompRoundMatches(matches);
    MemoryBuffer@ buf = MemoryBuffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _CompRoundMatches::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_CompRoundMatches() {
    Test_ToFromBuffer_Check({});
    Test_ToFromBuffer_Check({CompRoundMatch(123656, 829354, false, "쥲拝", "쪚ꗼ"), CompRoundMatch(429952, 439826, true, "ﴻ", "ⶭ灁ᏹ㑚ᄟ텻"), CompRoundMatch(490366, 613160, true, "㷕y䖀湶㐇쩎䷐묲", "㍜殮⧽਄劦퐄")});
    Test_ToFromBuffer_Check({CompRoundMatch(967640, 929627, false, "ꌉ⦿䫏찣䄺㔼﬌㒩⣃", "挪쒶庋탄갅⿂䤗ᅾ읡")});
    Test_ToFromBuffer_Check({CompRoundMatch(405989, 200599, true, "粜唬䃩벋⛩涻뼢ꏅ㜔", "᫳"), CompRoundMatch(468056, 543129, false, "㺒郊ᄾ䭖傄", "琲䍡핽�᫏ᇵ")});
    Test_ToFromBuffer_Check({CompRoundMatch(352464, 913879, false, "蒔銥", "峔䞠⧖奡玜겧徕䧎")});
    Test_ToFromBuffer_Check({CompRoundMatch(928503, 908488, true, "࡟记Ⴒ늴㐆", "礱䲏Ȥﭢ")});
    Test_ToFromBuffer_Check({CompRoundMatch(305848, 489756, true, "", "ꎁ杕묙뷘뽵ꀜ"), CompRoundMatch(843770, 592914, false, "芺", "蛬�卻恀墿䌣�癓�鄒")});
    Test_ToFromBuffer_Check({CompRoundMatch(691552, 740264, true, "콳栌˺�ဵࠬ", "쑶敭큇ᤅ⩭"), CompRoundMatch(921233, 36589, false, "抅뻱", "瓽捭ﱋ"), CompRoundMatch(610901, 520261, false, "鴳툞Ⅳ", "峽ᱪⓣ䝚ࠌ臼")});
    Test_ToFromBuffer_Check({CompRoundMatch(982156, 566692, false, "쉫탑尴ᡰ傹", ""), CompRoundMatch(821325, 79569, false, "踯", "岺�槧ൃ")});
    Test_ToFromBuffer_Check({CompRoundMatch(325523, 811015, true, "影圓倖ŝ", ""), CompRoundMatch(674685, 977204, true, "Ꚃ╥柱", "鹭ឞ뫕圩ࢬ"), CompRoundMatch(451658, 494885, false, "ꍲ觇", "㸪")});
    Test_ToFromBuffer_Check({CompRoundMatch(712180, 745376, true, "ଧ銣㢬鍑忯", "䫂⊘放髋鬥"), CompRoundMatch(256404, 724963, false, "�짺ၑ珤꼟絕", "홐")});
    Test_ToFromBuffer_Check({CompRoundMatch(450463, 68765, false, "㙒౫썍", "ւꈒ戚춭"), CompRoundMatch(632768, 406274, false, "渽", "싌无죋轧瑦཰")});
    Test_ToFromBuffer_Check({CompRoundMatch(358699, 368175, false, "端滄꧜ꕭ凗⳴", "贷誸暭"), CompRoundMatch(808225, 871562, false, "⨏취ಗᨠﳄ�⃄玔묍", "禳蓮鿞겮鴆痉泲훇嶈")});
    Test_ToFromBuffer_Check({CompRoundMatch(949124, 714903, true, "໩鲔✀ॵ젧", "䨁㧐멬��ᩁ펩碅"), CompRoundMatch(781705, 709551, false, "欦뀃궳顂헧", "�ፑ")});
    Test_ToFromBuffer_Check({CompRoundMatch(938354, 468334, false, "", "紮㾶傻竨罽"), CompRoundMatch(112592, 392369, true, "犖", "犉"), CompRoundMatch(858389, 508488, false, "�ྰ", "佶")});
    Test_ToFromBuffer_Check({CompRoundMatch(589319, 239575, true, "蘝എ쾻骯", "ꔈ粄繧"), CompRoundMatch(276691, 70629, true, "晭�ꉼ", "왱˂੭ᓟ逤邐"), CompRoundMatch(457902, 598805, false, "쮎㸣", "⺵䨝⤖❅"), CompRoundMatch(138879, 263867, false, "ᄯ봳", "Ⅼ륗㔸齬�젳쳝")});
    Test_ToFromBuffer_Check({CompRoundMatch(991105, 611797, false, "", "난㼄Ɱ"), CompRoundMatch(385826, 698702, false, "挏䆭䐜�䖩仍", "쨣雜蒘痃隔䨓䐭ǘ钶"), CompRoundMatch(460247, 149648, true, "韊槾᜴䭤ნḙ៷졷", "")});
    Test_ToFromBuffer_Check({CompRoundMatch(987116, 647385, false, "晇⾛逮৖饳˛㫕Ï篒ꝱ", "러㡭붩症뉾敬钎")});
    Test_ToFromBuffer_Check({CompRoundMatch(821229, 128428, false, "䝜ˎ", "⺢喳爕ᡟ")});
    Test_ToFromBuffer_Check({CompRoundMatch(68188, 118302, true, "䷺ᢂᎰ㧟�쉐⽚̿", "ꚩ"), CompRoundMatch(472836, 429837, true, "睯", "ᛆƶ뽨懾᡺")});
    Test_ToFromBuffer_Check({CompRoundMatch(577567, 816054, true, "", "翖롩浰"), CompRoundMatch(919574, 58327, false, "魨殉빰椻", ""), CompRoundMatch(640719, 388909, false, "Ừ⠹ꆥس尭뵂", "츰쉝⚛뭯"), CompRoundMatch(253464, 733018, true, "ꝺ茜紜㗆쀐", "╸蟱㬿")});
    Test_ToFromBuffer_Check({CompRoundMatch(940477, 454262, false, "빞嶺蠷ⰴ홼䚟", "䢍")});
    Test_ToFromBuffer_Check({CompRoundMatch(801423, 666157, true, "腡쥂额", "光雡푘ꍳ蟭䤖쒻狄局"), CompRoundMatch(547833, 842066, true, "缼値᯺", "᫅鯚㾴䈪肉蒗課꽐༪벃"), CompRoundMatch(66949, 611448, true, "蓇녙遟顸퍘尤ꤨ", "ꪒ�캑쵅魎߳")});
    Test_ToFromBuffer_Check({CompRoundMatch(591704, 157680, false, "㹽ࠒ芜൧", "伉쎍ꂻ뜆榝ࠂ㡽"), CompRoundMatch(970339, 334089, false, "ᜲꗃ筐뇺ਪ", "䛬᳝ٺᗮ�翊焤ᱺ")});
    Test_ToFromBuffer_Check({CompRoundMatch(676880, 664448, false, "᪑뾮㡨놚ₙ첐", ""), CompRoundMatch(301442, 902628, false, "풭䠷桉�麇㶼믔", "䫥븊㢘焠쏩熽筝촣")});
    Test_ToFromBuffer_Check({CompRoundMatch(393506, 179307, false, "≔ぬ梐", ""), CompRoundMatch(71901, 702561, true, "�䝡", "詙곈肧ధ"), CompRoundMatch(102543, 909543, false, "誣లച㽺阣죸", "쏀詽撑ٶ왞")});
    Test_ToFromBuffer_Check({CompRoundMatch(506153, 726921, true, "丟㘓", "扴"), CompRoundMatch(366280, 271700, true, "ᢃ腒ꊠ兟ľ制㚸", "ଷ")});
    Test_ToFromBuffer_Check({CompRoundMatch(614915, 820050, true, "園喒躬ᚑ鈉઱", "咱↍"), CompRoundMatch(283639, 651695, false, "㓙弒", "庿簐蠑萗윗㹆"), CompRoundMatch(152615, 965723, false, "ꄋ壆됕㤖", "똋"), CompRoundMatch(55874, 372630, true, "裹", "甝弑癹闝舗⥧寡薲뷗")});
    Test_ToFromBuffer_Check({CompRoundMatch(118721, 400537, false, "䊫֨", "멋ᆶ☉筛춨쥹��"), CompRoundMatch(66657, 102146, false, "愍ᳬԂ㛲蚾㺴ꅞｗ", "ʚ窰욹釞檘応甪韇"), CompRoundMatch(60936, 983556, true, "鯄ⶢ򲢬ꌷ๊붷", "�䦽"), CompRoundMatch(806703, 997307, false, "漥⾝婒れ", "핶ᵇⒺ㤄嫅㠾")});
    Test_ToFromBuffer_Check({CompRoundMatch(551759, 991738, true, "⋿櫌", "⬧㇫㭩絹葅㥲쿱댧"), CompRoundMatch(353399, 477899, false, "", "᥹냝놢뷈㜜隢늆"), CompRoundMatch(724290, 181266, false, "鮆ⰱ柨բ䟆ᛯ�칚騱", "墩"), CompRoundMatch(817214, 311068, true, "࢙⦩䚏쳂藏芗沆ﻈ", "熯")});
    Test_ToFromBuffer_Check({CompRoundMatch(335695, 970290, false, "곙梔�㴺빱㔖傺褅", "듾纖靉뺸料")});
    Test_ToFromBuffer_Check({CompRoundMatch(102504, 967581, true, "蚔", "䃦鵸枢辱"), CompRoundMatch(801900, 634356, false, "", "၂ℋ轴ᓤ⁓蟅"), CompRoundMatch(858951, 675313, true, "舖笺", "漵溋⽼仈뷀㰤ꏜ�ꄎ"), CompRoundMatch(503383, 502940, false, "ᲃ郪궪", "쿜﫷ݾ복枿⩃᏾尡㢗")});
    Test_ToFromBuffer_Check({CompRoundMatch(634415, 622358, false, "遹뵪딺嬂唆譮", "픓٘靭"), CompRoundMatch(686876, 143357, true, "", "襄口ǹ勆袣樱"), CompRoundMatch(452123, 856514, false, "", "䡑㵶㮛䔂塻ネ"), CompRoundMatch(449137, 943249, true, "᛽ꪍ蠻", "㾘ᓔ㦔얌敶㮜ﱺ㙪搑")});
    Test_ToFromBuffer_Check({CompRoundMatch(668931, 887017, true, "돉㌖楇轆戗涠″殺", "巬㻠㝝堳떨눦⁊囩쿈")});
    Test_ToFromBuffer_Check({CompRoundMatch(687930, 952132, true, "ግ", "㟝"), CompRoundMatch(123774, 455998, false, "륌췧⨏Ӿᬲ嗰", "䦝ꔐ")});
    Test_ToFromBuffer_Check({CompRoundMatch(806104, 121029, false, "됍볓�烙ᜧ怖⧀ִಚ", "걀钣좌냰八㷕礛微"), CompRoundMatch(139714, 741864, true, "�혬⦑壇ሚ", "ᰴᕆ顇棗Ɤ"), CompRoundMatch(124610, 351439, true, "", "쬪Ꞹڟ튆랣㥳")});
    Test_ToFromBuffer_Check({CompRoundMatch(363898, 57987, false, "컡ᮕ", "➔⇐䦭駵夎"), CompRoundMatch(430315, 563019, false, "⟶腈ἐঢ়ꧥ蜒", "爢"), CompRoundMatch(609005, 691212, true, "৙㝅ᙲ", "ᘴ렵")});
    Test_ToFromBuffer_Check({CompRoundMatch(765969, 527180, true, "꣧뵐", "즦"), CompRoundMatch(146837, 332417, false, "芭瘇薀̍࠘᳁߼", "羑཯獠잧"), CompRoundMatch(961055, 397734, true, "ひኛ὚", "ឞ瓧뤧薁")});
    Test_ToFromBuffer_Check({CompRoundMatch(160193, 526196, false, "礘䨳덗轼⓭蝎詌딄⟪", "탏敞"), CompRoundMatch(57466, 467842, false, "գᒍ廡秚樔蕞暞䗫Ɔ", "ᠨ煚㙊欀댴兢掮"), CompRoundMatch(402918, 977672, false, "恦", "뮅뻍贺ꡥ颕訑�"), CompRoundMatch(209169, 577959, true, "", "⨿茎烫⼟粠")});
    Test_ToFromBuffer_Check({CompRoundMatch(121882, 561195, true, "㕌⮖ᵷ瀪", "�")});
    Test_ToFromBuffer_Check({CompRoundMatch(947949, 599521, true, "ဪ桚䥸ꊘႼ갭历绝", "罉唅椸鉰憻窶鑪ฯ"), CompRoundMatch(214148, 483951, false, "⎘Ⴡ�듔ꢃ擘讜", ""), CompRoundMatch(30407, 50809, true, "", "〖")});
    Test_ToFromBuffer_Check({CompRoundMatch(677770, 562241, true, "羑臸氚Ồ锇埑�", "踅ḅ㉵ǽ癈盬ࡕ鬅")});
  }
  
  bool unitTestResults_CompRoundMatches_ToFromBuffer = runAsync(Tests_RegisterAll_CompRoundMatches_ToFromBuffer);
}
#endif