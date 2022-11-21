#if UNIT_TEST
namespace Test_PlayerStats {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_PlayerStats_CommonTesting() {
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
  
  bool unitTestResults_PlayerStats_CommonTesting = runAsync(Tests_RegisterAll_PlayerStats_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_PlayerStats_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_PlayerStats', UnitTest_ToJsonFromJson_PlayerStats);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in Name, const string &in SpawnStatus, const uint[] &in CurrentLapTimes, const uint[] &in CurrentRaceTimes, uint CurrentLapTime, uint CurrentRaceTime) {
    PlayerStats@ tmp = PlayerStats(Name, SpawnStatus, CurrentLapTimes, CurrentRaceTimes, CurrentLapTime, CurrentRaceTime);
    assert(tmp == PlayerStats(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_PlayerStats() {
    Test_ToJsonFromJson_Check("", "ꠂ쮰", {690814, 712811}, {883496, 86104, 191439}, 673390, 116343);
    Test_ToJsonFromJson_Check("�", "汯粌鉅", {704518, 331709}, {292599}, 141875, 331925);
    Test_ToJsonFromJson_Check("ᲊ̇॑", "堉", {573604, 121822, 314713}, {711273, 957341, 880999}, 833828, 414406);
    Test_ToJsonFromJson_Check("z懇�客㒞", "윷窋", {656514}, {774112}, 962581, 425743);
    Test_ToJsonFromJson_Check("", "", {710663, 882972, 314391}, {740990, 8357, 450229, 467498}, 125510, 201887);
    Test_ToJsonFromJson_Check("렷뵫皼", "�常祈ᵒ㪗", {809822, 549667, 499137, 13629}, {814563, 192429, 562436}, 839750, 493396);
    Test_ToJsonFromJson_Check("", "뮏엣", {568426, 650767, 68320, 115425}, {198407, 275663}, 474515, 501721);
    Test_ToJsonFromJson_Check("窐踎윉懜翊신꨻በ", "충왦굸褢鶳", {781176}, {417442, 64291, 304545, 899539}, 351797, 529015);
    Test_ToJsonFromJson_Check("恦鬋鍡轔援�ꧾ", "죤箖质ᣙ", {335004, 473376, 673225}, {812588, 945480}, 609511, 60203);
    Test_ToJsonFromJson_Check("៯ꭍڑ쀈ⵗ㏬", "벛ﳾ啃둸瀀", {342727}, {828508}, 617347, 317170);
    Test_ToJsonFromJson_Check("符䭭澀⽹ᱶ爅螝⬣", "∝", {}, {646581, 213551, 419173}, 490369, 936231);
    Test_ToJsonFromJson_Check("ᨘ퉁濑੉Ⱬꖗ႘", "뢑㖄瑁캳륣쑋", {47391, 348997}, {881761, 204841, 227340}, 817776, 776724);
    Test_ToJsonFromJson_Check("쐤얪", "≁隵ꄻ�ঽ㎒�郁❨鲶", {419376, 944723}, {496393}, 391375, 928935);
    Test_ToJsonFromJson_Check("ꮄ轓", "", {436624}, {138289, 777047, 235631, 123726}, 403511, 798815);
    Test_ToJsonFromJson_Check("삒볜", "↳웡꫎淐꺒Ｅ澮촎姴", {604406, 871194}, {561047, 56280, 44570, 743344}, 440156, 532804);
    Test_ToJsonFromJson_Check("颤짒傉峩ᯕ", "髷漻拹ⓨ淪", {328084, 650080, 477212}, {354192, 811107}, 471506, 827710);
    Test_ToJsonFromJson_Check("", "䐪䈞䞞䜋", {270298, 81540, 245860, 572018}, {256248}, 250599, 907104);
    Test_ToJsonFromJson_Check("؏", "▝ħ蔋팪絠촊枤ŀ", {497867}, {548088, 699484, 41873}, 801176, 883112);
    Test_ToJsonFromJson_Check("殠齒䡬뾋뿰", "湾ᾬ 讈䗺⼎Ԍ臋", {979765, 523510}, {235459, 929340, 615355, 442711}, 512066, 850587);
    Test_ToJsonFromJson_Check("晵룅쪹꨽ꩾ", "밥�틭姻韷ሸ", {611399}, {457076, 313111}, 470409, 645878);
    Test_ToJsonFromJson_Check("멨靮垆", "왪噧㉊㚨줫⧑㙵覆", {7076, 364627, 996560, 9299}, {64905, 448613, 235111, 507600}, 260294, 13752);
    Test_ToJsonFromJson_Check("紇答", "靡ﮃ嚄譵ʢᖀ㨎", {898974, 995150}, {935263, 740388, 652417}, 804780, 477471);
    Test_ToJsonFromJson_Check("", "鑭嵿釄⅟᥌⇝䱓", {228067}, {992645, 662721, 900364, 423624}, 925671, 602002);
    Test_ToJsonFromJson_Check("⍣�浥Ԉ", "", {297509}, {995447, 311819}, 14342, 450978);
    Test_ToJsonFromJson_Check("꼭㗶澃軬", "鷬헡㕚别", {494262, 218910}, {788089}, 621229, 452225);
    Test_ToJsonFromJson_Check("㪏", "", {61932, 482244, 276447}, {355681}, 462683, 26762);
    Test_ToJsonFromJson_Check("淮듑箩厈䃐᲎暓煆", "ご䎽붏矓暴颙", {476766, 506709, 749041}, {192767}, 674254, 176502);
    Test_ToJsonFromJson_Check("⊐檢䩬媴白矷孃뷌", "闞ꩍ㨧㞆豽몗䎇㤴", {347672, 346296}, {990125, 322790, 890783, 302662}, 709068, 645113);
    Test_ToJsonFromJson_Check("温膀", "襶喩ᓅ䍕", {214393, 38087}, {995705, 195560}, 717574, 333832);
    Test_ToJsonFromJson_Check("婯맕赕磳섇邋�", "똼顯얮듖踉弹겸", {194770}, {49348, 172674}, 653111, 144152);
    Test_ToJsonFromJson_Check("똛엫ᦡ⯓Ŧ", "㽗ⷻ찄䛉笘ꚠ", {853944}, {250992, 692481, 462708, 496057}, 112610, 176037);
    Test_ToJsonFromJson_Check("⏽㈝㩵㈰㽇䙃", "⎈汼듿쩷ﾪ蛻紻ꕣ䞦〱", {236794, 637991, 921369}, {798623, 84621, 676260}, 171101, 369123);
    Test_ToJsonFromJson_Check("抈⽊얳礞䛜", "徺〶力෎턒柬઒", {333402, 6459}, {921210, 935244, 334991}, 100569, 98021);
    Test_ToJsonFromJson_Check("尰", "", {609876, 730312, 831451}, {205558, 685120}, 55990, 602416);
    Test_ToJsonFromJson_Check("ⱪ탵", "陚＝ⶇ�", {455245, 491580, 169314, 798602}, {754312, 82722, 666517}, 960091, 15019);
    Test_ToJsonFromJson_Check("㩜ﾴ连", "暡欐걗�", {860289, 898206, 122414}, {320537, 769227}, 681251, 699876);
    Test_ToJsonFromJson_Check("⅝Ҥ襤덌", "", {606831, 559173, 453668, 182284}, {805490, 311470, 607971, 615506}, 885948, 712383);
    Test_ToJsonFromJson_Check("咫㌊㧱疦", "蛊ꠌ⋞ネ얽䦵೿緋빢", {32241, 307753}, {774043, 280243, 82787}, 830567, 581720);
    Test_ToJsonFromJson_Check("㰧໾趀㍟㤒居개⣪", "⺪恎", {32282, 265097, 703275}, {38413, 645752, 264554}, 854347, 249768);
    Test_ToJsonFromJson_Check("鴈濙", "⮱苸�篦䙸䜋�", {547939, 408858, 846810, 377640}, {743799, 170000, 637854, 315557}, 704637, 700426);
    Test_ToJsonFromJson_Check("Ⅲꂐ硘우梨杯ꤎ", "थに", {94574}, {668195}, 157199, 37056);
    Test_ToJsonFromJson_Check("뮾眲餻", "쑷", {804165, 333229, 699157, 191455}, {904511, 870298}, 913697, 587688);
  }
  
  bool unitTestResults_PlayerStats_ToFromJSONObject = runAsync(Tests_RegisterAll_PlayerStats_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_PlayerStats_Getters() {
    RegisterUnitTest('UnitTest_PlayerStats_Getters', UnitTest_PlayerStats_Getters);
  }
  
  bool Test_CheckProps_PlayerStats(const string &in Name, const string &in SpawnStatus, const uint[] &in CurrentLapTimes, const uint[] &in CurrentRaceTimes, uint CurrentLapTime, uint CurrentRaceTime) {
    PlayerStats@ tmp = PlayerStats(Name, SpawnStatus, CurrentLapTimes, CurrentRaceTimes, CurrentLapTime, CurrentRaceTime);
    assert(Name == tmp.Name, 'field Name with value `' + Name + '`');
    assert(SpawnStatus == tmp.SpawnStatus, 'field SpawnStatus with value `' + SpawnStatus + '`');
    assert(CurrentLapTimes == tmp.CurrentLapTimes, 'field CurrentLapTimes');
    assert(CurrentRaceTimes == tmp.CurrentRaceTimes, 'field CurrentRaceTimes');
    assert(CurrentLapTime == tmp.CurrentLapTime, 'field CurrentLapTime with value `' + CurrentLapTime + '`');
    assert(CurrentRaceTime == tmp.CurrentRaceTime, 'field CurrentRaceTime with value `' + CurrentRaceTime + '`');
    return true;
  }
  
  void UnitTest_PlayerStats_Getters() {
    Test_CheckProps_PlayerStats("�￿躮䮠馩�", "㧖⢢羋⽪㎜৏렊", {920219, 397204, 551850, 275550}, {402441, 409104, 14178}, 464786, 672947);
    Test_CheckProps_PlayerStats("鳔ꂆऒ", "﶑䙢꺰ꦞ", {380290, 845199, 990278}, {55244, 36088}, 12605, 372964);
    Test_CheckProps_PlayerStats("۫芁≲彲", "콬", {763812, 48204}, {853156, 149817}, 438676, 425498);
    Test_CheckProps_PlayerStats("", "豈", {55266, 813021, 575746, 551289}, {719653}, 49582, 433840);
    Test_CheckProps_PlayerStats("ᇡ", "�뽥뤎", {672021}, {168768, 6143, 643726, 457496}, 469338, 985034);
    Test_CheckProps_PlayerStats("㔭묹뭷┼쿽騍큋㈣", "缲䁏뤥蹪鈤", {472243, 263950, 741566}, {703391, 509010, 680656}, 945399, 696757);
    Test_CheckProps_PlayerStats("瀮㍿웦쭜䢝䃙�׭駭", "", {32083, 951829}, {378630, 96323, 816997}, 208375, 135571);
    Test_CheckProps_PlayerStats("過ଚ㩕ၪ㩾껫", "떌䱇盰쩑虿옡", {589860, 378085, 146796, 480205}, {212605, 678280, 611458}, 773342, 705388);
    Test_CheckProps_PlayerStats("杻�죝ᝫ᥾鼾㮦窘ᤲ쯳", "의", {527405, 591760, 748967}, {848880, 395859}, 330938, 514263);
    Test_CheckProps_PlayerStats("秉ⵑ᠟Ꮍ⁭", "＠߇₹", {577437}, {978653, 982620}, 334968, 390076);
    Test_CheckProps_PlayerStats("℃벷쨭욢", "鶧ㆌ痒㇌⋛䨗ও�", {807284, 233096, 234266}, {742625, 597764}, 707776, 850420);
    Test_CheckProps_PlayerStats("㦟茍沕К߄", "ソ⿈鄠", {77000, 47926, 244633}, {865586}, 505425, 454352);
    Test_CheckProps_PlayerStats("㒴퟽ᗦ㴟봨ￊￔ쥲兆", "崢ꊵ쐭", {848405, 585479, 795275, 876047}, {133172, 633088}, 833723, 27085);
    Test_CheckProps_PlayerStats("Ⴒ嶹堠鷦", "큝", {489704, 500301, 23260}, {431245, 973039, 154650}, 878595, 679739);
    Test_CheckProps_PlayerStats("쌘㙛핺", "ॐ쮞覑甃縎貥็۟", {550359}, {309649, 983400, 439297, 949203}, 850147, 565714);
    Test_CheckProps_PlayerStats("䝛튟뿎ວ扚듍꩐瘁쪟怢", "狥Ü매", {705766, 924696}, {333021, 948170, 885581, 485202}, 731067, 366682);
    Test_CheckProps_PlayerStats("ࣼ", "⧞픭", {362144, 443541}, {623470, 812325}, 438389, 805260);
    Test_CheckProps_PlayerStats("畉弐狝פ뤫硥", "�淲ﺆ跏㜤샱", {150513, 107715, 694438, 753018}, {623725, 180139, 422863, 684445}, 647698, 612954);
    Test_CheckProps_PlayerStats("뉐㕋퇪㷗뚪䬹칭", "ጢ", {340098, 180162, 165205}, {930210, 133511, 990522}, 897441, 720999);
    Test_CheckProps_PlayerStats("䚃ᖓ嵐䓸瀓", "ⵏ骗뱼扟킋泎ⲅ朓", {895579, 483553}, {468413}, 455407, 996330);
    Test_CheckProps_PlayerStats("ធ", "鷪䈥⏀淓둬ਈ틑ꏛᐰ", {54111, 572336, 508154, 882201}, {747574}, 598425, 333296);
    Test_CheckProps_PlayerStats("섎", "늋", {137515, 794190}, {551557, 174998}, 358271, 614957);
    Test_CheckProps_PlayerStats("", "ᡶ⛥杭貴溪৥", {220917, 763780, 42325, 761795}, {349405}, 96082, 300778);
    Test_CheckProps_PlayerStats("婓菨뻟௎", "诨⥇Ш", {579095, 191296}, {684845, 142735, 594259}, 571451, 914746);
    Test_CheckProps_PlayerStats("悄௶揸ꥒ叵﨑밍뇘Ꜽ", "贙殺뱆ᩖ彐쑥밃괦㮜䔐", {65331, 801047}, {237947, 498609, 744440}, 84409, 926444);
    Test_CheckProps_PlayerStats("⿳훿☸꤫睊�", "铟Ꙓ鐻ų⊺�", {963535, 928835, 970757}, {633121, 988634}, 813324, 412232);
    Test_CheckProps_PlayerStats("Ⰶ�䅴抭␹鈖躇탩", "禱鍾齪床὏勐", {113599}, {957451}, 439545, 819074);
    Test_CheckProps_PlayerStats("헽⇐춻嶻㐙㷀뵌慔", "⃙㾥괶", {878758}, {266898, 160891}, 218247, 380243);
    Test_CheckProps_PlayerStats("뒱㵉ꙙꌗ枚", "龭컏�嚌솱挂ꁪ쥫�", {758908, 754646}, {}, 82673, 881873);
    Test_CheckProps_PlayerStats("灈￨℈⩝ꝶ擆", "", {728971, 688748, 321742, 275608}, {873724}, 994918, 343715);
    Test_CheckProps_PlayerStats("䛳碸䀠열腺蛫", "鎫籄艍큋詁棐숢嗖ᘖ᮳", {269596, 861730}, {727307, 747628, 524510, 68507}, 109811, 244744);
    Test_CheckProps_PlayerStats("諪ﰞပ꙳", "嬫з漈ꑆ个幚뗔", {976532, 614806, 816426, 676684}, {400651, 657129, 84793}, 599112, 304460);
    Test_CheckProps_PlayerStats("灤览Ⱳ斓쪺", "Ȩ㘅驹", {97523, 207862, 841486}, {36520, 967173}, 955306, 202414);
    Test_CheckProps_PlayerStats("㭹뱍", "�ྊ䐊", {384998, 125245}, {739279}, 397931, 421838);
    Test_CheckProps_PlayerStats("딳落᤼擭硈勋⊲ǫ礳", "䏭哧唨䌲㓂䗻칦⼝", {398345, 711427, 218602, 961228}, {3792, 435024, 657076, 996815}, 602813, 242168);
    Test_CheckProps_PlayerStats("䈭䋟嵎桅꣒뙤偌", "▦⼛傟ꕅ⊥꜔䤩卑̐", {526053, 598321, 459941}, {254338, 604029, 3143}, 549334, 948044);
    Test_CheckProps_PlayerStats("廒ㇱ팜锏▽ꇲ", "", {991072, 459646, 950220, 927154}, {483718, 410924}, 182271, 514523);
    Test_CheckProps_PlayerStats("鳼歿捺퇵�렡ڣ뢐಼떍", "떵�鷜™櫃諄垇", {657445}, {419668, 527817, 236077}, 388226, 628368);
    Test_CheckProps_PlayerStats("㋔伮묁폹╷䥾箉", "쓄퇗븇괘摄䃜", {458208, 259244, 480955}, {262018, 638305}, 316561, 550387);
    Test_CheckProps_PlayerStats("췥뾴ⴾ愫팹룼崬銌", "郐濂", {799355}, {402482}, 925580, 176023);
    Test_CheckProps_PlayerStats("", "꩓ꓛ", {843363, 968472, 354045}, {225063}, 478027, 291632);
    Test_CheckProps_PlayerStats("浃፛⠬⨚⢅擝ֈ胑", "퓥숅郸", {543725}, {874662, 113289, 573931}, 523512, 908342);
  }
  
  bool unitTestResults_PlayerStats_Getters = runAsync(Tests_RegisterAll_PlayerStats_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_PlayerStats_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_PlayerStats', UnitTest_OpEqSimple_PlayerStats);
  }
  
  PlayerStats@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in Name, const string &in SpawnStatus, const uint[] &in CurrentLapTimes, const uint[] &in CurrentRaceTimes, uint CurrentLapTime, uint CurrentRaceTime) {
    PlayerStats@ o1 = PlayerStats(Name, SpawnStatus, CurrentLapTimes, CurrentRaceTimes, CurrentLapTime, CurrentRaceTime);
    PlayerStats@ o2 = PlayerStats(Name, SpawnStatus, CurrentLapTimes, CurrentRaceTimes, CurrentLapTime, CurrentRaceTime);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_PlayerStats() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", "춗䵩첏㞟", {310539, 803100, 499239, 860435}, {295268, 746965, 606964, 878215}, 535487, 148099);
    OpEqSimple_Check("麑遬徨", "ꩣ釪", {728579, 618336}, {526999, 377064, 960330}, 962771, 489079);
    OpEqSimple_Check("", "킅�叴뢦", {18341}, {159512, 333816}, 123640, 643073);
    OpEqSimple_Check("쇳濶鵛", "垛峵כֿ鐄ℛݙᚬ", {536782, 156001, 631652}, {785460, 26440, 214810, 184471}, 133463, 481225);
    OpEqSimple_Check("썵㞫䫆ើ鹆", "ຯ㪚鎤쎣䝕뭀", {348332}, {316940, 504118, 690858, 471876}, 401551, 541699);
    OpEqSimple_Check("", "", {747501, 45080, 12172}, {606939, 521707}, 812991, 511553);
    OpEqSimple_Check("汀ᆣ젙娣ʱᯜ鱦", "ਮ虴簪䤀揾噚셑燵", {5573, 765765}, {68708, 465852, 819364}, 624373, 718449);
    OpEqSimple_Check("", "쬟칁껁", {37294, 468333}, {4203, 333348, 629572}, 147695, 766369);
    OpEqSimple_Check("⃠嚅", "栥鏡", {765227, 153090, 172033}, {726400, 559404}, 207068, 397768);
    OpEqSimple_Check("꟤��뙑耽裮ዖ", "ᨣ㤬꾷ټ໿", {87953, 411404, 38908}, {704848, 438577, 997818, 6580}, 780762, 891985);
    OpEqSimple_Check("뛰�둕껅汆", "秨玹桗喐", {521754}, {680607, 631334}, 279276, 747775);
    OpEqSimple_Check("", "ᫎ솠轼ⱬ褑ཧ捺슅엎筄", {258954, 235166, 490783}, {358437, 358214}, 432666, 105782);
    OpEqSimple_Check("ﲥ疬᳢䩶㩒홌ꃢ｡뫇", "큽咪઼側똶뙈", {929569, 159354, 213686}, {255643}, 98074, 985987);
    OpEqSimple_Check("ࡀ컒�粄⅝", "䳶넊", {753539, 481138, 39828}, {141600, 47786, 992454, 829588}, 131429, 370081);
    OpEqSimple_Check("ⴿ㓶ࣛﬣ�⟹", "賥硬⭷", {310600, 694240}, {48706, 759825, 578377}, 794688, 783622);
    OpEqSimple_Check("⚟鰉", "띟璦Ⴗ婑遚㌌⻄㕹", {753465, 338120}, {97859, 296593}, 343909, 463281);
    OpEqSimple_Check("奺ဂ䳇텩㚽댯맑힊骝", "㎭啷⨍揉뭮", {560452, 384157, 863464, 62424}, {308928}, 739364, 419116);
    OpEqSimple_Check("쩪媭䥿톤聿妒ᫍ�⁔վ", "ᗱ閯ﺸ娂ᑠ쟀냖", {410162, 33842, 291997}, {728516, 438887}, 734668, 798823);
    OpEqSimple_Check("̉韺輨浉ㆠ㌔", "図罛⢲Ȃ㹪쉰龊〢", {235839, 436798}, {607334, 386377}, 518187, 971400);
    OpEqSimple_Check("䋰ꭔ", "ຽ", {855411, 236951, 213556}, {223128}, 253073, 621920);
    OpEqSimple_Check("숬勯", "䷗넱�㙫姦䟧ఊꪫ", {265296}, {948126, 714203, 927171, 703199}, 761909, 80547);
    OpEqSimple_Check("일ٸ顚辑죹⪱", "膞坫窀훱Ⅺ킠�鸋", {285725, 572024, 851901}, {363319}, 594375, 629633);
    OpEqSimple_Check("⹳ꈰ뗵丷", "", {240144, 894415, 181762, 563843}, {926220}, 696064, 331215);
    OpEqSimple_Check("䣇ᚇ梅翂㳕࢏", "縰㷇", {178912, 223235, 419277}, {299172, 946673, 553377}, 932418, 445761);
    OpEqSimple_Check("녜뎙㾣咂ﱉ皾澐", "过�蝄合", {824660, 86998, 101815, 812180}, {914453, 608672, 603924}, 361374, 856521);
    OpEqSimple_Check("—뜔愄츿첣⦝", "迊ṱ", {520379, 496681, 640719}, {542692}, 549628, 303267);
    OpEqSimple_Check("禾ﾫ䅖ꏊ軃頴", "", {476823, 362536}, {480850, 571849, 598605, 986198}, 700481, 994484);
    OpEqSimple_Check("", "암䢢갎穯쎙竗硨", {466006, 136002, 444643, 63435}, {796492, 957356, 47111, 24041}, 233572, 652683);
    OpEqSimple_Check("륳", "ྦྷ擊㣙㾯禗뻧쌜⺢뀁", {240354}, {315764}, 558349, 380025);
    OpEqSimple_Check("", "�ⷀ듅㡐沁祿⑝낤", {149093, 258463}, {385338, 951957, 354149}, 38661, 223824);
    OpEqSimple_Check("ꩀ옲", "ⅶ엱ǫ揆쟶孛﷤", {607898, 383038, 889660, 605805}, {36500, 72292, 488918}, 357414, 407040);
    OpEqSimple_Check("綽ケ摓릺칻啗", "꺥", {19538, 62975, 422442}, {353682, 114857, 679750, 813124}, 951824, 999243);
    OpEqSimple_Check("ㅞἄ辰思莽䱪㪪䀷픿", "闥媰⹄̥グ㘁", {246041}, {765188}, 346449, 602322);
    OpEqSimple_Check("", "海Ⴗ״", {56189, 817337}, {132420, 164296, 512875, 620502}, 490476, 525549);
    OpEqSimple_Check("๋캌涒", "ⳡ늵꜀㏔绨ᵬﴗ", {887256, 911530, 769047, 39926}, {90062, 103312, 404813}, 243828, 140435);
    OpEqSimple_Check("억", "챞䢿眭᫜", {464965}, {618239, 434225, 4480}, 267078, 966582);
    OpEqSimple_Check("풭樮쟓銀氢", "㲰핋嶣䇙寇鼹", {568006}, {550126, 67959, 582402, 407489}, 747140, 491136);
    OpEqSimple_Check("┉堼彠", "�噊딠㶷蠃ᚙ鋩ඎ", {653790, 747418, 789431}, {201495, 790689}, 151634, 31709);
    OpEqSimple_Check("ꭰ蘣㴧", "ꗭ뙌鉨恁䄈", {36947}, {364434}, 611520, 92494);
    OpEqSimple_Check("㫋�", "", {805620, 596394}, {536663, 340379}, 440082, 987124);
    OpEqSimple_Check("岌ഠ㞞炈㸸毰", "棌�곔櫽ꐫ␓쌍油蒨", {360974, 120708, 847424, 33190}, {891430, 450585, 567009, 509565}, 652705, 95634);
    OpEqSimple_Check("ۄꤢ䎲", "热⹉㊘၁᫄鍹䨢", {215597}, {374859, 995308}, 280413, 225358);
  }
  
  bool unitTestResults_PlayerStats_OpEq = runAsync(Tests_RegisterAll_PlayerStats_OpEq);
}
#endif