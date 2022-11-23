#if UNIT_TEST
namespace Test_User {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_User_CommonTesting() {
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
  
  bool unitTestResults_User_CommonTesting = runAsync(Tests_RegisterAll_User_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_User_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_User', UnitTest_ToJsonFromJson_User);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in uid, const string &in name, float last_seen, MaybeOfString@ secret) {
    User@ tmp = User(uid, name, last_seen, secret);
    assert(tmp == User(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_User() {
    Test_ToJsonFromJson_Check("", "ꠂ쮰", 0.6009376899343625, MaybeOfString("﵇"));
    Test_ToJsonFromJson_Check("躜ಙ㟊罐㳋뽄旤", "꼸䃧쁐욘ᱶ谛䆳", 0.10079380548596094, MaybeOfString("澯�჌"));
    Test_ToJsonFromJson_Check("�", "汯粌鉅", 0.656762656595913, MaybeOfString(""));
    Test_ToJsonFromJson_Check("䢕颒饣ퟶ䳟框雱", "救솳棈", 0.47380688436040974, MaybeOfString());
    Test_ToJsonFromJson_Check("ｓ褨堉⍴ᲊ̇॑䎞ꦻ", "摂ꖶ鍁紙", 0.9403768442293521, MaybeOfString("客㒞᫯볠箢暂遐鬱峝"));
    Test_ToJsonFromJson_Check("澵z懇", "뵧칒튪윷", 0.5715138826386602, MaybeOfString("䞚㌴⦱扬"));
    Test_ToJsonFromJson_Check("旰蓡柿ஷ", "봌彺য়ꬢ毝榆", 0.27167739033311483, MaybeOfString());
    Test_ToJsonFromJson_Check("炤䩦ᛥ婫囼▏", "䦋쁗缧ⱊﱻ狀ꆟ", 0.9026913423569367, MaybeOfString("ᵒ㪗羘렷뵫"));
    Test_ToJsonFromJson_Check("�常", "ͽ텫", 0.8595433411465694, MaybeOfString());
    Test_ToJsonFromJson_Check("徭", "놪☼앇炄㐕畍鞙栥", 0.8865818604298783, MaybeOfString("罆鹌"));
    Test_ToJsonFromJson_Check("엣ᩁ㟅ഽ", "", 0.6537757248868121, MaybeOfString("῏⻖蚇ங⨗萃"));
    Test_ToJsonFromJson_Check("坯켫ꗥ쟭銗", "懜翊신꨻በ↥鿊", 0.6298404730064051, MaybeOfString());
    Test_ToJsonFromJson_Check("왦굸褢鶳ᄶ窐", "ꔴ㳇୭鹥灦㣋", 0.3795387979501573, MaybeOfString("Ηꨘ"));
    Test_ToJsonFromJson_Check("�ꧾ큽ⷾ뮁d更", "鍡轔", 0.5012867774354698, MaybeOfString("ᣙ욗"));
    Test_ToJsonFromJson_Check("趀絀죤箖", "", 0.06079823526590981, MaybeOfString("坖澂ꉃ뒅Ὄ㜣뗃㷦⏓箝"));
    Test_ToJsonFromJson_Check("៯ꭍڑ쀈ⵗ㏬", "벛ﳾ啃둸瀀", 0.6648844632622248, MaybeOfString("蘇"));
    Test_ToJsonFromJson_Check("홭ᢻ샞饤浏䴾", "澀⽹ᱶ爅螝", 0.7639193571004641, MaybeOfString("럸튦蘥気�∝ꒋ"));
    Test_ToJsonFromJson_Check("", "ᖦﭭ见禁", 0.8629635567138733, MaybeOfString());
    Test_ToJsonFromJson_Check("੉Ⱬ", "쎧ᨘ퉁", 0.23618082759724038, MaybeOfString("裳엽뷗뢑㖄瑁캳"));
    Test_ToJsonFromJson_Check("", "㵁㢝蔹ｽ≨⢮舊┛", 0.11485119588433355, MaybeOfString("�ঽ㎒�郁❨鲶"));
    Test_ToJsonFromJson_Check("욉쒜≁隵", "☖甩", 0.0788169210212384, MaybeOfString("ꨝꮄ轓᧦㗭再섚"));
    Test_ToJsonFromJson_Check("籕ￌ龎", "ꗸ롼", 0.41324186344316316, MaybeOfString("閑㏲ᔲ逥좣㉒"));
    Test_ToJsonFromJson_Check("삒볜", "↳웡꫎淐꺒Ｅ澮촎姴", 0.8477532886191054, MaybeOfString("갯䘞턜㧷わ銂⧼馣谱蘄"));
    Test_ToJsonFromJson_Check("䴨", "겶຾", 0.9938807995030101, MaybeOfString("颤짒傉峩ᯕ"));
    Test_ToJsonFromJson_Check("髷漻拹ⓨ淪", "ꢶ嗲聅䄳ㆳ尉ź恮", 0.6838200351613667, MaybeOfString(""));
    Test_ToJsonFromJson_Check("䐪䈞䞞䜋", "蜵来৷몖괩퉧瑏求뺝", 0.7773537387965963, MaybeOfString("촊枤ŀཎ؏쀯㖩ꅽ딚圤"));
    Test_ToJsonFromJson_Check("ħ蔋팪", "穏뫤࡙攴쑋㵗髍澇㤘", 0.3673828022402631, MaybeOfString("뾋뿰秮"));
    Test_ToJsonFromJson_Check(" 讈䗺⼎Ԍ臋뽦殠齒", "ᒢ湾", 0.0904722786929795, MaybeOfString("曘靳ԝ춤ᴼ馿ꞑ漆霋枒"));
    Test_ToJsonFromJson_Check("哻咷", "룅쪹꨽", 0.07730659706392633, MaybeOfString("밥�틭姻韷ሸ"));
    Test_ToJsonFromJson_Check("꺗⯒ꊑ䐁ߠ", "ೕ멨靮垆规☉᡽햅𤋮", 0.20173074733546503, MaybeOfString("⛟왪噧㉊㚨줫⧑"));
    Test_ToJsonFromJson_Check("", "轔렫炙띤䮔췬鼋탐", 0.6825479360681717, MaybeOfString("ꦘ疁꼵䁹呦㷽혭"));
    Test_ToJsonFromJson_Check("ᖀ㨎乕紇答㺳萵ꊕᑑ球", "쉑ᢰ靡ﮃ嚄譵", 0.9846824998896022, MaybeOfString("맆晝劬瘪剈"));
    Test_ToJsonFromJson_Check("䱓䎸帍곔遲祆䊼Ꙕ", "釄⅟᥌", 0.15933599237321688, MaybeOfString("祶⯔䥮䒸龅鑭"));
    Test_ToJsonFromJson_Check("", "秇⋽吢", 0.6506418169711912, MaybeOfString());
    Test_ToJsonFromJson_Check("㾃庅鿹紣", "ꨁ딣⍣�浥ԈǶ봒❖", 0.5889841251023971, MaybeOfString("軬ꇈ퉿ማ鰜㞡"));
    Test_ToJsonFromJson_Check("꼭㗶", "鷬헡㕚", 0.5529694331590875, MaybeOfString("骽䭄"));
    Test_ToJsonFromJson_Check("", "䴤䦳", 0.7385601628285647, MaybeOfString());
    Test_ToJsonFromJson_Check("儻쳷계쳣㪏", "㈹�䕋⿬", 0.5965776604584314, MaybeOfString("〱"));
    Test_ToJsonFromJson_Check("煆펾챆妙薐㨵䓸뷐�", "잒淮듑箩厈䃐᲎", 0.10608369815446608, MaybeOfString("䬼덃耕굗ご䎽붏矓"));
    Test_ToJsonFromJson_Check("ꓩꦼ�୹౺삯Ϩ죂갗", "뷌齟蜰ộ", 0.42671683683372885, MaybeOfString());
    Test_ToJsonFromJson_Check("⊐檢䩬媴白", "闞ꩍ㨧㞆豽몗䎇㤴", 0.8025206801493283, MaybeOfString("阈熲㜆⏰‖馞褗蛢"));
    Test_ToJsonFromJson_Check("", "⺧䛙픮翽暈೵", 0.8933446439417753, MaybeOfString("温膀璠"));
  }
  
  bool unitTestResults_User_ToFromJSONObject = runAsync(Tests_RegisterAll_User_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_User_Getters() {
    RegisterUnitTest('UnitTest_User_Getters', UnitTest_User_Getters);
  }
  
  bool Test_CheckProps_User(const string &in uid, const string &in name, float last_seen, MaybeOfString@ secret) {
    User@ tmp = User(uid, name, last_seen, secret);
    assert(uid == tmp.uid, 'field uid with value `' + uid + '`');
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(last_seen == tmp.last_seen, 'field last_seen with value `' + last_seen + '`');
    assert(secret == tmp.secret, 'field secret');
    return true;
  }
  
  void UnitTest_User_Getters() {
    Test_CheckProps_User("�￿躮䮠馩�", "㧖⢢羋⽪㎜৏렊", 0.41464457866486376, MaybeOfString("蜽韋�╝"));
    Test_CheckProps_User("鰉", "疍", 0.18134318114320896, MaybeOfString("힞�싺"));
    Test_CheckProps_User("", "ꂆऒ涮�뗗텓酞", 0.6726526080969035, MaybeOfString("﶑䙢꺰ꦞ"));
    Test_CheckProps_User("㬪●ꜛ귦翮漽똮", "먳�⿵枵", 0.8249168958630957, MaybeOfString("윰蘆콬⨸۫芁≲"));
    Test_CheckProps_User("虝䰒ஷ握�", "ﵰ㞪㷗", 0.2398034484311023, MaybeOfString("那춴"));
    Test_CheckProps_User("⸔옯듡鷰", "젮훇懓奲", 0.2258253722571886, MaybeOfString("ᓭ褾㵹徲㼏嘿ꑙ尚"));
    Test_CheckProps_User("ᒧឝ밇�拣䵱䌏�", "퇚箺᧸䤩䇢�뽥뤎祰", 0.13565701671673777, MaybeOfString("鏓"));
    Test_CheckProps_User("㈣揘䢊儞祹㚏", "묹뭷┼쿽騍", 0.5962569725682293, MaybeOfString("蹪鈤ꦀ"));
    Test_CheckProps_User("㎀꿈�ᴶ๏㕭∸缲䁏", "㪂", 0.7271186768669257, MaybeOfString("랭즫ᇁ﹀賊惍"));
    Test_CheckProps_User("�׭駭겯ƴ皌", "쭜䢝", 0.7389461951046, MaybeOfString("炼椾䵙嗍珐瀮"));
    Test_CheckProps_User("阚⦈", "弊䮷⃷쨗蝢ᳳ쁼", 0.06974749130650772, MaybeOfString("攩"));
    Test_CheckProps_User("", "㩾껫墰菌㶑ꔘₜ齬", 0.17316936383637105, MaybeOfString());
    Test_CheckProps_User("䱇盰쩑虿옡뭱過ଚ", "�ꒉ㳀䈾뙱䕂륦홰", 0.7322529576403336, MaybeOfString("쯳枦섍鐷痚ꄻ"));
    Test_CheckProps_User("의䉶杻�죝ᝫ᥾鼾㮦窘", "痒", 0.8390673235240705, MaybeOfString("墒≜蔗塚䌽"));
    Test_CheckProps_User("᠟Ꮍ⁭豹理癙⤊웪", "⏋릈䨕＠߇₹紇秉", 0.9753003008548637, MaybeOfString("ᐡ赪읝㆒刱❕騐헵"));
    Test_CheckProps_User("벷쨭욢璞", "䨗ও�휋", 0.8235798766015003, MaybeOfString());
    Test_CheckProps_User("鶧ㆌ痒", "䩦뽼퍑", 0.9204241237232574, MaybeOfString("森ⶍභࢆ"));
    Test_CheckProps_User("沕К߄뽇㪢㸿ᓮₙ", "鄠짭㦟", 0.47970855351523894, MaybeOfString());
    Test_CheckProps_User("蔟Ι龲ꇗ⡔辅⭉", "ￔ쥲兆崤颦", 0.6374825856822928, MaybeOfString("㴟"));
    Test_CheckProps_User("㱷ဥ院崢ꊵ쐭ғ㒴퟽", "䃹눭쯺", 0.9199758674576766, MaybeOfString(""));
    Test_CheckProps_User("ᔻἚ", "⁴", 0.7658551567075099, MaybeOfString("Ⴒ嶹堠鷦"));
    Test_CheckProps_User("큝", "鉚枛칸ힼ㼓럮", 0.7474580708646485, MaybeOfString("谥缃ಟ킐⁮ꕕ뉲�工"));
    Test_CheckProps_User("۟弜쌘㙛핺﫽㑪㿊", "縎貥", 0.9626198042941372, MaybeOfString("녰ॐ쮞覑"));
    Test_CheckProps_User("", "ꃈ䮣ᬬ", 0.7888087359204929, MaybeOfString("郫홟㕤㫛"));
    Test_CheckProps_User("怢瞱㻗﬽팊�", "듍꩐瘁", 0.8649722704966424, MaybeOfString());
    Test_CheckProps_User("Ü매剟䝛튟뿎", "ȟ薲ꭉ", 0.059111077365982846, MaybeOfString("᫣읈聹匂仰"));
    Test_CheckProps_User("‱䘢", "᥃嗯", 0.10891778492784024, MaybeOfString("⧞픭蚏ࣼ䪞㧯䦴귏"));
    Test_CheckProps_User("㈾នﯸ滣轁竁怒ৈ", "酁଱", 0.7538900527888397, MaybeOfString());
    Test_CheckProps_User("畉弐狝פ뤫硥", "�淲ﺆ跏㜤샱", 0.1437038607633225, MaybeOfString("䞈䚴鵁틖"));
    Test_CheckProps_User("妐檣袿칉谜訷໰胖", "뚪䬹칭烈罽췜歵ȧㄚ", 0.005671962632644904, MaybeOfString("￰귥ጢ䨣뉐㕋"));
    Test_CheckProps_User("쯰㗟豺", "ꁄ枙꥞琷᯵テ䪮䅎", 0.39342558774790987, MaybeOfString());
    Test_CheckProps_User("瀓䳻", "复䚃ᖓ嵐", 0.761043144278714, MaybeOfString("扟킋泎"));
    Test_CheckProps_User("㼘ⵏ骗", "⋵隸꫍痈", 0.06985956573386656, MaybeOfString("v鬕绽ᅧ猣�嚖竝嬑"));
    Test_CheckProps_User("ធ", "鷪䈥⏀淓둬ਈ틑ꏛᐰ", 0.8807671949643489, MaybeOfString("啕ኞ衍蛜"));
    Test_CheckProps_User("䃿fྔ㐔ᡄ鷂", "섎", 0.8018259745099703, MaybeOfString("踵妕늋"));
    Test_CheckProps_User("㲸肅瞇᭥⶗褰", "溪৥롰꬜䮖揉筢", 0.6560423866175312, MaybeOfString("Ꙭꇰ⦥๤즿ㄨ穂Hᡶ⛥"));
    Test_CheckProps_User("俍埯퐥ঠ἗넾", "", 0.1085610259829839, MaybeOfString("婓菨뻟௎"));
    Test_CheckProps_User("诨⥇Ш", "꬈फ़Ը㌲狊", 0.16792388361316354, MaybeOfString("揉᪥"));
    Test_CheckProps_User("Ꜽ膎㠇趣", "﨑밍", 0.5558136098812397, MaybeOfString("밃괦㮜䔐炒悄௶揸"));
    Test_CheckProps_User("贙殺뱆ᩖ彐", "Ν曶됚", 0.2676242223324367, MaybeOfString("⏾齫ﾌ"));
    Test_CheckProps_User("๠쌩䖐ⱝ", "낭荸〈", 0.5092983513648148, MaybeOfString("⊺�ࠫ⿳훿☸꤫睊�"));
    Test_CheckProps_User("慺㗻壺旻슽铟Ꙓ鐻", "䟎他�", 0.19917060676923515, MaybeOfString("躇탩뿛ၲႪ㣕"));
  }
  
  bool unitTestResults_User_Getters = runAsync(Tests_RegisterAll_User_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_User_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_User', UnitTest_OpEqSimple_User);
  }
  
  User@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in uid, const string &in name, float last_seen, MaybeOfString@ secret) {
    User@ o1 = User(uid, name, last_seen, secret);
    User@ o2 = User(uid, name, last_seen, secret);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_User() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", "춗䵩첏㞟", 0.1504769605353833, MaybeOfString(""));
    OpEqSimple_Check("涬凙ﷰ눵뭩", "蝔ᔁ䀓⃩쭶퍉첯", 0.8558604534975535, MaybeOfString("탏핈霋흽"));
    OpEqSimple_Check("釪�麑遬", "਀", 0.25657898525548123, MaybeOfString("勑뤋펍캒"));
    OpEqSimple_Check("⇩㵣䎵甄壝", "", 0.7625625286076975, MaybeOfString("壉샴廗ᦷ氫ᚘ킅�"));
    OpEqSimple_Check("璊诛퇟鯚", "獔", 0.9430046891528203, MaybeOfString("ℛݙᚬ쇳"));
    OpEqSimple_Check("︐좙桭垛峵כֿ", "冥㶶밑幖許ᬤ쿊菆", 0.6918915871958675, MaybeOfString(""));
    OpEqSimple_Check("⋳䝅攨鑽烆ঙ", "鹆ʊ冿�Ⓢ", 0.4208600434571784, MaybeOfString(""));
    OpEqSimple_Check("", "", 0.9219037512884959, MaybeOfString("䝕"));
    OpEqSimple_Check("鎤쎣", "摃䍎␷윸ຯ", 0.5827463444242004, MaybeOfString("␜῰蹎쟳횱宙홧㉜는"));
    OpEqSimple_Check("蚵⧝耏盧", "ꨕẽ뮱", 0.3525745106640153, MaybeOfString());
    OpEqSimple_Check("ࠡ", "汀ᆣ젙娣ʱᯜ鱦", 0.27617375984609766, MaybeOfString("쏥䁏ਮ虴簪䤀揾噚셑"));
    OpEqSimple_Check("䀐硩", "䀿虿砍", 0.16778451864038804, MaybeOfString());
    OpEqSimple_Check("픽鳐", "⣣뾈噦", 0.7057623992235225, MaybeOfString("⻰쬟"));
    OpEqSimple_Check("�㏊뻹媋痰", "糓岁ꮸ㏧㽤᪮壐", 0.4554565751252028, MaybeOfString("櫇ꟙ栥鏡螫⃠嚅⒝ࣾ惝"));
    OpEqSimple_Check("ሌ괙", "ឰ墐こꅯ", 0.7690249042441253, MaybeOfString("꟤��뙑耽裮ዖ"));
    OpEqSimple_Check("ᨣ㤬꾷ټ໿", "汢ꏠ⮶䋧館胄ા즣傪", 0.6621905875681856, MaybeOfString("괗饖"));
    OpEqSimple_Check("汆講㓤통�ﭝ豲氹φ", "뛰�둕", 0.905524170913512, MaybeOfString("ꈾ⩡秨玹桗"));
    OpEqSimple_Check("⩮�ώ꒏퓂䉰ꋗ嗳ರ", "슅엎筄䄗灰ᔃ㣛צ", 0.3346808302843388, MaybeOfString("ⱬ褑"));
    OpEqSimple_Check("", "�⧙곢歒愪ᱧᫎ", 0.15578252596584266, MaybeOfString("᳢䩶㩒홌ꃢ｡뫇묯릕"));
    OpEqSimple_Check("瓪ﲥ", "鄻콨�赭墨큽咪઼側똶", 0.253187472584279, MaybeOfString("苵䎥"));
    OpEqSimple_Check("�丮祒蛕䥓佴", "", 0.04532810116434847, MaybeOfString());
    OpEqSimple_Check("컒�粄⅝挝", "넊ᙓ", 0.28070421204003704, MaybeOfString(""));
    OpEqSimple_Check("♕", "", 0.5452865071339935, MaybeOfString("ꂋ"));
    OpEqSimple_Check("갽郭뱜", "鬻피䌱踀뤅芸", 0.4029356508529445, MaybeOfString());
    OpEqSimple_Check("娣ዯ﷤賚�챀曹", "⟹驵盲", 0.7376336752146639, MaybeOfString("⭷혀ⴿ㓶ࣛ"));
    OpEqSimple_Check("洂賥", "룎", 0.9765024278203502, MaybeOfString("㗓꒭"));
    OpEqSimple_Check("ğ", "", 0.39351291041519165, MaybeOfString("㕹બ⚟鰉ᡖ梉ᚭ"));
    OpEqSimple_Check("遚㌌⻄", "䨾㶜☭ෳ鈴띟璦Ⴗ", 0.0047310506947017515, MaybeOfString("ͥ᣾킯䠧◐噙庈䶊撍"));
    OpEqSimple_Check("", "텩㚽댯맑힊骝녮งꦠ", 0.23826937807643292, MaybeOfString("䌐ೕ㎭啷⨍揉뭮瞐奺"));
    OpEqSimple_Check("↟ڹ錠쟓쎭뗧䢼", "㝳䵉", 0.9141633323925377, MaybeOfString("聿妒ᫍ�⁔վ"));
    OpEqSimple_Check("娂ᑠ쟀냖럢쩪媭䥿", "䘚秱ᗱ閯", 0.9791523730285244, MaybeOfString("鬐鿹愶彄"));
    OpEqSimple_Check("輨浉ㆠ㌔Ú銼磃헮躁", "㹪쉰龊〢ᔖ̉", 0.44919466807003816, MaybeOfString());
    OpEqSimple_Check("扆䡖図罛", "稻�ꊈ껿", 0.8932229144932808, MaybeOfString("鬋龕ຽҷ䋰ꭔ䧂脑囲ﻯ"));
    OpEqSimple_Check("랔", "쳮쬤﨣ኛ믒趰忳", 0.3089013683185453, MaybeOfString("숬勯"));
    OpEqSimple_Check("䷗넱�㙫姦䟧ఊꪫ", "圦긡", 0.8317206277659724, MaybeOfString("䮆렞"));
    OpEqSimple_Check("⡋늟", "豮ⴈ", 0.29944438547801433, MaybeOfString("일ٸ顚辑죹⪱濱놿"));
    OpEqSimple_Check("膞坫窀훱Ⅺ킠�鸋", "씅煍尪읒쪭剈", 0.9511738489154604, MaybeOfString());
    OpEqSimple_Check("ө㩣�轏", "", 0.673404190071581, MaybeOfString("䛳啨ꋸ艌֩੿퉛꿪⹳"));
    OpEqSimple_Check("㵟蝅迨︧兀ࢺ", "ᄈ믋왚ꯂ喿�", 0.6203279451561756, MaybeOfString(""));
    OpEqSimple_Check("ힾ䣇ᚇ梅翂", "", 0.06933782765145312, MaybeOfString());
    OpEqSimple_Check("∁衽", "迒䌡ഘ", 0.14508229593983027, MaybeOfString("韠"));
    OpEqSimple_Check("녑", "咂ﱉ皾澐쇞㍐དྷ썦癓簡", 0.3384521097589527, MaybeOfString(""));
  }
  
  bool unitTestResults_User_OpEq = runAsync(Tests_RegisterAll_User_OpEq);
}
#endif