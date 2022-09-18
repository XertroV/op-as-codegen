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
  
  bool Test_ToJsonFromJson_Check(const string &in uid, const string &in name, SItemType type, bool visible, vec3 pos, float angle, bool tt, bool carSync, MaybeOfString@ attachedTo, const string &in skinZip, const string &in skinUrl, uint ver) {
    SceneItem@ tmp = SceneItem(uid, name, type, visible, pos, angle, tt, carSync, attachedTo, skinZip, skinUrl, ver);
    assert(tmp == SceneItem(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_SceneItem() {
    Test_ToJsonFromJson_Check("", "ꠂ쮰", SItemType(355425), true, vec3(0.8572257383993015, 0.14361827268433677, 0.597640745620076), 0.7164318266866877, false, false, MaybeOfString("䃧쁐욘ᱶ谛䆳ꔼ躜ಙ㟊"), "�ᲁ澯�჌江䚏", "汯粌鉅", 259935);
    Test_ToJsonFromJson_Check("", "䢕颒饣ퟶ䳟框雱", SItemType(292599), false, vec3(0.0258695301720265, 0.7480909338910556, 0.0974698551453044), 0.9673777189885162, true, true, MaybeOfString(), "ｓ褨堉⍴ᲊ̇॑䎞ꦻ", "摂ꖶ鍁紙", 957341);
    Test_ToJsonFromJson_Check("客㒞᫯볠箢暂遐", "澵z懇", SItemType(553541), true, vec3(0.021718975166659327, 0.3966502698122758, 0.7051741083642348), 0.4593848499745991, false, true, MaybeOfString("扬껰"), "㌴", "ஷࣅ", 425743);
    Test_ToJsonFromJson_Check("", "", SItemType(796389), true, vec3(0.08330126762543864, 0.03548954754857791, 0.11594971740429742), 0.008808822840828831, true, true, MaybeOfString("᯿쨄봌"), "炤䩦ᛥ婫囼", "䦋쁗缧ⱊﱻ狀ꆟ", 700350);
    Test_ToJsonFromJson_Check("ᵒ㪗羘렷뵫", "�常", SItemType(158796), true, vec3(0.12395391339620292, 0.379353548111093, 0.7751208705711742), 0.8595433411465694, true, true, MaybeOfString(), "", "놪☼앇炄㐕畍鞙栥", 814563);
    Test_ToJsonFromJson_Check("엣ᩁ㟅ഽ", "", SItemType(19141), false, vec3(0.9616670277722492, 0.6290975942411915, 0.16997161655219814), 0.6999025911557966, false, true, MaybeOfString("銗䔜῏"), "꨻በ↥鿊坯켫ꗥ", "鶳ᄶ窐踎윉懜翊", 555417);
    Test_ToJsonFromJson_Check("躀퓹ꔴ㳇୭鹥灦㣋충왦", "ꧾ큽ⷾ뮁d更든Η", SItemType(147453), true, vec3(0.0049169575818427645, 0.3464594331320652, 0.9432967179190818), 0.8758706719967866, true, false, MaybeOfString("ᣙ욗"), "趀絀죤箖", "", 123025);
    Test_ToJsonFromJson_Check("", "坖澂ꉃ뒅Ὄ㜣뗃㷦", SItemType(361688), true, vec3(0.2452047216916479, 0.2771207775348429, 0.8970523843993676), 0.6156473418770578, false, false, MaybeOfString("瀀⼸៯ꭍ"), "퍂蘇賻ᜳ벛ﳾ啃둸", "饤浏", 617347);
    Test_ToJsonFromJson_Check("홭", "澀⽹ᱶ爅螝", SItemType(454929), true, vec3(0.8471339469995042, 0.0027556130675392286, 0.016198383186104885), 0.912154776468945, false, true, MaybeOfString("ᖦﭭ见禁䡼淣럸"), "੉Ⱬꖗ", "쎧ᨘ퉁", 554346);
    Test_ToJsonFromJson_Check("엽뷗뢑", "ｽ≨⢮舊┛輄虼", SItemType(776724), false, vec3(0.46440129376221506, 0.11485119588433355, 0.9820765326647445), 0.8163082598784511, true, false, MaybeOfString("쒜≁隵ꄻ�ঽ㎒�郁❨"), "ᘭ☖甩ῶ", "ꨝꮄ轓᧦㗭再섚", 35974);
    Test_ToJsonFromJson_Check("좣㉒㇜ꗸ롼ᬁ籕ￌ", "㏲ᔲ", SItemType(798815), true, vec3(0.9074731422157367, 0.6360478958282842, 0.6679795271102243), 0.03975313764054009, false, true, MaybeOfString("淐꺒Ｅ澮촎"), "딙授↳웡", "턜㧷わ銂⧼馣谱", 44570);
    Test_ToJsonFromJson_Check("䴨餶", "겶຾", SItemType(532804), false, vec3(0.771778634643079, 0.5264728560701352, 0.3712353614956305), 0.9021347555807487, false, true, MaybeOfString("熷颤"), "ź恮뺪髷漻拹ⓨ淪", "☰�ꢶ嗲聅䄳ㆳ", 844727);
    Test_ToJsonFromJson_Check("求뺝숯䐪䈞䞞", "蜵来৷몖괩퉧", SItemType(256248), false, vec3(0.7420853119073832, 0.20009108129893013, 0.5965853806569172), 0.7729096900545571, true, false, MaybeOfString(), "؏", "▝ħ蔋팪絠촊枤ŀ", 308745);
    Test_ToJsonFromJson_Check("쑋㵗髍", "穏뫤࡙", SItemType(801176), true, vec3(0.017425127335556376, 0.12832161464184597, 0.21266037654721195), 0.32903631046835163, false, false, MaybeOfString(" 讈䗺⼎Ԍ臋뽦殠齒"), "ᒢ湾", "৹", 992957);
    Test_ToJsonFromJson_Check("춤ᴼ馿ꞑ", "哻咷㟞曘靳", SItemType(863576), true, vec3(0.31177964401979913, 0.9151964797243459, 0.44927277390345594), 0.8460690937219509, false, false, MaybeOfString("䐁ߠɯ밥�틭姻韷ሸ蜰"), "꺗⯒", "靮垆规☉᡽햅𤋮柅", 424004);
    Test_ToJsonFromJson_Check("왪噧㉊㚨줫⧑㙵覆", "轔렫炙띤䮔췬鼋탐缜檜", SItemType(507600), false, vec3(0.08829175871251699, 0.9314848119073942, 0.7033555818271616), 0.6772903789194722, true, true, MaybeOfString("疁꼵"), "答㺳萵ꊕᑑ球⍗ꦘ", "嚄譵ʢᖀ㨎乕", 403766);
    Test_ToJsonFromJson_Check("䎫쉑", "맆晝劬瘪剈", SItemType(935263), true, vec3(0.39902903763532127, 0.530675694593543, 0.24645372491630432), 0.5677554349264854, true, false, MaybeOfString("⇝䱓䎸帍"), "䥮䒸龅鑭嵿釄⅟", "秇⋽吢ↈ種祶", 662721);
    Test_ToJsonFromJson_Check("봒❖耾㾃", "⍣�浥Ԉ", SItemType(379745), false, vec3(0.8259118100748918, 0.5889841251023971, 0.8527028178110266), 0.8177185560659126, true, true, MaybeOfString("ማ"), "澃軬ꇈ퉿", "꼭", 181844);
    Test_ToJsonFromJson_Check("䦳�榺骽䭄궉쎟鷬", "쳷계쳣㪏汄ガ", SItemType(116611), true, vec3(0.8905570595015572, 0.07981919966629669, 0.9525870918075494), 0.33150864221691556, true, false, MaybeOfString("댍〱둫"), "妙薐㨵䓸뷐", "淮듑箩厈䃐᲎暓煆펾", 892962);
    Test_ToJsonFromJson_Check("䬼덃耕굗ご䎽붏", "ꓩꦼ�୹౺삯Ϩ죂갗", SItemType(176502), false, vec3(0.30397951523958683, 0.39518013009577063, 0.7400598529447149), 0.42916149433197526, true, true, MaybeOfString(), "⊐檢䩬媴白", "闞ꩍ㨧㞆豽몗䎇㤴", 472287);
    Test_ToJsonFromJson_Check("㜆⏰‖馞褗", "阈熲", SItemType(302662), false, vec3(0.33483721098622177, 0.9270115159112082, 0.7728845499329663), 0.9101098142145713, false, true, MaybeOfString("뎝⺧䛙픮"), "温膀璠", "襶喩ᓅ䍕", 849459);
    Test_ToJsonFromJson_Check("͢떳窖鬦歾䙖ᲀ", "浸酒袑橒", SItemType(333832), true, vec3(0.7043700668515498, 0.6474969911610228, 0.3272603337314261), 0.18356954966837985, true, true, MaybeOfString("뽶婯맕赕"), "踉弹", "顯얮", 852641);
    Test_ToJsonFromJson_Check("볶烓", "Ŧ묓买嗒쫑鋋�狫ꙡ", SItemType(769500), false, vec3(0.24405862588624405, 0.9539301548869955, 0.16250655016047252), 0.353682796169856, false, false, MaybeOfString("㽗ⷻ찄䛉笘ꚠ"), "", "騀♖쥁", 462708);
    Test_ToJsonFromJson_Check("裂ꦍꜚ䪗", "㩵㈰㽇䙃珍㉡�郺黋▘", SItemType(621484), true, vec3(0.4218845839714094, 0.7907528839031015, 0.4324588866124204), 0.22291566814431718, true, false, MaybeOfString("亦釪挨⎈汼듿쩷ﾪ蛻"), "鮕", "ꌋ뀀ᵧ塻", 84621);
    Test_ToJsonFromJson_Check("윊䰟", "柬઒궅抈⽊얳礞䛜꜠", SItemType(814349), true, vec3(0.09778065984034011, 0.9702311530570644, 0.02798921755887066), 0.0675207842455808, true, true, MaybeOfString(""), "", "", 536447);
    Test_ToJsonFromJson_Check("", "宕助鵒㼅ရ", SItemType(676304), false, vec3(0.22705115109079105, 0.9861143035749506, 0.7235478664392363), 0.379060888373787, false, true, MaybeOfString("䔂旓"), "", "", 627628);
    Test_ToJsonFromJson_Check("䅏᷄ꘖ蚜", "⾤ᐺ罦ᘪꮚ", SItemType(55990), true, vec3(0.5259973008772346, 0.41571064499007104, 0.7685443157183678), 0.4026640413341411, false, false, MaybeOfString("䋛頹㱭汦陚＝ⶇ�髀"), "雛깵黌壀唑", "걗�埈㩜ﾴ连㻰쮛䣔搵", 519051);
    Test_ToJsonFromJson_Check("娐j⏣ꄺ", "�롴ퟌ驠ૉ", SItemType(681251), false, vec3(0.505503264491215, 0.14808025543954234, 0.9820103221489165), 0.6202604503465167, false, true, MaybeOfString("麏揅שּ㰄⅝Ҥ"), "兓꽻뺿쭠", "떜", 615506);
    Test_ToJsonFromJson_Check("뷞ᠮ裡", "䦵೿緋빢毗咫㌊㧱疦鹰", SItemType(823493), false, vec3(0.9534667935005701, 0.795589066015365, 0.879805627688675), 0.09745416003160838, true, true, MaybeOfString("곑凋�蔐鴁⅘"), "냢", "ﱛಃ", 582937);
    Test_ToJsonFromJson_Check("恎ȟ㰧໾趀㍟㤒居", "䜷ꄀ罫", SItemType(135482), false, vec3(0.6736502450302477, 0.7709778550877133, 0.8720429390073022), 0.38470882148701174, true, false, MaybeOfString("Ⱕ"), "୊䥌", "琜䰶", 264554);
    Test_ToJsonFromJson_Check("", "瀨", SItemType(854347), true, vec3(0.39116459497770506, 0.9061641688021664, 0.4505922493760438), 0.5384696310099538, true, false, MaybeOfString("篦䙸䜋�셨"), "尊䉸䅐⮱苸", "", 195022);
    Test_ToJsonFromJson_Check("", "ؤ�㇨璧頒⹜遛", SItemType(315557), false, vec3(0.2364576837217704, 0.04885093357826161, 0.0834147562661277), 0.5136997222498524, false, false, MaybeOfString("躙腬"), "", "", 700426);
    Test_ToJsonFromJson_Check("Ⅲꂐ硘우梨杯ꤎ", "थに", SItemType(732290), true, vec3(0.24452667555051236, 0.5471554987817795, 0.7430816952805416), 0.29651288701990286, false, true, MaybeOfString("励돠"), "埈핹", "폺뮾眲餻Ჩ栬飒홟", 899755);
    Test_ToJsonFromJson_Check("뱏熫鏵밃", "䍅Ꝙ袘䯞髟", SItemType(587688), false, vec3(0.6846167122407895, 0.13331657514596199, 0.32439887073095836), 0.057889054090664284, true, false, MaybeOfString("⠔軙壑䘴"), "诘䒂厍盌퉃瀍", "ᄯ⫼䇤屴", 818382);
    Test_ToJsonFromJson_Check("폒", "뀧›䢬䟼ⶲ᝹糀", SItemType(49936), false, vec3(0.5846459896232216, 0.44656510252811255, 0.1440641345195771), 0.1198373945056635, false, false, MaybeOfString("ခ툎妊"), "툾ਫ਼騩ࡷ飵鍃", "", 402655);
    Test_ToJsonFromJson_Check("짫帐", "嬔䅒帆櫊䦚", SItemType(289997), true, vec3(0.8937702108611214, 0.1818484771912212, 0.007842497438119024), 0.5651938354434417, true, true, MaybeOfString("邝פᜃ梑蠰鸀臐ᙙᰪ"), "", "", 28880);
    Test_ToJsonFromJson_Check("覞잰聡ﳆ⠧뚇မͿ", "ּㄯ닢砐ᤌ�媓", SItemType(650221), false, vec3(0.5422208847208977, 0.544326362453553, 0.1778419954599077), 0.6109628452039151, false, true, MaybeOfString("䆖ើ銨〘ほ跱倭䗷"), "뽟몦呻", "", 20018);
    Test_ToJsonFromJson_Check("輂䥻扩唃쟚", "馤", SItemType(973202), true, vec3(0.7749315755325051, 0.7220825295532507, 0.6457840649624281), 0.6425998013664967, false, false, MaybeOfString("臘톸ୠ앧茾⷗"), "紶忿뾙乜ꩰ", "ꪓ춒ⷸ䢎�殶", 616253);
    Test_ToJsonFromJson_Check("춙K䱯㨯葄㿮쇴聇㻇", "줏气ቮꓛᦱ軽", SItemType(225732), false, vec3(0.4213824772375554, 0.553558734037708, 0.8336507341981171), 0.15459047730760206, true, false, MaybeOfString("쟍퐩㷬瘏�逊퉈䨽턋"), "ฑ舩쿋��", "ῷ筅", 95115);
    Test_ToJsonFromJson_Check("䫢틟", "쏯", SItemType(833935), false, vec3(0.8377770226624688, 0.3346609400281035, 0.41823609658434807), 0.674618223064867, true, true, MaybeOfString("ꑘ嗀嬺昍灙䒷�ﵺ䵴"), "쭗緞쐼ჲ쥟뽿", "㿥ᢧ맦䎀", 63877);
    Test_ToJsonFromJson_Check("쯜䨶堂ú", "஬麋�縣䉁ꨆ㏪㺢ḡ", SItemType(510), true, vec3(0.770501438887092, 0.8749565188190698, 0.02611991531500589), 0.8344321706492603, false, true, MaybeOfString("ꕠ�"), "閠쯨목楥ᾥ", "㣈Ꞑꮀ䅦䒵", 393537);
    Test_ToJsonFromJson_Check("컻㴃ϻ", "ḅ♁뚌ⶣޯ", SItemType(944209), false, vec3(0.7537132216401925, 0.4909217937341527, 0.2859053412852368), 0.9367291796657858, false, false, MaybeOfString("㿮"), "ἇ༽욎玓ꔊ", "筗鏖豺埞赱�暜窋ᖪ", 586919);
  }
  
  bool unitTestResults_SceneItem_ToFromJSONObject = runAsync(Tests_RegisterAll_SceneItem_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_SceneItem_Getters() {
    RegisterUnitTest('UnitTest_SceneItem_Getters', UnitTest_SceneItem_Getters);
  }
  
  bool Test_CheckProps_SceneItem(const string &in uid, const string &in name, SItemType type, bool visible, vec3 pos, float angle, bool tt, bool carSync, MaybeOfString@ attachedTo, const string &in skinZip, const string &in skinUrl, uint ver) {
    SceneItem@ tmp = SceneItem(uid, name, type, visible, pos, angle, tt, carSync, attachedTo, skinZip, skinUrl, ver);
    assert(uid == tmp.uid, 'field uid with value `' + uid + '`');
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(type == tmp.type, 'field type');
    assert(visible == tmp.visible, 'field visible with value `' + visible + '`');
    assert(pos.x == tmp.pos.x && pos.y == tmp.pos.y && pos.z == tmp.pos.z, 'field pos');
    assert(angle == tmp.angle, 'field angle with value `' + angle + '`');
    assert(tt == tmp.tt, 'field tt with value `' + tt + '`');
    assert(carSync == tmp.carSync, 'field carSync with value `' + carSync + '`');
    assert(attachedTo == tmp.attachedTo, 'field attachedTo');
    assert(skinZip == tmp.skinZip, 'field skinZip with value `' + skinZip + '`');
    assert(skinUrl == tmp.skinUrl, 'field skinUrl with value `' + skinUrl + '`');
    assert(ver == tmp.ver, 'field ver with value `' + ver + '`');
    return true;
  }
  
  void UnitTest_SceneItem_Getters() {
    Test_CheckProps_SceneItem("�￿躮䮠馩�", "㧖⢢羋⽪㎜৏렊", SItemType(252919), false, vec3(0.39542975667651264, 0.7897845319424683, 0.6891413948913764), 0.5442728016266007, false, true, MaybeOfString("�싺콠旱疍鰉橿"), "㘇힞", "ꂆऒ涮�뗗텓酞", 813542);
    Test_CheckProps_SceneItem("﶑䙢꺰ꦞ", "㬪●ꜛ귦翮漽똮", SItemType(36088), false, vec3(0.2440319174174368, 0.6646856570917581, 0.0413534762530371), 0.17365221035371173, true, false, MaybeOfString("۫芁≲彲"), "콬", "�拺윰", 321608);
    Test_CheckProps_SceneItem("ᄼﵰ㞪㷗᤾虝䰒", "那춴", SItemType(853156), false, vec3(0.20313925724622758, 0.7350865326519527, 0.3620176424095489), 0.9536167513363142, true, true, MaybeOfString("㼏嘿ꑙ尚豈젮훇懓"), "�㯂ᓭ褾㵹", "拣䵱", 433840);
    Test_CheckProps_SceneItem("ᇡ", "�뽥뤎", SItemType(502172), true, vec3(0.4918768953028493, 0.3896131638389142, 0.017031668227646346), 0.13565701671673777, true, true, MaybeOfString("揘䢊儞祹㚏풓"), "쿽騍큋", "뭷", 544625);
    Test_CheckProps_SceneItem("鈤ꦀ", "㎀꿈�ᴶ๏㕭∸缲䁏뤥", SItemType(985736), false, vec3(0.5480701390412032, 0.893681657916718, 0.9073092978947374), 0.7271186768669257, false, true, MaybeOfString("즫ᇁ﹀賊"), "겯ƴ皌撏랭", "珐瀮㍿웦쭜䢝䃙�׭", 585012);
    Test_CheckProps_SceneItem("阚⦈郶炼", "弊䮷⃷쨗蝢ᳳ쁼", SItemType(816997), true, vec3(0.32229246214138924, 0.3794400270001218, 0.949543322878677), 0.40573867662145696, true, true, MaybeOfString(), "過ଚ㩕ၪ㩾껫墰菌", "떌䱇盰쩑虿옡", 927946);
    Test_CheckProps_SceneItem("ꄻ滇�ꒉ㳀䈾뙱䕂", "ᤲ쯳枦섍鐷", SItemType(469141), false, vec3(0.8504115696299875, 0.21687760912667847, 0.8990701538971952), 0.01539877150924819, true, false, MaybeOfString("胊의䉶杻"), "≜蔗塚䌽ୣ筃", "", 395859);
    Test_CheckProps_SceneItem("秉ⵑ᠟Ꮍ⁭豹理癙⤊", "＠߇₹", SItemType(920965), true, vec3(0.4726727080869827, 0.3842920667418708, 0.1623536968428426), 0.9753003008548637, false, false, MaybeOfString("赪읝㆒刱❕騐"), "℃벷쨭욢璞�", "鶧ㆌ痒㇌⋛䨗ও�", 181358);
    Test_CheckProps_SceneItem("퍑", "", SItemType(970606), false, vec3(0.32724587355146456, 0.48556220274677603, 0.5730887896256004), 0.5689640173544008, true, true, MaybeOfString("К߄뽇㪢㸿ᓮₙ묇"), "ソ⿈鄠짭㦟茍", "龲ꇗ⡔辅", 865586);
    Test_CheckProps_SceneItem("颦蚕", "㒴퟽ᗦ㴟봨ￊￔ쥲兆", SItemType(346182), false, vec3(0.04951696891780802, 0.23360663151070785, 0.42570965337832906), 0.43067822532294237, true, true, MaybeOfString("ᔻἚ쫉䶶꣰䃹눭쯺튯"), "⁴", "嶹堠鷦耢", 418900);
    Test_CheckProps_SceneItem("큝", "鉚枛칸ힼ㼓럮", SItemType(107812), false, vec3(0.21403278886062688, 0.5767510913204174, 0.3519291278682319), 0.9709313274225831, false, false, MaybeOfString("⁮"), "ಟ킐", "뼊谥", 679739);
    Test_CheckProps_SceneItem("쌘㙛핺", "ॐ쮞覑甃縎貥็۟", SItemType(883796), false, vec3(0.0713440985751078, 0.8509823190285742, 0.7675218283047536), 0.04617409875903935, false, false, MaybeOfString(), "㻗﬽팊�슍郫홟㕤㫛", "䝛튟뿎ວ扚듍꩐瘁쪟怢", 132029);
    Test_CheckProps_SceneItem("Ü", "ȟ薲ꭉ", SItemType(680498), true, vec3(0.016380600173203554, 0.7079509607087593, 0.5008243725173289), 0.2932857839825031, true, true, MaybeOfString("䵌‱䘢먔᫣"), "귏毥᥃", "픭蚏ࣼ䪞㧯", 480081);
    Test_CheckProps_SceneItem("㈾នﯸ滣轁竁怒ৈ", "酁଱", SItemType(805260), false, vec3(0.7777776265413396, 0.10381077700472008, 0.050016794842675696), 0.3607038507986366, false, true, MaybeOfString("�淲ﺆ跏㜤샱镧畉弐"), "틖ꎀ", "袿칉谜訷໰胖�䞈䚴", 180139);
    Test_CheckProps_SceneItem("䬹칭烈罽췜", "䨣뉐㕋퇪㷗", SItemType(323729), false, vec3(0.5366260560865636, 0.4763533545082218, 0.05277546637355139), 0.5245373176990716, false, true, MaybeOfString("ꁄ枙꥞琷᯵テ䪮䅎"), "嵐䓸瀓䳻Ჵ", "", 147555);
    Test_CheckProps_SceneItem("ⵏ骗뱼扟킋泎ⲅ朓", "훃덙⋵隸꫍痈쎣", SItemType(666968), true, vec3(0.7116045838741607, 0.8648681896109451, 0.052380709933294314), 0.4692491900498277, true, false, MaybeOfString("v鬕绽"), "ធ", "鷪䈥⏀淓둬ਈ틑ꏛᐰ", 900907);
    Test_CheckProps_SceneItem("啕ኞ衍蛜", "䃿fྔ㐔ᡄ鷂", SItemType(409258), false, vec3(0.9416155707750542, 0.7252168826410625, 0.9441419667304223), 0.6768760442160424, true, true, MaybeOfString("᭥⶗褰씌"), "䮖揉筢㲸肅", "", 766638);
    Test_CheckProps_SceneItem("ᡶ⛥杭貴溪", "⦥๤즿ㄨ穂", SItemType(449432), true, vec3(0.868658179821753, 0.9989981758403583, 0.6409459899370307), 0.10388025040918973, true, false, MaybeOfString(), "菨뻟௎餵긽榈俍埯퐥", "फ़Ը㌲狊⵪诨⥇Ш啞", 594259);
    Test_CheckProps_SceneItem("揉᪥", "Ꜽ膎㠇趣", SItemType(375598), true, vec3(0.3971650849083276, 0.5558136098812397, 0.6787625773245295), 0.5483700323609496, true, true, MaybeOfString("쑥밃괦㮜䔐炒悄"), "䇶Ν曶됚简贙殺뱆ᩖ", "⏾齫ﾌ", 498609);
    Test_CheckProps_SceneItem("澎낭荸〈韴", "⊺�ࠫ⿳훿☸꤫睊�", SItemType(489560), false, vec3(0.2536126981739014, 0.13855355239405928, 0.11852761363542062), 0.4464377953887162, false, true, MaybeOfString("他�慺"), "", "탩뿛ၲႪ㣕ದ鴆", 760754);
    Test_CheckProps_SceneItem("齪床὏勐Ⰶ�䅴抭", "额禱", SItemType(437881), true, vec3(0.6914366137662141, 0.33678310892394886, 0.8574508679366908), 0.010846171998812897, false, false, MaybeOfString(), "헽⇐춻嶻㐙㷀뵌慔", "⃙㾥괶", 516520);
    Test_CheckProps_SceneItem("奨啈䂜絊앨⛳", "", SItemType(266898), true, vec3(0.4521545914244627, 0.9542826502371033, 0.177809595213183), 0.0469705355572377, true, false, MaybeOfString("㵉ꙙꌗ枚逳"), "", "龭컏�嚌솱挂ꁪ쥫�", 576372);
    Test_CheckProps_SceneItem("⶯", "⷗륶땣ᢦ", SItemType(163735), true, vec3(0.2452974506864778, 0.7532420869698944, 0.7487801237724628), 0.36535462055604656, true, false, MaybeOfString("륍虋陱濣"), "莻ጺ䭉胼ᑝ쨀", "蛫龆뇘", 653535);
    Test_CheckProps_SceneItem("ᘖ᮳➄䛳碸䀠", "큋詁棐숢", SItemType(153246), true, vec3(0.20166096892285207, 0.3766308749917107, 0.34896672486745134), 0.9727760767437407, false, false, MaybeOfString("꾋葍"), "䖈", "ပ꙳㜢㠱뮄ᢿ砹", 238728);
    Test_CheckProps_SceneItem("ꑆ个幚", "з", SItemType(979742), false, vec3(0.17677605905419963, 0.15714660527051735, 0.6237830131425444), 0.6298274037567095, true, true, MaybeOfString("󇸷"), "ڄ课幝", "�⥉嫾쀵ꑐ", 84793);
    Test_CheckProps_SceneItem("缰", "", SItemType(400651), true, vec3(0.41585583352290834, 0.7769399843071307, 0.6699824895104312), 0.7247511580236029, true, false, MaybeOfString(), "灤览Ⱳ斓쪺", "Ȩ㘅驹", 478706);
    Test_CheckProps_SceneItem("ઌ㳲嘁", "㵲�", SItemType(332001), false, vec3(0.01145687606719177, 0.03486463941394567, 0.9510091505716597), 0.1627072445874602, true, false, MaybeOfString("멫캿"), "罶㭹뱍᭲긞膐", "ĕ�뎿�ྊ", 830731);
    Test_CheckProps_SceneItem("礳惴瘿ݹ話亢", "", SItemType(54503), false, vec3(0.12553789193068532, 0.8395813861114818, 0.4330889873360698), 0.6385076994255686, true, true, MaybeOfString("줠딳"), "㓂䗻칦", "�⿎譟䏭哧唨", 623797);
    Test_CheckProps_SceneItem("赯", "絵橱꧵钖", SItemType(242168), true, vec3(0.1578725805309939, 0.667334811607066, 0.918691084682332), 0.13734870084437947, false, false, MaybeOfString("嵎"), "̐Ⲯ䈭", "꜔䤩", 772844);
    Test_CheckProps_SceneItem("䅕ℶ࠿ㆸ僥▦⼛傟", "偂忺紘票彣饽柿", SItemType(3143), true, vec3(0.1517317435479405, 0.24299280263622888, 0.5055760534040519), 0.6616738669861452, false, false, MaybeOfString(), "剠ﺯ�", "ㇱ팜锏▽ꇲ䱐敫뒦숾", 77868);
    Test_CheckProps_SceneItem("ꎥ띎", "穘覃᪯뺣幚쓼ሩ", SItemType(182271), false, vec3(0.6611951224790863, 0.5497571879763888, 0.32922080826443656), 0.8176357326179909, true, true, MaybeOfString("歿捺퇵�렡ڣ뢐಼"), "⫞떵�鷜™櫃諄垇疫", "욤츙촐㲃朓紸늹鷲", 388226);
    Test_CheckProps_SceneItem("묁폹╷䥾箉穘ꇠ䫧", "䃜鬲㋔", SItemType(953142), false, vec3(0.9004318406341746, 0.745379252240704, 0.20188491102395809), 0.18654003748043443, true, false, MaybeOfString("腪쓟"), "ǋ鯮镘嫊冠愃躊ꁸ", "췥뾴ⴾ愫팹룼崬銌", 647747);
    Test_CheckProps_SceneItem("ꓛꝘﺿю䗗ꕩ髽㱮䂗蓇", "�裹挬裀ǃ勵", SItemType(194759), true, vec3(0.401771874819776, 0.9301694254065721, 0.2083338006438379), 0.48089087870013475, true, false, MaybeOfString("擝ֈ胑苒ᒟ൒閪眧"), "⨚", "浃፛", 22511);
    Test_CheckProps_SceneItem("빃鞿춪�퓥", "쥒瓶", SItemType(908342), true, vec3(0.598684832732512, 0.11556083109023088, 0.23687755653489267), 0.31653149580421464, true, true, MaybeOfString("ඛ䈱렐ﴂ凘뭇⅖픻"), "됨㾕봠簜߲쫋侵", "뾆濾庰", 981241);
    Test_CheckProps_SceneItem("閊뺌", "킦﵌雫", SItemType(344417), true, vec3(0.7044213939013059, 0.12510500993817347, 0.9439347255713934), 0.6731380567295189, true, true, MaybeOfString(), "᧫垃배⒔ퟭ焿◰熇髾", "⏉碼恷阀衴猱", 583514);
    Test_CheckProps_SceneItem("", "뇆쟨", SItemType(850515), false, vec3(0.4274781087541385, 0.7957876710201556, 0.46666781393190276), 0.5220463068792812, false, true, MaybeOfString("∗楦鷞≦烛"), "�쒿뱴墆", "", 214250);
    Test_CheckProps_SceneItem("⾗", "߿栚䌒胐瘿냥�", SItemType(483076), true, vec3(0.3944322170663775, 0.6375500111084199, 0.1765862145352113), 0.9931618291852818, false, true, MaybeOfString("窺◫Ī "), "瘤", "㙬ͳ邊迬", 973286);
    Test_CheckProps_SceneItem("虋㖈ᘈ缥躒", "뢱⃹⑾⿚锔ﴫ", SItemType(376450), true, vec3(0.2996954365166349, 0.5984160944812075, 0.1432967023659948), 0.07511990893404927, true, false, MaybeOfString("몳덞帪㶩ꦿ㺕"), "藅끴", "쯢脹⣞阳␫幣䤁瀱", 635918);
    Test_CheckProps_SceneItem("㒴캹차쎉䥰", "㕆蔎椑豫鰏솞䡖딇␮", SItemType(615038), false, vec3(0.6431264647483483, 0.3575798675220366, 0.7377851562284795), 0.6272763049356995, true, false, MaybeOfString(""), "㯫", "콠距쥎洺툯", 983241);
    Test_CheckProps_SceneItem("鈛ⰻபY壂㖖", "", SItemType(68936), true, vec3(0.14666984702771058, 0.9001858746168138, 0.8723536282183386), 0.38198772742505543, false, true, MaybeOfString("䯻犖檣䗜띪鼖㛁귿"), "㶜⸉⁭䥉腪壋⣮坐", "樨", 94034);
    Test_CheckProps_SceneItem("螯ꢁ콧", "", SItemType(21914), false, vec3(0.5663724190398922, 0.3630394746377317, 0.2784802379452066), 0.5195658530665402, false, true, MaybeOfString("绅ⷊ睚혤薦䜾ຩ"), "ᾠ唏ࠔ㥳x", "", 269312);
    Test_CheckProps_SceneItem("醈�铙ឡ撨㱫㻃뤉�鐠", "⶯铊氓貥喅", SItemType(788000), false, vec3(0.620586185073753, 0.3157396951297949, 0.07082361032759008), 0.7264941231005332, false, true, MaybeOfString("┞弑쥶"), "鏉쫿뙡쀿蚺輂", "頌⛌", 148163);
  }
  
  bool unitTestResults_SceneItem_Getters = runAsync(Tests_RegisterAll_SceneItem_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_SceneItem_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_SceneItem', UnitTest_OpEqSimple_SceneItem);
  }
  
  SceneItem@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in uid, const string &in name, SItemType type, bool visible, vec3 pos, float angle, bool tt, bool carSync, MaybeOfString@ attachedTo, const string &in skinZip, const string &in skinUrl, uint ver) {
    SceneItem@ o1 = SceneItem(uid, name, type, visible, pos, angle, tt, carSync, attachedTo, skinZip, skinUrl, ver);
    SceneItem@ o2 = SceneItem(uid, name, type, visible, pos, angle, tt, carSync, attachedTo, skinZip, skinUrl, ver);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_SceneItem() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", "춗䵩첏㞟", SItemType(212987), false, vec3(0.2962178146914662, 0.7301329717646041, 0.24868004920365291), 0.03465510952968854, false, false, MaybeOfString("쭶퍉첯㚥涬凙"), "霋흽묌铱蝔ᔁ䀓", "਀ꩣ釪�麑遬徨탏", 414864);
    OpEqSimple_Check("勑뤋펍캒", "⇩㵣䎵甄壝", SItemType(591080), false, vec3(0.5286827434453567, 0.04470885081435966, 0.14093765995508883), 0.20178369209253402, true, true, MaybeOfString(), "쇳濶鵛獔楷璊诛퇟", "ݙ", 804528);
    OpEqSimple_Check("ᬤ쿊菆︐좙桭", "ﶇ䚱윲冥㶶밑幖", SItemType(214810), true, vec3(0.7456527895972378, 0.40580664826827434, 0.6927185578703501), 0.2175069596699937, true, true, MaybeOfString("ʊ冿�Ⓢꖠ"), "䝕뭀ꃲ썵㞫䫆ើ鹆", "鎤쎣", 288195);
    OpEqSimple_Check("", "는ꒋ㑶", SItemType(690858), true, vec3(0.7243563675900718, 0.40621994035608133, 0.6427409284015843), 0.7473548728727526, false, false, MaybeOfString("耏盧я␜"), "", "", 179642);
    OpEqSimple_Check("뮱", "똮ꨕẽ", SItemType(812991), false, vec3(0.963012987730565, 0.5999307421035742, 0.2568520816307757), 0.50683239917589, true, false, MaybeOfString("셑燵㪆汀ᆣ젙娣ʱ"), "ਮ虴簪䤀揾", "砍䀐硩钗쏥", 465852);
    OpEqSimple_Check("噦颤픽鳐ꈉʜ", "", SItemType(422278), true, vec3(0.08834728742407043, 0.6119112473036681, 0.5678185953608801), 0.17141666504154757, true, true, MaybeOfString("뻹媋"), "᪮壐辡�", "岁ꮸ㏧", 4203);
    OpEqSimple_Check("櫇ꟙ栥鏡螫⃠嚅⒝ࣾ惝", "ሌ괙", SItemType(559404), false, vec3(0.18267481875730437, 0.8961762338393258, 0.32298365809162316), 0.7441597407423703, true, true, MaybeOfString("锲釹"), "耽裮", "㤬꾷ټ໿ꍱ꟤��", 694261);
    OpEqSimple_Check("館胄ા즣", "汢ꏠ⮶", SItemType(997818), true, vec3(0.7855161520585028, 0.6501760159852803, 0.6464676254645305), 0.6387487983511523, true, true, MaybeOfString("둕껅汆講㓤통�ﭝ豲"), "뛰", "秨玹桗喐", 814326);
    OpEqSimple_Check("⩮�ώ꒏퓂䉰ꋗ嗳ರ", "슅엎筄䄗灰ᔃ㣛צ", SItemType(758489), false, vec3(0.6714290923771584, 0.5537181378126694, 0.5282303553671718), 0.20748392874723484, true, false, MaybeOfString("�⧙곢歒愪ᱧᫎ"), "ꃢ｡뫇묯릕⛲", "瓪ﲥ疬᳢䩶㩒", 364509);
    OpEqSimple_Check("鄻콨�赭墨큽咪઼側똶", "佴ꛬ苵䎥�", SItemType(557945), true, vec3(0.9770308872577879, 0.25795882067548054, 0.9302328261221912), 0.2687497442908351, false, true, MaybeOfString("粄⅝挝㠊"), "共䳶넊ᙓࡀ컒", "", 475985);
    OpEqSimple_Check("뱜悶ꂋ鰲", "", SItemType(433068), false, vec3(0.09234991254860066, 0.8226286335022323, 0.10676778625080724), 0.7878101127165417, true, true, MaybeOfString("䌱"), "篱鬻", "娣ዯ﷤賚�챀曹", 131429);
    OpEqSimple_Check("ࣛﬣ�⟹驵", "혀ⴿ", SItemType(177350), true, vec3(0.6790138933244226, 0.6796446632033422, 0.1275374885311059), 0.36210888501354904, true, true, MaybeOfString("螥㗓꒭→"), "ᚭࣳ�﨑ğ", "બ⚟鰉ᡖ梉", 877689);
    OpEqSimple_Check("띟璦Ⴗ婑", "䨾㶜☭ෳ", SItemType(284057), true, vec3(0.6104780727114892, 0.38704785629503796, 0.187071217776775), 0.11475330270582498, true, false, MaybeOfString("᣾킯䠧"), "멖�", "녮ง", 609845);
    OpEqSimple_Check("텩㚽댯맑", "瞐奺ဂ", SItemType(917838), true, vec3(0.4791033507693109, 0.7978449854058423, 0.7752905254137192), 0.048952245641943185, false, false, MaybeOfString("㝳䵉貟↟ڹ錠쟓쎭뗧"), "罚", "", 978412);
    OpEqSimple_Check("聿妒ᫍ", "娂ᑠ쟀냖럢쩪媭䥿", SItemType(284973), false, vec3(0.5173792534123078, 0.4139414655109595, 0.36848167952545063), 0.9791523730285244, false, false, MaybeOfString(), "彄", "㌔Ú銼磃헮躁潿鬐鿹", 305916);
    OpEqSimple_Check("輨", "㹪쉰龊〢ᔖ̉", SItemType(323966), false, vec3(0.8994595435911136, 0.8116286866421013, 0.12833290087447172), 0.7574581116239811, true, false, MaybeOfString("稻�ꊈ껿"), "ﻯ機", "龕ຽҷ䋰ꭔ䧂脑", 968043);
    OpEqSimple_Check("쳮쬤﨣ኛ믒趰忳", "숬勯ﵜ", SItemType(263019), false, vec3(0.8445434029421506, 0.9546034205493533, 0.6617133378338597), 0.5645305782391367, true, true, MaybeOfString("圦긡㴽䷗"), "흌", "䣵䮆", 703199);
    OpEqSimple_Check("奋豮ⴈ֑", "일ٸ顚辑죹⪱濱놿", SItemType(796197), false, vec3(0.9584431270875238, 0.008187641859141942, 0.22566018264072957), 0.8426762506564502, false, false, MaybeOfString(""), "膞", "씅煍尪읒쪭剈", 363319);
    OpEqSimple_Check("ө㩣�轏", "", SItemType(959191), false, vec3(0.026616194763507784, 0.7903374292842752, 0.3780489812502866), 0.8023739325825003, true, true, MaybeOfString(""), "㵟蝅迨︧兀ࢺ鱈䛳啨", "ᄈ믋왚ꯂ喿�", 897341);
    OpEqSimple_Check("", "ힾ䣇ᚇ梅翂", SItemType(806802), true, vec3(0.006278563293758111, 0.0725287529977638, 0.035435955056657996), 0.5289865399380151, false, true, MaybeOfString("迒䌡ഘ"), "癓簡枌녑埖韠", "皾澐쇞㍐དྷ", 455033);
    OpEqSimple_Check("过�蝄合౜녜뎙㾣", "൹貈垸", SItemType(229473), true, vec3(0.12668943271352417, 0.42560651452541653, 0.45206265638212795), 0.5164862216992705, true, false, MaybeOfString("䷫킹륦"), "䂃堮㹺暮", "ṱ帮—뜔愄츿첣⦝脘", 255600);
    OpEqSimple_Check("", "틤榸倢슭펵㳞繶藩륍", SItemType(549628), false, vec3(0.24782405805207047, 0.7151062314934592, 0.8929004207686058), 0.19621092136772858, true, true, MaybeOfString("ﾫ䅖ꏊ軃頴罩"), "Ⳮ", "뙡여䯥鍮幘滆旌", 986198);
    OpEqSimple_Check("綒搅聍Ꟑᨎﳌ", "쎙竗硨ɯ䃟偶", SItemType(406292), false, vec3(0.11290842206818444, 0.20244165333101602, 0.061047941474731984), 0.8451829267876143, false, true, MaybeOfString("拚ꑧ⩱"), "䮕밤ᬣ뾩ᨶ␫祡", "᧎䫁詵䯻꼊赖뇁讌弴", 462606);
    OpEqSimple_Check("뀁م", "禗뻧쌜", SItemType(504468), false, vec3(0.4739580817865013, 0.4305659162022946, 0.8473410009626956), 0.997457470278003, true, true, MaybeOfString(), "낤햳釽⛧옩炰၃鉝", "ⷀ듅㡐沁祿", 274962);
    OpEqSimple_Check("休ￏ", "렳墄䖢⊎�ꮏ", SItemType(38661), true, vec3(0.4550249387766351, 0.5088196869514974, 0.23510883573214936), 0.9386096265812449, false, true, MaybeOfString(""), "Ჺⅶ엱ǫ揆쟶孛﷤枲", "捐챵ꏹ꼡姐䊂⤭", 262430);
    OpEqSimple_Check("븥ꖙ∴簾뱟", "綽ケ摓릺칻啗", SItemType(189775), true, vec3(0.7649451851681551, 0.6690332520143284, 0.904107983645102), 0.19647853271871737, true, true, MaybeOfString("鳙막"), "탡뒤엄闼嵞뿭燨ꍶ⨙", "䀷픿ᨏ衔", 414623);
    OpEqSimple_Check("グ㘁ȃㅞἄ辰思", "⹄", SItemType(765047), true, vec3(0.2008086360063444, 0.233668662250819, 0.41999550928361506), 0.603228629381968, true, false, MaybeOfString(), "", "근邺㣿䟫랴ퟭ씤�房댬", 102070);
    OpEqSimple_Check("勇啸俵㧠儂", "๋캌涒誀叞㇘㌬酉", SItemType(83341), false, vec3(0.38243529684023714, 0.5342137750863162, 0.033137191568099515), 0.5653741837317935, true, false, MaybeOfString("ⳡ"), "獽ᗒ攅樘", "Ư⥣䞘", 404813);
    OpEqSimple_Check("맖Ⴙ潊峼", "챞䢿眭᫜侯", SItemType(193240), true, vec3(0.0073273824561980476, 0.7000785431359329, 0.491355714616997), 0.23170027706385604, true, true, MaybeOfString("ꎝ"), "氢봃鿒碀㿷䆞룦", "쟓", 276945);
    OpEqSimple_Check("ⵜ㲰핋嶣䇙寇", "섀뇗", SItemType(999335), true, vec3(0.47692054532324923, 0.43164329856245, 0.8536649080243264), 0.2587752422591556, true, false, MaybeOfString("壄桀"), "둪┉堼彠ृ䘄蘁", "딠㶷蠃ᚙ鋩", 751776);
    OpEqSimple_Check("຺拇씌ည햍�쓩", "ꭰ蘣㴧튂䄕᳂꛰판눮", SItemType(41300), true, vec3(0.8994380258486784, 0.7729457415514372, 0.8638904294296589), 0.8549189990642103, false, false, MaybeOfString("㫋�べ瞃辞妝"), "Ꮪ⹅", "�躌續", 340379);
    OpEqSimple_Check("毰덷僀ᖊ", "㸸", SItemType(60435), false, vec3(0.999059282708475, 0.5906356207982802, 0.5720515537876876), 0.500552885467444, true, true, MaybeOfString("ㆎ棌�곔櫽ꐫ␓쌍油"), "ڷ寀�", "ᴧ룤ꫀ缎遁", 178160);
    OpEqSimple_Check("旺沣￟㸄ໟ䄺ꐶ⯀", "䎲⠋젿糖앻嶚", SItemType(743323), true, vec3(0.41914930679795764, 0.7561884442140294, 0.9723906554153146), 0.26932755264887936, false, false, MaybeOfString(), "췾热⹉㊘၁᫄", "㰚ㇿ떶⨨ᘟ戣⦻䭋", 225358);
    OpEqSimple_Check("", "ீ憨", SItemType(804429), true, vec3(0.29066635728379075, 0.7557324458638823, 0.9608942954618923), 0.32853624100263057, false, true, MaybeOfString("扐葁"), "Ỵ莙▸", "", 905196);
    OpEqSimple_Check("곞ᘾꃥ촄㍕札펂ឝ", "ᖃ䩷", SItemType(509669), true, vec3(0.28495872965313435, 0.24283908644823315, 0.08554194266234615), 0.19511425411101163, true, true, MaybeOfString(""), "묽ᴂ㰶剎䌅糣Ӄഷঢ", "餥", 584989);
    OpEqSimple_Check("", "号ㆃ긺簼곽⺲댾麎", SItemType(461071), true, vec3(0.30449064695485434, 0.06801915777289269, 0.35276485530322643), 0.31233034204334503, true, true, MaybeOfString("䌑ᕊ愑㫷ൈ�ぞ"), "ϑ᠟釿", "㾂閈䨝嵵棓", 254967);
    OpEqSimple_Check("䜦鈷兔呃율ᤞ鍜ꆟ", "㋨츌䞸鄈鲤戙", SItemType(623056), true, vec3(0.28505353456598403, 0.819167034616306, 0.011927963705699873), 0.7747360378386154, true, true, MaybeOfString("ꓛ廉ཝݿ厪ꎢң"), "沗怛쯂Ӑ铨", "䕼ꢟ珱鲅昿ⅵ�졻", 643840);
    OpEqSimple_Check("㛠஑뚀�⑴", "✷㈳﷥똭퓄﮵", SItemType(189651), true, vec3(0.010882913605721162, 0.3291226617661876, 0.08000611564144777), 0.9752081283252724, true, false, MaybeOfString("⣻"), "轘␼℡짉", "䨴쏸휞", 453659);
    OpEqSimple_Check("㼳쬺義", "ﶼ즹␥", SItemType(639847), false, vec3(0.9243039865625575, 0.07773536121367261, 0.36362114519049465), 0.3562994903681332, false, true, MaybeOfString("餗뼂�숣怣楊멕"), "ฅⴑ鋆㫊훝湕ᱝ", "幺ਗ਼ᓊ鹿ݚ띤⻧⾁ᱡ", 569972);
    OpEqSimple_Check("﹒푽씛듷륑", "昳占㵊", SItemType(59131), true, vec3(0.7430402928698064, 0.2979771184259919, 0.653483541055342), 0.30401028241217615, false, true, MaybeOfString("댓໵噫歪嵞䄁緯壣"), "칲ﲤ荏嬸虶", "ꮂퟄ䬰왊", 415114);
    OpEqSimple_Check("쭖㟧", "ꑆ鷍뒦羊テ", SItemType(504590), true, vec3(0.45656131694864543, 0.6713304280635577, 0.7910930559928963), 0.8529058330938712, false, false, MaybeOfString(), "", "䂓㯄좑콤삓ȴ劗ᄼ", 302345);
    OpEqSimple_Check("㣶喒⅒瓮㫬", "劊좂響ض쭂槶ﾽ", SItemType(388969), true, vec3(0.8884813696558035, 0.8841946552899641, 0.9602055018582407), 0.07978019913648264, true, false, MaybeOfString("✷㎾腒鸒"), "鱚઄᷼嬺꼨㉫࠵聮怴䭝", "", 246592);
  }
  
  bool unitTestResults_SceneItem_OpEq = runAsync(Tests_RegisterAll_SceneItem_OpEq);
}
#endif