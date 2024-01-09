#if UNIT_TEST
namespace Test_TmxMapInfo {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_TmxMapInfo_CommonTesting() {
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
  
  bool unitTestResults_TmxMapInfo_CommonTesting = runAsync(Tests_RegisterAll_TmxMapInfo_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_TmxMapInfo_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_TmxMapInfo', UnitTest_ToJsonFromJson_TmxMapInfo);
  }
  
  bool Test_ToJsonFromJson_Check(uint TrackID, const string &in Name, MaybeOfString@ Tags, const int[] &in TagList) {
    TmxMapInfo@ tmp = TmxMapInfo(TrackID, Name, Tags, TagList);
    assert(tmp == TmxMapInfo(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_TmxMapInfo() {
    Test_ToJsonFromJson_Check(129450, "㳋뽄旤ᮔ﵇獣ແ", MaybeOfString("㹦ꑳﭤℊ"), {883496, -715156, 86104});
    Test_ToJsonFromJson_Check(673390, "ᲁ澯", MaybeOfString("軻ᖧ⭾뒍뿣확"), {996210, 403118, -936455, 294609});
    Test_ToJsonFromJson_Check(292599, "ꦻ땬黿救솳", MaybeOfString("䌭"), {-53502, 990778});
    Test_ToJsonFromJson_Check(138748, "ｓ", MaybeOfString("놜冺햵ᤫ簔�좕"), {-557053, -63346, 833828});
    Test_ToJsonFromJson_Check(414406, "z懇�客㒞", MaybeOfString(""), {-502240});
    Test_ToJsonFromJson_Check(857256, "ࣅ䞚㌴⦱扬껰朣", MaybeOfString(), {});
    Test_ToJsonFromJson_Check(962581, "旰蓡", MaybeOfString("杒୒D䀗ꬨ憽畏"), {-272947, -603417, -286551, -460635});
    Test_ToJsonFromJson_Check(8357, "䦋쁗缧ⱊﱻ狀ꆟ", MaybeOfString("덙꾜鏑郺ἁ맱"), {-567371});
    Test_ToJsonFromJson_Check(291599, "ͽ텫", MaybeOfString("๏ᇠ炦♱"), {-532373, -87796, -238218});
    Test_ToJsonFromJson_Check(562436, "엣ᩁ㟅ഽᒽ罆鹌ﲒ咧놪", MaybeOfString("掗ￊꥈ嗍䘢封撛"), {-991637, -7987});
    Test_ToJsonFromJson_Check(275663, "", MaybeOfString(), {-984928});
    Test_ToJsonFromJson_Check(203400, "褢鶳ᄶ窐踎윉懜", MaybeOfString(""), {-792129});
    Test_ToJsonFromJson_Check(419346, "㳇୭", MaybeOfString("怎饍`櫝"), {-93586, -578139, 529015, 351797});
    Test_ToJsonFromJson_Check(147453, "鍡轔", MaybeOfString("फᝌᣇ꒨㟋릔ሮ"), {-934952, -603447, 123025, -480073});
    Test_ToJsonFromJson_Check(945480, "Ὄ㜣", MaybeOfString("菙"), {361688});
    Test_ToJsonFromJson_Check(163171, "៯ꭍڑ쀈ⵗ", MaybeOfString("ཞꑓ뷾�뤴焦"), {-631210, 625858});
    Test_ToJsonFromJson_Check(828508, "䭭澀⽹ᱶ爅螝⬣홭ᢻ", MaybeOfString("娎뉺ꢗ軤衜㝪삾�೻壎"), {-620439});
    Test_ToJsonFromJson_Check(758410, "", MaybeOfString(), {312335, -147681});
    Test_ToJsonFromJson_Check(554346, "엽뷗뢑", MaybeOfString("ꆢ귐쩱"), {});
    Test_ToJsonFromJson_Check(881761, "㢝蔹", MaybeOfString("暮쬂뾟ૢ"), {-575131, -580521});
    Test_ToJsonFromJson_Check(235494, "욉쒜≁隵", MaybeOfString("號㪳ᒶ퐞也툃뻬笜"), {-148909, 703353, 954857, 35974});
    Test_ToJsonFromJson_Check(123726, "豣閑㏲ᔲ逥좣㉒㇜ꗸ", MaybeOfString("॰ഀ"), {272504, 760015});
    Test_ToJsonFromJson_Check(610207, "⧼馣谱蘄딙授", MaybeOfString(), {44570, 743344, -81191});
    Test_ToJsonFromJson_Check(56280, "䴨", MaybeOfString("앋�Ʞ恂慳칮"), {-149948});
    Test_ToJsonFromJson_Check(285613, "漻拹ⓨ", MaybeOfString("格湴ﳄᚬᖹ響醖"), {231882, 844727, -967250, 827710});
    Test_ToJsonFromJson_Check(167715, "瑏求뺝숯", MaybeOfString(), {876283, 508457});
    Test_ToJsonFromJson_Check(49476, "ŀཎ؏쀯㖩ꅽ딚圤쯼벮", MaybeOfString("릊☳憱딅휘쉕嗟徤"), {-200272, 41873, -218212});
    Test_ToJsonFromJson_Check(699484, "臋뽦殠齒䡬뾋뿰秮鿉", MaybeOfString("땓꟭뗏聲"), {992957, -359036, 621120, 12880});
    Test_ToJsonFromJson_Check(442711, "曘靳ԝ춤ᴼ", MaybeOfString("ꐊἸ᜸萿ᑈ㺋Ɏ"), {669151, 80314});
    Test_ToJsonFromJson_Check(859761, "姻韷", MaybeOfString("㬢娵ⵌ"), {-640669, 421056});
    Test_ToJsonFromJson_Check(78744, "靮垆规☉᡽햅𤋮柅", MaybeOfString("�"), {-351430, -419011, -428171, -928549});
    Test_ToJsonFromJson_Check(108577, "", MaybeOfString("䭅Ⅸ佰綐⨱㇟ꪒ飗"), {-279449, 235111, -928157, 507600});
    Test_ToJsonFromJson_Check(448613, "⍗ꦘ疁", MaybeOfString("ᙱ֤"), {-702173, 143856});
    Test_ToJsonFromJson_Check(506204, "ʢ", MaybeOfString("뼣撁銹"), {-983141, 681867, -283834});
    Test_ToJsonFromJson_Check(170734, "맆晝劬", MaybeOfString("됶豦偮縼矢遲੿ᥫ虝"), {-13186, 283554, 608847, 679849});
    Test_ToJsonFromJson_Check(524348, "紣ㄷꀞ秇⋽吢ↈ種祶⯔", MaybeOfString("ฏ垄"), {-932350, -786248, -457451, 602002});
    Test_ToJsonFromJson_Check(114641, "", MaybeOfString("ᕃ藃 ⏎늻"), {449872, -805007, 450978, 14342});
    Test_ToJsonFromJson_Check(918720, "꼭", MaybeOfString("銼௒"), {825672});
    Test_ToJsonFromJson_Check(354693, "䴤䦳", MaybeOfString("䲈㌒皬毸圌蒵⢢"), {-808708, 62621, 406196, -261301});
    Test_ToJsonFromJson_Check(355681, "妙薐㨵䓸뷐", MaybeOfString(""), {-648417, 814596, -299456});
    Test_ToJsonFromJson_Check(2535, "颙잒", MaybeOfString("犆뗄㿻ꨕ䦳翧⤅"), {565965, 740039, 438512});
    Test_ToJsonFromJson_Check(298277, "ộ念ꓩꦼ�୹౺", MaybeOfString(""), {-907873, -628251, -624427, 661932});
  }
  
  bool unitTestResults_TmxMapInfo_ToFromJSONObject = runAsync(Tests_RegisterAll_TmxMapInfo_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_TmxMapInfo_Getters() {
    RegisterUnitTest('UnitTest_TmxMapInfo_Getters', UnitTest_TmxMapInfo_Getters);
  }
  
  bool Test_CheckProps_TmxMapInfo(uint TrackID, const string &in Name, MaybeOfString@ Tags, const int[] &in TagList) {
    TmxMapInfo@ tmp = TmxMapInfo(TrackID, Name, Tags, TagList);
    assert(TrackID == tmp.TrackID, 'field TrackID with value `' + TrackID + '`');
    assert(Name == tmp.Name, 'field Name with value `' + Name + '`');
    assert(Tags == tmp.Tags, 'field Tags');
    assert(TagList == tmp.TagList, 'field TagList');
    return true;
  }
  
  void UnitTest_TmxMapInfo_Getters() {
    Test_CheckProps_TmxMapInfo(394184, "馩", MaybeOfString("ӆ쟭⦀椖"), {-688098, -638276});
    Test_CheckProps_TmxMapInfo(378662, "╝㸌鐁", MaybeOfString("꟪뢖棱꡺鼀ൃ橗"), {-349523, -853677, 402441, -622649});
    Test_CheckProps_TmxMapInfo(464786, "鳔ꂆऒ涮�뗗", MaybeOfString("岊⒆肭꘤쥹变㒠礃"), {36088, 212517, 440746, -191800});
    Test_CheckProps_TmxMapInfo(55244, "⨸۫芁≲彲⏈먳�", MaybeOfString("塡໒鿐"), {321608});
    Test_CheckProps_TmxMapInfo(715346, "㷗᤾虝", MaybeOfString(), {-2471});
    Test_CheckProps_TmxMapInfo(149817, "那", MaybeOfString("䋳"), {-724051, -702926});
    Test_CheckProps_TmxMapInfo(425498, "", MaybeOfString("䜮ᚗҳ충멵ᶼ覵"), {-732789});
    Test_CheckProps_TmxMapInfo(719653, "�拣䵱䌏", MaybeOfString(), {-863655, -723578});
    Test_CheckProps_TmxMapInfo(983172, "䤩䇢�뽥", MaybeOfString(), {643726, 457496, 183274, 837902});
    Test_CheckProps_TmxMapInfo(6143, "뭷┼쿽騍큋㈣揘䢊儞祹", MaybeOfString("뇎≌膅๴޷Მᑨ쾳ﺷ"), {458500, -180567, 191510});
    Test_CheckProps_TmxMapInfo(985736, "㪂", MaybeOfString("ឞ楚㔊夷"), {-122193, -692074, -801994});
    Test_CheckProps_TmxMapInfo(945399, "", MaybeOfString("瘃빻桑툆"), {-774052});
    Test_CheckProps_TmxMapInfo(363342, "", MaybeOfString("뗧돥轈ꭾﯗ歡洔"), {702564, -47836, -683839, 258145});
    Test_CheckProps_TmxMapInfo(816997, "㩾껫墰菌㶑ꔘₜ齬", MaybeOfString("ꟗ唡ஊ"), {-786142, -611149, 153273});
    Test_CheckProps_TmxMapInfo(853065, "�ꒉ㳀䈾뙱䕂륦홰", MaybeOfString("堷䑵蚖䜙莬"), {-139333, 89935});
    Test_CheckProps_TmxMapInfo(469141, "胊의䉶杻�죝ᝫ᥾", MaybeOfString("줖睪"), {-147055, -693731, -301873});
    Test_CheckProps_TmxMapInfo(395859, "秉ⵑ᠟Ꮍ⁭豹理癙⤊", MaybeOfString("㫟슷崠ᕧ◃"), {-43258, 982620, -592072, -568754});
    Test_CheckProps_TmxMapInfo(978653, "벷쨭욢璞", MaybeOfString("耓봸鱚뿽룣ӟꓟ砥㜬⋣"), {312816});
    Test_CheckProps_TmxMapInfo(315253, "森ⶍභࢆ⑧", MaybeOfString("걍퐮뼗"), {362086, 513331, 850420});
    Test_CheckProps_TmxMapInfo(22089, "짭", MaybeOfString("嫈룭밒᥃탃�刑ᅘ鳰"), {529329, 78530});
    Test_CheckProps_TmxMapInfo(83328, "쐭ғ㒴퟽ᗦ㴟봨ￊ", MaybeOfString("奚"), {-957449, 2628});
    Test_CheckProps_TmxMapInfo(772861, "", MaybeOfString("쯟㝒⒄색Ї"), {-881617});
    Test_CheckProps_TmxMapInfo(903157, "༏큝㫓", MaybeOfString("퉾돂띨體륯幈᠀㯱"), {-376175, 973039});
    Test_CheckProps_TmxMapInfo(431245, "ಟ", MaybeOfString("䡎"), {679739});
    Test_CheckProps_TmxMapInfo(182317, "็۟弜", MaybeOfString("Ⲃ叼熃ᐳፎ䮐잝"), {309649, -85927, 983400});
    Test_CheckProps_TmxMapInfo(850147, "扚듍꩐瘁쪟怢瞱", MaybeOfString("튜좎㜶錏齜圓涾⚬"), {335576, 521868, 680498});
    Test_CheckProps_TmxMapInfo(485202, "䵌‱䘢먔᫣", MaybeOfString("꺭齶褱"), {613923, 72793, 366682});
    Test_CheckProps_TmxMapInfo(480081, "㈾នﯸ滣轁竁怒ৈ", MaybeOfString("胣颡攤訞"), {-89168});
    Test_CheckProps_TmxMapInfo(396439, "�淲ﺆ跏㜤샱镧畉弐", MaybeOfString(), {952652, 357901, -626658, -211511});
    Test_CheckProps_TmxMapInfo(684445, "檣袿", MaybeOfString("ꩵ"), {612954, 647698});
    Test_CheckProps_TmxMapInfo(66200, "䬹칭", MaybeOfString("坊"), {140197, 355531, 925363});
    Test_CheckProps_TmxMapInfo(323729, "쯰㗟豺", MaybeOfString(), {-663109, -290020, 990522, -694202});
    Test_CheckProps_TmxMapInfo(133511, "", MaybeOfString("圙枩紂鯴떩ℭ"), {147555, 748571});
    Test_CheckProps_TmxMapInfo(303027, "扟킋泎", MaybeOfString("ㄼ鲶헞雟❢�䖗�"), {-737311, -723488});
    Test_CheckProps_TmxMapInfo(969195, "ꏛᐰꭢធ沈v鬕绽ᅧ", MaybeOfString(), {-507545, 361945, -820337, 650559});
    Test_CheckProps_TmxMapInfo(900907, "啕ኞ衍蛜", MaybeOfString("늽趽ማ鐆ᒓ俲⼿"), {-552542});
    Test_CheckProps_TmxMapInfo(487252, "揉筢㲸肅瞇", MaybeOfString("椇榩맃漾骞詻栞"), {717791, -499642, 656430});
    Test_CheckProps_TmxMapInfo(449432, "긽榈俍埯퐥ঠ἗넾ᅳ", MaybeOfString(""), {517511});
    Test_CheckProps_TmxMapInfo(900088, "诨⥇Ш", MaybeOfString("됤蓼㰡㣄咊"), {-406450, 571451, -529715, 684845});
    Test_CheckProps_TmxMapInfo(914746, "悄௶揸ꥒ叵﨑밍뇘Ꜽ", MaybeOfString("囍틠䤙"), {642519, -83490, -121713, 603343});
    Test_CheckProps_TmxMapInfo(490417, "", MaybeOfString("拉﫜禧"), {-397913, -544800, -187818, -679722});
    Test_CheckProps_TmxMapInfo(237947, "", MaybeOfString("⯤槯梾⛬㬻৷䪨꒥"), {284881, 489560, -122569});
  }
  
  bool unitTestResults_TmxMapInfo_Getters = runAsync(Tests_RegisterAll_TmxMapInfo_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_TmxMapInfo_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_TmxMapInfo', UnitTest_OpEqSimple_TmxMapInfo);
  }
  
  TmxMapInfo@ lastChecked = null;
  
  bool OpEqSimple_Check(uint TrackID, const string &in Name, MaybeOfString@ Tags, const int[] &in TagList) {
    TmxMapInfo@ o1 = TmxMapInfo(TrackID, Name, Tags, TagList);
    TmxMapInfo@ o2 = TmxMapInfo(TrackID, Name, Tags, TagList);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_TmxMapInfo() {
    OpEqSimple_Check(393455, "ﷰ눵뭩㵷衟춗䵩", MaybeOfString(), {-875436});
    OpEqSimple_Check(878215, "탏핈霋흽묌铱蝔ᔁ䀓⃩", MaybeOfString("꒲풜豈窏ｅ"), {221991, 693970});
    OpEqSimple_Check(960330, "⇩㵣䎵甄壝玃", MaybeOfString("詘렰佹膴ᳲ풜ᬃ"), {-602225, 333816});
    OpEqSimple_Check(159512, "쇳濶鵛獔楷璊诛퇟", MaybeOfString("⫀怉嗣"), {-416957});
    OpEqSimple_Check(226958, "밑幖許ᬤ쿊菆︐", MaybeOfString("趻䎕䝌바"), {-859114, -445943, 785460, 26440});
    OpEqSimple_Check(133463, "㞫䫆ើ鹆ʊ", MaybeOfString("盯볠后⡆"), {-662483});
    OpEqSimple_Check(288195, "", MaybeOfString("፦"), {-610864, 690858, -449551});
    OpEqSimple_Check(504118, "耏盧я␜", MaybeOfString(), {179642, -919552});
    OpEqSimple_Check(145172, "", MaybeOfString("쨔븬ଏ"), {854015});
    OpEqSimple_Check(222332, "娣", MaybeOfString("ᜇꩥ᫦霍"), {20188, 840953});
    OpEqSimple_Check(208909, "䀐硩钗쏥䁏", MaybeOfString("慹﮽ꫤⅥȩ"), {422278, -274274, 909595, 718449});
    OpEqSimple_Check(333641, "�㏊뻹媋痰", MaybeOfString("䞧શ�䔘⾆"), {147695, 4203});
    OpEqSimple_Check(766369, "⃠嚅", MaybeOfString("饁䱯淵す㫕崒"), {-37522, 559404});
    OpEqSimple_Check(726400, "锲釹ឰ", MaybeOfString("͓墳룠డ㫠瀚䊠"), {40481});
    OpEqSimple_Check(694261, "館胄ા즣", MaybeOfString("蟉꾋ྣ驣Ⴥ烶ꦴ휇"), {704848, -635331, -455288, -95488});
    OpEqSimple_Check(780762, "�둕껅汆", MaybeOfString("㣗짰"), {-634496});
    OpEqSimple_Check(814326, "⩮�ώ꒏퓂䉰ꋗ嗳ರ", MaybeOfString("웆覕䃄�ЊЫᯱ睟"), {-843927, -168216, 843670});
    OpEqSimple_Check(909926, "⧙곢歒", MaybeOfString("㳹"), {132045});
    OpEqSimple_Check(929297, "홌", MaybeOfString(""), {364509, 636291, -854843, 78939});
    OpEqSimple_Check(925658, "큽咪઼側", MaybeOfString("ೢꨉ�툱ฃ爯䑫ⵙ"), {279639, 937519, 557945, -916191});
    OpEqSimple_Check(759681, "粄⅝挝㠊", MaybeOfString("ꋽ"), {157952, -832582, -604767, -468278});
    OpEqSimple_Check(475985, "뱜悶ꂋ鰲", MaybeOfString("ᱟ骲盼ﰢ࿏꘰଒"), {47786, 992454, 829588, -746952});
    OpEqSimple_Check(141600, "⟹驵盲ⓟ娣ዯ", MaybeOfString("᧊㑗蟒⌧츂�ꁟᾅ죐"), {690603, -67493, -366355});
    OpEqSimple_Check(578377, "﨑", MaybeOfString("⠨"), {-374957, 417084, -799102});
    OpEqSimple_Check(877689, "띟璦Ⴗ婑", MaybeOfString(""), {849219, -321289, -393101, -381690});
    OpEqSimple_Check(284057, "", MaybeOfString(""), {296593, -812904, -413969, -366844});
    OpEqSimple_Check(97859, "녮ง", MaybeOfString("䍇ﷰ쎑ˬ퍪쉹٥"), {203988, -611502, 917838, -692325});
    OpEqSimple_Check(773250, "↟ڹ錠쟓쎭뗧䢼", MaybeOfString(), {419116, -424360, 739364});
    OpEqSimple_Check(978412, "聿妒ᫍ", MaybeOfString("䀡"), {-538153, 921986, -874280, -580971});
    OpEqSimple_Check(284973, "", MaybeOfString(""), {-816012});
    OpEqSimple_Check(463120, "磃헮躁潿鬐", MaybeOfString("箆玬㖳驡囈椐"), {-430263});
    OpEqSimple_Check(574276, "", MaybeOfString("厳눟ਵ⺊�半⩩⁦皝义"), {518187, -448816});
    OpEqSimple_Check(971400, "䋰ꭔ", MaybeOfString("쭾炞푵묺�좢"), {-468156});
    OpEqSimple_Check(958667, "숬勯ﵜ쳮쬤", MaybeOfString("ଵ峎㐇苘殾ﰃ"), {707858});
    OpEqSimple_Check(1447, "⡋늟", MaybeOfString("硷ﵜ⫌Ꞻ⧙㐈狀䌤譢"), {-353437, -274753, 836181});
    OpEqSimple_Check(796197, "膞坫窀훱Ⅺ", MaybeOfString("ࢫꂘび�瘣댮"), {});
    OpEqSimple_Check(363319, "ө㩣�轏", MaybeOfString("䮰䗦悛燓"), {-225964, 533724});
    OpEqSimple_Check(926220, "ᄈ믋왚ꯂ喿�", MaybeOfString("嫲�쓋쾙樂⏭"), {-785715, 372367});
    OpEqSimple_Check(806802, "迒䌡ഘ�∁衽", MaybeOfString(), {299172, 946673});
    OpEqSimple_Check(932418, "咂ﱉ皾澐쇞㍐དྷ썦癓簡", MaybeOfString("రȴཱིՋ㈭窟w䏭"), {48134});
    OpEqSimple_Check(619788, "䷫킹륦了挧ﳗ졝馺", MaybeOfString("㺸䞭촁챑ᩓ龜릇"), {734945, 79137, -251304, 562413});
    OpEqSimple_Check(255600, "", MaybeOfString("✨淨�薮쮮"), {549628, 542692, -30192});
  }
  
  bool unitTestResults_TmxMapInfo_OpEq = runAsync(Tests_RegisterAll_TmxMapInfo_OpEq);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_TmxMapInfo_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_TmxMapInfo', UnitTest_ToFromBuffer_TmxMapInfo);
  }
  
  bool Test_ToFromBuffer_Check(uint TrackID, const string &in Name, MaybeOfString@ Tags, const int[] &in TagList) {
    TmxMapInfo@ tmp = TmxMapInfo(TrackID, Name, Tags, TagList);
    MemoryBuffer@ buf = MemoryBuffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _TmxMapInfo::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_TmxMapInfo() {
    Test_ToFromBuffer_Check(490366, "", MaybeOfString("㷕y䖀湶㐇쩎䷐묲"), {-131469, 208087});
    Test_ToFromBuffer_Check(184950, "㑽沒皔�", MaybeOfString("呋㊠쉝얖秅軫"), {-465845, -491818});
    Test_ToFromBuffer_Check(829354, "থ䤫ﯹ윶", MaybeOfString("蛗뙱頸"), {-272359, -286637, 980098, 394003});
    Test_ToFromBuffer_Check(542064, "�䓂ൗ㬬䱿학", MaybeOfString(), {549906, -538914, -217452});
    Test_ToFromBuffer_Check(156703, "玵⌂玍뱑ự螸", MaybeOfString("ᇵ͈㺒"), {-116232, 500830});
    Test_ToFromBuffer_Check(215149, "벋⛩涻뼢ꏅ㜔", MaybeOfString("ܪ�濃ฮ⢩◎"), {-400843, 264122, 966690, 307951});
    Test_ToFromBuffer_Check(18419, "蒔銥", MaybeOfString(), {-229795, -999444, 711944});
    Test_ToFromBuffer_Check(871047, "婗�嗇웖峔䞠", MaybeOfString(), {-135141});
    Test_ToFromBuffer_Check(213099, "࡟记Ⴒ늴㐆", MaybeOfString("䅞嶗弄㘲㢧"), {-911577, 664733});
    Test_ToFromBuffer_Check(835031, "�", MaybeOfString(""), {-470320, -422981, 935627});
    Test_ToFromBuffer_Check(305848, "�髨", MaybeOfString("愹㮠ꎁ杕묙뷘뽵"), {-631575, 319227, 520261});
    Test_ToFromBuffer_Check(861842, "㴑", MaybeOfString("峽ᱪⓣ䝚ࠌ臼"), {599204, -726942});
    Test_ToFromBuffer_Check(873537, "ℤ", MaybeOfString("뱵뒣퀢饮톑써ꝍ约"), {691552, -815981, -259701});
    Test_ToFromBuffer_Check(740264, "蛬讽", MaybeOfString(""), {182755, -71101});
    Test_ToFromBuffer_Check(373377, "褺끤찙뗿", MaybeOfString("ຨの⧚諍愥"), {79569, -869218, -388165});
    Test_ToFromBuffer_Check(692075, "", MaybeOfString("岺�槧ൃ"), {-506405, 196468, 349336});
    Test_ToFromBuffer_Check(933514, "賵ঃ굈꒍쉫탑", MaybeOfString("醱✨딦鹟㙾"), {-342126, 385463});
    Test_ToFromBuffer_Check(674685, "먫ᣆ", MaybeOfString("Ꚃ"), {-593560});
    Test_ToFromBuffer_Check(473825, "㇮ᛏ큎뒏⫛", MaybeOfString("梱쒰ᘤ�6"), {});
    Test_ToFromBuffer_Check(506392, "", MaybeOfString("䰌嗗睊௭ꪘ΄㢋뵈곋"), {-306469, 173894, -510644, 919387});
    Test_ToFromBuffer_Check(712180, "湧섳⒜㓚苵孇᚞粷", MaybeOfString("쟝䫂⊘放"), {-756628, 898687, 406274, 632768});
    Test_ToFromBuffer_Check(319491, "볞", MaybeOfString("礱ﾡῼ�ﭾ싌无죋"), {-251685});
    Test_ToFromBuffer_Check(119549, "밦󻴑ւꈒ戚춭袺㙒౫", MaybeOfString("祽勽迩ﬀࡴ粪ጃ퓣䒦"), {164935, 463721, -42045});
    Test_ToFromBuffer_Check(328793, "镇混�禳蓮鿞겮鴆", MaybeOfString("妾端滄꧜ꕭ凗⳴"), {781705, -921049, 186933, -514823});
    Test_ToFromBuffer_Check(709551, "㻿틛䚙Չ찐", MaybeOfString("㠐ྉ�"), {-790168, 681555, 645363});
    Test_ToFromBuffer_Check(998119, "໩", MaybeOfString("�꣎⺞㨱㘌䫀沛䄺砄"), {-525877, -669283, 171001, -651053});
    Test_ToFromBuffer_Check(155863, "", MaybeOfString("㲀帔䕮쯦὜㖔巍"), {35511, 512740, -808479, -461199});
    Test_ToFromBuffer_Check(107080, "紮㾶傻竨罽", MaybeOfString("ﮪ䭐릇"), {975482, 381756, -141531});
    Test_ToFromBuffer_Check(508626, "匥ᄯ", MaybeOfString("麉醙�葊�᮵"), {585311, 35178, 70328, -2463});
    Test_ToFromBuffer_Check(949646, "㭿", MaybeOfString(), {908455, 100513, -901272});
    Test_ToFromBuffer_Check(281342, "晭�ꉼ", MaybeOfString("쌭㧮琭⮜뎬"), {-921606, -76857, -625519, 875210});
    Test_ToFromBuffer_Check(589319, "", MaybeOfString("蘝എ쾻骯"), {-893315});
    Test_ToFromBuffer_Check(560058, "䜎㊟焱쑔ᣛﻃ瞽�쀮ꢸ", MaybeOfString("�몗헗ᘖ疰厔ǜ"), {849299});
    Test_ToFromBuffer_Check(534295, "䐭ǘ钶옠挏䆭䐜", MaybeOfString("ⰾ肧뛅皤ꘑ閾਽ލ⓮"), {-738673, -945010, -25369, 991105});
    Test_ToFromBuffer_Check(611797, "㤞㱸", MaybeOfString(), {987116, -534633, -155739, 326125});
    Test_ToFromBuffer_Check(647385, "캣ᮅᔜ�䛝쏔", MaybeOfString(""), {95318, -989212, -554863});
    Test_ToFromBuffer_Check(133548, "鼋皿ꮺ玚疭爿㰙ḋ", MaybeOfString("䝜ˎ"), {605952});
    Test_ToFromBuffer_Check(63954, "푭", MaybeOfString("녛ﮝ"), {41008});
    Test_ToFromBuffer_Check(996068, "魠齁⣔蓷璉", MaybeOfString(), {914083, 554244});
    Test_ToFromBuffer_Check(843199, "�쉐⽚̿划㠒", MaybeOfString(), {-747370, 654169, 790541, -373706});
    Test_ToFromBuffer_Check(825340, "粙", MaybeOfString(), {784257, 615343, -32333, 95161});
    Test_ToFromBuffer_Check(682330, "쀐㴔", MaybeOfString("졠甹"), {-807878, 640719, 301561});
  }
  
  bool unitTestResults_TmxMapInfo_ToFromBuffer = runAsync(Tests_RegisterAll_TmxMapInfo_ToFromBuffer);
}
#endif