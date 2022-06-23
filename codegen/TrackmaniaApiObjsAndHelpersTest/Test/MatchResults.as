#if UNIT_TEST
namespace Test_MatchResults {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_MatchResults_CommonTesting() {
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
  
  bool unitTestResults_MatchResults_CommonTesting = runAsync(Tests_RegisterAll_MatchResults_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_MatchResults_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_MatchResults', UnitTest_ToJsonFromJson_MatchResults);
  }
  
  bool Test_ToJsonFromJson_Check(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    MatchResults@ tmp = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    assert(tmp == MatchResults(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_MatchResults() {
    Test_ToJsonFromJson_Check(129450, "㳋뽄旤ᮔ﵇獣ແ", "䃧쁐욘ᱶ谛䆳ꔼ躜ಙ㟊", {MatchResult(MaybeOfUint(414406), MaybeOfUint(246452), "⛦屻㚡딽蔭", "䡓兡↉딢셐"), MatchResult(MaybeOfUint(606311), MaybeOfUint(121822), "ᮃ놜冺햵ᤫ簔�", ""), MatchResult(MaybeOfUint(), MaybeOfUint(84558), "䌭덉羌ฬ擪孻", "礽ᚪ�"), MatchResult(MaybeOfUint(673390), MaybeOfUint(587832), "땶烈軻", "돻딘ꃺꆈ")});
    Test_ToJsonFromJson_Check(501560, "响憴பꋣ", "杒୒D䀗ꬨ憽畏", {MatchResult(MaybeOfUint(), MaybeOfUint(), "坯켫ꗥ쟭銗", "懜翊신꨻በ↥鿊"), MatchResult(MaybeOfUint(507044), MaybeOfUint(562436), "엣ᩁ㟅ഽᒽ罆鹌ﲒ咧놪", "⻖蚇ங⨗萃쎉뮏"), MatchResult(MaybeOfUint(77932), MaybeOfUint(291599), "ͽ텫", "唃徭ྈ"), MatchResult(MaybeOfUint(882946), MaybeOfUint(8357), "䦋쁗缧ⱊﱻ狀ꆟ", "")});
    Test_ToJsonFromJson_Check(154767, "왦굸褢鶳ᄶ窐", "ꔴ㳇୭鹥灦㣋", {MatchResult(MaybeOfUint(304545), MaybeOfUint(593682), "ㅥ", "㥱䙐禭홢")});
    Test_ToJsonFromJson_Check(547273, "ሮ忽", "转ᢶ퇈侘룒फᝌᣇ꒨㟋", {MatchResult(MaybeOfUint(), MaybeOfUint(468463), "쑋쎧ᨘ", "裳엽뷗뢑㖄瑁캳"), MatchResult(MaybeOfUint(986174), MaybeOfUint(489123), "䡼淣럸튦蘥", "Ⱬꖗ႘ᖦﭭ见"), MatchResult(MaybeOfUint(342727), MaybeOfUint(625858), "饤浏", "䭭澀⽹ᱶ爅螝⬣홭ᢻ"), MatchResult(MaybeOfUint(6572), MaybeOfUint(609511), "⼸៯ꭍڑ쀈ⵗ㏬蠑", "벛ﳾ啃둸")});
    Test_ToJsonFromJson_Check(227340, "", "쐤얪㵁㢝蔹ｽ≨⢮舊", {MatchResult(MaybeOfUint(811960), MaybeOfUint(148290), "宥목", "�讼Ѯꤘ꭭䊘"), MatchResult(MaybeOfUint(35974), MaybeOfUint(436624), "�쩇쟬ﱩ", "ῦ鴧灩༕ﭕ椅롥"), MatchResult(MaybeOfUint(235494), MaybeOfUint(), "쭋胋젮Ⱑ", "號㪳ᒶ퐞也툃뻬笜")});
    Test_ToJsonFromJson_Check(604406, "", "", {MatchResult(MaybeOfUint(33014), MaybeOfUint(), "聅䄳ㆳ尉ź恮뺪髷", "숯䐪䈞䞞䜋歹☰�ꢶ"), MatchResult(MaybeOfUint(636085), MaybeOfUint(440156), "", "淪熷颤짒傉峩ᯕᔺ")});
    Test_ToJsonFromJson_Check(771523, "몖괩", "来", {MatchResult(MaybeOfUint(43093), MaybeOfUint(775867), "☳憱딅", "ᶥ톪�湀녂릊"), MatchResult(MaybeOfUint(256248), MaybeOfUint(934467), "Ｈ罧", "澌כֿ")});
    Test_ToJsonFromJson_Check(475093, "횊穧돤魣䐵뒠빖裮", "땓꟭뗏聲", {MatchResult(MaybeOfUint(), MaybeOfUint(470409), "㙵覆ೕ멨靮垆规", "㚨줫"), MatchResult(MaybeOfUint(120250), MaybeOfUint(669151), "밥�틭姻韷ሸ", "꺗⯒ꊑ䐁ߠ"), MatchResult(MaybeOfUint(853246), MaybeOfUint(929340), "", ""), MatchResult(MaybeOfUint(), MaybeOfUint(621120), "霋", "춤ᴼ馿ꞑ")});
    Test_ToJsonFromJson_Check(33888, "炙띤䮔췬鼋탐缜檜⛟", "䁹呦㷽혭㞥ۚ轔", {MatchResult(MaybeOfUint(681867), MaybeOfUint(898974), "�胛๫좧", "됶豦偮縼矢遲੿ᥫ虝"), MatchResult(MaybeOfUint(506204), MaybeOfUint(477731), "撁銹瞝", "Ⱆ"), MatchResult(MaybeOfUint(64905), MaybeOfUint(434202), "ᙱ֤", "쨟ጦٛ")});
    Test_ToJsonFromJson_Check(552097, "綽傍ᙏ젙濍γ曘⮢꓾ȝ", "�ࣔ潛", {MatchResult(MaybeOfUint(345755), MaybeOfUint(366477), "儻쳷", "㈹�䕋⿬"), MatchResult(MaybeOfUint(542289), MaybeOfUint(), "", "䦳�榺骽䭄궉쎟鷬"), MatchResult(MaybeOfUint(887527), MaybeOfUint(992645), "ꨁ딣⍣�浥ԈǶ봒❖", "ꇈ퉿ማ鰜㞡吂")});
    Test_ToJsonFromJson_Check(355681, "妙薐㨵䓸뷐", "淮듑箩厈䃐᲎暓煆펾", {MatchResult(MaybeOfUint(674254), MaybeOfUint(68500), "", "樤㞹㿼昡˶鵺ﯶᲑ篥ɿ"), MatchResult(MaybeOfUint(892962), MaybeOfUint(), "瞽犆뗄㿻ꨕ䦳翧", "ᓒ혖඾鈝젾늇媎")});
    Test_ToJsonFromJson_Check(489368, "᥵ۚ籲ݏ쁒⨮", "畧‚ᓒ潰Ⳉペ蛛", {MatchResult(MaybeOfUint(194770), MaybeOfUint(471592), "Ŧ묓买嗒쫑鋋�", "똛엫ᦡ"), MatchResult(MaybeOfUint(599454), MaybeOfUint(314379), "겸뽶婯", "퉨똼顯얮듖踉"), MatchResult(MaybeOfUint(), MaybeOfUint(733079), "ᲀ㭔⬥襶喩", "酒袑橒檡͢떳窖鬦歾"), MatchResult(MaybeOfUint(), MaybeOfUint(890783), "뎝⺧䛙픮", "温膀璠")});
    Test_ToJsonFromJson_Check(821203, "笘", "뼘㽗ⷻ찄", {MatchResult(MaybeOfUint(798623), MaybeOfUint(841284), "䅣", "䏊㲠嘁첱Ὠ殱"), MatchResult(MaybeOfUint(515698), MaybeOfUint(59894), "駪᷑铁뮱ོ", "쬣ܹ㈸襁"), MatchResult(MaybeOfUint(112610), MaybeOfUint(482035), "ቄ忸៥览䫞쪯㦮尭칉", "ઋԞ൪"), MatchResult(MaybeOfUint(), MaybeOfUint(793101), "虺艧늚�", "⍜༟䬻껀")});
    Test_ToJsonFromJson_Check(371018, "Ქ쬣ナᱽ⁚", "쨳〛ⵐ", {MatchResult(MaybeOfUint(750458), MaybeOfUint(55990), "�髀ⱪ탵Ⰽ妬", "汦陚＝"), MatchResult(MaybeOfUint(190769), MaybeOfUint(), "ꮚ찌䅏", ""), MatchResult(MaybeOfUint(255071), MaybeOfUint(242717), "", ""), MatchResult(MaybeOfUint(293496), MaybeOfUint(98021), "尰", "")});
    Test_ToJsonFromJson_Check(913604, "搵垑雛깵黌壀唑骿䋛", "埈㩜ﾴ连㻰쮛", {MatchResult(MaybeOfUint(519051), MaybeOfUint(497370), "ͨﯨ", "ꕦ䝵")});
    Test_ToJsonFromJson_Check(157374, "탱ⶽន", "怢팃쪶蒌惴礰", {MatchResult(MaybeOfUint(77310), MaybeOfUint(), "ᠮ裡͆⩒轖", "㧱疦鹰냣"), MatchResult(MaybeOfUint(29713), MaybeOfUint(262440), "麏", "兓꽻뺿쭠")});
    Test_ToJsonFromJson_Check(788234, "ꠌ⋞ネ얽䦵೿", "⅘굡늤", {MatchResult(MaybeOfUint(135482), MaybeOfUint(975179), "妬聸顤咙䤔", "﴿⩚�몘었퀆굾"), MatchResult(MaybeOfUint(581720), MaybeOfUint(426431), "∋擫đ益⬫", "ं〮맒꺧ۨ"), MatchResult(MaybeOfUint(), MaybeOfUint(), "㇦縡嚐", "")});
    Test_ToJsonFromJson_Check(66908, "廔授뫑不", "ꓦ挱嘏", {MatchResult(MaybeOfUint(332422), MaybeOfUint(17000), "웖륞㍃솞थに٧Ⅲꂐ", ""), MatchResult(MaybeOfUint(313857), MaybeOfUint(), "㇦", "邡㤩顽䤎饈⧚"), MatchResult(MaybeOfUint(443206), MaybeOfUint(315557), "伜", "腬킰"), MatchResult(MaybeOfUint(783074), MaybeOfUint(68906), "遛㔧ꡜ㵷枸첓嬅쭸尊", "頒")});
    Test_ToJsonFromJson_Check(668195, "埈핹", "폺뮾眲餻Ჩ栬飒홟", {MatchResult(MaybeOfUint(286439), MaybeOfUint(699157), "", "Ⴒ⍠⅍ᙄ蠬")});
    Test_ToJsonFromJson_Check(272392, "왗꜖", "≽⣙옔偀茹庱", {MatchResult(MaybeOfUint(899038), MaybeOfUint(818382), "폒", "뀧›䢬䟼ⶲ᝹糀")});
    Test_ToJsonFromJson_Check(49936, "", "", {MatchResult(MaybeOfUint(799550), MaybeOfUint(), "矨蒷⫥ꚨ", "鍀㇕蟃෵㥔̳姇"), MatchResult(MaybeOfUint(28880), MaybeOfUint(138067), "Ը䘷", "㣥ዄગဠ☊틉"), MatchResult(MaybeOfUint(886948), MaybeOfUint(855091), "뫯꪿䒼큝耷넲㴝ส", "횏ᩅ果룗"), MatchResult(MaybeOfUint(664378), MaybeOfUint(), "鮳裴ⲍꨞ﷨뺛穿濶", "한팬೻偉㝙倎卌")});
    Test_ToJsonFromJson_Check(905071, "", "⟐䶢", {MatchResult(MaybeOfUint(629363), MaybeOfUint(), "냱뾯抃䱈೵谬㭹馤탢", "茾")});
    Test_ToJsonFromJson_Check(926335, "", "臘톸", {MatchResult(MaybeOfUint(15466), MaybeOfUint(94877), "鸪荤佀ഇ礲�⁋", "툕翂斜⭝毡")});
    Test_ToJsonFromJson_Check(459217, "", "퐴跙�岚", {MatchResult(MaybeOfUint(464106), MaybeOfUint(), "", "逊퉈䨽턋ᄙ噕숲ॣ᧸")});
    Test_ToJsonFromJson_Check(930722, "쿋��㥌쟍퐩㷬", "틟ẚꙝῷ筅ฑ", {MatchResult(MaybeOfUint(), MaybeOfUint(), "곎推杪䊫纂", "羊斉깭랚"), MatchResult(MaybeOfUint(353933), MaybeOfUint(491946), "Ⲣ", "〳螦䪾癌䠗夋Ἲ櫌垫맻"), MatchResult(MaybeOfUint(921056), MaybeOfUint(262710), "䮇潍ෂꉫ", "ឃᥦ㫟"), MatchResult(MaybeOfUint(589811), MaybeOfUint(), "�ꠓ�쀇", "")});
    Test_ToJsonFromJson_Check(244741, "谯絾搷窐梁�東巹", "⇼", {MatchResult(MaybeOfUint(), MaybeOfUint(393864), "赱�暜窋ᖪ࡝ἇ", "筗鏖豺"), MatchResult(MaybeOfUint(938543), MaybeOfUint(841147), "ḅ♁뚌ⶣޯ", "ꔊ줮㿮ᚶ堩ᘟ縏")});
    Test_ToJsonFromJson_Check(586919, "ꠋ��숽쉳蔼蹥", "ꈘᵮ�㟇䬦쭁农", {MatchResult(MaybeOfUint(12502), MaybeOfUint(445080), "", "돎ꍞ"), MatchResult(MaybeOfUint(533747), MaybeOfUint(343354), "运Ꝉꊁᖚ忝崖꒎ﺎ쵍", "⊂"), MatchResult(MaybeOfUint(150200), MaybeOfUint(529338), "�", "麑䲩ꌲ")});
    Test_ToJsonFromJson_Check(144308, "ᆟ䭼䐘췱䬊礫庳勫딧", "⑧拕휄슎", {MatchResult(MaybeOfUint(), MaybeOfUint(620086), "锑敦暒쇠", "柚촵"), MatchResult(MaybeOfUint(), MaybeOfUint(95525), "缜圆䐰饄音", ""), MatchResult(MaybeOfUint(65488), MaybeOfUint(310009), "", "₏蛉"), MatchResult(MaybeOfUint(575514), MaybeOfUint(), "䈩휲쾹짨뵅", "ﳘ鯇剸錛⧡")});
    Test_ToJsonFromJson_Check(331757, "餢관쫣娪颥驗䂨Ɱ✬", "滛窖ꀰ又ꉂ节瓞", {MatchResult(MaybeOfUint(365427), MaybeOfUint(881105), "᱕⽲", "굄ᩞ")});
    Test_ToJsonFromJson_Check(143619, "ா鑁Ƿ伹", "", {MatchResult(MaybeOfUint(496723), MaybeOfUint(), "뻾婣⦯撥鵁ﮁ迁溺", "ꪓ䲽ⰻ㒥ӝ�⁸�"), MatchResult(MaybeOfUint(663313), MaybeOfUint(904552), "虋ᯣ鸚圲枴І", "껶祓")});
    Test_ToJsonFromJson_Check(695100, "龡웞Ꜳ噅䪂ᄞ�䁾", "釛畜鄴쑬뻞侔坺䎶", {MatchResult(MaybeOfUint(316229), MaybeOfUint(898056), "嘙", "᭡私솰᧜톨⧷薎舉紋"), MatchResult(MaybeOfUint(934480), MaybeOfUint(624630), "ៅ", "뮩줙"), MatchResult(MaybeOfUint(410256), MaybeOfUint(427051), "⎜", "鬒")});
    Test_ToJsonFromJson_Check(417663, "복䠄ᣊ䁿잸嘼挜䆪ֱ뺠", "㠛꿭㒀Õ", {MatchResult(MaybeOfUint(39747), MaybeOfUint(174085), "⣯苒", "俎�츗㫤涶隄"), MatchResult(MaybeOfUint(904967), MaybeOfUint(227706), "塭䈐䰧욘፟⩜頿邬︺", "꙰罸蕍鴨䒯䫙鴑艸"), MatchResult(MaybeOfUint(), MaybeOfUint(801785), "恕೹⊅", "")});
    Test_ToJsonFromJson_Check(175475, "⚩ꐰﴗ", "ᔉ幕覊냊坊ᚣ㮍橖୪", {MatchResult(MaybeOfUint(417675), MaybeOfUint(138179), "络緄덯ꙛ骦敁䪴�부", "欴ᒐ")});
    Test_ToJsonFromJson_Check(395904, "䱇ﺘ徳䉰잱", "砼밀", {MatchResult(MaybeOfUint(430033), MaybeOfUint(285382), "ᘅǆ칁柴떦", "튃"), MatchResult(MaybeOfUint(77773), MaybeOfUint(68336), "韵�升Ⴥ", "䦐㺇櫷犊⺩뷗걲"), MatchResult(MaybeOfUint(756651), MaybeOfUint(), "趢힪�滹", "㠒弱洊戌勳ꕭ㤂텟뢙"), MatchResult(MaybeOfUint(331462), MaybeOfUint(), "뻌५�啵⸁煿忲", "櫤툈ᩅỺஒ")});
    Test_ToJsonFromJson_Check(939964, "睯੄莄", "膺", {});
    Test_ToJsonFromJson_Check(248168, "䌬耓톴", "䬟뛎榃쯰�糾蜎椣", {MatchResult(MaybeOfUint(874819), MaybeOfUint(61520), "埏⡓桾ޜ", "ᜋѥ"), MatchResult(MaybeOfUint(179825), MaybeOfUint(640058), "춟쨗퍑짏", "ﱻ"), MatchResult(MaybeOfUint(593373), MaybeOfUint(970832), "뭷ݏ괎崵", "��")});
    Test_ToJsonFromJson_Check(483226, "᧬䑹뷢憵㱦", "ୄ蟖溚荠ݲ₶᰸鍠", {MatchResult(MaybeOfUint(10048), MaybeOfUint(), "端", "ꢔ�")});
    Test_ToJsonFromJson_Check(586140, "㞩ꚗ옴鬸蝸꺲ѱ얙", "︕譋햙", {MatchResult(MaybeOfUint(583506), MaybeOfUint(254697), "", "ꑘ覚"), MatchResult(MaybeOfUint(476230), MaybeOfUint(), "ᐻ껚ꗻퟤ䲩㻂", "牥諹淩Ṟ阯�䅏"), MatchResult(MaybeOfUint(64765), MaybeOfUint(603261), "罬m녹", "禹푔"), MatchResult(MaybeOfUint(), MaybeOfUint(710445), "", "顕﮽紒魝抍诫镤")});
    Test_ToJsonFromJson_Check(57403, "䎶", "鰸", {MatchResult(MaybeOfUint(), MaybeOfUint(220554), "籪", "ꘌ葛읜ಛȋ倣഍ᤵ")});
    Test_ToJsonFromJson_Check(47617, "㵺㊕੿锃儝ඃጱ", "", {MatchResult(MaybeOfUint(147073), MaybeOfUint(508403), "⊵䀔쾆駮", "嶴ବ᜺䋉Ị㾹怑輎︗"), MatchResult(MaybeOfUint(), MaybeOfUint(841450), "冀ꂔɦ", "綳忪豘"), MatchResult(MaybeOfUint(472463), MaybeOfUint(740344), "巵䉌ㆂ뾏ᐤ�瀍䞳뎡擥", "᲍冚刻鯀ᛷ䘉꩏"), MatchResult(MaybeOfUint(62675), MaybeOfUint(82264), "焥爅覑慼萗냞", "㓨鎓粐")});
    Test_ToJsonFromJson_Check(142114, "乣溵䭼쫓致湧癁", "ㅗ䐍㣯", {MatchResult(MaybeOfUint(), MaybeOfUint(), "�ᐎ皦댦㤘먱קּ", "角᜾ꅢ캮猫존툘�卐"), MatchResult(MaybeOfUint(959038), MaybeOfUint(647364), "齫ﭔ哙큐", "骋빇φล陼ᰪ꩗")});
    Test_ToJsonFromJson_Check(504155, "諶", "亪姖㝲", {MatchResult(MaybeOfUint(299973), MaybeOfUint(621859), "ꛄꁇ꩝ᩣ雳", "렓뷫税䟗ꪻ㼸"), MatchResult(MaybeOfUint(949533), MaybeOfUint(199369), "饧눇", "窽ꯁ諱梁䴧"), MatchResult(MaybeOfUint(91626), MaybeOfUint(315603), "匢Բｼ䉔㰗ɇ", "蜆㼈"), MatchResult(MaybeOfUint(737504), MaybeOfUint(138184), "ꂀ刺Ὦ餚샘טּ�", "觰㌓浦姰頙")});
  }
  
  bool unitTestResults_MatchResults_ToFromJSONObject = runAsync(Tests_RegisterAll_MatchResults_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_MatchResults_Getters() {
    RegisterUnitTest('UnitTest_MatchResults_Getters', UnitTest_MatchResults_Getters);
  }
  
  bool Test_CheckProps_MatchResults(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    MatchResults@ tmp = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    assert(roundPosition == tmp.roundPosition, 'field roundPosition with value `' + roundPosition + '`');
    assert(matchLiveId == tmp.matchLiveId, 'field matchLiveId with value `' + matchLiveId + '`');
    assert(scoreUnit == tmp.scoreUnit, 'field scoreUnit with value `' + scoreUnit + '`');
    assert(results == tmp.results, 'field results');
    return true;
  }
  
  void UnitTest_MatchResults_Getters() {
    Test_CheckProps_MatchResults(394184, "馩", "躮", {MatchResult(MaybeOfUint(886792), MaybeOfUint(397204), "暭쑁㚷￣꟪뢖棱꡺鼀", "萦﫦䉕㌄搡즗쿵"), MatchResult(MaybeOfUint(980813), MaybeOfUint(895509), "ᣖ", "�ᠱࡱ")});
    Test_CheckProps_MatchResults(931445, "", "礃ឝਛ", {MatchResult(MaybeOfUint(450636), MaybeOfUint(149817), "那", "젮훇懓奲쮄⸔옯듡"), MatchResult(MaybeOfUint(655667), MaybeOfUint(324910), "�拺윰", "㞪㷗᤾虝䰒ஷ"), MatchResult(MaybeOfUint(211084), MaybeOfUint(654758), "�⿵枵ⴾ㬪●ꜛ귦翮漽", "彲⏈")});
    Test_CheckProps_MatchResults(985047, "ᓭ褾㵹徲㼏嘿ꑙ尚", "ᒧឝ밇�拣䵱䌏�", {MatchResult(MaybeOfUint(458500), MaybeOfUint(472243), "﫛", "ឞ楚㔊夷"), MatchResult(MaybeOfUint(544625), MaybeOfUint(998389), "޷Მ", "챳䫑넲뇎≌膅"), MatchResult(MaybeOfUint(771070), MaybeOfUint(672021), "撇寤퐫", "㤏�撵ߨ䯂䭱ꋔ૴")});
    Test_CheckProps_MatchResults(553221, "뵋榟蚂㢲蘆鞆", "瘃빻桑", {MatchResult(MaybeOfUint(23362), MaybeOfUint(361241), "䵙", "阚⦈郶炼")});
    Test_CheckProps_MatchResults(847011, "弊䮷⃷쨗蝢ᳳ", "㶑ꔘₜ齬聎雄攩澴", {MatchResult(MaybeOfUint(785817), MaybeOfUint(70718), "", "ꟗ唡ஊ")});
    Test_CheckProps_MatchResults(779184, "㸙", "", {MatchResult(MaybeOfUint(401776), MaybeOfUint(982620), "㆒", "℃벷쨭욢璞�ᐡ赪읝"), MatchResult(MaybeOfUint(), MaybeOfUint(848880), "ⵑ᠟Ꮍ⁭豹理癙", "＠߇₹紇"), MatchResult(MaybeOfUint(251911), MaybeOfUint(215862), "ୣ筃痒胊의䉶杻�죝", "墒≜蔗塚"), MatchResult(MaybeOfUint(682153), MaybeOfUint(184404), "鐷痚ꄻ滇�ꒉ㳀䈾", "枦")});
    Test_CheckProps_MatchResults(515696, "", "퍑ꗸ鶧ㆌ痒㇌⋛䨗", {MatchResult(MaybeOfUint(), MaybeOfUint(952030), "쌽", "閜䈀疶뫰"), MatchResult(MaybeOfUint(454352), MaybeOfUint(581447), "꿫琢췹", "좗謧痀㬙"), MatchResult(MaybeOfUint(22089), MaybeOfUint(294837), "밒᥃탃�刑", "嫈"), MatchResult(MaybeOfUint(970606), MaybeOfUint(224795), "⛛걍퐮뼗␺ᤳ", "ᆴ걾�")});
    Test_CheckProps_MatchResults(917537, "쯟㝒⒄색Ї", "鏟灭", {MatchResult(MaybeOfUint(877881), MaybeOfUint(973039), "뼊谥缃ಟ킐", "็۟弜쌘㙛핺﫽㑪"), MatchResult(MaybeOfUint(), MaybeOfUint(418900), "큝", "鉚枛칸ힼ㼓럮")});
    Test_CheckProps_MatchResults(783971, "覑甃", "ꃈ䮣ᬬ컵嶐녰ॐ", {MatchResult(MaybeOfUint(623932), MaybeOfUint(608398), "ⳳ흰姺㼙光♤흆", ""), MatchResult(MaybeOfUint(850147), MaybeOfUint(698153), "娗鿍섡⁏㸸㓌", "齜圓涾")});
    Test_CheckProps_MatchResults(6804, "돖꺭齶褱炋", "", {MatchResult(MaybeOfUint(753018), MaybeOfUint(357901), "", "妐檣袿칉谜訷໰胖"), MatchResult(MaybeOfUint(733567), MaybeOfUint(143921), "淲ﺆ", ""), MatchResult(MaybeOfUint(23189), MaybeOfUint(), "នﯸ滣轁竁怒ৈ⍪", "惗酁଱᮷")});
    Test_CheckProps_MatchResults(180139, "䬹칭烈罽췜", "䨣뉐㕋퇪㷗", {MatchResult(MaybeOfUint(), MaybeOfUint(), "詮柃ㄼ鲶헞", "ﮜ镕㠇篘㹡휁ꅮ"), MatchResult(MaybeOfUint(902045), MaybeOfUint(599862), "�쁰ꢚﲆ䉳诲뺔", "�"), MatchResult(MaybeOfUint(323729), MaybeOfUint(165205), "ﶊ响⮷�쒢ﻖ쾁᳓", "圙枩紂鯴떩ℭ")});
    Test_CheckProps_MatchResults(755458, "䰩⮵⧿堫竎绒", "츸࣓", {MatchResult(MaybeOfUint(557301), MaybeOfUint(491704), "Ꙭꇰ⦥๤즿ㄨ穂Hᡶ⛥", "俍埯퐥ঠ἗넾"), MatchResult(MaybeOfUint(794190), MaybeOfUint(847881), "䮖揉筢㲸肅", ""), MatchResult(MaybeOfUint(882201), MaybeOfUint(684210), "䃿fྔ㐔ᡄ鷂", "섎")});
    Test_CheckProps_MatchResults(96082, "⥇Ш啞婓菨뻟௎餵", "⵪", {MatchResult(MaybeOfUint(), MaybeOfUint(579095), "䗎稦⡠式㏩됤蓼", "娒㜽㆒蠩鉜拓")});
    Test_CheckProps_MatchResults(207472, "욿Т᏾쟰囍틠䤙礎㋳숙", "�씼旝吾捣嶟廌⁹", {MatchResult(MaybeOfUint(995994), MaybeOfUint(772864), "␹鈖躇", "�䅴"), MatchResult(MaybeOfUint(187198), MaybeOfUint(489560), "他�慺㗻壺旻슽", "㣕ದ鴆䟎"), MatchResult(MaybeOfUint(583163), MaybeOfUint(498609), "澎낭荸〈韴", "⊺�ࠫ⿳훿☸꤫睊�")});
    Test_CheckProps_MatchResults(209250, "禱鍾齪床὏勐", "阊", {});
    Test_CheckProps_MatchResults(319794, "枂᜕嫀᮶๑肬", "䅿ꦧ", {MatchResult(MaybeOfUint(853742), MaybeOfUint(282186), "挂ꁪ쥫�쭑뒱", "컏�嚌"), MatchResult(MaybeOfUint(757638), MaybeOfUint(187953), "絊앨⛳唏", "剭ﺏ柙㕤쩢姽ἆ奨啈")});
    Test_CheckProps_MatchResults(576372, "⶯", "⷗륶땣ᢦ", {MatchResult(MaybeOfUint(), MaybeOfUint(688748), "묒ꀓ䤢౤ᅺ", "蓸�舆"), MatchResult(MaybeOfUint(364364), MaybeOfUint(177629), "ട墳譐鯮㚰", "")});
    Test_CheckProps_MatchResults(542936, "똳䁶䉇ꖸ渡ꒋלּ⚶η㝯", "ﲏ", {});
    Test_CheckProps_MatchResults(68507, "罜", "뮄ᢿ", {MatchResult(MaybeOfUint(391279), MaybeOfUint(614806), "ậ≲턺", "㟦兡䏰糗鿾돵傗䘠"), MatchResult(MaybeOfUint(39143), MaybeOfUint(), "؟잫긬ᒦ窸䃿ﲩ�", "Ჿ䟪롶꠸텤")});
    Test_CheckProps_MatchResults(538331, "蒮搛ᅕ쐑벒푈", "浏඾繫䷩暻Эᳺ푰", {MatchResult(MaybeOfUint(388691), MaybeOfUint(961882), "ݹ話亢൓⾽", "⊲ǫ礳惴"), MatchResult(MaybeOfUint(207862), MaybeOfUint(561537), "膐朳멫캿욀", "ྊ䐊罶㭹뱍᭲")});
    Test_CheckProps_MatchResults(88502, "", "⼝줠딳落", {MatchResult(MaybeOfUint(146269), MaybeOfUint(150520), "ఱ", "纉彾"), MatchResult(MaybeOfUint(657076), MaybeOfUint(550737), "洂겿躂노闗", ""), MatchResult(MaybeOfUint(367067), MaybeOfUint(961228), "ᆵ춳Ầ", "ﬂ冺")});
    Test_CheckProps_MatchResults(813733, "斄ᘫ", "暪棱館迠", {MatchResult(MaybeOfUint(598321), MaybeOfUint(3143), "�䂁ㅽ", "剠ﺯ�")});
    Test_CheckProps_MatchResults(948044, "廒ㇱ팜锏▽ꇲ", "", {MatchResult(MaybeOfUint(236077), MaybeOfUint(483702), "欬ጪ쥒", "←ꠣ"), MatchResult(MaybeOfUint(272284), MaybeOfUint(238565), "滔㘎ᔳ", "銇"), MatchResult(MaybeOfUint(), MaybeOfUint(588224), "鞼", "㖦"), MatchResult(MaybeOfUint(833518), MaybeOfUint(459646), "耥౩ꡯ᧠苶缶ϱ", "ℷ鼈㐏虒")});
    Test_CheckProps_MatchResults(316700, "", "Ꮞ飑ႎ卒谓⪪", {MatchResult(MaybeOfUint(), MaybeOfUint(647747), "ꓛꝘﺿю䗗ꕩ髽㱮䂗蓇", "�裹挬裀ǃ勵"), MatchResult(MaybeOfUint(480955), MaybeOfUint(90327), "ǋ鯮镘嫊冠愃", "췥뾴ⴾ愫팹룼崬銌"), MatchResult(MaybeOfUint(359901), MaybeOfUint(953142), "", "쓟쓄퇗")});
    Test_CheckProps_MatchResults(194759, "놔筶", "閪眧畹", {MatchResult(MaybeOfUint(291632), MaybeOfUint(914143), "₎ㄊፂ�꿘腷頀", "꒻⼧闂Ꭴ詓燥")});
    Test_CheckProps_MatchResults(60944, "괘᪄", "罫䵮웤", {MatchResult(MaybeOfUint(794865), MaybeOfUint(), "䈱렐ﴂ凘뭇", "㾔")});
    Test_CheckProps_MatchResults(836488, "", "簜", {MatchResult(MaybeOfUint(583514), MaybeOfUint(191), "쀞镸", "ဖ륒ਭപ䂬⛦わ힢啽ᕇ"), MatchResult(MaybeOfUint(568489), MaybeOfUint(241452), "║ｷܫ䪡�屳휠", "︍歳컧묈䳖"), MatchResult(MaybeOfUint(43591), MaybeOfUint(28052), "裘쾕䮝�દ咾釫", "ఽ슆")});
    Test_CheckProps_MatchResults(866713, "쬒閨്쟵㖥蚭㔃좓", "", {MatchResult(MaybeOfUint(), MaybeOfUint(973286), "虋㖈ᘈ缥躒", "뢱⃹⑾⿚锔ﴫ"), MatchResult(MaybeOfUint(18020), MaybeOfUint(911753), "蔥瘤հ", "邊"), MatchResult(MaybeOfUint(535214), MaybeOfUint(420662), "㝎那끧߿栚", "�獠")});
    Test_CheckProps_MatchResults(376450, "ꦿ㺕㍠종ᕉ豼", "帪", {MatchResult(MaybeOfUint(115083), MaybeOfUint(745616), "Ɂ犆渉", "ﻴ뚓◚꒟�ῼ錦鳕"), MatchResult(MaybeOfUint(635918), MaybeOfUint(34956), "㝲ࠩ᭵녱撅", "憧쀓"), MatchResult(MaybeOfUint(), MaybeOfUint(792646), "衪", "㕿�슌욵ｪ餤１렏⢈")});
    Test_CheckProps_MatchResults(295740, "为ぼ", "∇�넢ꉥꚰﾹࣴ㦎", {MatchResult(MaybeOfUint(499798), MaybeOfUint(94034), "螯ꢁ콧", ""), MatchResult(MaybeOfUint(519644), MaybeOfUint(677123), "坐풗䯻犖", "⸉⁭䥉腪壋"), MatchResult(MaybeOfUint(527463), MaybeOfUint(60574), "", "辞羡褡✸")});
    Test_CheckProps_MatchResults(21914, "᤯", "睚혤薦䜾ຩῐ朿", {MatchResult(MaybeOfUint(), MaybeOfUint(996571), "훴", "偿紥ᩎ"), MatchResult(MaybeOfUint(802745), MaybeOfUint(302803), "ꭸせ泴볹䰝Ḍ⁭", "敚ꊔ䝻ᗓ騵ꦎ鈌䧢")});
    Test_CheckProps_MatchResults(950475, "靍㱦", "⑹箜芘뱷᪊", {MatchResult(MaybeOfUint(35156), MaybeOfUint(780395), "끕蘆㉰춈ꪦﵥ⁥㦠ꣃ", "ꏝ뙪"), MatchResult(MaybeOfUint(251205), MaybeOfUint(324463), "", "ᨷ鞏"), MatchResult(MaybeOfUint(684080), MaybeOfUint(440754), "", "⮲﫩ᬀ으ꦒᢆ民"), MatchResult(MaybeOfUint(949125), MaybeOfUint(622606), "覩", "沱ߵ⸏䪉�㛐盿農빱")});
    Test_CheckProps_MatchResults(126556, "䇑홂᫐퓙", "㖹鐶鉥蟎⅒蓉", {MatchResult(MaybeOfUint(604216), MaybeOfUint(), "黟ⶔ⭓Ϗ䦵ﯔ۱ᔍ䲥␈", "�︧ꖀ"), MatchResult(MaybeOfUint(956196), MaybeOfUint(141675), "뤧옠䝳﷠", ""), MatchResult(MaybeOfUint(160095), MaybeOfUint(268205), "", "硞햅匿ল꼴镊궱鰳"), MatchResult(MaybeOfUint(721285), MaybeOfUint(213947), "㶴象랖鉏箩", "ꦩ䁿ﯹឿ杕ी玫伜")});
    Test_CheckProps_MatchResults(368793, "惱㱚", "懵�偣鍝帽䟚", {MatchResult(MaybeOfUint(694053), MaybeOfUint(60414), "ᨈ蒁Ʞ㙖㲶㙢벾", "♥榮阯魐節�믜"), MatchResult(MaybeOfUint(174953), MaybeOfUint(494827), "耭䢒墻ߊ⭔", "")});
    Test_CheckProps_MatchResults(613080, "䶚똭丢먊ਏ", "ફ筌杷譛諉ମ鉤", {MatchResult(MaybeOfUint(814228), MaybeOfUint(), "枈", "塌鿌蕎農"), MatchResult(MaybeOfUint(), MaybeOfUint(257537), "ᝨ뭈턡乤媾", "摃咹ｘ븠쎧㏆"), MatchResult(MaybeOfUint(102014), MaybeOfUint(478652), "ꁸᢠ炟摝侾췮玙", ""), MatchResult(MaybeOfUint(957812), MaybeOfUint(46547), "ݯ켾粼ò䙄䍩뼚韦", "ഫ")});
    Test_CheckProps_MatchResults(985933, "", "弶촒塯", {MatchResult(MaybeOfUint(), MaybeOfUint(359111), "瑄ଁ騊㷘鰹", "㼏럘㊔਎╅迤稘蠌"), MatchResult(MaybeOfUint(386831), MaybeOfUint(409061), "㨮ᩲ茴锨", "೚�卄"), MatchResult(MaybeOfUint(547261), MaybeOfUint(322060), "舒勴", "꛶갔쾟疦욋䳾ⵙ꫒ࣀ"), MatchResult(MaybeOfUint(801603), MaybeOfUint(121340), "േ歿ﳤ䬀떊蹉紵뎃럑㗱", "᤹")});
    Test_CheckProps_MatchResults(459703, "䦭ੵ슆꟫謉㐤照愄⛁", "켚蕁ᡵ윩嶮ꙮ䆤瘝蛪", {MatchResult(MaybeOfUint(968614), MaybeOfUint(62484), "滓�ħ其", "靐�昂㉆⭺쌵䫲"), MatchResult(MaybeOfUint(667325), MaybeOfUint(187845), "꾆ꌆ빜", "Ӯ绰ሤ粼䊍檭祬훼▜ऺ"), MatchResult(MaybeOfUint(243516), MaybeOfUint(206944), "꿖嗯♓⺔", "ﱑ瓐ꢐ")});
    Test_CheckProps_MatchResults(554498, "젬몥", "畑�咞繜", {MatchResult(MaybeOfUint(933848), MaybeOfUint(691571), "", "�閫ጒ쿟�蠝⍸⭫愡"), MatchResult(MaybeOfUint(847697), MaybeOfUint(735878), "౟稵愫뿱悜놁해", "")});
    Test_CheckProps_MatchResults(743803, "簝", "", {MatchResult(MaybeOfUint(174949), MaybeOfUint(639328), "꣩條괰럕槲澜觛᮵瓚", "�퐁쩊"), MatchResult(MaybeOfUint(253381), MaybeOfUint(), "ꎣ", "㉂噼傗쬄"), MatchResult(MaybeOfUint(643626), MaybeOfUint(759585), "", "빽"), MatchResult(MaybeOfUint(460842), MaybeOfUint(775430), "", "�氁貓﾿꓾")});
    Test_CheckProps_MatchResults(188562, "上亖䎜滺涸ⲩ", "㲳踮ꑃ웍錻", {MatchResult(MaybeOfUint(664882), MaybeOfUint(773560), "䙟㠆ꧻ", "뭇ᴙꔴ䡚詴協᧴ꬁ"), MatchResult(MaybeOfUint(663760), MaybeOfUint(236033), "訩ஃ௞", "")});
    Test_CheckProps_MatchResults(951006, "鵓蛜귮ꭉ", "虄偧�㊀", {MatchResult(MaybeOfUint(843069), MaybeOfUint(163792), "鏉霦", "呠"), MatchResult(MaybeOfUint(676238), MaybeOfUint(73096), "၁딆ሕ", "諄ꟷꊑ⠉茹ꎂ"), MatchResult(MaybeOfUint(433054), MaybeOfUint(591297), "芵锿•㇓䖙叀", "ᯜﬠℎ蘸죚佊꾈켽")});
    Test_CheckProps_MatchResults(999704, "娤嬟", "⬿፮覦꧛㒿", {MatchResult(MaybeOfUint(), MaybeOfUint(644394), "唠↍❠摀", "蛱弰뀿屑뿏闻✩"), MatchResult(MaybeOfUint(82251), MaybeOfUint(180786), "娸곓͟湖", "ꙅ轄绰㻠ꢍ彝⊌헥"), MatchResult(MaybeOfUint(602832), MaybeOfUint(388), "䞯ኡ趚謘뛟", ""), MatchResult(MaybeOfUint(98643), MaybeOfUint(), "뗻ஹ誼", "稣㴺郘")});
  }
  
  bool unitTestResults_MatchResults_Getters = runAsync(Tests_RegisterAll_MatchResults_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_MatchResults_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_MatchResults', UnitTest_OpEqSimple_MatchResults);
  }
  
  MatchResults@ lastChecked = null;
  
  bool OpEqSimple_Check(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    MatchResults@ o1 = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    MatchResults@ o2 = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_MatchResults() {
    OpEqSimple_Check(393455, "ﷰ눵뭩㵷衟춗䵩", "쭶퍉첯㚥涬", {MatchResult(MaybeOfUint(591567), MaybeOfUint(999074), "ᛱ떡ꖯ꒲풜豈", "芖쬬뵉삕⁪ؠ技呝"), MatchResult(MaybeOfUint(295268), MaybeOfUint(665920), "", "䉍")});
    OpEqSimple_Check(332990, "ᳲ풜", "詘렰佹", {MatchResult(MaybeOfUint(479941), MaybeOfUint(112534), "垛峵כֿ鐄ℛݙᚬ", "︐좙"), MatchResult(MaybeOfUint(), MaybeOfUint(), "璊诛퇟鯚", "獔")});
    OpEqSimple_Check(658911, "冥㶶밑幖許ᬤ쿊菆", "䝅攨鑽烆ঙﶇ䚱", {MatchResult(MaybeOfUint(133463), MaybeOfUint(386748), "ꂅ䔲", "后⡆鍙莕")});
    OpEqSimple_Check(358019, "쮟허", "怸፦⺑띌렯岺", {MatchResult(MaybeOfUint(300568), MaybeOfUint(511553), "汀ᆣ젙娣ʱᯜ鱦", "ਮ虴簪䤀揾噚셑燵"), MatchResult(MaybeOfUint(554651), MaybeOfUint(179642), "뮱", "똮ꨕẽ"), MatchResult(MaybeOfUint(107540), MaybeOfUint(504118), "耏盧я␜", "")});
    OpEqSimple_Check(610006, "䀐硩", "䀿虿砍", {MatchResult(MaybeOfUint(292550), MaybeOfUint(884234), "墳룠డ", "奟㜫䞞祡"), MatchResult(MaybeOfUint(689395), MaybeOfUint(172033), "饁䱯", "畼〭⤓ﲁ들≱髀"), MatchResult(MaybeOfUint(), MaybeOfUint(304368), "䞧શ�䔘⾆", "⁗∾웇Ⓩᱭश胤Ⲟꫢ"), MatchResult(MaybeOfUint(718449), MaybeOfUint(616710), "놵묺쥷藹㴮", "侉�")});
    OpEqSimple_Check(544378, "疡赬", "캈", {MatchResult(MaybeOfUint(), MaybeOfUint(780762), "�둕껅汆", "玹桗喐橀"), MatchResult(MaybeOfUint(786095), MaybeOfUint(997818), "", "�ﭝ豲氹φ䚧")});
    OpEqSimple_Check(814326, "⩮�ώ꒏퓂䉰ꋗ嗳ರ", "슅엎筄䄗灰ᔃ㣛צ", {MatchResult(MaybeOfUint(929297), MaybeOfUint(985182), "᧡⬆ꁓ", "㵅绰혏牒"), MatchResult(MaybeOfUint(831018), MaybeOfUint(884620), "׊�猋┕緰튅", "㝛侢㳹�蛖ꬹ耐")});
    OpEqSimple_Check(594924, "銰ၧᮑ", "ೢꨉ�툱ฃ爯䑫ⵙ", {MatchResult(MaybeOfUint(575611), MaybeOfUint(141600), "⟹驵盲ⓟ娣ዯ", "賥硬⭷혀ⴿ㓶ࣛﬣ"), MatchResult(MaybeOfUint(481138), MaybeOfUint(), "䚨篱鬻피䌱踀", "챀"), MatchResult(MaybeOfUint(), MaybeOfUint(475985), "뱜悶ꂋ鰲", ""), MatchResult(MaybeOfUint(929569), MaybeOfUint(759681), "粄⅝挝㠊", "共䳶넊ᙓࡀ컒")});
    OpEqSimple_Check(294139, "룎", "螥㗓꒭→", {MatchResult(MaybeOfUint(284057), MaybeOfUint(348076), "", "䇨蘛ǆ簃偵펫ῥ遮ᕺ摃"), MatchResult(MaybeOfUint(112824), MaybeOfUint(788261), "㉻�냀㛛", "똹텽"), MatchResult(MaybeOfUint(), MaybeOfUint(329660), "赊ﴋ鎘", "薾ꔲ昽꜓ᵃ")});
    OpEqSimple_Check(880161, "䍇ﷰ쎑ˬ퍪쉹٥", "銵뒮ꬴ새櫯쩈䰏禯", {MatchResult(MaybeOfUint(888785), MaybeOfUint(574276), "", "ꊈ껿譍扆䡖図罛⢲Ȃ"), MatchResult(MaybeOfUint(291997), MaybeOfUint(463120), "磃헮躁潿鬐", "̉韺輨浉ㆠ㌔Ú"), MatchResult(MaybeOfUint(69729), MaybeOfUint(543714), "냖럢쩪媭", "鼗䘚秱ᗱ閯ﺸ娂ᑠ"), MatchResult(MaybeOfUint(560452), MaybeOfUint(340979), "㝳䵉", "罚")});
    OpEqSimple_Check(607334, "ﻯ機", "龕ຽҷ䋰ꭔ䧂脑", {MatchResult(MaybeOfUint(1447), MaybeOfUint(), "", "ﵜ⫌Ꞻ⧙㐈狀䌤譢䳷饡"), MatchResult(MaybeOfUint(263019), MaybeOfUint(630661), "ྮ韑ଵ峎", "濺췲"), MatchResult(MaybeOfUint(968043), MaybeOfUint(236951), "桁�ည葀՗", "҅飛曀푧鯄꟒")});
    OpEqSimple_Check(308035, "�鳛", "ඟ姡�럴咨ᮭ岾＄", {MatchResult(MaybeOfUint(), MaybeOfUint(533724), "㵟蝅迨︧兀ࢺ鱈䛳啨", "ᄈ믋왚ꯂ喿�"), MatchResult(MaybeOfUint(851901), MaybeOfUint(217817), "轏씅", "੿퉛꿪⹳ꈰ뗵丷ө㩣")});
    OpEqSimple_Check(897341, "", "ힾ䣇ᚇ梅翂", {MatchResult(MaybeOfUint(867988), MaybeOfUint(), "粑飼膃峧", "率Ⅳ魨")});
    OpEqSimple_Check(584081, "礸蟽袸▴れꘅ", "憚邷塙ꢖ嶰읦逕", {MatchResult(MaybeOfUint(311873), MaybeOfUint(111470), "馺൹貈垸뀰过�", "暮㟄䷫킹륦了挧ﳗ")});
    OpEqSimple_Check(914453, "—뜔愄츿첣⦝脘곅䂃堮", "迊ṱ", {MatchResult(MaybeOfUint(700481), MaybeOfUint(571410), "㼉媻뉾ᮈⵌ", "玗붐"), MatchResult(MaybeOfUint(87920), MaybeOfUint(225588), "⌻礚쑲∆ⴝ䨥踯", "巴⶯协⌜᳜"), MatchResult(MaybeOfUint(512834), MaybeOfUint(496681), "歓퐍⟳庶✨", "⯈퀍낼민翍쵓㩌찚࿋")});
    OpEqSimple_Check(252171, "", "桏져墩", {MatchResult(MaybeOfUint(684252), MaybeOfUint(957356), "م륳⏏᧎䫁詵䯻꼊", "쌜⺢")});
    OpEqSimple_Check(967496, "炰၃鉝✜ྦྷ擊㣙㾯", "釽⛧", {MatchResult(MaybeOfUint(274962), MaybeOfUint(258463), "瑨ᘂㄺƫ㪙", "ᓪ辜榡"), MatchResult(MaybeOfUint(471983), MaybeOfUint(486011), "䆀", "闻")});
    OpEqSimple_Check(942992, "뗭", "鈩⥁", {MatchResult(MaybeOfUint(424590), MaybeOfUint(225780), "鳙막", "탡뒤엄闼嵞뿭燨ꍶ⨙"), MatchResult(MaybeOfUint(383038), MaybeOfUint(262430), "븥ꖙ∴簾뱟", "綽ケ摓릺칻啗"), MatchResult(MaybeOfUint(935449), MaybeOfUint(577326), "", "꼡姐䊂⤭�")});
    OpEqSimple_Check(951824, "ἄ辰思莽䱪㪪䀷픿ᨏ", "⹄̥グ㘁ȃ", {MatchResult(MaybeOfUint(132420), MaybeOfUint(796634), "", "麼◹۝塴惑涑홨"), MatchResult(MaybeOfUint(102070), MaybeOfUint(56189), "煾❴", "⒲"), MatchResult(MaybeOfUint(765047), MaybeOfUint(246041), "Ĺ甗쇸蛙惢", "投᮪쥕箏﻿")});
    OpEqSimple_Check(663923, "廌", "⻌閉笢뾊諽髩浙䭬", {MatchResult(MaybeOfUint(183808), MaybeOfUint(), "쟓", "冥풭"), MatchResult(MaybeOfUint(464965), MaybeOfUint(773269), "룦ύ", "봃鿒碀㿷"), MatchResult(MaybeOfUint(269383), MaybeOfUint(), "䢿眭᫜侯억맖Ⴙ潊", "")});
    OpEqSimple_Check(276945, "ⵜ㲰핋嶣䇙寇", "섀뇗", {MatchResult(MaybeOfUint(384006), MaybeOfUint(745993), "⨎", "㚡�闧㼅﬎梡깺"), MatchResult(MaybeOfUint(407489), MaybeOfUint(803720), "랄⬄䴎뚶豗馌⬝", "㲇߇⾕")});
    OpEqSimple_Check(439191, "演읎떩煤⼉岁", "喭﬚﹢멊┰ಂℳ", {MatchResult(MaybeOfUint(531572), MaybeOfUint(92494), "㫋�", "")});
    OpEqSimple_Check(475261, "續Ꮪ", "ἦ㰞�", {MatchResult(MaybeOfUint(718283), MaybeOfUint(), "仫힒", "ਾ"), MatchResult(MaybeOfUint(987124), MaybeOfUint(), "萩➽縴邾滁﫿ყꉼ嵠﬙", "ﰠ붺︈")});
    OpEqSimple_Check(120708, "㍙⊘�౟", "欣ﳋ乯", {MatchResult(MaybeOfUint(613298), MaybeOfUint(225358), "", "ீ憨"), MatchResult(MaybeOfUint(59634), MaybeOfUint(743323), "热⹉㊘၁᫄鍹䨢䵟ۄ", "떶⨨ᘟ戣⦻䭋톓")});
    OpEqSimple_Check(804429, "扐葁霤黟ꮪ", "Ỵ莙▸", {MatchResult(MaybeOfUint(509669), MaybeOfUint(), "컪", "疱↢"), MatchResult(MaybeOfUint(905196), MaybeOfUint(978683), "�憕€鹷蛶鞱穥", "拳沈")});
    OpEqSimple_Check(745629, "쫣唹噴爙⋥Ⓠ", "賂둁圡芪ȯ딝륷䲛", {MatchResult(MaybeOfUint(41134), MaybeOfUint(223849), "呃율ᤞ", "䞸鄈鲤戙᤿䜦鈷"), MatchResult(MaybeOfUint(121888), MaybeOfUint(707067), "", "嵵棓쿏"), MatchResult(MaybeOfUint(508756), MaybeOfUint(461071), "핈䌶", "㫷ൈ�ぞᓺ")});
    OpEqSimple_Check(907649, "ꎢң�黾ᔏ셂몚첈", "ݿ", {MatchResult(MaybeOfUint(189651), MaybeOfUint(2664), "", "꒝﷬︀膥␲浧뭧핾"), MatchResult(MaybeOfUint(192506), MaybeOfUint(824996), "瑫�긇", "돉㘖惢"), MatchResult(MaybeOfUint(), MaybeOfUint(), "뢬垑锖", ""), MatchResult(MaybeOfUint(517187), MaybeOfUint(356714), "�馰㏙伥╙灌띎", "음")});
    OpEqSimple_Check(154699, "፡␯撂ᴥ䂽ᧁ", "孈틕଀蒍", {MatchResult(MaybeOfUint(467419), MaybeOfUint(896358), "䄁緯壣媂", "噫歪"), MatchResult(MaybeOfUint(453397), MaybeOfUint(569972), "﹒푽씛듷륑", "昳占㵊"), MatchResult(MaybeOfUint(466985), MaybeOfUint(), "⾁ᱡ䋢ฅⴑ鋆", "幺ਗ਼ᓊ鹿ݚ띤"), MatchResult(MaybeOfUint(), MaybeOfUint(671591), "ᱝꕮ餗", "")});
    OpEqSimple_Check(556133, "ퟄ䬰왊姭칲ﲤ荏嬸虶", "쭖㟧⃟㢋ꮂ", {MatchResult(MaybeOfUint(318429), MaybeOfUint(172280), "疡谉闷䖕✚葝壜벦", "鿸큿㱘嚶溇Ჶᔲ"), MatchResult(MaybeOfUint(), MaybeOfUint(704184), "ʏ㾕臨", "尝㙬㛡"), MatchResult(MaybeOfUint(), MaybeOfUint(304429), "탨轭쫓됻⯌ꯘ眝بᱜ", "�⒚¢飸⣌䂜쾣"), MatchResult(MaybeOfUint(649838), MaybeOfUint(), "㲊", "嵫ꅄ卒̶凮嚠ﲎ")});
    OpEqSimple_Check(981931, "꼐㆒衐⾕쩿ी狲篌髋", "棁༙㭮嗷㠽�୽", {MatchResult(MaybeOfUint(436429), MaybeOfUint(51680), "", "咃ࠄ裞ꥭ峘갤噴崤腎"), MatchResult(MaybeOfUint(38788), MaybeOfUint(664123), "偛ᖧ⠀㲰ڣڪ⽷먍汃Q", "⫖㺄録"), MatchResult(MaybeOfUint(826335), MaybeOfUint(), "痡뗏�", ""), MatchResult(MaybeOfUint(984216), MaybeOfUint(357258), "崁尉ꊹ娷匇绱㑝", "")});
    OpEqSimple_Check(896538, "⮖铢뢇懅⧈碴熭彰", "翝", {MatchResult(MaybeOfUint(114951), MaybeOfUint(428239), "꽹䕵ᙃ", "쏳费糸荺伡燌௏"), MatchResult(MaybeOfUint(927238), MaybeOfUint(169558), "Ⲇ璡⩘", "寲疥῰馮얠"), MatchResult(MaybeOfUint(871005), MaybeOfUint(802978), "᡼쮯", "䷀㨌�"), MatchResult(MaybeOfUint(652939), MaybeOfUint(513362), "窞璫濝詼憐팰", "镄辠㼉瑸ꤰ")});
    OpEqSimple_Check(520926, "跤鼝", "틍냿ꬎஎ⃳੫貺軁测ᠾ", {MatchResult(MaybeOfUint(312539), MaybeOfUint(507040), "貧䔨㌅廏㻣", "丟娜츀М符푰뽲"), MatchResult(MaybeOfUint(954369), MaybeOfUint(578298), "Ꝟ冷硃⶘⁌뙦鰠", "⯾淂꒟釛")});
    OpEqSimple_Check(199060, "륳덏꽠枕뵷鉌䳷ጥ頦", "퐌쮧", {MatchResult(MaybeOfUint(814048), MaybeOfUint(954272), "", "⭿띄騣卂"), MatchResult(MaybeOfUint(546128), MaybeOfUint(422588), "ﴽ⃾땗", "쩢ꇭ뵪鈹"), MatchResult(MaybeOfUint(641927), MaybeOfUint(875341), "ﹳ쫹⾟袎焓弖껃Ú웪", "⸁싢忻辦")});
    OpEqSimple_Check(605807, "胹", "儺", {MatchResult(MaybeOfUint(413683), MaybeOfUint(412341), "倏叉檩浐瞹◌욡", "�ﲾ⾻㍷㚭ﲌ楪窏"), MatchResult(MaybeOfUint(199558), MaybeOfUint(427989), "扚냘锇㙙࠭", "㖫듣蜤")});
    OpEqSimple_Check(1174, "ܨ", "缻猄鴀屒⋧怦", {MatchResult(MaybeOfUint(654535), MaybeOfUint(492654), "韊ଯ⣾⠨℈뽋矧炋싑", "鸑")});
    OpEqSimple_Check(112184, "", "퐢℣努蝴篲屦셎㖉뭣", {MatchResult(MaybeOfUint(737538), MaybeOfUint(), "鐾㌉앷貶", "뢭痔")});
    OpEqSimple_Check(187517, "垶훪롾㐱ం⮌", "ꁦɹ�䴦㚝氅巃阴", {MatchResult(MaybeOfUint(621007), MaybeOfUint(), "进됭䆸", "")});
    OpEqSimple_Check(142247, "", "ꖓ噰醅祶�த⽥㑥ꉽ", {MatchResult(MaybeOfUint(480662), MaybeOfUint(), "", "⦀卵"), MatchResult(MaybeOfUint(), MaybeOfUint(79959), "ꎜ䁃癣못餌礵쭁�", "䖆掂䰆粁㦍㚈ꊼ"), MatchResult(MaybeOfUint(433506), MaybeOfUint(), "믦ݭ", ""), MatchResult(MaybeOfUint(652301), MaybeOfUint(961271), "ש⴨֥嬼슷䮈柎縋", "阸报")});
    OpEqSimple_Check(396963, "왆郼ꈝ쒜타ưᢘ", "߭礴㸠䅛澿", {MatchResult(MaybeOfUint(425384), MaybeOfUint(109757), "綎씃めᢑ娮", "﷜ᬁ狿昫�罺쿔")});
    OpEqSimple_Check(581327, "褪崎ⲛ㱡鷊좑袆뷢斩ᶷ", "寳쨯革", {MatchResult(MaybeOfUint(382032), MaybeOfUint(649254), "ᅸ뛦躌륕", "櫢潃뮚己唙淐挩㯂죷")});
    OpEqSimple_Check(201767, "轣脐⬒埐糋ᙴ", "擱�욌尽⪬ꇱ", {MatchResult(MaybeOfUint(259324), MaybeOfUint(855703), "癐ᖀ㪥ⶶ龪س▀롹", "꣔ᙑ鋃姸Ұ咍뇎"), MatchResult(MaybeOfUint(810439), MaybeOfUint(892586), "뉒例鰘덆鱤濫", "ᙥ줊"), MatchResult(MaybeOfUint(530271), MaybeOfUint(857619), "启ࢥ龇", "竖췸ܫከꔙ漖ꄃ跚㴺"), MatchResult(MaybeOfUint(210910), MaybeOfUint(577159), "", "誺燛頄᪚桀䮭")});
    OpEqSimple_Check(41625, "擤᠎坑⹉", "�鿟嘪愪ˠͅ摁ሏ좞", {MatchResult(MaybeOfUint(79117), MaybeOfUint(627110), "ﮣﱔ抃໊뛵溭", "픏ᡱ篢䗶䇃Ე馻筺䆈ᚬ")});
  }
  
  bool unitTestResults_MatchResults_OpEq = runAsync(Tests_RegisterAll_MatchResults_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_MatchResults_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_MatchResults', UnitTest_SzThenUnSz_MatchResults);
  }
  
  bool Test_SzThenUnSz_Check(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    MatchResults@ tmp = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    assert(tmp == _MatchResults::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_MatchResults() {
    Test_SzThenUnSz_Check(823221, "�朹鎟ﳙ㻲翾鵜靀㍒", "ﰙ⠁玭텆", {MatchResult(MaybeOfUint(322150), MaybeOfUint(527623), "陏", "씠䪉Ꮢ榋"), MatchResult(MaybeOfUint(263354), MaybeOfUint(805858), "躗", "츰ꍆ๩ヂᶥ뾠粯ꣿ"), MatchResult(MaybeOfUint(605220), MaybeOfUint(415169), "ř챉鋱Ʞ爇⼺鐸䨒", "벃堝ᛟ㤔"), MatchResult(MaybeOfUint(661263), MaybeOfUint(840437), "錭鿩꤉䵚ࢂ浮翅쿕焫", "䃜")});
    Test_SzThenUnSz_Check(705395, "圭徰藧퀕ᶏ", "쏦웺", {MatchResult(MaybeOfUint(479132), MaybeOfUint(973529), "㐚ꂖ摇䞰鄕", "勿掝䩸"), MatchResult(MaybeOfUint(694614), MaybeOfUint(), "⏂ꥏ꼼砍띑䗇", "踆⌾ꎳ㏰鉓켯τ㪔ﻊ"), MatchResult(MaybeOfUint(289231), MaybeOfUint(130027), "鉼竲㽥︠", "瞄")});
    Test_SzThenUnSz_Check(970574, "牉᳔", "퍻䳥最徐㭾멭Პ䑰", {MatchResult(MaybeOfUint(79708), MaybeOfUint(976559), "簳鋒馑읊쾮", "Ԧ懁ㅲ砤㉾滑肜"), MatchResult(MaybeOfUint(), MaybeOfUint(312200), "ꐎ굻⛩㰣兵∋沴", "ᢂ䙏ຸ愵䗽"), MatchResult(MaybeOfUint(234787), MaybeOfUint(480710), "훃�폡䐂᰾홗", "柊麑囼"), MatchResult(MaybeOfUint(288796), MaybeOfUint(329026), "", "贅谌⼋牐")});
    Test_SzThenUnSz_Check(788694, "ബ踳蝘䳡", "廕埒ꤵ쟹깴は", {MatchResult(MaybeOfUint(447567), MaybeOfUint(240382), "膕躯", "")});
    Test_SzThenUnSz_Check(730997, "ී쨳ㄤ䒹ਮゴ", "沲", {MatchResult(MaybeOfUint(610030), MaybeOfUint(194647), "绹", "혘疿쑡蕭㩀꫏")});
    Test_SzThenUnSz_Check(883773, "庚䛥嶿", "籫ᆄᆖ�", {MatchResult(MaybeOfUint(6692), MaybeOfUint(597747), "羔ﾧ鋣ꊌ멉녍ഩ਽", "憎"), MatchResult(MaybeOfUint(30265), MaybeOfUint(), "ꉁᏚ", ""), MatchResult(MaybeOfUint(31957), MaybeOfUint(300346), "ﲀ⧝�䄳凜嬚", "ྉ樦纍"), MatchResult(MaybeOfUint(116704), MaybeOfUint(613456), "殤掙얷ᐮጧ뎆", "ᓌﻸꚡ䯯桾뭎")});
    Test_SzThenUnSz_Check(575382, "", "ⳃ㩄앪衚", {MatchResult(MaybeOfUint(767904), MaybeOfUint(), "肯䨏﻿ꓼ", "㶡앧�鸓㮝ႝ䖟哢"), MatchResult(MaybeOfUint(478495), MaybeOfUint(199047), "괇", "벑뀁矣₳迿ⵢ⎕곰✁"), MatchResult(MaybeOfUint(859526), MaybeOfUint(411907), "ƒ蠐前袊⬸", "ើ溥")});
    Test_SzThenUnSz_Check(760086, "⚝霡༺�띩⏚暚鲃", "ﬗ炅⧬䥱ᔇ즾�⟸嚟挆", {MatchResult(MaybeOfUint(10462), MaybeOfUint(559916), "푔⼧巇麃", "斻ை牖Ⲋ䆮⊂农陣띰"), MatchResult(MaybeOfUint(462625), MaybeOfUint(360995), "⯟骙䁣豅琧뗇躏òꘄᷡ", "펽꩙负釺锼珟፩�埊쎆"), MatchResult(MaybeOfUint(668538), MaybeOfUint(252573), "", "ຶꔽﾜᵏ䒴풠氂ᔾ")});
    Test_SzThenUnSz_Check(808646, "㪁▫윁벼寥ﴋᮝ臢", "鲑頸헳ᑭᷡƫ믅༐", {MatchResult(MaybeOfUint(745915), MaybeOfUint(), "뼖ቬ뫁귫", "ॄ綫鼂㦦턗"), MatchResult(MaybeOfUint(505384), MaybeOfUint(339013), "ᢜ锦먓쏜뙅", "瘞⺔셡")});
    Test_SzThenUnSz_Check(7803, "", "㟧歒䉛笔ꦚ", {MatchResult(MaybeOfUint(487581), MaybeOfUint(123480), "쒿№妝", "�")});
    Test_SzThenUnSz_Check(854263, "똣궆暱여군햛", "ﷺ⋏晆뗭", {MatchResult(MaybeOfUint(27512), MaybeOfUint(), "ᱰᆧᡒ희폿ざ綥", "�夛篢椞◌꽣⎄૧")});
    Test_SzThenUnSz_Check(485481, "깊칀ﲦ琇剧敺᭺ꐷꠌ", "", {MatchResult(MaybeOfUint(399064), MaybeOfUint(), "扻ꋨ䳘쏡卋鳊鍽扐", "鞞㉪屹팑龚⿞䅰ꡉፀ"), MatchResult(MaybeOfUint(328156), MaybeOfUint(478307), "욜푭", "仚饩�Ꮚ혹霭䞓盅")});
    Test_SzThenUnSz_Check(552448, "�韑튏ࡑ⪽", "�鯃嘐ኽੱ晤", {MatchResult(MaybeOfUint(), MaybeOfUint(), "赾衆", "꡽乕䛆㬾붙䃲"), MatchResult(MaybeOfUint(829491), MaybeOfUint(833655), "萱ᯋ錍჎됥", "⶚ꖿ鈳")});
    Test_SzThenUnSz_Check(165515, "", "츭⅑뻌腂꟠䖓꺈", {MatchResult(MaybeOfUint(409249), MaybeOfUint(496546), "뇵쯷蕹", "ᶬ놲"), MatchResult(MaybeOfUint(), MaybeOfUint(717927), "忧ⷾ챲퉗", "㴗")});
    Test_SzThenUnSz_Check(581686, "熪饍㨋", "ꇑﾷꃦ", {MatchResult(MaybeOfUint(953518), MaybeOfUint(127425), "룞ꖭ㸬♭吞", "")});
    Test_SzThenUnSz_Check(316948, "떁㝬鲤ŗ岞⚀", "ᶮ苿퍎ᇏ伅", {MatchResult(MaybeOfUint(147839), MaybeOfUint(), "�悝ㅍ➵", "즍�狫"), MatchResult(MaybeOfUint(850901), MaybeOfUint(), "㒾ⴙ荡옄샔ዕ", ""), MatchResult(MaybeOfUint(), MaybeOfUint(409650), "븍닑ꪐ脹窕ૐ취ꨟ泒擵", "䲲옮伴ꁧⓚ紝쾲铃켴")});
    Test_SzThenUnSz_Check(698385, "ಖⳡ忆悑", "臹⢺鏿ㆻ", {MatchResult(MaybeOfUint(), MaybeOfUint(48336), "", "鱴䐡낀飻㥾࿕烫偰⋇"), MatchResult(MaybeOfUint(524341), MaybeOfUint(897734), "臿陋㋫", ""), MatchResult(MaybeOfUint(194972), MaybeOfUint(514683), "⺃爛", "義겋㞔鲱˯"), MatchResult(MaybeOfUint(722283), MaybeOfUint(443949), "靅槴觰䮙ド", "�줖쵮ݯ滞觏퇌ⷧ")});
    Test_SzThenUnSz_Check(478841, "ꠋ뽾緙퇄⯛婃", "豀備㵛䓤", {MatchResult(MaybeOfUint(235251), MaybeOfUint(897768), "ഀ옉龞꺌ꭎ", "茠칧瓖ᵽ"), MatchResult(MaybeOfUint(474286), MaybeOfUint(107095), "", "错"), MatchResult(MaybeOfUint(172777), MaybeOfUint(695590), "妓�鎐壤䬦ᕴ�鸬?", "葑氊듳쎴")});
    Test_SzThenUnSz_Check(462891, "", "续盲碚", {MatchResult(MaybeOfUint(583690), MaybeOfUint(995570), "㵌⏭슒鷖ꩰ﵄", "혍뉻瘃⍴䇸ꍫ큑"), MatchResult(MaybeOfUint(432129), MaybeOfUint(284152), "࡞啈냢໚껃꽉೵", "䡬ٍ눘")});
    Test_SzThenUnSz_Check(950657, "䖧骤㛦샚娄奾鴄", "紓뻽龋ᡣ䓌⤳烗", {MatchResult(MaybeOfUint(436718), MaybeOfUint(339274), "േ᥹뛼켄雝繗", "⼏歖맹훿웴⏪"), MatchResult(MaybeOfUint(21513), MaybeOfUint(), "甄☸⨝쭻䏤ᢠ䫖", "⑓킄읋溛"), MatchResult(MaybeOfUint(59102), MaybeOfUint(603237), "＊₅뿴", "ﵝ릣㐌㞃ă拻"), MatchResult(MaybeOfUint(190609), MaybeOfUint(692155), "쉭邀", "닺쿿ꉧ")});
    Test_SzThenUnSz_Check(706611, "㯤㡆햽㸞뮸쉅", "ᨠ礇並並", {MatchResult(MaybeOfUint(396000), MaybeOfUint(), "蹢㏿༳�", "⌻"), MatchResult(MaybeOfUint(), MaybeOfUint(), "�॑覿畻鶩껳慅뎟", "䥖੥룧큎"), MatchResult(MaybeOfUint(425623), MaybeOfUint(869727), "㲡軖", "輐౟휐咒⣅꩹"), MatchResult(MaybeOfUint(293878), MaybeOfUint(297433), "", "")});
    Test_SzThenUnSz_Check(626664, "噧䯪蛯뤔ྉኛ", "", {MatchResult(MaybeOfUint(38387), MaybeOfUint(862689), "宅⎰皎䊭匑⩶妗�Ț釄", "࿥ᖕὪＩᬶѣ"), MatchResult(MaybeOfUint(711048), MaybeOfUint(597302), "⧊", "銣콇ﲇ꽾᭔"), MatchResult(MaybeOfUint(605540), MaybeOfUint(32797), "", "⚷큙퐵儋䳆䦺謑膢֣ꤿ")});
    Test_SzThenUnSz_Check(777534, "卤㵠휄Ｋ咱敏", "뿂⬔紘⅛䉠稯ꛬ焄－", {MatchResult(MaybeOfUint(9696), MaybeOfUint(268955), "ꔻ䪣续蹘", "ồ趌ݸﰙ囦鷎"), MatchResult(MaybeOfUint(), MaybeOfUint(758871), "䔋", "김则➦땲ꛠ")});
    Test_SzThenUnSz_Check(552662, "耼⫰", "腙췍꽄꫻⪏", {MatchResult(MaybeOfUint(880950), MaybeOfUint(361747), "", "䀒䍊빇曁绀溜ⅅ࿿倴"), MatchResult(MaybeOfUint(968174), MaybeOfUint(916384), "㗫", "弮�옚䬟뮳ॾ�")});
    Test_SzThenUnSz_Check(724134, "泘섆ۧꄕῗ੉諡畵", "쾽ಕ값﹊鴥묏⛿", {MatchResult(MaybeOfUint(811494), MaybeOfUint(806546), "ك", ""), MatchResult(MaybeOfUint(), MaybeOfUint(404141), "", "赩ﻔ㉇︢瀝턑"), MatchResult(MaybeOfUint(536175), MaybeOfUint(396617), "惯廤�ꑷ", "ꘁ﬩险檑�Ʋᤆ")});
    Test_SzThenUnSz_Check(850352, "滤ၓ뛬乍拢줊∣폎", "꒭ɞ�斧晛昱썏%", {MatchResult(MaybeOfUint(735896), MaybeOfUint(759709), "欭愛쫿迩Ềᮺኛ�ꑞ", "圵"), MatchResult(MaybeOfUint(207043), MaybeOfUint(), "⿙鿁", "柫缾꫘")});
    Test_SzThenUnSz_Check(264347, "�贲Ἴｃ鉃买㊜ꐶ塶", "䑐㸬", {MatchResult(MaybeOfUint(), MaybeOfUint(876539), "뭶ዘ�㷣䷐ꌂ䈀", "샛煶끮"), MatchResult(MaybeOfUint(222921), MaybeOfUint(313175), "㪒닢䳨⼨늾쏲⦜냍", ""), MatchResult(MaybeOfUint(26718), MaybeOfUint(), "본촄", "遚∻ꟛ⧐")});
    Test_SzThenUnSz_Check(949509, "姩麟ᠺ", "鏅泌囯쐍", {MatchResult(MaybeOfUint(109577), MaybeOfUint(), "旒笟둀魟䡏鉕�", "팤넎춶堢쟔"), MatchResult(MaybeOfUint(), MaybeOfUint(762638), "糢쨶波ፑ", "㶔涠�淿"), MatchResult(MaybeOfUint(883046), MaybeOfUint(126019), "〗춙끬➒ᗽ}൳鸄", "봭썏곑釕쒮狛㩪㨹﹵锗"), MatchResult(MaybeOfUint(973625), MaybeOfUint(342155), "", "沛葄ད�ኈ椉ૻᔔ")});
    Test_SzThenUnSz_Check(284960, "坤痒", "膋ᢒ罯髗ɸ鳠", {MatchResult(MaybeOfUint(658967), MaybeOfUint(985140), "ᩴ糺灮⸽", "ﭪ飂漬꒞浿"), MatchResult(MaybeOfUint(857474), MaybeOfUint(988462), "뢊�", "턣囬낌昒ጔꫨ妿⼖拚"), MatchResult(MaybeOfUint(798386), MaybeOfUint(849105), "⛦뚈組仕", "�")});
    Test_SzThenUnSz_Check(525975, "", "享ኁ", {MatchResult(MaybeOfUint(427135), MaybeOfUint(701413), "祰䧈躺줘웎由짉ꤶ", "쮜먏"), MatchResult(MaybeOfUint(304563), MaybeOfUint(208431), "", ""), MatchResult(MaybeOfUint(286932), MaybeOfUint(668516), "蟣", "蘄㐌䂹꒷ꢫ⣬ﵻ耘ꊻመ"), MatchResult(MaybeOfUint(), MaybeOfUint(893571), "洵뜞", "뀈")});
    Test_SzThenUnSz_Check(346112, "㠷픮똹₀㘞�メ", "漓Zᄥ녷ྕ嚨豯�쉾", {MatchResult(MaybeOfUint(276909), MaybeOfUint(181277), "ώ䔁", "鳈땼饠给㮊䔽샰녂愾"), MatchResult(MaybeOfUint(892843), MaybeOfUint(717017), "䨝䯵ᩗ瓮ໞ", ""), MatchResult(MaybeOfUint(815663), MaybeOfUint(371522), "㯪╴뽝䖥繕햗얪", "龞햣䩝↡밌ᇿ팑ퟞề"), MatchResult(MaybeOfUint(57286), MaybeOfUint(755672), "㡟襅ꆾ먍ꂥ㤠䗻", "�蠕謖䷅")});
    Test_SzThenUnSz_Check(743513, "ݍ枍ꧫ", "彃쟝콧꩖沀躁䢆⥳ﺯ", {MatchResult(MaybeOfUint(155485), MaybeOfUint(608879), "鲒穪朆毢ᜋ", "撱賥뉳㻛骐图秈"), MatchResult(MaybeOfUint(65793), MaybeOfUint(629745), "Ꙫ揮ﹿ쿥⯓禁", "䭖౏꡽◱")});
    Test_SzThenUnSz_Check(655784, "᧽�향醁줪Ф◩�雅", "ᅾ⇈䷫堧Ἶ", {MatchResult(MaybeOfUint(700683), MaybeOfUint(), "⃑狭貾ᯄ犠", "꽸倍"), MatchResult(MaybeOfUint(453732), MaybeOfUint(), "㰩힁谁پ细푣Ꙗꙵ", ""), MatchResult(MaybeOfUint(840347), MaybeOfUint(465804), "饍ผ蚫ㄥ", "謓턵圅䲻遀⫷㬺")});
    Test_SzThenUnSz_Check(851164, "", "즯⨻藛箁ힻ앷绋ꗅ", {MatchResult(MaybeOfUint(464000), MaybeOfUint(977483), "썅", "宱"), MatchResult(MaybeOfUint(914442), MaybeOfUint(768459), "�꺧ﶺ螵", "�端牖콬菑ꝝ평洝"), MatchResult(MaybeOfUint(996429), MaybeOfUint(343231), "㻯䉼⩂㽌顸쌋ꀛ掤줆", "놴Ⲟ밈䘒䃨櫓⮨�")});
    Test_SzThenUnSz_Check(107005, "귆㬈", "ᢣ⪭࠮틇溷", {MatchResult(MaybeOfUint(170614), MaybeOfUint(), "ޠﳻ됷躊", "惐唥躯"), MatchResult(MaybeOfUint(217026), MaybeOfUint(252476), "谩띋ࠚ䨀羴툟棃", "罾䧼蔓ᦺ㷍ଚ쐯␂ꛌ"), MatchResult(MaybeOfUint(471755), MaybeOfUint(649467), "枞䎘Ꝙ❬칟いu⮘꟭", "鰸祚ꪀ")});
    Test_SzThenUnSz_Check(566754, "뉕镶쟶", "眤颒", {MatchResult(MaybeOfUint(659454), MaybeOfUint(86115), "䀰Ⱈ邋䡮凭칄ẓߖ鎱", "෸輠蚸쯖")});
    Test_SzThenUnSz_Check(830748, "龑", "ꌢꀗ䊤ါꊯ黢ꍆ", {MatchResult(MaybeOfUint(646546), MaybeOfUint(264903), "豮", "ᘺ₃ꐫ"), MatchResult(MaybeOfUint(228966), MaybeOfUint(465989), "ꞁ屵펽", "醳麔弐鹺뵖թ⩾䁄掦"), MatchResult(MaybeOfUint(928008), MaybeOfUint(488168), "聙Ჵ浠똟遜⃎", ""), MatchResult(MaybeOfUint(702962), MaybeOfUint(190296), "硓莜௃牺㒢Њ", "꧷陵윗뼞㵊")});
    Test_SzThenUnSz_Check(65777, "쪽閉俭", "﬍", {MatchResult(MaybeOfUint(), MaybeOfUint(577856), "Გ䅬", "伜㙏槉㵭㲗枝")});
    Test_SzThenUnSz_Check(255327, "虪⨈ণ䵹隐ﶚ蕙ぬㄍ", "↰㻜靳镹", {MatchResult(MaybeOfUint(670203), MaybeOfUint(35081), "ꛟ癕屦贌�", ""), MatchResult(MaybeOfUint(402095), MaybeOfUint(), "絃㔕뜛䲶㑵黮㈹ⶤ놿", "ꋜ⹄ـ䋳妎䡞"), MatchResult(MaybeOfUint(623043), MaybeOfUint(183231), "䢗愦쥕凙፦闏⺃ʞ閈", "찖聘䋽ヽ鲋鄶蘄")});
    Test_SzThenUnSz_Check(229017, "뻕쓇渢迍䛀켿窨", "寓㩢", {MatchResult(MaybeOfUint(973724), MaybeOfUint(268912), "싐쥀氹狦홉և䈞Ә", "륈쌬㣓蕏⛊"), MatchResult(MaybeOfUint(506479), MaybeOfUint(964883), "⹺购껎", "쬂匎藟轫⭏◿쳵ꐇ᳗"), MatchResult(MaybeOfUint(514208), MaybeOfUint(700986), "洃쳷裨쓸롴溂ႛ㰁똣", "觟"), MatchResult(MaybeOfUint(594708), MaybeOfUint(917483), "箤̏混뎶", "")});
    Test_SzThenUnSz_Check(205337, "ꂝ", "䇻⦰", {MatchResult(MaybeOfUint(713596), MaybeOfUint(805122), "", ""), MatchResult(MaybeOfUint(125679), MaybeOfUint(450045), "윻俬忾", "焣ڲ訐胟烓⒏﫴ᢁ퍹"), MatchResult(MaybeOfUint(866653), MaybeOfUint(103390), "잷賑", "㙆錁઎꾒⫅俔"), MatchResult(MaybeOfUint(515832), MaybeOfUint(959465), "悙ⲩ", "☿퉁㻟�㈟竹욽")});
    Test_SzThenUnSz_Check(641045, "ᾁ傅뀍욜೹罎", "�害嘶悂ᤈ㲣⾼", {MatchResult(MaybeOfUint(64193), MaybeOfUint(471247), "䡞エ鹨敳攝", "㈜쾹낁먛Ⅹ")});
  }
  
  bool unitTestResults_MatchResults_RowSerialization = runAsync(Tests_RegisterAll_MatchResults_RowSerialization);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_MatchResults_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_MatchResults', UnitTest_ToFromBuffer_MatchResults);
  }
  
  bool Test_ToFromBuffer_Check(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    MatchResults@ tmp = MatchResults(roundPosition, matchLiveId, scoreUnit, results);
    Buffer@ buf = Buffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _MatchResults::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_MatchResults() {
    Test_ToFromBuffer_Check(490366, "", "ᦞ壩괛�㸝赳粢ോ银浕", {MatchResult(MaybeOfUint(305150), MaybeOfUint(509369), "䄺㔼﬌", "䫏"), MatchResult(MaybeOfUint(829354), MaybeOfUint(415918), "鵨쥲", "蛗뙱頸쪚"), MatchResult(MaybeOfUint(729506), MaybeOfUint(), "呋㊠", ""), MatchResult(MaybeOfUint(184950), MaybeOfUint(), "蟿∉㥂哙㍜殮", "얖秅軫䄍缕")});
    Test_ToFromBuffer_Check(255475, "쒶庋탄갅⿂䤗ᅾ", "ꏑ", {MatchResult(MaybeOfUint(), MaybeOfUint(), "겧徕", "�嗇웖峔䞠⧖奡玜"), MatchResult(MaybeOfUint(869217), MaybeOfUint(612549), "⣎녿썳쁇�圍", "蒔銥"), MatchResult(MaybeOfUint(), MaybeOfUint(268958), "", "᫳ᦇ粜"), MatchResult(MaybeOfUint(286481), MaybeOfUint(), "⒯둷盚ⳬ斮ț븶餦ਗ਼玵", "ꏅ㜔庯쎿命")});
    Test_ToFromBuffer_Check(254406, "࡟记Ⴒ늴㐆醁递", "礱䲏Ȥﭢ", {MatchResult(MaybeOfUint(711358), MaybeOfUint(112876), "묙뷘뽵ꀜ䗹叚ឫ焵蚍犺", "ኟ狵愹㮠ꎁ"), MatchResult(MaybeOfUint(27503), MaybeOfUint(246866), "", "ꦏ")});
    Test_ToFromBuffer_Check(525529, "", "峽ᱪⓣ䝚ࠌ臼", {MatchResult(MaybeOfUint(), MaybeOfUint(691552), "讽ń", "솸綯臭ध□-"), MatchResult(MaybeOfUint(921233), MaybeOfUint(873537), "ℤ", "ﱋ抅")});
    Test_ToFromBuffer_Check(299431, "꾷㍀ᠼᨁ꒚憑ȍ♑", "儾㏻劣❜料痁혈䒽ꢢ", {MatchResult(MaybeOfUint(120117), MaybeOfUint(982156), "縬룩䚪怐齵連�ړ", "㙾⛢鵷扑")});
    Test_ToFromBuffer_Check(494885, "醱✨", "䵝洔榌", {MatchResult(MaybeOfUint(682389), MaybeOfUint(506392), "", "Ɉ틛顿"), MatchResult(MaybeOfUint(855579), MaybeOfUint(65929), "큎뒏⫛⪃璔氉恌", "䋇ﮥ㇮")});
    Test_ToFromBuffer_Check(260709, "��짺ၑ珤꼟", "孇᚞粷ּ繞홐", {MatchResult(MaybeOfUint(438882), MaybeOfUint(812762), "⳴컺㢛㬋ޡ", "妾端滄꧜ꕭ"), MatchResult(MaybeOfUint(37823), MaybeOfUint(), "迩", "㻌諯ᗛꅜ⡦ҙ祽"), MatchResult(MaybeOfUint(), MaybeOfUint(), "⮘祘ᠶ灏숆燰ꛪ", "ጃ퓣䒦⪢㈍䞙ꦧ"), MatchResult(MaybeOfUint(260068), MaybeOfUint(484221), "渽뒮㩍哙쮈쟝", "礱ﾡῼ�ﭾ싌无죋轧瑦")});
    Test_ToFromBuffer_Check(938994, "헧ᜰ︺ꮛⳲ贷誸", "뀃궳", {MatchResult(MaybeOfUint(949124), MaybeOfUint(48699), "໩鲔✀ॵ젧", "䨁㧐멬��ᩁ펩碅")});
    Test_ToFromBuffer_Check(171001, "䉙吪⁴⡀", "寱佶�ྰ�㒡ᢢ", {MatchResult(MaybeOfUint(409361), MaybeOfUint(138879), "樇麉쩎ꍌ섴날ꧾ截", "ఁ媶홪麉醙�葊�"), MatchResult(MaybeOfUint(248972), MaybeOfUint(938354), "�㗙䇬", "︀ᅞ陵")});
    Test_ToFromBuffer_Check(699561, "⺵䨝⤖❅", "뫛쫴곳焋ᙩ왟ɳ늂豿", {MatchResult(MaybeOfUint(), MaybeOfUint(560058), "䜎㊟焱쑔ᣛﻃ瞽�쀮ꢸ", "냙"), MatchResult(MaybeOfUint(804771), MaybeOfUint(), "孂왱˂੭", "㛟넸爧렓猪ꄴﻐ䙪ꂟ")});
    Test_ToFromBuffer_Check(385218, "ﭒ", "䐜�䖩仍퓕", {MatchResult(MaybeOfUint(334771), MaybeOfUint(359389), "⺢喳爕ᡟﭖ", "녛ﮝ။"), MatchResult(MaybeOfUint(987116), MaybeOfUint(231849), "逮৖饳˛㫕Ï篒ꝱ쭁ｹ", "붩症뉾敬钎荫晇"), MatchResult(MaybeOfUint(991105), MaybeOfUint(224974), "겨䨎࿇쐯罔㕮", "난㼄Ɱ"), MatchResult(MaybeOfUint(951646), MaybeOfUint(533765), "ⰾ肧뛅皤ꘑ閾਽ލ⓮", "")});
    Test_ToFromBuffer_Check(81862, "ƶ뽨懾᡺䝜睯뽡", "︠封쥞渐ﰖ鿶쐌ꝕ", {MatchResult(MaybeOfUint(349905), MaybeOfUint(580200), "䷺ᢂᎰ", "ዸ볗ح粙賛ꚩ")});
    Test_ToFromBuffer_Check(615343, "쀐㴔颏", "韯ꝺ茜紜", {MatchResult(MaybeOfUint(177518), MaybeOfUint(), "�뤏꽓鬽睔", ""), MatchResult(MaybeOfUint(839857), MaybeOfUint(602585), "츰쉝⚛", "醗ꪊၳ"), MatchResult(MaybeOfUint(301561), MaybeOfUint(682979), "", "ꆥس")});
    Test_ToFromBuffer_Check(973141, "큣䫈駸翖롩浰", "ⰴ홼䚟ͩ鯴뱠", {MatchResult(MaybeOfUint(909425), MaybeOfUint(168367), "镝䎵꿻", "摃㧾"), MatchResult(MaybeOfUint(243645), MaybeOfUint(470257), "掹᭚", "칺�ࣞ噖͍뤃蜥")});
    Test_ToFromBuffer_Check(680300, "蒗課꽐༪벃ﰷ缼値᯺", "鋽੊鼎汴ᕂ穓᫅鯚㾴䈪", {MatchResult(MaybeOfUint(867334), MaybeOfUint(691820), "", "倡⭘光雡푘ꍳ蟭")});
    Test_ToFromBuffer_Check(165931, "ᜲꗃ筐뇺ਪ", "䛬᳝ٺᗮ�翊焤ᱺ", {MatchResult(MaybeOfUint(157680), MaybeOfUint(974668), "㹽ࠒ芜", "伉쎍ꂻ뜆榝ࠂ㡽")});
    Test_ToFromBuffer_Check(816568, "桉�麇㶼믔な", "䫥븊㢘焠쏩熽筝촣ܶ풭", {MatchResult(MaybeOfUint(), MaybeOfUint(469100), "❖꺋≔ぬ梐翂䯠傒", "ꊠ兟ľ制㚸旱蚛"), MatchResult(MaybeOfUint(15574), MaybeOfUint(331373), "ᥴ䪔먬偩㤐", "Ꭾ앩"), MatchResult(MaybeOfUint(102543), MaybeOfUint(620452), "㽺阣죸鉓렧", "澻誣ల"), MatchResult(MaybeOfUint(664448), MaybeOfUint(905653), "쵑Ѩ䊽괟㩷盽졐", "")});
    Test_ToFromBuffer_Check(238770, "篾曕྄췴졼쓩ｽଷ쌒", "左ᶢ繑⥦眣", {MatchResult(MaybeOfUint(474825), MaybeOfUint(769883), "᷽ꂶ锢꼂鞘븫꽨ൂ甝弑", "ሤ㸊䰧檘")});
    Test_ToFromBuffer_Check(338141, "밝㓙弒䪂焮ໞ", "萗윗", {MatchResult(MaybeOfUint(45130), MaybeOfUint(60936), "燦编풜死킗叟잻흵樖", "ｗၸⅶ鈆돰᥹Ꮽ"), MatchResult(MaybeOfUint(961000), MaybeOfUint(), "⾝婒れሳ�", "㠾엞"), MatchResult(MaybeOfUint(262073), MaybeOfUint(578018), "㳵唵Ἐ痪", "咱↍ꇒ園喒躬ᚑ鈉")});
    Test_ToFromBuffer_Check(354557, "㛲", "", {MatchResult(MaybeOfUint(482056), MaybeOfUint(658856), "Ꟙﱤ鐣넷⋜쬱岌嘵쑲厴", "㞝ᐶ吅펄델鍱骨"), MatchResult(MaybeOfUint(192755), MaybeOfUint(942279), "", "芗沆ﻈ㳖గ젻稭"), MatchResult(MaybeOfUint(774157), MaybeOfUint(528211), "�আ䊫֨먯", "☉筛춨쥹")});
    Test_ToFromBuffer_Check(372602, "㯥㌋鰵", "", {MatchResult(MaybeOfUint(991738), MaybeOfUint(617813), "⬧㇫㭩絹葅㥲쿱댧", "錉㖲怹毩棱"), MatchResult(MaybeOfUint(429421), MaybeOfUint(982759), "ຽ", "ⶂ")});
    Test_ToFromBuffer_Check(940109, "料긆곙梔�㴺빱", "궪ⴙꨶ䑀鸱듾纖靉", {MatchResult(MaybeOfUint(350726), MaybeOfUint(687126), "�ⶆ쵫", "笺Ԗ擔觻ᚙ")});
    Test_ToFromBuffer_Check(614389, "溋⽼", "ኚ哱า畸ᘿ", {MatchResult(MaybeOfUint(209246), MaybeOfUint(926753), "₠", "㵶㮛䔂塻ネ턞㛢攽"), MatchResult(MaybeOfUint(), MaybeOfUint(759872), "갸", "튷�误ಷ峇⌊⇓ꏽ"), MatchResult(MaybeOfUint(), MaybeOfUint(106850), "뛭︑畫见緢钄⯯", "⽴ỹ듛"), MatchResult(MaybeOfUint(42429), MaybeOfUint(869884), "ℋ轴", "좟")});
    Test_ToFromBuffer_Check(686876, "겸檴", "䆷抏ꚋ˺䄿", {MatchResult(MaybeOfUint(13038), MaybeOfUint(808683), "넢ể椉熞碖斥", "册삿렔锼")});
    Test_ToFromBuffer_Check(484948, "搩眊퇉ᥠ᜜䪹", "ଯ摔昛펬ﵩ夜땘᠊板", {MatchResult(MaybeOfUint(455998), MaybeOfUint(411324), "륌췧⨏Ӿᬲ", "䦝ꔐ")});
    Test_ToFromBuffer_Check(687930, "⢒ⶎ糰ﻙ䮋", "", {MatchResult(MaybeOfUint(899245), MaybeOfUint(16527), "싓ꓕᘴ렵⚲৙", ""), MatchResult(MaybeOfUint(901788), MaybeOfUint(817996), "八㷕礛微ㆦ됍볓�", "猳퍒槢蚕↕걀钣좌"), MatchResult(MaybeOfUint(318580), MaybeOfUint(187399), "㎱䮠匱఻䭁ⓝ", "ִಚ㍥啷"), MatchResult(MaybeOfUint(257426), MaybeOfUint(457948), "쬪Ꞹڟ튆", "≤㬓땆튾ꓩ")});
    Test_ToFromBuffer_Check(415622, "㬽쩙芉", "夎୨컡ᮕ셄婅䟙슽ȱ䞮", {MatchResult(MaybeOfUint(392457), MaybeOfUint(407312), "륌", "")});
    Test_ToFromBuffer_Check(397734, "멀푓罂궏챤닎", "謌", {});
    Test_ToFromBuffer_Check(146837, "ꢥ", "펭齛䳢", {MatchResult(MaybeOfUint(951013), MaybeOfUint(765969), "댻秛隢⤐束Ⳑ엢㉯블", "䞊뵇妫嘩ᰀꬌ䃉ⷒ뀈㞴"), MatchResult(MaybeOfUint(157026), MaybeOfUint(730688), "獠잧", "羑")});
    Test_ToFromBuffer_Check(540885, "鮟", "訑�▁恦띕", {MatchResult(MaybeOfUint(242983), MaybeOfUint(672263), "Ɔ�ᕉ", "蕞暞")});
    Test_ToFromBuffer_Check(242683, "㙊欀댴兢掮ꡧգᒍ", "ꥆᠨ", {MatchResult(MaybeOfUint(720249), MaybeOfUint(214148), "祦䛷", "큀굞ӝꠕ怰護顭"), MatchResult(MaybeOfUint(), MaybeOfUint(999663), "訐셺⊔崎쏑", ""), MatchResult(MaybeOfUint(167143), MaybeOfUint(558699), "敞윳礘䨳덗轼", "㕌⮖ᵷ瀪⣝᫟줙拇")});
    Test_ToFromBuffer_Check(978110, "갭历绝䆁", "ꊘ", {MatchResult(MaybeOfUint(), MaybeOfUint(582690), "轾凤쿹䲡ꔵ갵䭤", "턁铢őꎦ띜˅ꠙ昘㰻ᓈ"), MatchResult(MaybeOfUint(90531), MaybeOfUint(333033), "ﲳ꽼揂", "㓉ᾄ苨歎♼哝묗甝엥")});
    Test_ToFromBuffer_Check(561146, "峥읆畃糄됿퇋祑ﴌ阜잟", "ﰏ⥌㤘懣ﷅ紞䏸䠩", {MatchResult(MaybeOfUint(416656), MaybeOfUint(693362), "", "ၧ"), MatchResult(MaybeOfUint(501549), MaybeOfUint(733076), "Ɠ蜿埻", "脜䷪棿♥ፒ旜鈱䔑")});
    Test_ToFromBuffer_Check(916838, "ἐ￲", "폣阱迕", {MatchResult(MaybeOfUint(824988), MaybeOfUint(599411), "䴎ମ", "驆ｪ纅⨕ࠅﶩ⹜⁌㚷"), MatchResult(MaybeOfUint(945321), MaybeOfUint(198175), "", "鐭賡韦ꁿ⤥䱋畷뷼"), MatchResult(MaybeOfUint(240146), MaybeOfUint(226171), "꥽氻照飩艸䇄⹼�", "廰ቝ"), MatchResult(MaybeOfUint(671130), MaybeOfUint(549073), "ᘌု瓌밶", "㏞☉ꇧò턽綫")});
    Test_ToFromBuffer_Check(387331, "靁ꂄ", "榁", {MatchResult(MaybeOfUint(790490), MaybeOfUint(), "㡦츦佷䏪龜꽯ㅨ뱫ᛂ", "繻佤桵镎ꣀ⃜⻓ʅꟶ"), MatchResult(MaybeOfUint(469428), MaybeOfUint(85579), "䁖윂", "ⓗ候滰碽᷒")});
    Test_ToFromBuffer_Check(533009, "혳⎅귚", "", {MatchResult(MaybeOfUint(442329), MaybeOfUint(669419), "퇕�㐼㹥獐", "像比鈼笴襒枙斨"), MatchResult(MaybeOfUint(193165), MaybeOfUint(588910), "꺒瓽ص㨘鳶", "⢒")});
    Test_ToFromBuffer_Check(708613, "埫㜚왹䔪堮魦窢೘꼓", "", {MatchResult(MaybeOfUint(25444), MaybeOfUint(97732), "", "㽱ﱁ烔矈맫ᄱ鏌㧏Ꝡ焏")});
    Test_ToFromBuffer_Check(967674, "鶟�", "丷剨", {MatchResult(MaybeOfUint(390119), MaybeOfUint(), "灎箊獊", "∲㓝�彑墻礜㈜㵻턘")});
    Test_ToFromBuffer_Check(255196, "᜻᠃䪤캗筱䢭浛", "", {MatchResult(MaybeOfUint(978219), MaybeOfUint(627271), "沆ẍ⮘嗿痰쏓踌⑁", "꽂ὁ둕撒")});
    Test_ToFromBuffer_Check(325060, "뿓僐⁍≪힕᮫墆桝憉垤", "穟˩䌖莜⹚", {MatchResult(MaybeOfUint(586870), MaybeOfUint(18765), "㱈䒫ﲡ", ""), MatchResult(MaybeOfUint(758697), MaybeOfUint(62232), "槢홑ҕ琐孪", "諸ǯᮐ")});
    Test_ToFromBuffer_Check(226966, "۸⾎Ƴ", "ኹ䌎곿꼋튴앇㝉ꎱ泡", {MatchResult(MaybeOfUint(52563), MaybeOfUint(739682), "㾪箝㈿顱", "ୡ�붿镤굎")});
    Test_ToFromBuffer_Check(411218, "䪫", "굶踝靄ꀏ�뤳埕悆嗪ⳍ", {MatchResult(MaybeOfUint(149436), MaybeOfUint(632702), "⻩�瘷앁ज़", "覌ݜ뮋莟㫮퉍䰽鳙柰")});
  }
  
  bool unitTestResults_MatchResults_ToFromBuffer = runAsync(Tests_RegisterAll_MatchResults_ToFromBuffer);
}
#endif