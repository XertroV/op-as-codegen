#if UNIT_TEST
namespace Test_Competition {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_Competition_CommonTesting() {
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
  
  bool unitTestResults_Competition_CommonTesting = runAsync(Tests_RegisterAll_Competition_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_Competition_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_Competition', UnitTest_ToJsonFromJson_Competition);
  }
  
  bool Test_ToJsonFromJson_Check(uint id, uint startDate, uint endDate, uint matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, const string &in region) {
    Competition@ tmp = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region);
    assert(tmp == Competition(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_Competition() {
    Test_ToJsonFromJson_Check(129450, 573551, 355425, 263911, 126408, 191439, "ᱶ", "䚏꼸䃧쁐", "澯�჌", "�");
    Test_ToJsonFromJson_Check(620474, 767667, 671952, 259935, 975206, 294609, "㟳䢕颒饣ퟶ", "ꦻ땬黿救솳", "ᲊ̇॑", "堉");
    Test_ToJsonFromJson_Check(606311, 853398, 34736, 880999, 957341, 711273, "暂", "懇�客㒞᫯볠", "朣뵧칒튪윷窋澵", "䞚㌴⦱扬");
    Test_ToJsonFromJson_Check(962581, 425743, 228874, 545237, 796389, 811618, "쨄봌", "炤䩦ᛥ婫囼▏", "䦋쁗缧ⱊﱻ狀ꆟ", "");
    Test_ToJsonFromJson_Check(291599, 158796, 236301, 772258, 238755, 689542, "", "畍", "炄", "ᩁ㟅ഽᒽ罆鹌ﲒ咧놪☼");
    Test_ToJsonFromJson_Check(357741, 149912, 19141, 147800, 307977, 782152, "鿊坯켫ꗥ쟭", "窐踎윉懜翊신꨻በ", "충왦굸褢鶳", "퓹ꔴ㳇୭鹥灦");
    Test_ToJsonFromJson_Check(304545, 64291, 417442, 351797, 529015, 147453, "鍡轔", "搢趀絀죤箖质ᣙ욗恦", "뗃㷦⏓箝썷", "㏬蠑坖澂ꉃ뒅Ὄ");
    Test_ToJsonFromJson_Check(920767, 820139, 369679, 138046, 105196, 330434, "벛ﳾ啃둸", "ᢻ샞饤浏䴾퍂蘇賻", "符䭭澀⽹ᱶ爅螝⬣", "∝");
    Test_ToJsonFromJson_Check(489123, 522901, 419173, 213551, 646581, 490369, "ᖦﭭ", "੉Ⱬꖗ", "쎧ᨘ퉁", "㖄瑁캳륣");
    Test_ToJsonFromJson_Check(17181, 227340, 204841, 881761, 817776, 776724, "쐤얪", "≁隵ꄻ�ঽ㎒�郁❨鲶", "섚ᘭ☖甩ῶ욉", "轓᧦㗭");
    Test_ToJsonFromJson_Check(318565, 35974, 954857, 703353, 123726, 235631, "豣閑㏲ᔲ逥좣㉒", "", "䮪", "淐꺒Ｅ澮촎");
    Test_ToJsonFromJson_Check(610207, 687318, 91151, 743344, 44570, 56280, "䴨", "겶຾", "淪熷颤짒傉峩ᯕᔺ", "恮뺪髷漻拹");
    Test_ToJsonFromJson_Check(526475, 999438, 811107, 354192, 471506, 827710, "", "䐪䈞䞞䜋", "蜵来৷몖괩퉧瑏求뺝", "ཎ؏쀯㖩ꅽ딚圤쯼");
    Test_ToJsonFromJson_Check(160914, 43093, 618140, 674608, 308745, 376275, "㵗", "穏뫤࡙攴", "뾋뿰秮", " 讈䗺⼎Ԍ臋뽦殠齒");
    Test_ToJsonFromJson_Check(817303, 44522, 911772, 12880, 621120, 992957, "춤ᴼ馿ꞑ", "哻咷㟞曘靳", "晵룅쪹꨽ꩾ", "밥�틭姻韷ሸ");
    Test_ToJsonFromJson_Check(656011, 421056, 78744, 313111, 457076, 470409, "㙵覆ೕ멨靮垆规", "㚨줫", "", "䮔췬鼋탐缜檜⛟왪");
    Test_ToJsonFromJson_Check(156113, 507600, 235111, 448613, 64905, 260294, "ᖀ㨎乕紇答㺳萵", "쉑ᢰ靡ﮃ嚄譵", "맆晝劬瘪剈授", "䱓䎸帍곔遲祆䊼Ꙕ");
    Test_ToJsonFromJson_Check(934461, 12590, 679849, 608847, 283554, 524348, "紣ㄷꀞ秇⋽吢ↈ種祶⯔", "耾㾃庅", "ԈǶ봒", "ማ鰜㞡吂檞ꨁ딣⍣�");
    Test_ToJsonFromJson_Check(14342, 450978, 449872, 918720, 181844, 822200, "䴤䦳�榺骽䭄궉쎟", "쳷계쳣㪏汄", "", "鱆㈹�䕋");
    Test_ToJsonFromJson_Check(355681, 462683, 26762, 578239, 536202, 814596, "矓暴颙잒淮듑箩", "갗爑䬼덃耕굗ご䎽", "念ꓩꦼ�୹౺삯Ϩ", "뷌齟蜰");
    Test_ToJsonFromJson_Check(997977, 631049, 988710, 432442, 20231, 116955, "⏰‖馞褗蛢䲲闞ꩍ", "೵횽祋阈熲", "膀璠뎝⺧䛙픮翽", "䙖ᲀ㭔⬥襶喩ᓅ䍕ꆹ");
    Test_ToJsonFromJson_Check(757733, 361553, 195560, 995705, 717574, 333832, "婯맕赕磳섇邋�", "똼顯얮듖踉弹겸", "볶烓", "Ŧ묓买嗒쫑鋋�狫ꙡ");
    Test_ToJsonFromJson_Check(769500, 821203, 506456, 763501, 818278, 885620, "♖쥁힒뼘㽗", "䪗⇹瓒䬓", "▘녝裂ꦍ", "㩵㈰㽇䙃珍㉡�郺");
    Test_ToJsonFromJson_Check(621484, 523884, 535483, 376339, 278929, 515698, "塻盩鮕雮亦釪挨⎈", "爒ˣꌋ뀀", "얳礞䛜꜠㋆윊", "잜徺〶力෎턒柬઒궅抈");
    Test_ToJsonFromJson_Check(341415, 715158, 536447, 742040, 334991, 935244, "鵒㼅", "", "䔂旓彥㖹尰鵟", "");
    Test_ToJsonFromJson_Check(627628, 354961, 685120, 205558, 55990, 602416, "ⱪ탵", "陚＝ⶇ�", "頹㱭", "搵垑雛깵黌壀唑骿䋛");
    Test_ToJsonFromJson_Check(15019, 434488, 875074, 796797, 234740, 703842, "ૉ娐j⏣ꄺ暡欐", "䦱�롴ퟌ", "", "Ҥ襤덌ῤ䐧ꮚ");
    Test_ToJsonFromJson_Check(433737, 262440, 482143, 130869, 540486, 615506, "뷞ᠮ裡", "䦵೿緋빢毗咫㌊㧱疦鹰", "蛊ꠌ⋞ネ", "곑凋�蔐鴁⅘굡");
    Test_ToJsonFromJson_Check(830567, 581720, 582937, 514184, 119086, 314376, "ȟ", "罫⺪", "", "Ⱕ⤑ﻂ殩姒糒ꃆ塀");
    Test_ToJsonFromJson_Check(264554, 645752, 38413, 854347, 249768, 165697, "篦䙸䜋�셨", "尊䉸䅐⮱苸", "", "㇨璧頒⹜遛㔧ꡜ㵷枸첓");
    Test_ToJsonFromJson_Check(315557, 637854, 170000, 743799, 704637, 700426, "Ⅲꂐ硘우梨杯ꤎ", "थに", "돠艄훔�웖륞㍃", "埈핹腕");
    Test_ToJsonFromJson_Check(37056, 432533, 668463, 51833, 362389, 590338, "뱏熫鏵밃碻ᶁ", "䍅Ꝙ袘䯞髟", "墼", "୵㘱䢨̭");
    Test_ToJsonFromJson_Check(228408, 132636, 233611, 788811, 485983, 818382, "폒", "뀧›䢬䟼ⶲ᝹糀", "Nခ툎妊⧔扦㿏Ⴇ⳵", "騩ࡷ飵");
    Test_ToJsonFromJson_Check(619631, 402655, 369631, 651681, 886948, 449216, "臐ᙙᰪ栎纰乩궕껒꾤", "邝פᜃ梑蠰", "", "");
    Test_ToJsonFromJson_Check(28880, 944920, 825583, 560035, 398893, 188284, "닢", "ᛙ牗ּ", "⇹", "䆖ើ銨〘ほ跱倭䗷");
    Test_ToJsonFromJson_Check(278317, 179847, 20018, 927132, 913860, 390837, "馤", "뾯抃䱈೵谬", "臘톸ୠ앧茾⷗", "紶忿뾙乜ꩰ");
    Test_ToJsonFromJson_Check(282719, 606587, 616253, 899452, 95616, 462465, "ꓛᦱ軽ꂜ춙K䱯㨯葄", "噕숲ॣ᧸⹯줏气", "쟍퐩㷬瘏�逊퉈䨽턋", "ฑ舩쿋��");
    Test_ToJsonFromJson_Check(519206, 802097, 798627, 95115, 272044, 903474, "檃添", "�ﵺ䵴㫨὇ų", "灙", "趰ꑘ嗀嬺");
    Test_ToJsonFromJson_Check(965403, 594783, 863382, 374360, 353933, 373576, "퐔", "ú锖疊", "쯜䨶", "஬麋�縣䉁ꨆ㏪㺢ḡ");
    Test_ToJsonFromJson_Check(510, 138003, 351956, 987749, 64367, 572988, "䒵춣閠쯨목楥ᾥ軫", "", "쏁ŵ㣈Ꞑ", "縏맄ḅ♁뚌ⶣޯﮦ컻㴃");
    Test_ToJsonFromJson_Check(256514, 393864, 502672, 684342, 985616, 722837, "뒣筗鏖", "쉳蔼蹥揪", "㟇䬦쭁农祝ꠋ��", "㉐漊쎽怴闛ꈘᵮ");
    Test_ToJsonFromJson_Check(292130, 298748, 69313, 533747, 910428, 825455, "男�ᆰ뜬", "颓ヂ�蜷", "驸ﰹ珛㸤⇢㫢긩保", "꨷");
  }
  
  bool unitTestResults_Competition_ToFromJSONObject = runAsync(Tests_RegisterAll_Competition_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_Competition_Getters() {
    RegisterUnitTest('UnitTest_Competition_Getters', UnitTest_Competition_Getters);
  }
  
  bool Test_CheckProps_Competition(uint id, uint startDate, uint endDate, uint matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, const string &in region) {
    Competition@ tmp = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region);
    assert(id == tmp.id, 'field id with value `' + id + '`');
    assert(startDate == tmp.startDate, 'field startDate with value `' + startDate + '`');
    assert(endDate == tmp.endDate, 'field endDate with value `' + endDate + '`');
    assert(matchesGenerationDate == tmp.matchesGenerationDate, 'field matchesGenerationDate with value `' + matchesGenerationDate + '`');
    assert(nbPlayers == tmp.nbPlayers, 'field nbPlayers with value `' + nbPlayers + '`');
    assert(leaderboardId == tmp.leaderboardId, 'field leaderboardId with value `' + leaderboardId + '`');
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(liveId == tmp.liveId, 'field liveId with value `' + liveId + '`');
    assert(creator == tmp.creator, 'field creator with value `' + creator + '`');
    assert(region == tmp.region, 'field region with value `' + region + '`');
    return true;
  }
  
  void UnitTest_Competition_Getters() {
    Test_CheckProps_Competition(394184, 158696, 888896, 284583, 980813, 825164, "", "⢢羋", "╝㸌鐁", "韋");
    Test_CheckProps_Competition(313205, 230597, 459702, 14178, 409104, 402441, "㘇힞", "ꂆऒ涮�뗗텓酞", "漽똮覧﶑䙢꺰ꦞᩘ", "먳�⿵枵ⴾ㬪●ꜛ귦");
    Test_CheckProps_Competition(622511, 937581, 265299, 476140, 324910, 49504, "握", "㷗᤾虝䰒ஷ", "듡鷰那춴庂ᄼﵰ", "尚豈젮훇懓奲쮄⸔");
    Test_CheckProps_Competition(224303, 788874, 44714, 425650, 719653, 49582, "拣䵱", "뽥뤎祰ᇡᒧឝ밇", "䇢", "윃ᆟ퇚箺᧸䤩");
    Test_CheckProps_Competition(643726, 6143, 168768, 469338, 985034, 302501, "쿽騍큋", "뭷", "蹪鈤ꦀ㔭", "㎀꿈�ᴶ๏㕭∸缲䁏");
    Test_CheckProps_Competition(972616, 680656, 509010, 703391, 945399, 696757, "瀮㍿웦쭜䢝䃙�׭駭", "", "䵙", "阚⦈郶炼");
    Test_CheckProps_Competition(847011, 203213, 258145, 702564, 816997, 96323, "㩾껫墰菌㶑ꔘ", "옡뭱過ଚ㩕", "뙱䕂륦홰떌䱇盰쩑", "痚ꄻ滇�ꒉ㳀");
    Test_CheckProps_Competition(773342, 705388, 321952, 89935, 469141, 215862, "ୣ筃痒胊의䉶杻�죝", "墒≜蔗塚", "᠟Ꮍ⁭豹理癙⤊웪", "⏋릈䨕＠߇₹紇秉");
    Test_CheckProps_Competition(982620, 978653, 334968, 390076, 565396, 988735, "䨗ও�휋℃", "ꗸ鶧ㆌ痒㇌", "퍑", "");
    Test_CheckProps_Competition(970606, 35581, 597764, 742625, 707776, 850420, "㦟茍沕К߄", "ソ⿈鄠", "龲ꇗ⡔辅", "颦蚕蔟");
    Test_CheckProps_Competition(78530, 529329, 83328, 124133, 762934, 346182, "㱷ဥ院", "䃹눭쯺", "쫉䶶", "鷦耢鬗⁴炆ᔻἚ");
    Test_CheckProps_Competition(903157, 418900, 147888, 793887, 67462, 782210, "⁮ꕕ뉲�工턈鉚枛", "ಟ", "뼊谥", "็۟弜쌘㙛핺﫽㑪");
    Test_CheckProps_Competition(783971, 913764, 883796, 488370, 949203, 439297, "郫홟㕤㫛Ҹ", "怢瞱㻗﬽팊�", "듍꩐瘁", "狥Ü매剟䝛튟뿎ວ");
    Test_CheckProps_Competition(396785, 680498, 521868, 335576, 485202, 885581, "먔", "㧯䦴귏毥᥃嗯䵌‱", "ࣼ", "⧞픭");
    Test_CheckProps_Competition(519232, 327978, 521245, 812325, 623470, 438389, "镧畉弐狝פ뤫硥홅惗", "틖ꎀ�淲ﺆ跏㜤", "袿칉谜訷໰胖�䞈䚴", "罽췜歵ȧㄚ�妐");
    Test_CheckProps_Competition(66200, 925238, 582898, 482768, 925363, 355531, "ጢ", "豺댜￰", "꥞琷᯵テ䪮䅎쯰", "嵐䓸瀓䳻Ჵ﨑ꁄ");
    Test_CheckProps_Competition(902045, 748571, 147555, 303027, 462299, 965014, "㼘ⵏ骗", "⋵隸꫍痈", "嚖竝嬑훃", "沈v鬕绽ᅧ猣");
    Test_CheckProps_Competition(534398, 575293, 650559, 361945, 900907, 753475, "鷂啕ኞ", "늋鯪섎఍䃿fྔ㐔", "㲸肅瞇᭥⶗褰씌踵", "溪৥롰꬜䮖揉筢");
    Test_CheckProps_Competition(491704, 15600, 233767, 656430, 717791, 449432, "긽榈俍埯퐥ঠ἗넾ᅳ", "婓菨뻟௎", "诨⥇Ш", "꬈फ़Ը㌲狊");
    Test_CheckProps_Competition(594259, 142735, 684845, 571451, 914746, 375598, "밃괦㮜䔐炒悄௶揸ꥒ叵", "贙殺뱆ᩖ彐", "Ν曶됚", "ⱝ侘⏾齫ﾌ䳙");
    Test_CheckProps_Competition(498609, 237947, 84409, 926444, 679346, 541083, "�ࠫ⿳훿", "铟Ꙓ鐻ų", "他�慺㗻壺旻슽", "㣕ದ鴆䟎");
    Test_CheckProps_Competition(412232, 772864, 760754, 963563, 383195, 209250, "禱鍾齪床὏勐", "阊", "㐙㷀뵌慔駐윳陑镉⣀", "㾥괶됼헽⇐춻");
    Test_CheckProps_Competition(187953, 516520, 961253, 905806, 387647, 160891, "ﺏ柙㕤쩢", "㵉ꙙꌗ枚逳", "", "龭컏�嚌솱挂ꁪ쥫�");
    Test_CheckProps_Competition(576372, 366742, 751600, 82673, 881873, 44403, "륍虋陱濣灈￨℈⩝ꝶ", "莻ጺ䭉胼ᑝ쨀", "蛫龆뇘", "숢嗖ᘖ᮳➄䛳碸䀠열");
    Test_CheckProps_Competition(731056, 153246, 608162, 262313, 646611, 566801, "砹罜䖈줍", "", "뗔ゃ諪ﰞပ꙳㜢㠱뮄", "个幚");
    Test_CheckProps_Competition(192542, 77285, 759445, 979742, 391279, 933285, "횹ڄ", "졠陨❝�⥉嫾쀵", "缰", "");
    Test_CheckProps_Competition(400651, 599112, 304460, 19455, 910563, 810229, "灤览", "㘅驹劣", "㵲�젽ઌ㳲嘁�", "쿏靆ﰭᖦ");
    Test_CheckProps_Competition(237482, 967173, 36520, 955306, 202414, 395680, "�뎿�ྊ䐊罶㭹", "ݹ話亢൓⾽㖉", "⊲ǫ礳惴", "");
    Test_CheckProps_Competition(88502, 327820, 252881, 952190, 679382, 971312, "⿎譟䏭哧唨䌲㓂䗻", "푍봴", "䪵", "赯");
    Test_CheckProps_Competition(996815, 657076, 435024, 3792, 602813, 242168, "䈭䋟嵎桅꣒뙤偌", "▦⼛傟ꕅ⊥꜔䤩卑̐", "턴䅕ℶ࠿ㆸ", "票彣饽");
    Test_CheckProps_Competition(3143, 604029, 254338, 549334, 948044, 926072, "廒ㇱ팜锏▽", "", "ꎥ띎", "穘覃᪯뺣幚쓼ሩ");
    Test_CheckProps_Competition(182271, 514523, 660373, 762405, 237771, 175415, "⫞떵�鷜™櫃諄垇疫", "욤츙촐㲃朓紸늹鷲", "䥾箉穘ꇠ䫧䟧儷", "묁폹");
    Test_CheckProps_Competition(294566, 547396, 797806, 953142, 777612, 45846, "ꁸᶝ腪쓟쓄", "ǋ鯮镘嫊冠愃", "췥뾴ⴾ愫팹룼崬銌", "郐濂");
    Test_CheckProps_Competition(215935, 840198, 33362, 402482, 925580, 176023, "", "꩓ꓛ", "裹挬裀ǃ", "畹㘅놔筶ꑢ");
    Test_CheckProps_Competition(291632, 371733, 904542, 262511, 667170, 70395, "郸", "빃鞿춪�퓥", "쥒瓶", "脍䣢椃錂");
    Test_CheckProps_Competition(726562, 579288, 907733, 586115, 473488, 77247, "㾔", "㾕봠簜߲쫋", "", "뾆濾庰");
    Test_CheckProps_Competition(981241, 699301, 751134, 568489, 713956, 344417, "␁", "弆", "᧫垃배⒔ퟭ焿◰熇髾", "⏉碼恷阀衴猱");
    Test_CheckProps_Competition(583514, 251270, 850515, 815523, 262152, 875938, "鷞≦烛ྦ", "�쒿뱴墆�∗", "", "믅");
    Test_CheckProps_Competition(163447, 420662, 483076, 416819, 559176, 215951, "հ窺◫Ī ↥", "蔥", "邊", "虋㖈ᘈ缥躒�펀ᯒ㙬");
    Test_CheckProps_Competition(221147, 407516, 928807, 746986, 376450, 425535, "종ᕉ", "몳덞帪㶩ꦿ㺕", "藅끴", "쯢脹⣞阳␫幣䤁瀱");
    Test_CheckProps_Competition(635918, 240742, 27156, 77124, 71326, 676911, "딇", "嵨㟠㕆蔎椑豫鰏솞", "��졪᤼", "韭쿡");
    Test_CheckProps_Competition(615038, 802924, 663322, 343050, 19941, 895765, "쥎洺", "壂㖖䟴콠", "鈛ⰻப", "");
  }
  
  bool unitTestResults_Competition_Getters = runAsync(Tests_RegisterAll_Competition_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_Competition_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_Competition', UnitTest_OpEqSimple_Competition);
  }
  
  Competition@ lastChecked = null;
  
  bool OpEqSimple_Check(uint id, uint startDate, uint endDate, uint matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, const string &in region) {
    Competition@ o1 = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region);
    Competition@ o2 = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_Competition() {
    OpEqSimple_Check(393455, 392207, 212987, 218290, 83728, 476217, "쭶퍉첯㚥涬凙", "霋흽묌铱蝔ᔁ䀓", "਀ꩣ釪�麑遬徨탏", "壝玃勑뤋펍캒ᨶ");
    OpEqSimple_Check(526999, 962771, 489079, 509350, 591080, 333816, "璊诛퇟鯚", "獔", "峵כֿ鐄ℛݙᚬ쇳濶", "ᬤ쿊菆︐좙桭");
    OpEqSimple_Check(131073, 236713, 75537, 164045, 184471, 214810, "Ⓢꖠ⋳䝅攨鑽", "㞫䫆ើ鹆ʊ冿", "", "ຯ㪚鎤쎣䝕뭀");
    OpEqSimple_Check(288195, 531474, 7923, 471876, 690858, 504118, "耏盧я␜", "", "", "ꨕẽ뮱");
    OpEqSimple_Check(812991, 511553, 854015, 222332, 713311, 468715, "쏥䁏ਮ虴簪䤀揾噚셑", "䀐硩", "䀿虿砍", "픽鳐ꈉ");
    OpEqSimple_Check(718449, 909595, 422278, 333641, 830012, 82116, "뻹", "᪮壐辡�", "岁ꮸ㏧", "惝�嬅");
    OpEqSimple_Check(766369, 453007, 59523, 636232, 689395, 114882, "괙⬲", "こꅯ껳", "锲釹ឰ", "耽裮");
    OpEqSimple_Check(298494, 457344, 106515, 40481, 694261, 263, "館胄ા", "汢ꏠ⮶", "괗饖㪟", "汆講㓤통�ﭝ豲氹φ");
    OpEqSimple_Check(853751, 671624, 984599, 716978, 814326, 317042, "⩮�ώ꒏퓂䉰", "슅엎筄䄗灰ᔃ㣛צ", "", "ⱬ褑");
    OpEqSimple_Check(843670, 909926, 457029, 770199, 522160, 104104, "⛲㕤�", "ꃢ｡뫇묯", "瓪ﲥ疬᳢䩶㩒", "墨큽咪઼側똶뙈");
    OpEqSimple_Check(601038, 673623, 105608, 713773, 557945, 937519, "", "�", "粄⅝挝㠊", "共䳶넊ᙓࡀ컒");
    OpEqSimple_Check(475985, 789265, 36996, 322382, 381895, 433068, "鬻피䌱踀뤅芸", "娣ዯ﷤賚�챀曹䚨", "⟹驵盲", "賥硬⭷혀ⴿ㓶ࣛﬣ");
    OpEqSimple_Check(294139, 170604, 690603, 578377, 759825, 48706, "㕹બ⚟鰉ᡖ梉ᚭ", "遚㌌⻄", "䨾㶜☭ෳ鈴띟璦Ⴗ", "撍䈒");
    OpEqSimple_Check(296593, 97859, 343909, 463281, 327759, 609845, "텩㚽댯맑", "瞐奺ဂ", "㎭啷⨍揉", "");
    OpEqSimple_Check(773250, 395321, 354108, 306065, 941752, 993119, "վ罚宿㝳䵉貟↟", "䥿톤聿妒ᫍ�", "閯ﺸ娂ᑠ쟀냖럢쩪", "愶彄纇鼗䘚秱ᗱ");
    OpEqSimple_Check(610831, 834401, 438887, 728516, 734668, 798823, "̉韺輨浉ㆠ㌔", "図罛⢲Ȃ㹪쉰龊〢", "扆", "稻�ꊈ껿");
    OpEqSimple_Check(518187, 971400, 756593, 196654, 968043, 958667, "숬勯ﵜ쳮쬤", "䷗넱�㙫姦䟧ఊꪫ", "圦긡", "흌");
    OpEqSimple_Check(1447, 703199, 927171, 714203, 948126, 761909, "顚辑죹⪱濱놿宦奋", "훱Ⅺ킠�鸋₫일", "", "膞");
    OpEqSimple_Check(641360, 925617, 809472, 668258, 217817, 363319, "ө㩣�轏", "", "֩੿퉛꿪⹳ꈰ", "");
    OpEqSimple_Check(926220, 696064, 331215, 897341, 155958, 952064, "ힾ䣇ᚇ梅", "", "迒䌡ഘ�∁衽", "癓簡枌녑埖韠");
    OpEqSimple_Check(445761, 857000, 976480, 455033, 111470, 573616, "൹貈垸뀰过", "挧ﳗ졝", "暮㟄䷫킹륦了", "䂃堮");
    OpEqSimple_Check(856521, 84333, 651960, 562413, 79137, 734945, "繶藩륍韚킉迊", "倢슭펵", "絟磶▧汶틤", "ﾫ䅖ꏊ軃頴罩");
    OpEqSimple_Check(87920, 677295, 262088, 508624, 38712, 95772, "ﳌ祊⠤❮", "ɯ䃟偶텒綒搅聍Ꟑ", "암䢢갎穯쎙竗硨", "ᨶ␫祡扁拚ꑧ⩱ꛏ");
    OpEqSimple_Check(24041, 47111, 957356, 796492, 233572, 652683, "륳", "ྦྷ擊㣙㾯禗뻧쌜⺢뀁", "낤햳釽⛧옩炰၃鉝✜", "ⷀ듅㡐沁祿");
    OpEqSimple_Check(274962, 997288, 354149, 951957, 385338, 38661, "揆쟶孛﷤枲ꩀ옲죥魍", "姐䊂⤭�Ჺⅶ엱", "챵ꏹ", "ᛁ�");
    OpEqSimple_Check(839490, 488918, 72292, 36500, 357414, 407040, "綽ケ摓릺칻啗", "꺥", "ꥑ듴", "鳙막");
    OpEqSimple_Check(837621, 232588, 813124, 679750, 114857, 353682, "䀷픿ᨏ衔", "グ㘁ȃㅞἄ辰思莽䱪", "⹄", "房댬㾑ໞ탬鏩Ⓜ恇闥");
    OpEqSimple_Check(346449, 602322, 102070, 771852, 994879, 620502, "띴勇", "캌涒誀叞㇘㌬", "", "");
    OpEqSimple_Check(728813, 537856, 297461, 629495, 40693, 65114, "峼�澷Ư⥣", "侯억맖Ⴙ", "", "㳻툇姴챞䢿");
    OpEqSimple_Check(106429, 773269, 4480, 434225, 618239, 267078, "鼹冥풭樮쟓銀氢봃", "ⵜ㲰핋嶣䇙寇", "섀뇗", "桀蜿쾖촱痛");
    OpEqSimple_Check(67959, 550126, 747140, 491136, 128982, 152199, "蠃ᚙ鋩ඎ둪┉", "�噊딠", "຺拇씌ည햍�쓩", "ꭰ蘣㴧튂䄕᳂꛰판눮");
    OpEqSimple_Check(41300, 364434, 611520, 92494, 619517, 74358, "", "Ꮪ⹅", "�躌續", "毰덷僀ᖊἦ");
    OpEqSimple_Check(21957, 60435, 28953, 321189, 818279, 49532, "�곔櫽ꐫ␓쌍", "缎遁ᘤڷ寀�바ㆎ", "⯀ⵡ㽀ᴧ룤", "旺沣￟㸄ໟ䄺ꐶ");
    OpEqSimple_Check(450585, 891430, 652705, 95634, 743323, 63831, "톓췾热⹉㊘၁᫄鍹", "", "떶⨨ᘟ戣", "ቒ녈㰚ㇿ");
    OpEqSimple_Check(115423, 804429, 929767, 59051, 943847, 718145, "랂筙Ỵ莙▸뇺", "촄㍕札펂ឝ뙽", "悑곞ᘾ", "⻋忡過ᖃ");
    OpEqSimple_Check(879936, 783001, 936371, 854275, 840058, 975752, "ⳤ", "", "号ㆃ긺簼곽⺲댾麎", "玬욢죚");
    OpEqSimple_Check(461071, 968142, 182715, 362238, 396370, 67937, "", "ϑ᠟釿뾂䌑ᕊ愑", "㾂閈䨝嵵棓", "鈷兔呃율ᤞ鍜ꆟ翌");
    OpEqSimple_Check(717346, 22390, 363250, 943936, 907649, 675557, "ᔏ셂몚", "厪ꎢң�", "沗怛쯂Ӑ铨䄴ꓛ廉ཝ", "䕼ꢟ珱鲅昿ⅵ�졻");
    OpEqSimple_Check(643840, 872409, 192506, 968112, 262452, 458117, "፤✷㈳﷥똭퓄", "짉⣻ّḧ魯멅", "쏸휞⬔轘␼", "㼳쬺義瘺픲");
    OpEqSimple_Check(440974, 726525, 761889, 639847, 59050, 856622, "怣", "餗뼂�", "ฅⴑ鋆㫊훝湕ᱝ", "幺ਗ਼ᓊ鹿ݚ띤⻧⾁ᱡ");
    OpEqSimple_Check(569972, 753179, 122070, 50692, 674568, 941312, "昳占", "ɓקּ", "嵞䄁緯壣媂ᆠ", "댓໵噫");
    OpEqSimple_Check(922379, 638577, 811477, 597319, 699556, 892400, "쭖㟧⃟㢋ꮂ", "鷍뒦羊テ", "劗ᄼ잷輠烖ᩬ䎠찇", "䠜ヸഫ傻䂓㯄좑콤삓");
  }
  
  bool unitTestResults_Competition_OpEq = runAsync(Tests_RegisterAll_Competition_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_Competition_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_Competition', UnitTest_SzThenUnSz_Competition);
  }
  
  bool Test_SzThenUnSz_Check(uint id, uint startDate, uint endDate, uint matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, const string &in region) {
    Competition@ tmp = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region);
    assert(tmp == _Competition::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_Competition() {
    Test_SzThenUnSz_Check(823221, 663647, 352245, 777791, 86592, 719979, "朹鎟ﳙ", "编", "엻렒哾๺⾖㻄쪼ﰙ⠁玭", "氎꼻㤚藴킅Ề쯣");
    Test_SzThenUnSz_Check(964425, 605220, 262638, 498192, 179363, 144555, "幻汛瀹ፎﬡ賄", "�䮞丵�", "푲෗蔃䓥㻥잒묑�", "䟃넲䗵蹟牪");
    Test_SzThenUnSz_Check(322150, 614406, 417104, 547338, 697340, 334487, "㯠쬙ꅇ", "ᢐၛⶍ쎦㋥霈�ౝ", "먝瞄⧛鉼竲㽥︠걿좳樁", "䗇髣");
    Test_SzThenUnSz_Check(83184, 876484, 70271, 966343, 542139, 990030, "⤦➦踆⌾ꎳ㏰鉓켯τ", "䩸Ὼ㐚ꂖ摇䞰鄕ꈽ", "掝", "⑇");
    Test_SzThenUnSz_Check(467845, 956732, 101415, 490254, 320578, 583029, "솛格둪퍻䳥最徐㭾", "ፕ⎃ﲀ", "", "诜돚兽奞ͩ줞");
    Test_SzThenUnSz_Check(700902, 853957, 759104, 336591, 877257, 761537, "", "剼᪲", "ⰳ팑ꇬ䋶慸", "鐮軅㧦胷");
    Test_SzThenUnSz_Check(405127, 314974, 151896, 129142, 227499, 571633, "ు盡ₜ阵璫⃔煡", "곟ᢏ淡钡", "줒女ѽ泡誄狋", "佌Țꡮ殴䉵庨嶏");
    Test_SzThenUnSz_Check(809993, 973135, 540022, 466577, 344084, 240382, "膕躯", "", "虻雈", "ී쨳ㄤ䒹ਮ");
    Test_SzThenUnSz_Check(868449, 179302, 165205, 610030, 881016, 266937, "㐟ꯩ㹎ӑ䞖猏鐪", "躹䰑挤③", "ꡃ", "⸕숈祭鑚ൃ䶀椼");
    Test_SzThenUnSz_Check(848229, 992004, 999781, 841877, 612124, 573568, "ᓌﻸꚡ䯯桾", "", "�䄳凜嬚魯ᄍ", "太蠵ྉ樦纍ﲀ");
    Test_SzThenUnSz_Check(99463, 860757, 909951, 951620, 840455, 597747, "羔ﾧ鋣ꊌ멉녍ഩ਽", "憎", "⁋컱ⳃ㩄앪衚ध⿺", "᭬퇠至៳╝");
    Test_SzThenUnSz_Check(830203, 657034, 818624, 606450, 478495, 271620, "", "洉疧ꅦ뭲", "∐⒳伷鳯⽸︧濜ḟ", "᤾℟仅䃜쪪㌲㯊");
    Test_SzThenUnSz_Check(770642, 834356, 876904, 384560, 271358, 595771, "䶂簜饋᲏඿", "䷗鷪묡拠銢᜼錢", "손靇", "ԙꇖⲽ櫉疷冤");
    Test_SzThenUnSz_Check(884816, 252573, 449721, 421428, 437232, 360995, "⯟骙䁣豅琧뗇躏òꘄᷡ", "펽꩙负釺锼珟፩�埊쎆", "巇麃犿鎒", "띰摼푔");
    Test_SzThenUnSz_Check(929837, 487546, 504451, 808646, 898762, 882280, "윁벼寥ﴋᮝ", "㪁", "鲑頸헳ᑭᷡƫ믅༐", "鮷囫я戵댢㌠商");
    Test_SzThenUnSz_Check(225907, 63460, 433202, 482962, 745915, 315247, "쎡韠ᣳ翠�", "삈켳劻�桮럫憍ᕝ", "륫", "觰�");
    Test_SzThenUnSz_Check(141403, 123480, 876501, 913816, 930027, 532104, "궆暱여군햛蝅縰", "狤í똫俑ﷺ⋏晆뗭⴬", "믔ы䞀�ᐑꖢ䞶ꡡ훅", "낊㮄瓲ꔽ႙趹攘");
    Test_SzThenUnSz_Check(680346, 153507, 335942, 779011, 168469, 571192, "漎㛊�鉠託", "沈", "혹霭䞓盅�욜", "鳊鍽扐肑レ䷋仚饩�");
    Test_SzThenUnSz_Check(896003, 238891, 267100, 216236, 184788, 227017, "뒧蟐ﶾ鞞㉪", "韑튏ࡑ", "㕋�鯃嘐ኽੱ晤斔", "튤⟫砚乸̛瀎ᭆ㍰");
    Test_SzThenUnSz_Check(333008, 445010, 999603, 252543, 401634, 764241, "㺡࣊砅", "흴", "뻗８ᦲ菬蜻췭栴省", "왓꿨᳁ْଠ墻ἰ");
    Test_SzThenUnSz_Check(717927, 8570, 445240, 940335, 406575, 727940, "尷ꦾ첥⡵苨", "놲싵뇵쯷", "ꇑﾷꃦꅕ熪饍㨋8辝쵌", "␬");
    Test_SzThenUnSz_Check(953518, 283816, 334966, 17733, 693496, 428419, "Ⱄㄺ", "窗䊨㎠๥Ⲣ⪒冁", "婬桸꯺쎡魶㭷栳", "泒擵䆲");
    Test_SzThenUnSz_Check(989899, 583609, 363891, 810147, 786060, 403152, "옮伴ꁧⓚ紝쾲铃켴돺", "ᚡ窓", "㒾ⴙ荡옄샔ዕ", "");
    Test_SzThenUnSz_Check(670170, 133036, 763745, 133184, 698385, 181735, "ㆻಖⳡ忆", "蝶ꙵ隓臹⢺", "�诨苵跗뼍掰圷", "띨켊෦");
    Test_SzThenUnSz_Check(181236, 462111, 975084, 231318, 872445, 341345, "࢙憖ꀖ銱", "䪩", "謐", "죫ㅿ傴灲");
    Test_SzThenUnSz_Check(524341, 113139, 633845, 410284, 802080, 938700, "὏鞳鿔힢ꤪ㙖࡮�", "떾", "j좠⵲贉韽벻", "펝郀곐캼뎻튓");
    Test_SzThenUnSz_Check(674290, 314257, 695590, 585317, 715650, 126346, "䬦ᕴ", "氊듳쎴妓�鎐", "错䆈罹Ⰲ룟晶", "﫦㊷");
    Test_SzThenUnSz_Check(698855, 640500, 879577, 231998, 809611, 319210, "", "碚�뛥", "", "杽㶲焏ἕ蠕");
    Test_SzThenUnSz_Check(432129, 995984, 361102, 172416, 587000, 143859, "榄诶᳌帻鈿橦衺㉹䧚炐", "", "", "镫웤ꢚ穧륚�ᚽ蟛");
    Test_SzThenUnSz_Check(584624, 987676, 28482, 822700, 42437, 796256, "њֿ㪝峵傊톥泈ₙ搯", "ℾ쪋䕊츨ቓ瑪ؠ欸", "쭎", "捱");
    Test_SzThenUnSz_Check(934201, 959717, 827282, 387499, 263097, 603237, "＊₅뿴", "ﵝ릣㐌㞃ă拻", "", "⨝쭻䏤ᢠ䫖葻");
    Test_SzThenUnSz_Check(299030, 746125, 314857, 332208, 339274, 484862, "േ᥹뛼켄雝", "⏪㚳", "쉅亠햇ᖇ⼏歖맹훿", "㡆햽㸞");
    Test_SzThenUnSz_Check(858641, 186903, 106182, 967719, 874189, 293878, "ዼ眒沸쏀闎", "鹜瘁⟱", "斨", "");
    Test_SzThenUnSz_Check(595611, 243548, 167998, 288457, 646320, 731491, "멘┗�莘럜ꪱ㖔⍁", "঍ꆡ�鯉罨婽搅䉗", "쫒뗺磝", "풦䦵亰絽࢜");
    Test_SzThenUnSz_Check(725908, 60001, 941798, 240268, 135515, 576993, "骦灭⭔櫳", "퐵儋䳆䦺謑膢֣", "뭃⧊萉ꇱ灶�⚷", "銣콇ﲇ꽾᭔");
    Test_SzThenUnSz_Check(816683, 862689, 91441, 171277, 676002, 998835, "ᖕὪＩᬶѣ瀠宅⎰皎䊭", "卤㵠휄Ｋ咱敏", "⅛䉠稯ꛬ焄－噈", "⅌滛ⷖ뿂⬔");
    Test_SzThenUnSz_Check(723687, 655057, 730433, 9696, 608631, 227459, "가郩㌼㏖⼇", "ᐱ鉓䞓", "妛࿏", "㮼쓎憷Ὄဨ㘳顫踠䙲");
    Test_SzThenUnSz_Check(916384, 756483, 269129, 980780, 439734, 212480, "", "", "䀒䍊빇曁绀溜ⅅ࿿倴", "畵䯖쫟艖");
    Test_SzThenUnSz_Check(626085, 916666, 664136, 816274, 509939, 797218, "嘍쾽ಕ", "徵ꨩ穕", "᧪귮煢쇳", "ᄉ⪒");
    Test_SzThenUnSz_Check(215898, 662617, 672713, 993313, 820855, 259505, "韄色톽ⱥ졗", "ᡐ蜑ዡ渝봫᧮Ἳ", "飗㠝茼邬䃳䡝㹅楨", "濁檍ਜ");
    Test_SzThenUnSz_Check(230479, 134830, 978541, 166520, 568742, 158127, "沗逴矖卤䥌Ŝ柫", "ኛ�", "Ề", "愛쫿");
    Test_SzThenUnSz_Check(645572, 163036, 663349, 264347, 830664, 172725, "贲Ἴｃ鉃", "꤭韶啇许䑐㸬涂", "יּ尒䃚ና苔놗퇝", "푑");
  }
  
  bool unitTestResults_Competition_RowSerialization = runAsync(Tests_RegisterAll_Competition_RowSerialization);
}
#endif