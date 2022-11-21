#if UNIT_TEST
namespace Test_RoomInfo {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_RoomInfo_CommonTesting() {
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
  
  bool unitTestResults_RoomInfo_CommonTesting = runAsync(Tests_RegisterAll_RoomInfo_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_RoomInfo_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_RoomInfo', UnitTest_ToJsonFromJson_RoomInfo);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in name, uint n_teams, uint n_players, uint player_limit, MaybeOfString@ join_code, bool is_public) {
    RoomInfo@ tmp = RoomInfo(name, n_teams, n_players, player_limit, join_code, is_public);
    assert(tmp == RoomInfo(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_RoomInfo() {
    Test_ToJsonFromJson_Check("", 129450, 573551, 355425, MaybeOfString(), false);
    Test_ToJsonFromJson_Check("ᱶ谛䆳ꔼ躜ಙ㟊罐㳋뽄", 883496, 673390, 116343, MaybeOfString(), false);
    Test_ToJsonFromJson_Check("䳟框雱燐꬝,汯粌鉅᜘", 403118, 996210, 292599, MaybeOfString("䌭덉羌ฬ擪孻"), true);
    Test_ToJsonFromJson_Check("堉⍴", 606311, 853398, 34736, MaybeOfString("冺햵ᤫ簔"), false);
    Test_ToJsonFromJson_Check("客㒞᫯볠箢暂遐", 509010, 762937, 553541, MaybeOfString(), true);
    Test_ToJsonFromJson_Check("", 857256, 67966, 842264, MaybeOfString("பꋣ䡓"), true);
    Test_ToJsonFromJson_Check("", 228874, 545237, 796389, MaybeOfString("ꬨ"), true);
    Test_ToJsonFromJson_Check("쨄봌", 467498, 450229, 8357, MaybeOfString("ﵴ"), false);
    Test_ToJsonFromJson_Check("皼䦋쁗缧ⱊﱻ", 291599, 158796, 236301, MaybeOfString("♱솎"), false);
    Test_ToJsonFromJson_Check("놪☼앇炄㐕畍鞙栥", 814563, 839750, 493396, MaybeOfString("封撛首譤"), true);
    Test_ToJsonFromJson_Check("ꗥ쟭銗䔜῏⻖蚇ங", 275663, 198407, 474515, MaybeOfString(), true);
    Test_ToJsonFromJson_Check("窐踎윉懜翊신꨻በ", 929417, 362775, 866688, MaybeOfString(""), false);
    Test_ToJsonFromJson_Check("㳇୭鹥灦㣋충", 721389, 899539, 304545, MaybeOfString("ㅥ趑"), true);
    Test_ToJsonFromJson_Check("", 147453, 442122, 757477, MaybeOfString(), false);
    Test_ToJsonFromJson_Check("죤箖质ᣙ", 61424, 123025, 945480, MaybeOfString("됢菙ၰ㡽걅"), true);
    Test_ToJsonFromJson_Check("៯ꭍڑ쀈ⵗ㏬", 330434, 960296, 368435, MaybeOfString("簈㖻Ꙛំ䏯ཞꑓ뷾"), true);
    Test_ToJsonFromJson_Check("홭", 959377, 703562, 133268, MaybeOfString("삾�೻壎ⴍ"), false);
    Test_ToJsonFromJson_Check("ᖦﭭ见禁䡼淣럸", 758410, 670355, 378524, MaybeOfString(), false);
    Test_ToJsonFromJson_Check("쑋쎧ᨘ", 554346, 17181, 227340, MaybeOfString("ଌ蓼﫤"), false);
    Test_ToJsonFromJson_Check("㢝蔹", 776724, 886650, 781291, MaybeOfString("뷰ᷙ㧖齢鬰㖦ӵ暮"), true);
    Test_ToJsonFromJson_Check("㗭再섚ᘭ☖甩ῶ욉쒜", 74150, 318565, 35974, MaybeOfString("ﱩ媡"), false);
    Test_ToJsonFromJson_Check("豣閑㏲ᔲ逥좣㉒㇜ꗸ", 811960, 415355, 760015, MaybeOfString(), false);
    Test_ToJsonFromJson_Check("딙授↳웡", 91151, 743344, 44570, MaybeOfString("冋"), false);
    Test_ToJsonFromJson_Check("겶຾", 532804, 34223, 734280, MaybeOfString("郅栗�"), true);
    Test_ToJsonFromJson_Check("漻拹ⓨ", 643309, 111365, 526475, MaybeOfString("㢭ꇔ格湴"), false);
    Test_ToJsonFromJson_Check("", 844727, 231882, 167715, MaybeOfString("鱐ꄝ标妒䗶瘬黊"), false);
    Test_ToJsonFromJson_Check("쀯㖩ꅽ딚圤쯼벮蜵", 662348, 160914, 43093, MaybeOfString("湀녂릊☳憱딅휘"), false);
    Test_ToJsonFromJson_Check("穏뫤࡙", 801176, 883112, 765603, MaybeOfString("횊穧"), false);
    Test_ToJsonFromJson_Check("䗺", 245672, 817303, 44522, MaybeOfString("⫦㿕롔蜡い"), false);
    Test_ToJsonFromJson_Check("靳ԝ춤", 929340, 235459, 512066, MaybeOfString("꼅ꐊἸ᜸"), false);
    Test_ToJsonFromJson_Check("蜰晵", 840907, 60272, 245929, MaybeOfString("ᡋᡰ墍믙"), false);
    Test_ToJsonFromJson_Check("멨靮垆规☉᡽햅", 580415, 108577, 33888, MaybeOfString("綐⨱㇟ꪒ"), true);
    Test_ToJsonFromJson_Check("㷽혭㞥ۚ轔렫炙띤", 448613, 64905, 260294, MaybeOfString("⢻疳쨟ጦٛꦺ"), true);
    Test_ToJsonFromJson_Check("쉑ᢰ靡ﮃ嚄譵", 170734, 306458, 632656, MaybeOfString("遲੿ᥫ虝Ѐ�胛"), true);
    Test_ToJsonFromJson_Check("鑭嵿釄⅟᥌⇝䱓", 524348, 300962, 104905, MaybeOfString(), false);
    Test_ToJsonFromJson_Check("秇⋽吢", 662721, 992645, 925671, MaybeOfString("藃 ⏎늻텿錈솢�䰃䁓"), true);
    Test_ToJsonFromJson_Check("ማ", 14342, 450978, 449872, MaybeOfString("ﴪỗᯁ"), true);
    Test_ToJsonFromJson_Check("䦳�榺骽䭄궉쎟鷬", 788089, 621229, 452225, MaybeOfString("뵆扈僿䞚䲈㌒皬毸圌"), true);
    Test_ToJsonFromJson_Check("〱", 355681, 462683, 26762, MaybeOfString("裰轛멭錰㸦"), true);
    Test_ToJsonFromJson_Check("䎽붏矓暴颙잒淮", 156482, 901422, 688702, MaybeOfString(), false);
    Test_ToJsonFromJson_Check("Ϩ죂갗爑", 192767, 674254, 176502, MaybeOfString("樤㞹㿼昡˶鵺ﯶᲑ篥ɿ"), false);
    Test_ToJsonFromJson_Check("䎇", 20231, 116955, 720361, MaybeOfString("Ⳉペ蛛᠓"), true);
  }
  
  bool unitTestResults_RoomInfo_ToFromJSONObject = runAsync(Tests_RegisterAll_RoomInfo_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_RoomInfo_Getters() {
    RegisterUnitTest('UnitTest_RoomInfo_Getters', UnitTest_RoomInfo_Getters);
  }
  
  bool Test_CheckProps_RoomInfo(const string &in name, uint n_teams, uint n_players, uint player_limit, MaybeOfString@ join_code, bool is_public) {
    RoomInfo@ tmp = RoomInfo(name, n_teams, n_players, player_limit, join_code, is_public);
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(n_teams == tmp.n_teams, 'field n_teams with value `' + n_teams + '`');
    assert(n_players == tmp.n_players, 'field n_players with value `' + n_players + '`');
    assert(player_limit == tmp.player_limit, 'field player_limit with value `' + player_limit + '`');
    assert(join_code == tmp.join_code, 'field join_code');
    assert(is_public == tmp.is_public, 'field is_public with value `' + is_public + '`');
    return true;
  }
  
  void UnitTest_RoomInfo_Getters() {
    Test_CheckProps_RoomInfo("�￿躮䮠馩�", 980813, 825164, 378662, MaybeOfString("꡺鼀ൃ橗븺寔옛�"), true);
    Test_CheckProps_RoomInfo("酞韫㘇힞�싺콠旱", 672947, 490383, 813542, MaybeOfString("岊⒆肭꘤쥹变㒠礃"), false);
    Test_CheckProps_RoomInfo("�⿵枵ⴾ㬪●ꜛ", 372964, 622511, 937581, MaybeOfString("݋"), false);
    Test_CheckProps_RoomInfo("�拺윰蘆", 321608, 715346, 402362, MaybeOfString("ⴐ"), false);
    Test_CheckProps_RoomInfo("듡鷰那춴庂ᄼﵰ", 438676, 425498, 985047, MaybeOfString("충멵"), false);
    Test_CheckProps_RoomInfo("㵹徲㼏", 719653, 49582, 433840, MaybeOfString("㻡뼇ṽ杢⅄"), true);
    Test_CheckProps_RoomInfo("儞祹㚏풓鏓윃ᆟ퇚箺᧸", 985034, 302501, 401385, MaybeOfString("�"), false);
    Test_CheckProps_RoomInfo("뭷", 544625, 205984, 182859, MaybeOfString("޷Მ"), false);
    Test_CheckProps_RoomInfo("㎀꿈�ᴶ๏㕭∸缲䁏", 972616, 680656, 509010, MaybeOfString("鞆㤨ॽ"), false);
    Test_CheckProps_RoomInfo("׭駭겯", 591738, 926979, 620839, MaybeOfString("두"), false);
    Test_CheckProps_RoomInfo("", 585012, 264138, 345680, MaybeOfString("높䋪㋘늒竛뗧"), true);
    Test_CheckProps_RoomInfo("ꔘₜ齬聎雄攩澴䶩", 135571, 428782, 785817, MaybeOfString("鉴㉙"), false);
    Test_CheckProps_RoomInfo("過", 153273, 853065, 927946, MaybeOfString(), true);
    Test_CheckProps_RoomInfo("ꒉ㳀䈾뙱", 611458, 678280, 212605, MaybeOfString("틑吲炔ᒚ레휺堷"), false);
    Test_CheckProps_RoomInfo("䌽ୣ筃痒胊의䉶", 565032, 395859, 848880, MaybeOfString("◃뽽�额㳦䥍ⅸ⯃쩆搊"), false);
    Test_CheckProps_RoomInfo("㆒刱❕騐헵�䉨⏋릈䨕", 978653, 334968, 390076, MaybeOfString("㜬⋣亶␞ꎴ흨"), false);
    Test_CheckProps_RoomInfo("㇌⋛", 27558, 40242, 181358, MaybeOfString("줯党Ὥ"), false);
    Test_CheckProps_RoomInfo("森ⶍභࢆ", 742625, 707776, 850420, MaybeOfString("ᅘ鳰Ԕࠆ祊藍藄ஙᆴ"), false);
    Test_CheckProps_RoomInfo("崤颦蚕蔟Ι龲ꇗ⡔", 529329, 83328, 124133, MaybeOfString("奚좗謧痀㬙菣꿫"), false);
    Test_CheckProps_RoomInfo("ᔻἚ쫉䶶꣰䃹눭쯺튯", 833723, 27085, 506361, MaybeOfString("嚱ᇊᙷ펁佗횄俁鏟"), false);
    Test_CheckProps_RoomInfo("ힼ㼓", 808460, 108758, 772472, MaybeOfString("攇뽿퉾돂"), true);
    Test_CheckProps_RoomInfo("뼊谥缃ಟ킐", 679739, 182317, 694416, MaybeOfString("Ⲃ叼熃ᐳፎ䮐잝"), false);
    Test_CheckProps_RoomInfo("", 983400, 309649, 850147, MaybeOfString(""), true);
    Test_CheckProps_RoomInfo("剟䝛튟뿎ວ扚듍꩐瘁쪟", 623932, 761232, 396785, MaybeOfString("흰姺㼙光"), true);
    Test_CheckProps_RoomInfo("‱䘢", 731067, 366682, 72793, MaybeOfString("췽"), true);
    Test_CheckProps_RoomInfo("នﯸ滣轁竁怒ৈ⍪", 623470, 438389, 805260, MaybeOfString("ᥕ剃爆爣膡꛶"), false);
    Test_CheckProps_RoomInfo("틖ꎀ�淲ﺆ跏㜤", 357901, 952652, 684445, MaybeOfString("ꩵ屨蜍"), false);
    Test_CheckProps_RoomInfo("䬹칭烈罽췜", 582898, 482768, 925363, MaybeOfString(), false);
    Test_CheckProps_RoomInfo("ጢ", 323729, 180108, 629317, MaybeOfString("쾁᳓⢋"), false);
    Test_CheckProps_RoomInfo("Ჵ﨑ꁄ枙꥞琷᯵", 720999, 402357, 902045, MaybeOfString("䢝"), false);
    Test_CheckProps_RoomInfo("扟킋泎ⲅ", 965014, 40648, 927132, MaybeOfString(""), true);
    Test_CheckProps_RoomInfo("", 490015, 666968, 969195, MaybeOfString("竎绒ㅠﻬ견ﮜ镕㠇篘"), false);
    Test_CheckProps_RoomInfo("犌郉鷪䈥⏀淓둬ਈ", 753475, 684210, 835964, MaybeOfString("늽趽ማ鐆ᒓ俲⼿"), true);
    Test_CheckProps_RoomInfo("늋", 487252, 847881, 974829, MaybeOfString("챆맰"), false);
    Test_CheckProps_RoomInfo("", 551557, 358271, 614957, MaybeOfString("詻"), true);
    Test_CheckProps_RoomInfo("ᡶ⛥杭貴", 656430, 717791, 449432, MaybeOfString("촨ﶗ峹ﵭ"), true);
    Test_CheckProps_RoomInfo("啞婓菨뻟௎餵긽榈俍埯", 848668, 123956, 594259, MaybeOfString(), false);
    Test_CheckProps_RoomInfo("᪥", 571451, 914746, 375598, MaybeOfString("틠䤙礎㋳숙෥즇졧"), false);
    Test_CheckProps_RoomInfo("曶됚简贙殺뱆ᩖ彐쑥", 490417, 744440, 498609, MaybeOfString(), false);
    Test_CheckProps_RoomInfo("낭荸〈", 84409, 926444, 679346, MaybeOfString("⯤槯梾⛬㬻৷䪨꒥"), false);
    Test_CheckProps_RoomInfo("슽铟Ꙓ", 92853, 841821, 795081, MaybeOfString(), false);
    Test_CheckProps_RoomInfo("", 988634, 633121, 813324, MaybeOfString(), true);
  }
  
  bool unitTestResults_RoomInfo_Getters = runAsync(Tests_RegisterAll_RoomInfo_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_RoomInfo_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_RoomInfo', UnitTest_OpEqSimple_RoomInfo);
  }
  
  RoomInfo@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in name, uint n_teams, uint n_players, uint player_limit, MaybeOfString@ join_code, bool is_public) {
    RoomInfo@ o1 = RoomInfo(name, n_teams, n_players, player_limit, join_code, is_public);
    RoomInfo@ o2 = RoomInfo(name, n_teams, n_players, player_limit, join_code, is_public);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_RoomInfo() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", 393455, 392207, 212987, MaybeOfString("ᠺ먲梏뼂"), false);
    OpEqSimple_Check("퍉첯㚥", 606964, 746965, 295268, MaybeOfString("䉍ዯ"), true);
    OpEqSimple_Check("麑遬徨", 787504, 551494, 414864, MaybeOfString("呝쵄ᛱ떡"), true);
    OpEqSimple_Check("⇩㵣䎵甄壝玃", 591080, 333816, 159512, MaybeOfString("뇊챾﩯ᘞ쉓"), true);
    OpEqSimple_Check("כֿ鐄ℛݙᚬ", 804528, 226958, 44436, MaybeOfString("鵀�豝䌹쁡퐕썷ᯱꛞ"), true);
    OpEqSimple_Check("烆ঙﶇ䚱윲", 26440, 785460, 133463, MaybeOfString("⡆鍙莕㧩ꂅ䔲뼟Ŧ"), false);
    OpEqSimple_Check("䍎␷윸ຯ㪚鎤쎣䝕", 531474, 7923, 471876, MaybeOfString("撿"), false);
    OpEqSimple_Check("", 504118, 316940, 401551, MaybeOfString("뼡㾢笏㶆ʱ"), false);
    OpEqSimple_Check("뮱", 521707, 606939, 812991, MaybeOfString(""), true);
    OpEqSimple_Check("汀ᆣ젙娣ʱᯜ鱦", 468715, 840953, 20188, MaybeOfString("천⥠渠ᐢ㲛㧣⿾"), true);
    OpEqSimple_Check("䀿虿", 624373, 718449, 909595, MaybeOfString("놵묺쥷藹㴮"), false);
    OpEqSimple_Check("뻹", 629572, 333348, 4203, MaybeOfString("㫕崒⁗∾웇Ⓩᱭश"), true);
    OpEqSimple_Check("괙⬲", 897339, 559404, 726400, MaybeOfString("⤓"), false);
    OpEqSimple_Check("耽裮ዖ锲釹", 12795, 298494, 457344, MaybeOfString("奟㜫䞞祡"), false);
    OpEqSimple_Check("汢ꏠ⮶䋧館胄ા즣傪", 997818, 438577, 704848, MaybeOfString(), false);
    OpEqSimple_Check("喐橀뛰�둕껅汆講", 814326, 317042, 332229, MaybeOfString("睟娬䇒侮ꀵٽ촷䒠"), false);
    OpEqSimple_Check("", 24944, 263165, 470016, MaybeOfString(""), true);
    OpEqSimple_Check("ⱬ褑", 843670, 909926, 457029, MaybeOfString("㝛侢㳹�蛖ꬹ耐"), false);
    OpEqSimple_Check("㩒홌ꃢ", 29411, 78939, 636291, MaybeOfString("䑫ⵙස銰ၧᮑώᘢ㵅"), true);
    OpEqSimple_Check("蛕䥓佴ꛬ苵䎥�쭲", 279639, 759681, 255643, MaybeOfString("꼥ᗁቲ堽ᬵ꽧"), true);
    OpEqSimple_Check("共䳶넊ᙓࡀ컒", 475985, 789265, 36996, MaybeOfString("଒嬋笩讏"), true);
    OpEqSimple_Check("䚨篱鬻피䌱踀", 829588, 992454, 47786, MaybeOfString("덖揙"), false);
    OpEqSimple_Check("驵盲ⓟ娣", 554833, 356165, 177350, MaybeOfString("讖宦뻸"), true);
    OpEqSimple_Check("螥㗓", 578377, 759825, 48706, MaybeOfString("퇎赊ﴋ鎘"), false);
    OpEqSimple_Check("㌌⻄", 112824, 776355, 602310, MaybeOfString(""), false);
    OpEqSimple_Check("䨾㶜", 284057, 296593, 97859, MaybeOfString(), true);
    OpEqSimple_Check("녮", 327759, 609845, 263480, MaybeOfString("퍪쉹"), false);
    OpEqSimple_Check("瞐奺ဂ", 917838, 203988, 773250, MaybeOfString("ꡂ၌鳿윀꡴⻜銵뒮"), false);
    OpEqSimple_Check("罚", 978412, 15728, 543714, MaybeOfString("�؁૰犮"), false);
    OpEqSimple_Check("鼗䘚秱ᗱ", 463120, 610831, 834401, MaybeOfString("剈箆玬㖳驡囈椐༁틋�"), true);
    OpEqSimple_Check("図罛⢲Ȃ㹪쉰龊", 493150, 371477, 170942, MaybeOfString(), false);
    OpEqSimple_Check("䋰ꭔ䧂脑囲ﻯ機稻", 196654, 968043, 958667, MaybeOfString("ﰃ҅飛曀푧鯄꟒䠂桁"), false);
    OpEqSimple_Check("", 69302, 707858, 1447, MaybeOfString(), true);
    OpEqSimple_Check("宦奋豮ⴈ֑⡋늟", 80547, 56148, 836181, MaybeOfString(), false);
    OpEqSimple_Check("�鸋₫", 796197, 147837, 128962, MaybeOfString("媿餧윭ࢫꂘび�瘣댮杣"), true);
    OpEqSimple_Check("", 629633, 612128, 959191, MaybeOfString("譇橾⻊䮰"), false);
    OpEqSimple_Check("蝅迨︧兀ࢺ鱈䛳", 926220, 696064, 331215, MaybeOfString("嫲�쓋쾙樂⏭"), true);
    OpEqSimple_Check("", 806802, 867988, 950426, MaybeOfString("膃"), false);
    OpEqSimple_Check("迒䌡", 946673, 299172, 932418, MaybeOfString("憚邷塙ꢖ嶰읦逕礸蟽"), true);
    OpEqSimple_Check("", 111470, 573616, 37300, MaybeOfString("຿゠礊"), false);
    OpEqSimple_Check("挧ﳗ졝", 107419, 915066, 603924, MaybeOfString("龜릇v"), true);
    OpEqSimple_Check("⦝脘곅", 651960, 562413, 79137, MaybeOfString("淨�薮쮮磫呃温뗝쥨"), false);
  }
  
  bool unitTestResults_RoomInfo_OpEq = runAsync(Tests_RegisterAll_RoomInfo_OpEq);
}
#endif