#if UNIT_TEST
namespace Test_SceneItem {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_SceneItem_CommonTesting() {
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
  
  bool unitTestResults_SceneItem_CommonTesting = runAsync(Tests_RegisterAll_SceneItem_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_SceneItem_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_SceneItem', UnitTest_ToJsonFromJson_SceneItem);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in name, uint ver, SItemType type, vec3 pos, float angle, bool tt, bool carSync, MaybeOfString@ attachedTo, const string &in skinZip) {
    SceneItem@ tmp = SceneItem(name, ver, type, pos, angle, tt, carSync, attachedTo, skinZip);
    assert(tmp == SceneItem(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_SceneItem() {
    Test_ToJsonFromJson_Check("", 129450, SItemType(573551), vec3(0.6009376899343625, 0.8632308216128641, 0.014990074567026494), 0.585889424935863, true, false, MaybeOfString(), "ℊ䮇귂⎶越⫺");
    Test_ToJsonFromJson_Check("�勩ִ嬂㹦ꑳ", 516271, SItemType(584806), vec3(0.2944646018065813, 0.10079380548596094, 0.4177846128203834), 0.8810454527293543, false, true, MaybeOfString("ᲁ澯"), "䳟框雱燐꬝,汯粌鉅᜘");
    Test_ToJsonFromJson_Check("䢕颒饣", 292599, SItemType(141875), vec3(0.9673777189885162, 0.2898732946672818, 0.47380688436040974), 0.13211496133921433, true, true, MaybeOfString("礽ᚪ�司䌭덉"), "䞫");
    Test_ToJsonFromJson_Check("簔�좕큇", 816099, SItemType(752865), vec3(0.9728337600700715, 0.6584323424186708, 0.18760089165885044), 0.6826412643690786, false, true, MaybeOfString("懇�客㒞᫯볠"), "朣뵧칒튪윷窋澵");
    Test_ToJsonFromJson_Check("䞚㌴⦱扬", 962581, SItemType(425743), vec3(0.6252622081084467, 0.03204760282861423, 0.969836140037438), 0.9603157471680621, true, false, MaybeOfString(""), "ꬨ");
    Test_ToJsonFromJson_Check("䀗", 710663, SItemType(614947), vec3(0.4251184935798489, 0.8948035928862186, 0.06423221065859878), 0.5530407012221593, false, true, MaybeOfString("狀ꆟ㾩炤䩦"), "皼䦋쁗缧ⱊﱻ");
    Test_ToJsonFromJson_Check("ᵒ㪗羘렷뵫", 291599, SItemType(158796), vec3(0.13078502525146354, 0.12395391339620292, 0.379353548111093), 0.7751208705711742, false, true, MaybeOfString("ᇠ炦"), "꽝낸똞ꚣ筣");
    Test_ToJsonFromJson_Check("", 681635, SItemType(943851), vec3(0.5877709354217029, 0.290823741020087, 0.3528027806211276), 0.14302336244984687, false, false, MaybeOfString(""), "뮏엣");
    Test_ToJsonFromJson_Check("῏⻖蚇ங⨗萃", 782152, SItemType(275663), vec3(0.9653079109104853, 0.3781675600345095, 0.5262904258101668), 0.565144282563191, true, true, MaybeOfString("鵸詤ぐ"), "⁥츟惦鷰ᖺ䖛䥿");
    Test_ToJsonFromJson_Check("뢵䗕", 38750, SItemType(781176), vec3(0.35137355064571535, 0.15266321932555327, 0.20626006378152412), 0.3795387979501573, false, false, MaybeOfString("ꧾ큽ⷾ뮁d更든Η"), "");
    Test_ToJsonFromJson_Check("", 442122, SItemType(757477), vec3(0.01530524716493918, 0.7995858987791398, 0.8109199678576179), 0.9177684550721983, false, true, MaybeOfString("㓉⩊转ᢶ퇈侘룒फᝌᣇ"), "됢菙ၰ㡽걅");
    Test_ToJsonFromJson_Check("鳐�", 178195, SItemType(263794), vec3(0.5630223595365055, 0.6523171866556244, 0.002917053644972413), 0.8090964964633326, false, true, MaybeOfString("䴾퍂蘇賻ᜳ벛"), "螝⬣홭ᢻ샞饤");
    Test_ToJsonFromJson_Check("ꒋ符䭭澀⽹ᱶ", 489123, SItemType(522901), vec3(0.2080042358525117, 0.5724688365927286, 0.6432111676052265), 0.446271471887022, false, true, MaybeOfString("臼瀙娎뉺"), "ᴝ삱鄎吐�Ͼ斐임㾂");
    Test_ToJsonFromJson_Check("招곢贕没", 348997, SItemType(47391), vec3(0.8970625972827256, 0.10863343445054881, 0.8445143624416154), 0.5527894192155401, false, false, MaybeOfString(), "쐤얪㵁㢝蔹ｽ≨⢮舊");
    Test_ToJsonFromJson_Check("≁隵ꄻ�ঽ㎒�郁❨鲶", 23152, SItemType(201380), vec3(0.5140212422767753, 0.3193859422204019, 0.0788169210212384), 0.5715946161987235, true, false, MaybeOfString("퐞"), "쟬ﱩ媡요쉒▹ﯖ號㪳");
    Test_ToJsonFromJson_Check("", 949831, SItemType(896297), vec3(0.7974610392923751, 0.24182768223892323, 0.26404935506361044), 0.9264182755380954, true, false, MaybeOfString("꺒Ｅ澮촎姴䮪삒볜豣"), "馣谱蘄딙授↳웡꫎");
    Test_ToJsonFromJson_Check("갯䘞턜㧷わ銂", 561047, SItemType(440156), vec3(0.00905988226135256, 0.329576637749363, 0.9938807995030101), 0.6200728098024022, false, false, MaybeOfString("䔻镩෾萫郅栗�᭩앋"), "格湴ﳄᚬᖹ響醖");
    Test_ToJsonFromJson_Check("", 131607, SItemType(237800), vec3(0.620051420116821, 0.5021004590681291, 0.8912596776575128), 0.9959002058002633, true, false, MaybeOfString("蜵来৷몖괩퉧瑏求뺝"), "ཎ؏쀯㖩ꅽ딚圤쯼");
    Test_ToJsonFromJson_Check("絠촊枤", 618140, SItemType(674608), vec3(0.5483790871446855, 0.8069155611130016, 0.6210504856989955), 0.7279951762072719, true, true, MaybeOfString("ᶥ톪�湀"), "몒謒");
    Test_ToJsonFromJson_Check("魣䐵뒠빖", 377004, SItemType(916802), vec3(0.785397055458928, 0.9012640579143837, 0.9173395852173397), 0.8991180262058591, true, true, MaybeOfString("聸ᒢ湾ᾬ "), "曘靳ԝ춤ᴼ馿ꞑ漆霋枒");
    Test_ToJsonFromJson_Check("哻咷", 863576, SItemType(553871), vec3(0.9151964797243459, 0.44927277390345594, 0.8460690937219509), 0.6012230522936317, false, false, MaybeOfString(), "墍믙㬢娵ⵌ⫿鰰⇹숄ꙍ");
    Test_ToJsonFromJson_Check("伲킬簱ᡋ", 30150, SItemType(70707), vec3(0.4285707135817831, 0.5369153062519223, 0.43874808654130815), 0.808885435484762, false, true, MaybeOfString("⛟왪噧㉊㚨줫⧑"), "");
    Test_ToJsonFromJson_Check("轔렫炙띤䮔췬鼋탐", 507600, SItemType(235111), vec3(0.6772903789194722, 0.4838808218407821, 0.4111510763928066), 0.6736085571691434, false, true, MaybeOfString("ጦٛꦺᙱ֤馵ᆪ"), "撁銹瞝ۄ⢻疳");
    Test_ToJsonFromJson_Check("Ⱆ", 995150, SItemType(898974), vec3(0.5267933190459354, 0.8403036663496418, 0.298278363560456), 0.1948874267725681, true, true, MaybeOfString("祆䊼Ꙕ"), "᥌⇝䱓䎸帍곔");
    Test_ToJsonFromJson_Check("釄", 679849, SItemType(608847), vec3(0.8138729924400677, 0.46321807450764724, 0.9996745586393748), 0.29062008126202044, false, false, MaybeOfString("�ࣔ潛픔綽傍ᙏ젙"), "邽쪿淬ฏ垄塍嵓");
    Test_ToJsonFromJson_Check("�䰃", 943449, SItemType(297509), vec3(0.8527028178110266, 0.8177185560659126, 0.09241985766795457), 0.19894948983516056, true, false, MaybeOfString("ꇈ퉿"), "꼭㗶澃");
    Test_ToJsonFromJson_Check("鷬헡㕚", 825672, SItemType(354693), vec3(0.05405081764517856, 0.087018550414135, 0.4724470407108064), 0.49110215133573026, false, true, MaybeOfString("䲈㌒皬毸圌蒵⢢"), "圀詓鐋䎶뵆扈僿䞚");
    Test_ToJsonFromJson_Check("쇈๛", 518560, SItemType(26331), vec3(0.007899022664827771, 0.29372305390132736, 0.30553487097170895), 0.473756675363405, false, false, MaybeOfString("잒淮듑箩厈䃐᲎"), "耕굗ご䎽붏矓暴");
    Test_ToJsonFromJson_Check("爑䬼덃", 740039, SItemType(565965), vec3(0.6829643322541212, 0.37128223868612303, 0.16494361784539355), 0.9933770149915372, true, false, MaybeOfString(), "읒럕࠘ᮍ怅䓗柳ᓒ");
    Test_ToJsonFromJson_Check("㞹㿼昡˶鵺ﯶᲑ篥", 206760, SItemType(489368), vec3(0.5847513929869753, 0.5344908742860383, 0.4089926613536629), 0.4847562026627158, false, true, MaybeOfString(), "闞ꩍ㨧");
    Test_ToJsonFromJson_Check("阈熲㜆⏰‖馞褗蛢", 890783, SItemType(322790), vec3(0.9743797974541689, 0.28720291018821437, 0.571677695294692), 0.45402957007942235, true, true, MaybeOfString("ᭊ初�䯊ךּ"), "至쐱ྟ찕崾흨");
    Test_ToJsonFromJson_Check("샛Ꝩ騫㡪ῥ舙鬱", 599454, SItemType(210682), vec3(0.08573204236372003, 0.3714169391297814, 0.667068733678697), 0.07484340438379133, false, true, MaybeOfString("똼顯얮듖踉弹겸뽶婯맕"), "볶烓");
    Test_ToJsonFromJson_Check("Ŧ묓买嗒쫑鋋�狫ꙡ", 769500, SItemType(821203), vec3(0.9991214759643755, 0.5927662763710908, 0.4209267089240843), 0.5531664744732745, false, true, MaybeOfString(""), "䞿皆Ꮳ煭휶");
    Test_ToJsonFromJson_Check("�巸", 324522, SItemType(829574), vec3(0.8941779843970099, 0.8654848280667722, 0.818135611162584), 0.2240864290967986, false, true, MaybeOfString("郺黋▘녝"), "㽇䙃珍㉡");
    Test_ToJsonFromJson_Check("", 245926, SItemType(621484), vec3(0.38487750170048207, 0.4218845839714094, 0.7907528839031015), 0.4324588866124204, true, true, MaybeOfString("ઋԞ൪"), "娬⸰");
    Test_ToJsonFromJson_Check("盟駪᷑铁뮱ོ再", 759835, SItemType(321923), vec3(0.9799397615622448, 0.6722303711214245, 0.23224440227832852), 0.6695423771951079, true, true, MaybeOfString("궅抈⽊얳礞䛜꜠㋆"), "잜徺〶力෎턒柬");
    Test_ToJsonFromJson_Check("", 715158, SItemType(536447), vec3(0.31989314980799943, 0.5622343819412563, 0.6158506863824328), 0.7284823664131027, false, false, MaybeOfString("鰫烷쓿璟溫弄뮮"), "͔");
    Test_ToJsonFromJson_Check("锃�ꚴ램ഔ쁴蔝娞⠸", 70862, SItemType(19565), vec3(0.8684672125934005, 0.7808190960347742, 0.9185846945823098), 0.001792182681053962, false, false, MaybeOfString(""), "髀ⱪ탵Ⰽ妬눌鏩틽");
    Test_ToJsonFromJson_Check("＝ⶇ", 729860, SItemType(913604), vec3(0.4789826704556973, 0.9724855669645991, 0.8508029481632648), 0.10911078895866443, false, true, MaybeOfString("ᆔ耵攰圾ᴿ퀡ପ"), "䕲璷瘑ᩰ넑");
    Test_ToJsonFromJson_Check("ꕦ䝵龌ͨﯨ撦ꥯ얩倳䊜", 157374, SItemType(575994), vec3(0.4648893305402665, 0.6728745092045862, 0.32543381458401394), 0.01566378493591388, true, false, MaybeOfString(""), "Ҥ襤덌ῤ䐧ꮚ");
    Test_ToJsonFromJson_Check("꽻뺿쭠贑麏揅שּ㰄", 540486, SItemType(615506), vec3(0.19729798668869677, 0.7711154500819349, 0.5138909050793811), 0.027879086801725947, false, false, MaybeOfString(), "ᨲ");
    Test_ToJsonFromJson_Check("峪蛅䬈줺", 309855, SItemType(17883), vec3(0.19874178999976339, 0.4649450785782864, 0.3638880524616167), 0.24018037470066006, false, true, MaybeOfString("蛊ꠌ⋞ネ"), "곑凋�蔐鴁⅘굡");
  }
  
  bool unitTestResults_SceneItem_ToFromJSONObject = runAsync(Tests_RegisterAll_SceneItem_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_SceneItem_Getters() {
    RegisterUnitTest('UnitTest_SceneItem_Getters', UnitTest_SceneItem_Getters);
  }
  
  bool Test_CheckProps_SceneItem(const string &in name, uint ver, SItemType type, vec3 pos, float angle, bool tt, bool carSync, MaybeOfString@ attachedTo, const string &in skinZip) {
    SceneItem@ tmp = SceneItem(name, ver, type, pos, angle, tt, carSync, attachedTo, skinZip);
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(ver == tmp.ver, 'field ver with value `' + ver + '`');
    assert(type == tmp.type, 'field type');
    assert(pos.x == tmp.pos.x && pos.y == tmp.pos.y && pos.z == tmp.pos.z, 'field pos');
    assert(angle == tmp.angle, 'field angle with value `' + angle + '`');
    assert(tt == tmp.tt, 'field tt with value `' + tt + '`');
    assert(carSync == tmp.carSync, 'field carSync with value `' + carSync + '`');
    assert(attachedTo == tmp.attachedTo, 'field attachedTo');
    assert(skinZip == tmp.skinZip, 'field skinZip with value `' + skinZip + '`');
    return true;
  }
  
  void UnitTest_SceneItem_Getters() {
    Test_CheckProps_SceneItem("�￿躮䮠馩�", 980813, SItemType(825164), vec3(0.42605082757121454, 0.8994976900981263, 0.6529987266534002), 0.9015342862818084, false, true, MaybeOfString("寔옛�ᠱ"), "꟪뢖棱꡺鼀ൃ橗");
    Test_CheckProps_SceneItem("쿵ᒄ暭쑁㚷", 87722, SItemType(931445), vec3(0.11356447223274245, 0.8706391467110436, 0.6222508887863955), 0.6726526080969035, false, false, MaybeOfString(""), "●ꜛ귦翮漽똮覧﶑䙢");
    Test_CheckProps_SceneItem("�⿵枵ⴾ", 372964, SItemType(622511), vec3(0.7530959084411598, 0.6925963632262295, 0.3190492933239086), 0.8284380383921964, false, false, MaybeOfString(), "");
    Test_CheckProps_SceneItem("鿐繗", 48204, SItemType(763812), vec3(0.6137909617339219, 0.30351385814301385, 0.9174464214208752), 0.05620840706685949, true, false, MaybeOfString("⸔옯듡鷰那춴庂ᄼ"), "젮훇懓奲");
    Test_CheckProps_SceneItem("ᓭ褾㵹徲㼏嘿ꑙ尚豈", 719653, SItemType(49582), vec3(0.18326834830607677, 0.5464410826314432, 0.257499702394707), 0.7681342949011057, false, false, MaybeOfString("⅄⊫햷"), "寤퐫帧�㶈�㻡뼇ṽ");
    Test_CheckProps_SceneItem("裺", 281728, SItemType(935876), vec3(0.7331967943968236, 0.14246232907402437, 0.7990867322306553), 0.7156515059599893, true, true, MaybeOfString("묹뭷┼쿽騍"), "鈤ꦀ");
    Test_CheckProps_SceneItem("㎀꿈�ᴶ๏㕭∸缲䁏뤥", 985736, SItemType(972616), vec3(0.893681657916718, 0.9073092978947374, 0.7271186768669257), 0.7456510433674096, true, false, MaybeOfString(), "蚂㢲蘆鞆㤨ॽ簊ឞ楚㔊");
    Test_CheckProps_SceneItem("桑툆뵋", 23362, SItemType(255319), vec3(0.028904784484256426, 0.26285183954185426, 0.1211465248470877), 0.8639008937701121, true, false, MaybeOfString("郶炼"), "쁼﬩阚");
    Test_CheckProps_SceneItem("蝢", 702564, SItemType(816997), vec3(0.00201616482903071, 0.32229246214138924, 0.3794400270001218), 0.949543322878677, true, true, MaybeOfString("鉴㉙挶㊜䱁蝜炚"), "ꟗ唡");
    Test_CheckProps_SceneItem("", 804972, SItemType(682153), vec3(0.1923322771640179, 0.07135098430856643, 0.1833635588099079), 0.14234731306431225, true, true, MaybeOfString(), "痚ꄻ滇�ꒉ㳀");
    Test_CheckProps_SceneItem("쯳枦섍", 89935, SItemType(469141), vec3(0.7713710180350445, 0.8504115696299875, 0.21687760912667847), 0.8990701538971952, true, true, MaybeOfString("䢁㗡築뢰珊"), "줖睪");
    Test_CheckProps_SceneItem("ꦏ", 633516, SItemType(874548), vec3(0.5482597409506607, 0.045955429340691974, 0.3145297045421459), 0.6633679539260305, true, false, MaybeOfString("릈䨕＠߇₹紇秉ⵑ"), "");
    Test_CheckProps_SceneItem("읝㆒刱❕騐헵�", 978653, SItemType(334968), vec3(0.9411050150827994, 0.08018306180843295, 0.5165765548667761), 0.6668799741505086, false, true, MaybeOfString("룣ӟꓟ砥㜬⋣亶␞"), "봸鱚");
    Test_CheckProps_SceneItem("夞䫿줯党Ὥ䜚༻", 224795, SItemType(109476), vec3(0.31757974406591605, 0.8918258058334821, 0.323473388014116), 0.383912829395343, false, true, MaybeOfString("짭㦟茍沕К߄뽇㪢㸿"), "辅⭉ソ⿈");
    Test_CheckProps_SceneItem("蚕蔟Ι龲ꇗ", 454352, SItemType(78530), vec3(0.40530413966872925, 0.4361259492282411, 0.2356951964254003), 0.2428266504978885, true, true, MaybeOfString("謧痀㬙菣꿫琢췹"), "奚");
    Test_CheckProps_SceneItem("쑅閜䈀疶뫰줪", 149066, SItemType(399166), vec3(0.788806959422681, 0.5007382922343623, 0.1381044448996449), 0.43965975075944314, false, false, MaybeOfString("Ⴒ嶹"), "큝");
    Test_CheckProps_SceneItem("鉚枛칸ힼ㼓럮", 107812, SItemType(154650), vec3(0.9634747719222096, 0.8907154569824763, 0.7258240011175275), 0.25035794416924845, true, true, MaybeOfString(""), "쮽񜋑⊳汧載ﵩ䡎ꋐﰸ");
    Test_CheckProps_SceneItem("と獍", 357930, SItemType(229639), vec3(0.458949734204891, 0.9626198042941372, 0.6205730822964446), 0.6832555316776295, true, false, MaybeOfString("ꃈ䮣ᬬ컵嶐녰ॐ"), "㻗﬽팊�슍郫홟㕤㫛");
    Test_CheckProps_SceneItem("䝛튟뿎ວ扚듍꩐瘁쪟怢", 132029, SItemType(623932), vec3(0.4407369892302607, 0.8152071339149062, 0.8635612064337177), 0.9629957619882169, false, false, MaybeOfString("흰姺㼙光"), "Ժ蕧枪");
    Test_CheckProps_SceneItem("돖꺭齶褱炋", 573283, SItemType(272553), vec3(0.9861878482560571, 0.27362316813022974, 0.06394881432128549), 0.8732161027720273, true, false, MaybeOfString("轁竁怒"), "홅惗酁଱᮷㈾នﯸ");
    Test_CheckProps_SceneItem("샱镧畉弐狝פ뤫", 143921, SItemType(645157), vec3(0.08536131590854437, 0.4760802213456855, 0.868364577586001), 0.8265246538568869, true, false, MaybeOfString(), "ॡ弨犳㮲");
    Test_CheckProps_SceneItem("屨蜍蕠俠尉紸?", 893367, SItemType(620249), vec3(0.44137227695499187, 0.4811808944126502, 0.08295419303837893), 0.2818521555894297, true, false, MaybeOfString("퇪㷗뚪䬹"), "쯰㗟豺댜￰귥ጢ䨣뉐");
    Test_CheckProps_SceneItem("琷᯵テ䪮", 133511, SItemType(930210), vec3(0.8830392774581161, 0.18896218072109025, 0.39342558774790987), 0.04654617935723913, false, true, MaybeOfString(""), "䉳诲뺔풓䢝୙簉矈圙枩");
    Test_CheckProps_SceneItem("鲶헞雟❢�䖗�쁰ꢚﲆ", 895579, SItemType(267089), vec3(0.8709019896904482, 0.30994434762277845, 0.3236040991375242), 0.6934694674301285, true, false, MaybeOfString("ꭢធ沈"), "ꏛ");
    Test_CheckProps_SceneItem("犌郉鷪䈥⏀淓둬ਈ", 753475, SItemType(684210), vec3(0.7732156090313641, 0.8906635529783851, 0.22036581962386417), 0.27847906354743945, true, false, MaybeOfString("㹒稃⤳늽趽ማ鐆ᒓ"), "㣇ꨒꋙ켍Ⰼᜤ");
    Test_CheckProps_SceneItem("챆맰", 245770, SItemType(837965), vec3(0.9771046787393767, 0.8199474284518266, 0.6823187981184193), 0.21070397422216086, false, false, MaybeOfString("ᡶ⛥杭貴溪৥"), "⦥๤즿ㄨ穂");
    Test_CheckProps_SceneItem("", 307209, SItemType(349405), vec3(0.4926422110258798, 0.33216843024462855, 0.10229633846427144), 0.9465540088464292, true, true, MaybeOfString(""), "㧝䅴헜");
    Test_CheckProps_SceneItem("", 324005, SItemType(106890), vec3(0.30441701193545806, 0.51358313649594, 0.1715817955190231), 0.4248514987644048, true, true, MaybeOfString("趣馸揉᪥溊䷡꬈"), "膎");
    Test_CheckProps_SceneItem("䔐炒悄௶揸ꥒ叵﨑밍뇘", 534976, SItemType(802517), vec3(0.6094296917363208, 0.780649803942372, 0.7466861022388033), 0.2848411692701472, false, false, MaybeOfString("捣嶟廌"), "씼旝吾");
    Test_CheckProps_SceneItem("", 583163, SItemType(934111), vec3(0.8361729811114134, 0.9059712290326, 0.1371966326316803), 0.6186537638393481, true, false, MaybeOfString("꤫睊�澎"), "�ࠫ⿳훿");
    Test_CheckProps_SceneItem("铟Ꙓ鐻ų", 284881, SItemType(92853), vec3(0.05758472907244448, 0.6724570559675139, 0.17454860786653525), 0.6358503255228747, true, false, MaybeOfString("痿䲥ꂵ꛽빗�厷ア"), "匶⨏쟹膗堳뾒뮦놘蘜뗌");
    Test_CheckProps_SceneItem("Ϡᱮዖ", 963317, SItemType(113599), vec3(0.16459582707127363, 0.2051685574488568, 0.6914366137662141), 0.33678310892394886, false, true, MaybeOfString("㷀뵌慔駐"), "⇐춻嶻");
    Test_CheckProps_SceneItem("⃙㾥괶됼", 961253, SItemType(905806), vec3(0.46333944399996635, 0.8583013223755646, 0.0631323908749653), 0.46363992544991894, true, false, MaybeOfString("뼧"), "໵㘦恿땊₏텿霈");
    Test_CheckProps_SceneItem("罻�ꨯꧼ", 629387, SItemType(861971), vec3(0.9507541451373855, 0.8533399267370533, 0.5716035242991538), 0.8737214444548457, true, true, MaybeOfString("ᢦ폛⶯"), "￨℈⩝ꝶ擆⷗륶");
    Test_CheckProps_SceneItem("륍虋陱濣", 833786, SItemType(120825), vec3(0.917988872583019, 0.24086845491121917, 0.961187019460456), 0.45861637567105534, false, true, MaybeOfString("貆"), "蓸�");
    Test_CheckProps_SceneItem("η㝯ӧ㛏図䋘䮢", 439306, SItemType(861730), vec3(0.7300101745547775, 0.3211359336604997, 0.5526537259820168), 0.14800687793083808, true, true, MaybeOfString("砹罜䖈줍"), "");
    Test_CheckProps_SceneItem("뗔ゃ諪ﰞပ꙳㜢㠱뮄", 687975, SItemType(193210), vec3(0.29484725477865303, 0.5718354203607121, 0.06757623193207021), 0.9722915929613131, true, true, MaybeOfString("䟪"), "塀豽");
    Test_CheckProps_SceneItem("鬅为", 614806, SItemType(976532), vec3(0.4791183227110274, 0.5205555840025449, 0.738595386845337), 0.7379184112595014, true, true, MaybeOfString("쪺⾉輖쀠껲﹍룦蟄缰ᓵ"), "览Ⱳ");
    Test_CheckProps_SceneItem("嘁�Ȩ㘅驹劣灤", 429408, SItemType(429967), vec3(0.557355052119752, 0.08572087254641618, 0.832238688055537), 0.9937111288279813, true, false, MaybeOfString("灰㩈㉡㘬䑰끰"), "粓䞎⨞");
    Test_CheckProps_SceneItem("", 346080, SItemType(963810), vec3(0.40155805153844787, 0.6087058124172994, 0.8382711954593058), 0.18887601615343058, true, false, MaybeOfString("ݹ話亢൓⾽㖉"), "⊲ǫ礳惴");
    Test_CheckProps_SceneItem("", 88502, SItemType(327820), vec3(0.4287193098239225, 0.7098045105625896, 0.9735293667640208), 0.236063066048577, true, false, MaybeOfString(""), "퇷慉炷軫锸뺢鰸ꆕ⺕");
    Test_CheckProps_SceneItem("⬟⬆餽ﭝﬂ冺惼ᆵ춳", 587979, SItemType(212632), vec3(0.1578725805309939, 0.667334811607066, 0.918691084682332), 0.13734870084437947, false, false, MaybeOfString("嵎"), "̐Ⲯ䈭");
  }
  
  bool unitTestResults_SceneItem_Getters = runAsync(Tests_RegisterAll_SceneItem_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_SceneItem_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_SceneItem', UnitTest_OpEqSimple_SceneItem);
  }
  
  SceneItem@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in name, uint ver, SItemType type, vec3 pos, float angle, bool tt, bool carSync, MaybeOfString@ attachedTo, const string &in skinZip) {
    SceneItem@ o1 = SceneItem(name, ver, type, pos, angle, tt, carSync, attachedTo, skinZip);
    SceneItem@ o2 = SceneItem(name, ver, type, pos, angle, tt, carSync, attachedTo, skinZip);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_SceneItem() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", 393455, SItemType(392207), vec3(0.2626739783504391, 0.5356089540457395, 0.3798207418899148), 0.3270317680793962, true, false, MaybeOfString("ᠺ먲梏뼂"), "꟢펫");
    OpEqSimple_Check("珱姢抳滛", 26686, SItemType(665920), vec3(0.77638134582731, 0.7039444300830106, 0.10158453700206453), 0.5871856266573005, true, false, MaybeOfString("麑遬徨"), "ꩣ釪");
    OpEqSimple_Check("勑뤋펍캒ᨶ롆", 526999, SItemType(962771), vec3(0.6620740297539505, 0.9754902529416095, 0.8899997444311155), 0.17766343437957738, false, true, MaybeOfString("詘렰佹膴ᳲ풜ᬃ"), "﩯ᘞ쉓㻇娍쪁ᆬ鬹");
    OpEqSimple_Check("嗣ᮌ曄ꚉ桀楫뇊", 533671, SItemType(142480), vec3(0.5804051144888648, 0.7352814919945232, 0.7729000676297118), 0.65916455381511, false, false, MaybeOfString(""), "");
    OpEqSimple_Check("ᬤ쿊", 131073, SItemType(236713), vec3(0.8204600735662785, 0.42821111782836313, 0.1788686929172225), 0.17067580724632173, false, true, MaybeOfString("䎕"), "");
    OpEqSimple_Check("Ŧ⃡釄Ἂ떋雄忙凌", 32507, SItemType(966222), vec3(0.9283513892108348, 0.4499085962073452, 0.5378475247592887), 0.43786765562271124, true, false, MaybeOfString("䝕"), "鎤쎣");
    OpEqSimple_Check("摃䍎␷윸ຯ", 471876, SItemType(690858), vec3(0.47744451857984277, 0.7243563675900718, 0.40621994035608133), 0.6427409284015843, false, false, MaybeOfString("㾢笏㶆ʱ䄔鍚뵭"), "");
    OpEqSimple_Check("ꔬ", 348129, SItemType(716312), vec3(0.7604992686586917, 0.060197423705923105, 0.7898397086140885), 0.3525745106640153, true, true, MaybeOfString(), "鱦ࠡ");
    OpEqSimple_Check("셑燵㪆汀ᆣ젙娣ʱ", 840953, SItemType(20188), vec3(0.632037924431282, 0.10265022241633862, 0.028886259081254834), 0.3686121112520863, true, true, MaybeOfString("⥠渠ᐢ"), "慹﮽ꫤⅥȩ매㘆");
    OpEqSimple_Check("ޜ", 939833, SItemType(616710), vec3(0.2892151760352846, 0.7057623992235225, 0.856772918653103), 0.2855563039358502, true, false, MaybeOfString("㽤᪮壐辡�㏊뻹媋痰碩"), "ꮸ");
    OpEqSimple_Check("鏡螫⃠嚅⒝ࣾ惝�嬅糓", 689395, SItemType(114882), vec3(0.7347940764086294, 0.24486232094693106, 0.7490944293090582), 0.5371971775485189, true, true, MaybeOfString("㑭畼〭⤓ﲁ들≱髀"), "͓墳룠డ㫠瀚䊠");
    OpEqSimple_Check("奟㜫䞞", 544378, SItemType(470200), vec3(0.9435282153745779, 0.05048434624936634, 0.9298778031626147), 0.13143646257530733, false, false, MaybeOfString("괗饖㪟믢汢ꏠ⮶䋧館"), "汆講㓤통�ﭝ豲氹φ");
    OpEqSimple_Check("뛰�둕", 984599, SItemType(716978), vec3(0.35041650494114335, 0.9551100139297126, 0.11548240115655697), 0.4509862281619507, false, true, MaybeOfString("䒠ბ썊䯲⏔銄"), "侮ꀵٽ");
    OpEqSimple_Check("ЊЫᯱ睟娬", 819938, SItemType(501726), vec3(0.45672455777261617, 0.551128241955828, 0.5113674497750437), 0.21816809113052119, true, false, MaybeOfString("곢歒愪"), "�⧙");
    OpEqSimple_Check("ꃢ｡뫇묯릕⛲", 304399, SItemType(29411), vec3(0.11376878205396644, 0.732878527013994, 0.7793774925076298), 0.33094083579766603, false, true, MaybeOfString("绰"), "ώᘢ");
    OpEqSimple_Check("ꨉ�툱ฃ爯䑫ⵙස銰ၧ", 929569, SItemType(511824), vec3(0.390992151289709, 0.5821349055423098, 0.23402543283720753), 0.6416684848450444, false, true, MaybeOfString("粄⅝挝㠊"), "共䳶넊ᙓࡀ컒");
    OpEqSimple_Check("", 475985, SItemType(789265), vec3(0.5926895577426485, 0.7176417953882561, 0.28710518651041445), 0.8544580442153188, false, false, MaybeOfString("굩ᱟ骲盼ﰢ࿏꘰଒嬋"), "é췍砟");
    OpEqSimple_Check("脫㕿덖揙�", 151322, SItemType(728610), vec3(0.32301038332423676, 0.034213444233971387, 0.5171666180329242), 0.14981906728344926, false, false, MaybeOfString("⭷혀ⴿ㓶ࣛ"), "洂賥");
    OpEqSimple_Check("룎", 690603, SItemType(578377), vec3(0.9515389906948148, 0.7386198294063191, 0.9177852724295972), 0.41288544908765956, true, true, MaybeOfString("퇎赊ﴋ鎘"), "팲薾ꔲ昽꜓");
    OpEqSimple_Check("㉻�냀㛛", 753465, SItemType(497496), vec3(0.6725445886480363, 0.39983862936489223, 0.6104780727114892), 0.38704785629503796, true, true, MaybeOfString("᣾킯䠧◐"), "멖�");
    OpEqSimple_Check("녮ง", 609845, SItemType(263480), vec3(0.20069722561198158, 0.8557775159626163, 0.2364730314521459), 0.7897012265351141, false, true, MaybeOfString("쎑"), "");
    OpEqSimple_Check("栭", 582502, SItemType(171082), vec3(0.9738493822393237, 0.6835300743968832, 0.6802212119476038), 0.9581219227789538, false, true, MaybeOfString("㝳䵉貟↟ڹ錠쟓"), "罚");
    OpEqSimple_Check("", 978412, SItemType(15728), vec3(0.006296610928278701, 0.9437061189411702, 0.6380674092276336), 0.15191082710023543, false, true, MaybeOfString("䀡"), "૰");
    OpEqSimple_Check("旌佌糏ꕤ�", 291997, SItemType(33842), vec3(0.903661691538832, 0.6535122709597984, 0.6908315004272533), 0.12735712394460902, false, false, MaybeOfString("浉ㆠ㌔Ú銼磃"), "");
    OpEqSimple_Check("㹪쉰龊〢ᔖ̉", 323966, SItemType(493150), vec3(0.8948376960562717, 0.7104263322942082, 0.9894861737217224), 0.4870917212623599, true, false, MaybeOfString(""), "Ô聈");
    OpEqSimple_Check("좢統佩諾訲꼟", 213556, SItemType(236951), vec3(0.7142417597185083, 0.16398337211645364, 0.6413554333342963), 0.8681224798169558, true, false, MaybeOfString("숬勯ﵜ쳮쬤"), "䷗넱�㙫姦䟧ఊꪫ");
    OpEqSimple_Check("圦긡", 1447, SItemType(703199), vec3(0.6369774032556347, 0.5362325527408311, 0.48155335266215415), 0.06188635484403295, true, false, MaybeOfString("⧙㐈狀"), "䊀덒턗屷硷ﵜ⫌");
    OpEqSimple_Check("姡�럴咨ᮭ岾＄ꤻ�鳛", 292877, SItemType(851901), vec3(0.2840913069826045, 0.3714793573000838, 0.6800562323443854), 0.9943914958249738, true, false, MaybeOfString("ө㩣�轏"), "⹳ꈰ뗵丷");
    OpEqSimple_Check("", 138540, SItemType(801560), vec3(0.30656014303982265, 0.9646646752788987, 0.328540387716396), 0.9730554581494328, true, false, MaybeOfString("䝈⊻弋ꑓ踠䦺"), "陉磹褼䅷");
    OpEqSimple_Check("嫲�쓋쾙樂⏭⾗", 410482, SItemType(35384), vec3(0.8554739560258919, 0.5833313258287177, 0.9864290780324624), 0.9180257049938784, true, false, MaybeOfString("�∁衽縰"), "迒䌡");
    OpEqSimple_Check("癓簡枌녑埖韠", 445761, SItemType(857000), vec3(0.5477674931975861, 0.2846641406811141, 0.022734818059361922), 0.43240254345927503, false, false, MaybeOfString("窟w䏭"), "ཱིՋ");
    OpEqSimple_Check("礊튵ర", 812180, SItemType(101815), vec3(0.12668943271352417, 0.42560651452541653, 0.45206265638212795), 0.5164862216992705, true, false, MaybeOfString("䷫킹륦"), "䂃堮㹺暮");
    OpEqSimple_Check("ṱ帮—뜔愄츿첣⦝脘", 255600, SItemType(512834), vec3(0.30360926003363414, 0.5225910835538949, 0.9941942300620462), 0.7496793250318986, false, true, MaybeOfString("歓퐍⟳庶✨"), "⯈퀍낼민翍쵓㩌찚࿋");
    OpEqSimple_Check("礚쑲∆ⴝ䨥踯龂Ƞ�", 479567, SItemType(126660), vec3(0.4969560189624112, 0.5639913345519413, 0.4257101567581809), 0.4549768741498594, true, true, MaybeOfString("쎙竗硨ɯ䃟偶"), "갎");
    OpEqSimple_Check("扁拚ꑧ⩱ꛏ�암", 443493, SItemType(24041), vec3(0.1790038804425876, 0.6963128441461888, 0.7172997806767466), 0.7777130472370019, false, true, MaybeOfString("揧�ᜯ㧳西"), "斍⏀쌛Ⓛ薚懙룙㎐꟡");
    OpEqSimple_Check("", 695104, SItemType(240354), vec3(0.8860367955109276, 0.8821561079854873, 0.5574885674554336), 0.5306396412340177, false, true, MaybeOfString("㡐沁祿⑝낤햳釽"), "ￏ墥ℓ�ⷀ");
    OpEqSimple_Check("", 354149, SItemType(951957), vec3(0.4465370916046841, 0.7919488497040927, 0.16292406626181866), 0.507602524248698, true, false, MaybeOfString("댶㍙럈鈩⥁岳뗭蜢穽"), "뼄쳌食ꆔ뾘�浹");
    OpEqSimple_Check("ﱐ윍㌌ࡍ埔", 383038, SItemType(607898), vec3(0.32186303861525983, 0.6507369972070386, 0.7255921809587591), 0.06016706026167006, true, false, MaybeOfString("븥ꖙ∴"), "綽ケ摓릺칻啗");
    OpEqSimple_Check("꺥", 849529, SItemType(225780), vec3(0.3240078619327433, 0.18350335545069693, 0.890470960592139), 0.9237387431430345, false, false, MaybeOfString("ꋧ힂"), "踼㛃踟괮");
    OpEqSimple_Check("ᾓ瞀鵰삫ᾄ龲尬度ⶰ", 798238, SItemType(877000), vec3(0.13012653548742018, 0.3379945132592667, 0.3331495380649108), 0.46135193130995705, false, false, MaybeOfString("㾑ໞ탬鏩Ⓜ恇闥媰"), "근邺㣿䟫랴ퟭ씤�房");
    OpEqSimple_Check("海Ⴗ״", 102070, SItemType(771852), vec3(0.2028660239665145, 0.5458428876222311, 0.3820284127174078), 0.8935102819900542, false, true, MaybeOfString("⒲"), "");
    OpEqSimple_Check("鑽", 108210, SItemType(759338), vec3(0.05335546566795347, 0.521683257781753, 0.17253638299765828), 0.5037436799629329, true, false, MaybeOfString("ⳡ늵꜀㏔绨ᵬﴗ"), "獽ᗒ攅樘");
  }
  
  bool unitTestResults_SceneItem_OpEq = runAsync(Tests_RegisterAll_SceneItem_OpEq);
}
#endif