#if UNIT_TEST
namespace Test_CompRound {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_CompRound_CommonTesting() {
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
  
  bool unitTestResults_CompRound_CommonTesting = runAsync(Tests_RegisterAll_CompRound_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_CompRound_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_CompRound', UnitTest_ToJsonFromJson_CompRound);
  }
  
  bool Test_ToJsonFromJson_Check(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, const string &in teamLeaderboardComputeType, const string &in matchScoreDirection) {
    CompRound@ tmp = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    assert(tmp == CompRound(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_CompRound() {
    Test_ToJsonFromJson_Check(129450, 573551, 355425, 263911, 126408, 191439, "ᱶ", "䚏꼸䃧쁐", "澯�჌", "�", "汯粌鉅");
    Test_ToJsonFromJson_Check(259935, 975206, 294609, 403118, 996210, 292599, "ꦻ땬黿救솳", "ᲊ̇॑", "堉", "ｓ", "摂ꖶ鍁紙");
    Test_ToJsonFromJson_Check(957341, 711273, 833828, 414406, 744556, 199466, "澵z懇", "뵧칒튪윷", "扬껰", "㌴", "ஷࣅ");
    Test_ToJsonFromJson_Check(425743, 228874, 545237, 796389, 811618, 178687, "᯿쨄봌", "炤䩦ᛥ婫囼", "䦋쁗缧ⱊﱻ狀ꆟ", "", "ᵒ㪗羘렷뵫");
    Test_ToJsonFromJson_Check(291599, 158796, 236301, 772258, 238755, 689542, "", "畍", "炄", "ᩁ㟅ഽᒽ罆鹌ﲒ咧놪☼", "⨗萃쎉뮏");
    Test_ToJsonFromJson_Check(307977, 782152, 275663, 198407, 474515, 501721, "窐踎윉懜翊신꨻በ", "충왦굸褢鶳", "퓹ꔴ㳇୭鹥灦", "Ηꨘ", "�ꧾ큽ⷾ뮁d更");
    Test_ToJsonFromJson_Check(442122, 757477, 61319, 220027, 23962, 61424, "", "뗃㷦⏓箝썷", "㏬蠑坖澂ꉃ뒅Ὄ", "៯ꭍڑ쀈ⵗ", "벛ﳾ啃둸瀀");
    Test_ToJsonFromJson_Check(698297, 625858, 828508, 617347, 317170, 959377, "ꒋ符䭭澀", "�", "䡼淣럸튦蘥", "Ⱬꖗ႘ᖦﭭ见", "瑁캳륣쑋쎧ᨘ퉁濑");
    Test_ToJsonFromJson_Check(17181, 227340, 204841, 881761, 817776, 776724, "쐤얪", "≁隵ꄻ�ঽ㎒�郁❨鲶", "섚ᘭ☖甩ῶ욉", "轓᧦㗭", "ᬁ籕ￌ龎쬩ꨝ");
    Test_ToJsonFromJson_Check(235631, 777047, 138289, 403511, 798815, 951763, "", "䮪", "淐꺒Ｅ澮촎", "딙授↳웡", "턜㧷わ銂⧼馣谱");
    Test_ToJsonFromJson_Check(44570, 56280, 561047, 440156, 532804, 34223, "颤짒傉", "髷漻拹ⓨ淪", "ꢶ嗲聅䄳ㆳ尉ź恮", "瑏求뺝숯䐪䈞䞞䜋歹☰", "몖괩");
    Test_ToJsonFromJson_Check(876283, 49476, 256248, 250599, 907104, 779715, "ħ蔋팪絠촊枤ŀཎ", "穏뫤࡙攴쑋㵗髍澇㤘", "뾋뿰秮", " 讈䗺⼎Ԍ臋뽦殠齒", "ᒢ湾");
    Test_ToJsonFromJson_Check(12880, 621120, 992957, 442711, 615355, 929340, "", "", "", "晵룅쪹꨽ꩾ", "밥�틭姻韷ሸ");
    Test_ToJsonFromJson_Check(656011, 421056, 78744, 313111, 457076, 470409, "㙵覆ೕ멨靮垆规", "㚨줫", "", "䮔췬鼋탐缜檜⛟왪", "㞥ۚ轔렫炙");
    Test_ToJsonFromJson_Check(235111, 448613, 64905, 260294, 13752, 693335, "紇", "靡ﮃ嚄譵ʢᖀ㨎", "䎫쉑", "맆晝劬瘪剈", "䱓䎸帍곔遲祆䊼Ꙕ");
    Test_ToJsonFromJson_Check(934461, 12590, 679849, 608847, 283554, 524348, "紣ㄷꀞ秇⋽吢ↈ種祶⯔", "耾㾃庅", "ԈǶ봒", "ማ鰜㞡吂檞ꨁ딣⍣�", "澃軬ꇈ퉿");
    Test_ToJsonFromJson_Check(181844, 822200, 152001, 825672, 354693, 814831, "", "쳷계쳣㪏汄ガ", "", "鱆㈹�䕋", "〱");
    Test_ToJsonFromJson_Check(355681, 462683, 26762, 578239, 536202, 814596, "矓暴颙잒淮듑箩", "갗爑䬼덃耕굗ご䎽", "念ꓩꦼ�୹౺삯Ϩ", "뷌齟蜰", "媴白矷");
    Test_ToJsonFromJson_Check(631049, 988710, 432442, 20231, 116955, 720361, "㜆⏰‖馞褗蛢䲲闞", "暈೵횽祋阈", "뎝⺧䛙픮", "温膀璠", "襶喩ᓅ䍕");
    Test_ToJsonFromJson_Check(849459, 217180, 757733, 361553, 195560, 995705, "ᆄ浸酒袑", "婯맕赕磳섇邋�", "똼顯얮듖踉弹겸", "볶烓", "Ŧ묓买嗒쫑鋋�狫ꙡ");
    Test_ToJsonFromJson_Check(769500, 821203, 506456, 763501, 818278, 885620, "♖쥁힒뼘㽗", "䪗⇹瓒䬓", "▘녝裂ꦍ", "㩵㈰㽇䙃珍㉡�郺", "蛻紻ꕣ䞦〱긄⏽");
    Test_ToJsonFromJson_Check(278929, 515698, 163050, 978188, 676260, 84621, "윊䰟", "柬઒궅抈⽊얳礞䛜꜠", "〶力෎", "", "");
    Test_ToJsonFromJson_Check(341415, 715158, 536447, 742040, 334991, 935244, "鵒㼅", "", "䔂旓彥㖹尰鵟", "", "");
    Test_ToJsonFromJson_Check(627628, 354961, 685120, 205558, 55990, 602416, "ⱪ탵", "陚＝ⶇ�", "頹㱭", "搵垑雛깵黌壀唑骿䋛", "埈㩜ﾴ连㻰쮛");
    Test_ToJsonFromJson_Check(703842, 454857, 519051, 164551, 322748, 275134, "ꄡ䦱�롴ퟌ驠", "Ҥ襤덌ῤ䐧ꮚ", "꽻뺿쭠贑麏揅שּ㰄", "饚", "ᠮ裡͆⩒轖");
    Test_ToJsonFromJson_Check(712383, 486223, 788234, 347957, 551658, 346280, "蛊ꠌ⋞ネ", "곑凋�蔐鴁⅘굡", "냢", "ﱛಃ", "㰧໾趀㍟㤒居개⣪");
    Test_ToJsonFromJson_Check(581600, 728577, 436154, 948042, 135482, 560859, "Ⱕ⤑ﻂ殩", "୊䥌", "琜䰶", "", "끜");
    Test_ToJsonFromJson_Check(645752, 38413, 854347, 249768, 165697, 68906, "遛㔧ꡜ㵷枸첓嬅쭸尊", "頒", "ؤ�㇨", "伜", "腬킰");
    Test_ToJsonFromJson_Check(743799, 704637, 700426, 957934, 789300, 756269, "", "Ⅲꂐ硘", "थに", "돠艄훔�웖륞㍃", "埈핹腕");
    Test_ToJsonFromJson_Check(37056, 432533, 668463, 51833, 362389, 590338, "뱏熫鏵밃碻ᶁ", "䍅Ꝙ袘䯞髟", "墼", "୵㘱䢨̭", "瀍ﱬ⠔軙壑");
    Test_ToJsonFromJson_Check(132636, 233611, 788811, 485983, 818382, 716013, "뀧›䢬䟼ⶲ᝹糀밄", "Nခ툎妊⧔扦㿏Ⴇ⳵", "騩ࡷ飵", "䦚鶯짫帐뺿块砑툾ਫ਼", "");
    Test_ToJsonFromJson_Check(886948, 449216, 372019, 289997, 381290, 838506, "邝פᜃ梑蠰鸀臐ᙙᰪ", "", "", "⠧뚇မͿ掗ν", "砐ᤌ�媓㊵覞잰聡");
    Test_ToJsonFromJson_Check(800187, 218039, 799550, 650221, 475412, 618854, "䆖ើ銨〘ほ跱倭䗷", "뽟몦呻", "", "輂䥻扩唃쟚뒍", "馤");
    Test_ToJsonFromJson_Check(973202, 814806, 157319, 48005, 926335, 29842, "臘톸", "紶忿뾙乜ꩰ", "ꪓ춒ⷸ䢎�殶", "聇㻇ຫ", "葄㿮");
    Test_ToJsonFromJson_Check(338469, 634986, 924168, 134123, 365100, 569962, "", "逊퉈䨽턋ᄙ噕숲ॣ᧸", "瘏", "ฑ舩쿋��㥌쟍퐩", "틟ẚꙝῷ");
    Test_ToJsonFromJson_Check(903474, 589811, 833935, 343244, 691293, 921056, "灙䒷�", "趰ꑘ嗀嬺", "쭗緞쐼ჲ쥟", "㿥ᢧ맦䎀", "锖疊索");
    Test_ToJsonFromJson_Check(942759, 87997, 954580, 653807, 524712, 794329, "牢஬麋", "ⲱꢊ", "ꕠ�", "閠쯨목楥ᾥ", "㣈Ꞑꮀ䅦䒵");
    Test_ToJsonFromJson_Check(393537, 756072, 114684, 841147, 789280, 944209, "ꔊ줮㿮ᚶ堩ᘟ", "�暜窋ᖪ࡝ἇ༽욎", "豺埞", "숽쉳蔼蹥揪₃뒣筗", "祝ꠋ��");
    Test_ToJsonFromJson_Check(799321, 649165, 291812, 481002, 204818, 150200, "溨콕ʔ镸〿ᭆ䅲砮˻ꇟ", "୑", "ᆰ뜬٬", "蜷輶男", "颓ヂ");
    Test_ToJsonFromJson_Check(12502, 700205, 224660, 289574, 479382, 669562, "⵶�伝", "㧘ڎ⣑뿇쳚醤稡", "䈩휲쾹짨뵅", "ﳘ鯇剸錛⧡", "及帾衞");
    Test_ToJsonFromJson_Check(104684, 425509, 143767, 95525, 950017, 643452, "暒쇠覡邯Ｄ▱缜", "锑", "柚촵", "관쫣娪颥驗䂨Ɱ✬맺", "滛窖ꀰ又ꉂ节瓞맜");
    Test_ToJsonFromJson_Check(38709, 284453, 365427, 216222, 204974, 202070, "旱嗙鸙뺦疂纑긶嘍唾", "Іﰹ奡Ṵሗ祢（쇱묜", "鸚圲", "놬׺ㅯ껶祓䲛虋", "⣍");
  }
  
  bool unitTestResults_CompRound_ToFromJSONObject = runAsync(Tests_RegisterAll_CompRound_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_CompRound_Getters() {
    RegisterUnitTest('UnitTest_CompRound_Getters', UnitTest_CompRound_Getters);
  }
  
  bool Test_CheckProps_CompRound(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, const string &in teamLeaderboardComputeType, const string &in matchScoreDirection) {
    CompRound@ tmp = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    assert(id == tmp.id, 'field id with value `' + id + '`');
    assert(qualifierChallengeId == tmp.qualifierChallengeId, 'field qualifierChallengeId with value `' + qualifierChallengeId + '`');
    assert(position == tmp.position, 'field position with value `' + position + '`');
    assert(nbMatches == tmp.nbMatches, 'field nbMatches with value `' + nbMatches + '`');
    assert(startDate == tmp.startDate, 'field startDate with value `' + startDate + '`');
    assert(endDate == tmp.endDate, 'field endDate with value `' + endDate + '`');
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(status == tmp.status, 'field status with value `' + status + '`');
    assert(leaderboardComputeType == tmp.leaderboardComputeType, 'field leaderboardComputeType with value `' + leaderboardComputeType + '`');
    assert(teamLeaderboardComputeType == tmp.teamLeaderboardComputeType, 'field teamLeaderboardComputeType with value `' + teamLeaderboardComputeType + '`');
    assert(matchScoreDirection == tmp.matchScoreDirection, 'field matchScoreDirection with value `' + matchScoreDirection + '`');
    return true;
  }
  
  void UnitTest_CompRound_Getters() {
    Test_CheckProps_CompRound(394184, 158696, 888896, 284583, 980813, 825164, "", "⢢羋", "╝㸌鐁", "韋", "�싺콠旱疍鰉橿");
    Test_CheckProps_CompRound(464786, 672947, 490383, 813542, 54851, 704714, "覧", "枵ⴾ㬪●ꜛ귦翮漽똮", "⨸۫芁≲彲⏈먳�", "�拺윰蘆", "㞪㷗᤾虝䰒ஷ");
    Test_CheckProps_CompRound(149817, 853156, 438676, 425498, 985047, 224303, "徲㼏嘿", "ᓭ褾", "ᒧឝ밇�拣䵱䌏�", "퇚箺᧸䤩䇢�뽥뤎祰", "儞祹㚏풓鏓윃");
    Test_CheckProps_CompRound(985034, 302501, 401385, 290417, 254860, 984066, "㔭묹", "缲䁏뤥蹪鈤", "ᨴ㪂ꦽ㎀꿈�ᴶ๏㕭", "랭즫ᇁ﹀賊惍", "�׭駭겯ƴ皌");
    Test_CheckProps_CompRound(926979, 620839, 892156, 363342, 361241, 585012, "阚⦈郶炼", "弊䮷⃷쨗蝢ᳳ쁼", "㶑ꔘₜ齬聎雄攩澴", "뭱過ଚ㩕ၪ㩾껫墰", "䕂륦홰떌䱇盰쩑虿");
    Test_CheckProps_CompRound(428390, 96314, 704214, 611458, 678280, 212605, "쯳枦섍", "의䉶杻�죝ᝫ᥾鼾㮦窘", "痒", "웪墒≜蔗塚䌽ୣ", "ⵑ᠟Ꮍ⁭豹理癙");
    Test_CheckProps_CompRound(681795, 802277, 116042, 920965, 982620, 978653, "벷쨭욢璞", "䨗ও�휋", "ꗸ鶧ㆌ痒㇌", "퍑", "");
    Test_CheckProps_CompRound(970606, 35581, 597764, 742625, 707776, 850420, "㦟茍沕К߄", "ソ⿈鄠", "龲ꇗ⡔辅", "颦蚕蔟", "㒴퟽ᗦ㴟봨ￊￔ쥲兆");
    Test_CheckProps_CompRound(346182, 518141, 153623, 2628, 772861, 633088, "耢鬗⁴炆ᔻ", "嶹堠", "༏큝㫓", "ힼ㼓", "⁮ꕕ뉲�工턈鉚枛");
    Test_CheckProps_CompRound(878595, 679739, 182317, 694416, 783971, 913764, "Ҹꃈ䮣ᬬ컵嶐", "㻗﬽팊�슍郫홟㕤", "䝛튟뿎ວ扚듍꩐瘁쪟怢", "狥Ü매", "聹匂仰䭬鹃ȟ薲");
    Test_CheckProps_CompRound(885581, 948170, 333021, 731067, 366682, 72793, "⍪⧞픭蚏", "轁竁怒", "홅惗酁଱᮷㈾នﯸ", "샱镧畉弐狝פ뤫", "䚴鵁틖ꎀ�淲ﺆ跏");
    Test_CheckProps_CompRound(952652, 684445, 422863, 180139, 623725, 647698, "뚪䬹칭烈", "豺댜￰귥ጢ䨣뉐㕋퇪", "꥞琷᯵テ䪮䅎쯰", "嵐䓸瀓䳻Ჵ﨑ꁄ", "");
    Test_CheckProps_CompRound(147555, 303027, 462299, 965014, 40648, 927132, "⋵隸꫍痈", "嚖竝嬑훃", "沈v鬕绽ᅧ猣", "ꭢ", "ꏛ");
    Test_CheckProps_CompRound(575293, 650559, 361945, 900907, 753475, 684210, "䃿fྔ㐔ᡄ鷂", "섎", "늋", "㲸肅瞇᭥⶗褰씌踵", "溪৥롰꬜䮖揉筢");
    Test_CheckProps_CompRound(491704, 15600, 233767, 656430, 717791, 449432, "긽榈俍埯퐥ঠ἗넾ᅳ", "婓菨뻟௎", "诨⥇Ш", "꬈फ़Ը㌲狊", "㠇趣馸揉᪥溊");
    Test_CheckProps_CompRound(375598, 463792, 482375, 442104, 534976, 802517, "䇶Ν曶됚简贙殺뱆ᩖ", "⏾齫ﾌ", "๠쌩䖐ⱝ", "낭荸〈", "");
    Test_CheckProps_CompRound(541083, 185861, 605257, 915086, 489560, 284881, "㗻壺旻", "ದ鴆䟎他�", "ၲႪ", "Ⰶ�䅴抭␹鈖躇탩", "禱鍾齪床὏勐");
    Test_CheckProps_CompRound(80069, 437881, 957451, 439545, 819074, 11919, "", "⇐춻嶻", "⃙㾥괶됼", "奨啈䂜絊앨⛳", "");
    Test_CheckProps_CompRound(266898, 218247, 380243, 958478, 282186, 400614, "弸龭컏�嚌솱挂ꁪ쥫", "ᢦ폛", "ꝶ擆⷗륶땣", "℈", "胼ᑝ쨀飞륍虋陱濣灈");
    Test_CheckProps_CompRound(120825, 886726, 873724, 994918, 343715, 576524, "䀠열腺", "", "➄", "큋詁棐숢嗖ᘖ", "ည쥙鎫籄");
    Test_CheckProps_CompRound(262313, 646611, 566801, 68507, 524510, 747628, "뮄ᢿ", "", "諪ﰞပ꙳", "嬫з漈ꑆ个幚뗔", "젟󇸷쾨쯚迪뢾");
    Test_CheckProps_CompRound(933285, 889541, 778262, 501081, 742990, 906532, "陨", "", "缰", "", "껲﹍");
    Test_CheckProps_CompRound(599112, 304460, 19455, 910563, 810229, 594916, "㳲嘁�Ȩ㘅驹劣", "젽ઌ", "쿏靆ﰭᖦ涹㵲", "᭲긞膐朳멫캿", "");
    Test_CheckProps_CompRound(678953, 318211, 799792, 530693, 384605, 961882, "ݹ話亢൓⾽", "⊲ǫ礳惴", "", "擭", "⼝줠딳落");
    Test_CheckProps_CompRound(367067, 269919, 513077, 623797, 996815, 657076, "偌눘胪⌊핤촆᠅絵橱", "嵎桅꣒", "̐Ⲯ䈭", "꜔䤩", "▦⼛傟ꕅ");
    Test_CheckProps_CompRound(846078, 895695, 880971, 170971, 979748, 654928, "�䂁ㅽ遦ﾅ偂忺紘票彣", "剠ﺯ�", "ㇱ팜锏▽ꇲ䱐敫뒦숾", "幚쓼ሩꡂꎥ띎�琳", "");
    Test_CheckProps_CompRound(410924, 483718, 182271, 514523, 660373, 762405, "鳼歿捺퇵�렡ڣ", "떵�鷜™櫃諄垇", "朓紸늹鷲尣", "墽욤츙촐", "䟧");
    Test_CheckProps_CompRound(628368, 959034, 880007, 815651, 294566, 547396, "괘摄", "쓟쓄퇗", "冠愃躊ꁸᶝ", "愫팹룼崬銌꼾ǋ鯮镘", "췥뾴ⴾ");
    Test_CheckProps_CompRound(647747, 215935, 840198, 33362, 402482, 925580, "Ꝙﺿ", "꩓", "裹挬裀ǃ", "畹㘅놔筶ꑢ", "擝ֈ胑苒ᒟ൒閪");
    Test_CheckProps_CompRound(667170, 70395, 615405, 526193, 22511, 291255, "ᶨ쥒瓶➣빃鞿춪", "", "픻脍䣢", "", "䈱렐ﴂ凘뭇");
    Test_CheckProps_CompRound(836488, 975102, 278055, 79186, 43591, 530210, "뾆濾庰", "﵌雫忡閊뺌킮㴗퍶", "␁퀞�", "弆", "᧫垃배⒔ퟭ焿◰熇髾");
    Test_CheckProps_CompRound(599679, 7799, 130942, 583514, 251270, 850515, "鷞≦烛ྦ蠔嬙వ", "�쒿뱴墆�∗", "", "믅", "�だ");
    Test_CheckProps_CompRound(163447, 420662, 483076, 416819, 559176, 215951, "հ窺◫Ī ↥", "蔥", "邊", "虋㖈ᘈ缥躒�펀ᯒ㙬", "锔ﴫ");
    Test_CheckProps_CompRound(928807, 746986, 376450, 425535, 183001, 38538, "몳덞帪㶩ꦿ㺕", "藅끴", "쯢脹⣞阳␫幣䤁瀱", "䥰�䳷쾞", "䡖딇␮弢㒴캹차");
    Test_CheckProps_CompRound(387384, 19295, 649645, 115083, 615038, 802924, "쥎洺툯࠙㯫榲⒦䂮", "壂㖖䟴콠", "鈛ⰻப", "", "辞羡褡✸");
    Test_CheckProps_CompRound(781467, 275720, 863518, 677123, 708222, 362400, "㶜⸉⁭䥉腪壋⣮坐", "樨", "귊ꮅ螯ꢁ콧퀫", "쁣", "薦䜾ຩῐ朿丯");
    Test_CheckProps_CompRound(325561, 367419, 782099, 802745, 524932, 746728, "㻃뤉�鐠੷삢ⱅ", "览醈�铙ឡ撨", "", "氓", "䈢䞨泿쥄뒅蕾쪊솱⶯");
    Test_CheckProps_CompRound(736344, 528196, 563010, 126483, 300080, 642390, "≖葉崵崜뼺쪌頌⛌�", "빱ꔛ覩䢕槓ﺉ麖憧器", "㛐盿", "प沱ߵ⸏䪉", "ᢆ民⏩㶏娠趯");
    Test_CheckProps_CompRound(611139, 324463, 554310, 934737, 123053, 453785, "椪ƫ", "ꣃ뛉", "끕蘆㉰춈ꪦﵥ⁥", "ꏝ뙪", "䇑홂᫐퓙쌄");
    Test_CheckProps_CompRound(2630, 182479, 721285, 254811, 348686, 675279, "࢟", "媑㡙噬�䄀", "皚ᮎ씮䡨瞠ⶐᮌ翪ৢ", "솁᠃", "ϱ㊢콖�");
    Test_CheckProps_CompRound(956196, 729010, 87168, 50554, 657144, 475748, "拼ᤩㄛ嶂�浼쵑", "", "窘룛擤咛夢ണ", "�ꪮ㲸ⓤݜ撌", "ꝃ尛ᬜ큀鬏⾍塰祛壏");
    Test_CheckProps_CompRound(494827, 273664, 885074, 424335, 60414, 563838, "耿ᨈ蒁Ʞ㙖㲶㙢", "♥榮阯魐節�", "똭丢먊ਏ�", "", "ફ筌杷譛諉ମ鉤");
  }
  
  bool unitTestResults_CompRound_Getters = runAsync(Tests_RegisterAll_CompRound_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_CompRound_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_CompRound', UnitTest_OpEqSimple_CompRound);
  }
  
  CompRound@ lastChecked = null;
  
  bool OpEqSimple_Check(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, const string &in teamLeaderboardComputeType, const string &in matchScoreDirection) {
    CompRound@ o1 = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    CompRound@ o2 = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_CompRound() {
    OpEqSimple_Check(393455, 392207, 212987, 218290, 83728, 476217, "쭶퍉첯㚥涬凙", "霋흽묌铱蝔ᔁ䀓", "਀ꩣ釪�麑遬徨탏", "壝玃勑뤋펍캒ᨶ", "叴뢦⇩㵣䎵");
    OpEqSimple_Check(591080, 333816, 159512, 123640, 643073, 272489, "峵כֿ鐄ℛݙᚬ쇳濶", "ᬤ쿊菆︐좙桭", "ﶇ䚱윲冥㶶밑幖", "ʊ冿�Ⓢꖠ⋳䝅攨鑽烆", "䝕뭀ꃲ썵㞫䫆ើ鹆");
    OpEqSimple_Check(288195, 531474, 7923, 471876, 690858, 504118, "耏盧я␜", "", "", "ꨕẽ뮱", "ʱᯜ鱦ࠡ");
    OpEqSimple_Check(713311, 468715, 840953, 20188, 208909, 610006, "䀐硩", "䀿虿砍", "픽鳐ꈉ", "⣣뾈噦", "⻰쬟칁");
    OpEqSimple_Check(830012, 82116, 511281, 629572, 333348, 4203, "櫇ꟙ栥鏡螫⃠嚅⒝ࣾ惝", "ሌ괙", "ឰ墐こꅯ", "ꍱ꟤��뙑耽裮ዖ锲", "㤬꾷ټ");
    OpEqSimple_Check(694261, 263, 6580, 997818, 438577, 704848, "", "喐橀뛰�둕껅汆講", "秨玹", "퓂䉰ꋗ嗳ರꈾ", "ώ");
    OpEqSimple_Check(680607, 279276, 747775, 333922, 24944, 263165, "ཧ捺슅", "ᱧᫎ솠轼ⱬ", "⧙곢歒", "", "ꃢ｡뫇묯릕⛲");
    OpEqSimple_Check(304399, 29411, 78939, 636291, 364509, 925658, "큽咪઼側", "", "ꛬ苵䎥�쭲鄻콨�", "祒蛕䥓", "�");
    OpEqSimple_Check(255643, 98074, 985987, 656856, 840971, 158662, "鿑䦚♕共䳶넊ᙓࡀ", "ꂋ", "갽郭뱜", "鬻피䌱踀뤅芸", "娣ዯ﷤賚�챀曹䚨");
    OpEqSimple_Check(131429, 370081, 554833, 356165, 177350, 294139, "룎", "螥㗓꒭→", "ᚭࣳ�﨑ğ", "બ⚟鰉ᡖ梉", "㌌⻄");
    OpEqSimple_Check(112824, 776355, 602310, 940369, 3945, 849219, "撍䈒", "庈", "᣾킯䠧◐", "멖�", "녮ง");
    OpEqSimple_Check(609845, 263480, 560959, 68111, 943082, 475754, "㎭啷⨍揉", "", "", "↟ڹ錠쟓쎭뗧䢼", "㝳䵉");
    OpEqSimple_Check(419116, 978412, 15728, 543714, 31625, 132643, "", "ᗱ閯ﺸ娂ᑠ쟀냖", "", "鼗", "鬐鿹愶彄");
    OpEqSimple_Check(834401, 438887, 728516, 734668, 798823, 305916, "輨", "㹪쉰龊〢ᔖ̉", "�ꊈ껿譍扆䡖図罛⢲", "䧂脑囲ﻯ機", "ҷ䋰");
    OpEqSimple_Check(196654, 968043, 958667, 223128, 253073, 621920, "숬勯", "䷗넱�㙫姦䟧ఊꪫ", "圦긡", "흌", "䣵䮆");
    OpEqSimple_Check(703199, 927171, 714203, 948126, 761909, 80547, "일ٸ顚辑죹⪱", "膞坫窀훱Ⅺ킠�鸋", "씅煍尪읒쪭剈", "ө㩣�轏", "⹳ꈰ뗵丷");
    OpEqSimple_Check(138540, 801560, 533724, 926220, 696064, 331215, "䣇ᚇ梅翂㳕࢏", "縰㷇", "∁衽", "迒䌡ഘ", "癓簡枌녑埖韠");
    OpEqSimple_Check(445761, 857000, 976480, 455033, 111470, 573616, "൹貈垸뀰过", "挧ﳗ졝", "暮㟄䷫킹륦了", "䂃堮", "ṱ帮—뜔愄츿첣⦝脘");
    OpEqSimple_Check(255600, 512834, 623898, 401557, 542692, 549628, "䅖ꏊ軃頴罩絟磶", "禾", "", "❮뙡여䯥鍮幘滆", "텒綒搅聍Ꟑᨎﳌ祊");
    OpEqSimple_Check(994484, 233142, 498402, 637479, 838732, 495566, "갎", "扁拚ꑧ⩱ꛏ�암", "讌弴ᄔ䮕밤ᬣ뾩ᨶ␫", "뀁م륳⏏᧎䫁詵䯻꼊赖", "禗뻧쌜");
    OpEqSimple_Check(504468, 932869, 720897, 315764, 558349, 380025, "", "�ⷀ듅㡐沁祿⑝낤", "ￏ墥", "", "");
    OpEqSimple_Check(354149, 951957, 385338, 38661, 223824, 454708, "ⅶ엱ǫ揆쟶孛﷤", "姐䊂⤭�Ჺ", "챵ꏹ", "ᛁ�", "븥ꖙ∴簾뱟");
    OpEqSimple_Check(674434, 44416, 516914, 365028, 690499, 210923, "듴䎇꺥侚", "막퇭", "燨ꍶ⨙獵", "衔ΰ탡뒤엄闼嵞", "ㅞἄ辰思莽䱪㪪䀷픿");
    OpEqSimple_Check(894972, 765047, 733492, 665455, 765188, 346449, "૾근邺㣿䟫랴", "俵㧠儂攑짱㥑海Ⴗ", "띴勇", "캌涒誀叞㇘㌬", "");
    OpEqSimple_Check(83341, 728813, 537856, 297461, 629495, 40693, "Ư⥣䞘", "�", "䢿眭᫜侯억맖Ⴙ潊", "", "툇");
    OpEqSimple_Check(56696, 106429, 773269, 4480, 434225, 618239, "鿒", "풭樮쟓銀氢", "㲰핋嶣䇙寇鼹", "", "桀蜿쾖촱痛窆섀뇗嵢");
    OpEqSimple_Check(67959, 550126, 747140, 491136, 128982, 152199, "蠃ᚙ鋩ඎ둪┉", "�噊딠", "຺拇씌ည햍�쓩", "ꭰ蘣㴧튂䄕᳂꛰판눮", "ꗭ뙌鉨恁䄈");
    OpEqSimple_Check(364434, 611520, 92494, 619517, 74358, 475261, "續Ꮪ", "ἦ㰞�", "", "덷", "");
    OpEqSimple_Check(21957, 60435, 28953, 321189, 818279, 49532, "�곔櫽ꐫ␓쌍", "缎遁ᘤڷ寀�바ㆎ", "⯀ⵡ㽀ᴧ룤", "旺沣￟㸄ໟ䄺ꐶ", "䎲⠋젿糖앻嶚");
    OpEqSimple_Check(743323, 63831, 953835, 58548, 448758, 724497, "톓췾", "", "떶⨨ᘟ戣", "ቒ녈㰚ㇿ", "ீ憨");
    OpEqSimple_Check(804429, 929767, 59051, 943847, 718145, 330646, "Ỵ莙▸", "", "ᘾꃥ촄㍕札펂ឝ뙽", "䩷悑", "况脪㢒⻋忡過");
    OpEqSimple_Check(936371, 854275, 840058, 975752, 937115, 584989, "", "号ㆃ긺簼곽⺲댾麎", "玬욢죚", "媉軪砦濾", "핈䌶");
    OpEqSimple_Check(396370, 67937, 116886, 707067, 93566, 330742, "閈䨝嵵", "翌", "戙᤿䜦鈷兔呃율ᤞ鍜", "䞸鄈", "몚첈㋨");
    OpEqSimple_Check(365089, 913031, 382766, 327864, 651168, 517187, "졻ꏳ沗怛쯂Ӑ", "鲅昿ⅵ", "䝤㰯䕼ꢟ", "㛠஑뚀�⑴", "✷㈳﷥똭퓄﮵");
    OpEqSimple_Check(189651, 33867, 718284, 847734, 537946, 938933, "轘", "䨴쏸휞", "즹␥㼳쬺義瘺", "怣楊멕纍ⷒ艜᫮⪙秢ﶼ", "餗뼂�");
    OpEqSimple_Check(990860, 734449, 710152, 237347, 934621, 102446, "ᓊ鹿ݚ띤⻧", "귵獦㣋幺ਗ਼", "듷륑깾", "昳占㵊㱲﹒푽", "ɓקּ");
    OpEqSimple_Check(896358, 197917, 841605, 196061, 556133, 532394, "칲ﲤ荏嬸虶", "ꮂퟄ䬰왊", "㟧⃟", "羊テ", "잷輠烖ᩬ䎠찇ꑆ鷍");
    OpEqSimple_Check(138796, 152750, 302345, 926855, 163241, 178350, "좂響ض쭂槶ﾽ꒿", "佪솫", "힢✷㎾腒鸒닞鉤⡄", "࠵聮怴", "什ꋃ鱚઄᷼嬺꼨");
    OpEqSimple_Check(37392, 730857, 639596, 382292, 441708, 750443, "닯薾뼁곒윶", "䐙ꛎ葨皣懁夀㎛圚챞", "齑간㴳鮙", "�", "绱㑝韼");
    OpEqSimple_Check(220919, 413150, 874273, 574339, 288208, 257053, "ﻖ䋘痡", "ڪ⽷먍汃Q䵈戨葎", "캊偛ᖧ⠀㲰", "ﵢ띣莹⫖㺄", "咃ࠄ裞ꥭ峘갤噴崤腎");
    OpEqSimple_Check(896538, 516893, 185454, 594357, 679607, 652939, "㹘捲픢㻯蕛⑰ㆤ헑", "ꅧξ랇㲑", "鹖氫�᧬쓔烈䞃", "謏믷γѦ㙉", "扚彡㉆䥅");
    OpEqSimple_Check(867578, 298094, 378434, 80386, 591269, 278057, "࿍塾ᨑ垢", "", "뼧ￎ", "뉢ﬗ䩂", "馚㤀䧅餍葐毉");
  }
  
  bool unitTestResults_CompRound_OpEq = runAsync(Tests_RegisterAll_CompRound_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_CompRound_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_CompRound', UnitTest_SzThenUnSz_CompRound);
  }
  
  bool Test_SzThenUnSz_Check(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, const string &in teamLeaderboardComputeType, const string &in matchScoreDirection) {
    CompRound@ tmp = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    assert(tmp == _CompRound::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_CompRound() {
    Test_SzThenUnSz_Check(823221, 663647, 352245, 777791, 86592, 719979, "朹鎟ﳙ", "编", "엻렒哾๺⾖㻄쪼ﰙ⠁玭", "氎꼻㤚藴킅Ề쯣", "�밄ꊦ⊼");
    Test_SzThenUnSz_Check(262638, 498192, 179363, 144555, 409427, 826942, "�佪�䮞丵�￝幻", "牪Ộ푲෗蔃䓥㻥잒", "䟃넲䗵", "竟潔箯㉽貺ᠤᝯ", "쬙ꅇ᭧봅≹");
    Test_SzThenUnSz_Check(337261, 394778, 629002, 832887, 693999, 4946, "︠걿좳樁㠵", "髣蘟먝瞄⧛鉼竲", "ﻊ爛⏂ꥏ꼼砍띑", "⤦➦踆⌾ꎳ㏰鉓켯τ", "䩸Ὼ㐚ꂖ摇䞰鄕ꈽ");
    Test_SzThenUnSz_Check(606676, 964248, 970574, 467845, 956732, 101415, "퍻䳥最徐㭾멭Პ", "䟥ፕ⎃ﲀᦓ솛格", "诜돚兽奞ͩ줞", "ᄺ膲", "剼᪲ꮚ෌");
    Test_SzThenUnSz_Check(45702, 896779, 485401, 405127, 314974, 151896, "巖ㅡ螘笣䨯䄸㻘궈", "⃔煡", "盡ₜ阵", "곟ᢏ淡钡೾", "줒女ѽ泡誄狋");
    Test_SzThenUnSz_Check(762338, 356559, 161330, 809993, 973135, 540022, "蓬㥊ᆺ⻖", "䒹ਮゴ虻雈皇殤膕", "�〿Ꝼ샛ᣱ沲툕ී쨳", "ӑ䞖猏鐪﹀ྏ䅳税", "③享㐟ꯩ");
    Test_SzThenUnSz_Check(558576, 297578, 12322, 613456, 548818, 848229, "桾뭎挘殤掙얷ᐮ", "魯ᄍ噕죐ᓌﻸꚡ", "樦纍ﲀ⧝�䄳凜", "Ꮪ猾ؙ太蠵", "傩Ἂ嚓慻徐");
    Test_SzThenUnSz_Check(597747, 283451, 10849, 185372, 191913, 58657, "앪衚ध⿺⯌憎祖羔ﾧ", "៳╝⁋컱ⳃ", "刪ᖑ᭬퇠", "䗶찀믌聅똯샩愍꩸", "洉疧ꅦ뭲");
    Test_SzThenUnSz_Check(116699, 616919, 769796, 544943, 767904, 840501, "ᡊ︆᤾℟仅䃜쪪㌲", "ذ沶ꫴ痺ﾖ", "䶂簜饋᲏඿븹", "䷗鷪묡拠銢᜼錢", "손靇");
    Test_SzThenUnSz_Check(380426, 542068, 903222, 42367, 884816, 252573, "", "ຶꔽﾜᵏ䒴풠氂ᔾ", "譥횓ƹ", "òꘄᷡ雘㲅", "�埊쎆㊆⯟骙䁣豅琧뗇");
    Test_SzThenUnSz_Check(768217, 477588, 555890, 559916, 78214, 923280, "⊂农陣", "ை牖Ⲋ", "臢⫎춂檓㸠", "벼寥ﴋ", "믅༐൨㪁▫");
    Test_SzThenUnSz_Check(455286, 886316, 383122, 880579, 464345, 505384, "箯浔陳᳚乹ﻺ鮷囫я", "䮋", "ᣳ翠�Ꙇ鑇撠", "ᕝ芜쎡韠", "�桮럫");
    Test_SzThenUnSz_Check(400742, 577624, 959424, 779544, 141403, 123480, "쒿№妝", "�", "햛蝅", "뗭⴬똣궆暱여", "훅꼦狤í똫俑ﷺ⋏");
    Test_SzThenUnSz_Check(635672, 394180, 207205, 354093, 59229, 885846, "", "㮄", "臾ÍἩ", "ț", "䚦");
    Test_SzThenUnSz_Check(168469, 571192, 936735, 281680, 40045, 491930, "욜푭沈ĉ漎", "仚饩�Ꮚ혹霭䞓盅", "鳊鍽扐肑レ", "⿞䅰ꡉፀ븯扻ꋨ䳘쏡", "ﶾ鞞㉪屹팑");
    Test_SzThenUnSz_Check(552448, 416887, 193882, 131058, 392530, 320323, "䞓㕋", "砚乸̛瀎ᭆ", "婌ਠ愤섉韭쟰튤⟫", "췭栴省ᨱ흴뒭㺡࣊", "ἰ쟽뻗８ᦲ菬蜻");
    Test_SzThenUnSz_Check(221120, 675410, 427827, 717927, 8570, 445240, "蕹尷ꦾ첥⡵苨앶㴗ၖ忧", "놲싵뇵", "ꇑﾷꃦꅕ熪饍㨋8辝쵌", "␬", "ꖡ䕯橄�㰿苨앛");
    Test_SzThenUnSz_Check(693496, 428419, 383891, 633990, 194991, 934484, "窗䊨㎠๥Ⲣ⪒冁", "婬桸꯺쎡魶㭷栳", "泒擵䆲", "铃켴돺븍닑ꪐ脹窕ૐ취", "");
    Test_SzThenUnSz_Check(175854, 277912, 599225, 318654, 576027, 20949, "➵孞扎㹰㽙ᶝ㒾ⴙ荡옄", "仫즍�狫�悝", "⢺鏿ㆻಖⳡ忆悑翐䈐", "뼍掰圷뵛蝶ꙵ隓", "聁�诨苵");
    Test_SzThenUnSz_Check(454112, 550861, 181236, 462111, 975084, 231318, "䪩引࢙憖ꀖ銱❕", "謐", "죫ㅿ傴灲", "灣", "殨䡍愆ᗓ‫䳦");
    Test_SzThenUnSz_Check(938700, 419937, 189423, 518889, 231231, 608287, "떾뱮὏", "j좠⵲贉韽벻", "펝郀곐캼뎻튓", "", "?�ﲙ྇");
    Test_SzThenUnSz_Check(126346, 591190, 373405, 583731, 707258, 894617, "葑氊듳", "遺错䆈罹Ⰲ룟", "�﫦", "쫯ഀ옉龞꺌", "칧瓖");
    Test_SzThenUnSz_Check(462891, 159848, 432129, 995984, 361102, 172416, "帻鈿橦衺㉹䧚炐▖䕥ϖ", "榄诶", "", "", "镫웤ꢚ穧륚�ᚽ蟛");
    Test_SzThenUnSz_Check(584624, 987676, 28482, 822700, 42437, 796256, "њֿ㪝峵傊톥泈ₙ搯", "ℾ쪋䕊츨ቓ瑪ؠ欸", "쭎", "捱", "닺쿿ꉧʪ쉭邀");
    Test_SzThenUnSz_Check(387499, 263097, 603237, 637750, 41139, 208057, "ﵝ릣㐌㞃ă", "", "⨝쭻䏤ᢠ䫖葻", "킄읋溛륹甄", "");
    Test_SzThenUnSz_Check(314857, 332208, 339274, 484862, 916822, 113080, "േ᥹뛼", "⼏歖맹훿웴⏪", "햇", "㯤㡆햽㸞뮸쉅", "ᨠ礇並並");
    Test_SzThenUnSz_Check(967719, 874189, 293878, 774162, 470347, 773077, "鹜瘁⟱", "斨", "", "ꎭﰎ�䢈", "㖔⍁숇鴕샰㬺苕覾覈");
    Test_SzThenUnSz_Check(152986, 280138, 458087, 87582, 396000, 619969, "脮঍ꆡ�", "࢜议쫒뗺", "呈봒ᇲ왙醀莇狾풦䦵亰", "櫳挧盬", "骦灭⭔");
    Test_SzThenUnSz_Check(100690, 42448, 169015, 851766, 262457, 175643, "⧊萉ꇱ灶", "銣콇ﲇ꽾᭔", "䊭匑⩶妗�Ț釄툆☄㭐", "ᖕὪＩᬶѣ瀠宅⎰", "卤㵠휄Ｋ咱敏");
    Test_SzThenUnSz_Check(772959, 600075, 606280, 510731, 59496, 514761, "뿂⬔紘", "滛", "䠃ꀼ렠", "브", "줪꿙找쯡뗽");
    Test_SzThenUnSz_Check(227459, 722115, 716784, 52221, 296737, 858338, "怆ᐱ", "顫踠䙲㱗妛", "쓎憷Ὄဨ", "", "�ㄌ㗫䐮勍");
    Test_SzThenUnSz_Check(756483, 269129, 980780, 439734, 212480, 361747, "", "䀒䍊빇曁绀溜ⅅ࿿倴", "畵䯖쫟艖", "", "﹊鴥묏⛿랥泘섆ۧꄕῗ");
    Test_SzThenUnSz_Check(960634, 536175, 493971, 640388, 270326, 602381, "ﴬᄉ", "ஊ惧吁略䑹뱕ﭔ", "졗볆丕鈂", "톽", "봫᧮Ἳ촷韄");
    Test_SzThenUnSz_Check(514223, 706528, 809621, 265019, 10421, 230479, "䫮⿙鿁냱㛹듴ე뉺", "䥌Ŝ柫缾", "矖", "愛쫿迩Ềᮺኛ�ꑞ沗", "");
    Test_SzThenUnSz_Check(163036, 663349, 264347, 830664, 172725, 276095, "贲Ἴ", "꤭韶啇许䑐㸬涂", "יּ尒䃚ና苔놗퇝", "푑", "ᱟ㉞Æ斫�휋ཞ턂Ỏꁖ");
    Test_SzThenUnSz_Check(849996, 55112, 395885, 168548, 252264, 437136, "", "逪胲軍", "ꡁᓮ腄墋㽀", "", "ﶈ");
    Test_SzThenUnSz_Check(828117, 260419, 607170, 434625, 342155, 321371, "沛葄ད�ኈ椉ૻ", "}൳鸄ꋺ䨼㸣", "狛㩪㨹﹵锗�〗춙끬➒", "釕", "糢쨶波ፑ鄪厦ﴑ봭썏");
    Test_SzThenUnSz_Check(828621, 323283, 146610, 251508, 394725, 723653, "楟旒笟둀魟䡏", "춶堢", "痒똁蹷팤", "쎘", "ᢒ罯髗ɸ");
    Test_SzThenUnSz_Check(108619, 869473, 798386, 942423, 332730, 630552, "핍竉䃋", "䞹悩牪", "঑ⷷ莣겄㖡⦲؈", "辜슦", "铠㼢瘚ꡁ쾕ᣉ噆ꡭ");
    Test_SzThenUnSz_Check(867984, 937492, 105864, 213048, 559225, 731469, "�뜙翕鏅", "", "뜞ੜ", "̂뀈璕", "票蟣麫땁");
    Test_SzThenUnSz_Check(908151, 228846, 975446, 209189, 686310, 208431, "", "", "下ᩇ찉㍜", "祰䧈躺줘웎由짉ꤶ", "쮜먏");
    Test_SzThenUnSz_Check(346112, 927486, 750419, 947898, 640815, 863120, "漓Zᄥ녷ྕ嚨豯�쉾", "泅梔灲祼戈诣䨉仜䭢", "㚠璬㊅聾칞됑ं콠", "琔ᐞ㍱▁쳋卝", "섋陝Ⓡ꧀鬴᱅");
  }
  
  bool unitTestResults_CompRound_RowSerialization = runAsync(Tests_RegisterAll_CompRound_RowSerialization);
}
#endif