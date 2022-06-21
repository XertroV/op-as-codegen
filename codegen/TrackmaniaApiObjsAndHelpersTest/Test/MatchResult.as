#if UNIT_TEST
namespace Test_MatchResult {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_MatchResult_CommonTesting() {
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
  
  bool unitTestResults_MatchResult_CommonTesting = runAsync(Tests_RegisterAll_MatchResult_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_MatchResult_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_MatchResult', UnitTest_ToJsonFromJson_MatchResult);
  }
  
  bool Test_ToJsonFromJson_Check(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant, const string &in zone) {
    MatchResult@ tmp = MatchResult(rank, score, participant, zone);
    assert(tmp == MatchResult(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_MatchResult() {
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(), "ꠂ쮰", "ᮔ﵇獣");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(126408), "罐", "");
    Test_ToJsonFromJson_Check(MaybeOfUint(286985), MaybeOfUint(191439), "ᱶ", "䚏꼸䃧쁐");
    Test_ToJsonFromJson_Check(MaybeOfUint(884255), MaybeOfUint(116343), "�", "汯粌鉅");
    Test_ToJsonFromJson_Check(MaybeOfUint(695394), MaybeOfUint(), "䢕颒饣ퟶ䳟框雱", "救솳棈");
    Test_ToJsonFromJson_Check(MaybeOfUint(681748), MaybeOfUint(331925), "ᲊ̇॑", "堉");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(606311), "摂ꖶ鍁紙", "遐鬱峝뻴");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(414406), "z懇�客㒞", "윷窋");
    Test_ToJsonFromJson_Check(MaybeOfUint(391029), MaybeOfUint(67966), "䞚㌴⦱扬", "旰蓡柿ஷ");
    Test_ToJsonFromJson_Check(MaybeOfUint(914935), MaybeOfUint(), "彺য়", "▏᯿쨄");
    Test_ToJsonFromJson_Check(MaybeOfUint(228090), MaybeOfUint(8357), "䦋쁗缧ⱊﱻ狀ꆟ", "");
    Test_ToJsonFromJson_Check(MaybeOfUint(77932), MaybeOfUint(291599), "ͽ텫", "唃徭ྈ");
    Test_ToJsonFromJson_Check(MaybeOfUint(507044), MaybeOfUint(562436), "엣ᩁ㟅ഽᒽ罆鹌ﲒ咧놪", "⻖蚇ங⨗萃쎉뮏");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(), "坯켫ꗥ쟭銗", "懜翊신꨻በ↥鿊");
    Test_ToJsonFromJson_Check(MaybeOfUint(361950), MaybeOfUint(555417), "躀퓹ꔴ㳇୭鹥灦㣋충왦", "ꧾ큽ⷾ뮁d更든Η");
    Test_ToJsonFromJson_Check(MaybeOfUint(239551), MaybeOfUint(442122), "鬋", "ᣙ욗");
    Test_ToJsonFromJson_Check(MaybeOfUint(108410), MaybeOfUint(61424), "", "뗃㷦⏓箝썷");
    Test_ToJsonFromJson_Check(MaybeOfUint(6572), MaybeOfUint(609511), "⼸៯ꭍڑ쀈ⵗ㏬蠑", "벛ﳾ啃둸");
    Test_ToJsonFromJson_Check(MaybeOfUint(342727), MaybeOfUint(625858), "饤浏", "䭭澀⽹ᱶ爅螝⬣홭ᢻ");
    Test_ToJsonFromJson_Check(MaybeOfUint(986174), MaybeOfUint(489123), "䡼淣럸튦蘥", "Ⱬꖗ႘ᖦﭭ见");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(468463), "쑋쎧ᨘ", "裳엽뷗뢑㖄瑁캳");
    Test_ToJsonFromJson_Check(MaybeOfUint(3110), MaybeOfUint(227340), "", "쐤얪㵁㢝蔹ｽ≨⢮舊");
    Test_ToJsonFromJson_Check(MaybeOfUint(188934), MaybeOfUint(235494), "욉쒜≁隵", "☖甩");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(496393), "轓᧦㗭", "ᬁ籕ￌ龎쬩ꨝ");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(235631), "豣閑㏲ᔲ逥좣㉒", "");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(811960), "꺒Ｅ澮", "馣谱蘄딙授↳웡꫎");
    Test_ToJsonFromJson_Check(MaybeOfUint(604406), MaybeOfUint(743344), "鈧䴨餶갯", "ᯕᔺ痯겶");
    Test_ToJsonFromJson_Check(MaybeOfUint(605906), MaybeOfUint(285613), "漻拹ⓨ", "恮뺪");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(526475), "䜋歹☰�ꢶ嗲聅䄳", "䐪䈞");
    Test_ToJsonFromJson_Check(MaybeOfUint(456094), MaybeOfUint(771523), "몖괩", "来");
    Test_ToJsonFromJson_Check(MaybeOfUint(615200), MaybeOfUint(256248), "ཎ؏쀯㖩ꅽ딚", "絠촊枤");
    Test_ToJsonFromJson_Check(MaybeOfUint(775867), MaybeOfUint(674608), "穏뫤࡙攴쑋㵗髍澇", "뾋뿰秮");
    Test_ToJsonFromJson_Check(MaybeOfUint(197441), MaybeOfUint(958172), "Ԍ", "䗺");
    Test_ToJsonFromJson_Check(MaybeOfUint(733371), MaybeOfUint(817303), "ᴼ馿ꞑ漆霋枒৹聸ᒢ", "咷㟞曘靳ԝ");
    Test_ToJsonFromJson_Check(MaybeOfUint(120250), MaybeOfUint(669151), "밥�틭姻韷ሸ", "꺗⯒ꊑ䐁ߠ");
    Test_ToJsonFromJson_Check(MaybeOfUint(), MaybeOfUint(470409), "㙵覆ೕ멨靮垆规", "㚨줫");
    Test_ToJsonFromJson_Check(MaybeOfUint(522388), MaybeOfUint(195672), "", "轔렫炙띤䮔췬鼋탐");
    Test_ToJsonFromJson_Check(MaybeOfUint(382427), MaybeOfUint(448613), "⍗ꦘ疁", "ᖀ㨎乕紇答㺳萵ꊕᑑ");
    Test_ToJsonFromJson_Check(MaybeOfUint(947821), MaybeOfUint(935419), "剈授䎫쉑ᢰ靡", "맆晝劬");
    Test_ToJsonFromJson_Check(MaybeOfUint(744885), MaybeOfUint(), "᥌⇝䱓䎸帍곔", "釄");
    Test_ToJsonFromJson_Check(MaybeOfUint(123526), MaybeOfUint(283554), "䥮䒸", "秇⋽吢ↈ種祶");
    Test_ToJsonFromJson_Check(MaybeOfUint(10972), MaybeOfUint(992645), "ꨁ딣⍣�浥ԈǶ봒❖", "ꇈ퉿ማ鰜㞡吂");
  }
  
  bool unitTestResults_MatchResult_ToFromJSONObject = runAsync(Tests_RegisterAll_MatchResult_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_MatchResult_Getters() {
    RegisterUnitTest('UnitTest_MatchResult_Getters', UnitTest_MatchResult_Getters);
  }
  
  bool Test_CheckProps_MatchResult(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant, const string &in zone) {
    MatchResult@ tmp = MatchResult(rank, score, participant, zone);
    assert(rank == tmp.rank, 'field rank');
    assert(score == tmp.score, 'field score');
    assert(participant == tmp.participant, 'field participant with value `' + participant + '`');
    assert(zone == tmp.zone, 'field zone with value `' + zone + '`');
    return true;
  }
  
  void UnitTest_MatchResult_Getters() {
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(), "㎜৏렊빬�￿躮䮠馩�", "⢢羋");
    Test_CheckProps_MatchResult(MaybeOfUint(450822), MaybeOfUint(886792), "韋", "�싺콠旱疍鰉橿");
    Test_CheckProps_MatchResult(MaybeOfUint(87722), MaybeOfUint(490383), "覧﶑䙢꺰ꦞᩘ鳔", "枵ⴾ㬪●ꜛ귦翮漽똮");
    Test_CheckProps_MatchResult(MaybeOfUint(290772), MaybeOfUint(622511), "윰蘆콬⨸۫芁≲", "虝䰒ஷ握�");
    Test_CheckProps_MatchResult(MaybeOfUint(686837), MaybeOfUint(149817), "那", "젮훇懓奲쮄⸔옯듡");
    Test_CheckProps_MatchResult(MaybeOfUint(868476), MaybeOfUint(224303), "徲㼏嘿", "ᓭ褾");
    Test_CheckProps_MatchResult(MaybeOfUint(429159), MaybeOfUint(433840), "ᇡ", "�뽥뤎");
    Test_CheckProps_MatchResult(MaybeOfUint(672021), MaybeOfUint(), "儞祹㚏풓鏓윃", "揘");
    Test_CheckProps_MatchResult(MaybeOfUint(583000), MaybeOfUint(984066), "㔭묹", "缲䁏뤥蹪鈤");
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(791515), "ꦽ㎀꿈�", "");
    Test_CheckProps_MatchResult(MaybeOfUint(585173), MaybeOfUint(), "撏랭즫ᇁ", "�׭駭겯ƴ");
    Test_CheckProps_MatchResult(MaybeOfUint(23362), MaybeOfUint(361241), "䵙", "阚⦈郶炼");
    Test_CheckProps_MatchResult(MaybeOfUint(32083), MaybeOfUint(702564), "ₜ齬聎雄攩澴䶩弊", "菌㶑");
    Test_CheckProps_MatchResult(MaybeOfUint(785867), MaybeOfUint(785817), "ଚ㩕ၪ", "");
    Test_CheckProps_MatchResult(MaybeOfUint(779184), MaybeOfUint(853065), "�ꒉ㳀䈾뙱䕂륦홰", "鐷痚ꄻ");
    Test_CheckProps_MatchResult(MaybeOfUint(397794), MaybeOfUint(), "䉶杻�죝ᝫ᥾鼾㮦窘ᤲ", "ୣ筃痒胊");
    Test_CheckProps_MatchResult(MaybeOfUint(591760), MaybeOfUint(395859), "秉ⵑ᠟Ꮍ⁭豹理癙⤊", "＠߇₹");
    Test_CheckProps_MatchResult(MaybeOfUint(401776), MaybeOfUint(982620), "㆒", "℃벷쨭욢璞�ᐡ赪읝");
    Test_CheckProps_MatchResult(MaybeOfUint(735119), MaybeOfUint(27558), "⑧䩦뽼퍑ꗸ鶧", "ᓮₙ묇森ⶍභ");
    Test_CheckProps_MatchResult(MaybeOfUint(363094), MaybeOfUint(850420), "㦟茍沕К߄", "ソ⿈鄠");
    Test_CheckProps_MatchResult(MaybeOfUint(742358), MaybeOfUint(402801), "Ι龲", "");
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(), "ￔ쥲兆崤颦", "쐭ғ㒴퟽ᗦ㴟봨");
    Test_CheckProps_MatchResult(MaybeOfUint(653215), MaybeOfUint(), "꣰䃹눭쯺튯㱷ဥ", "");
    Test_CheckProps_MatchResult(MaybeOfUint(402613), MaybeOfUint(133172), "⁴", "嶹堠鷦耢");
    Test_CheckProps_MatchResult(MaybeOfUint(566942), MaybeOfUint(793887), "", "鉚枛칸ힼ㼓럮");
    Test_CheckProps_MatchResult(MaybeOfUint(877881), MaybeOfUint(973039), "뼊谥缃ಟ킐", "็۟弜쌘㙛핺﫽㑪");
    Test_CheckProps_MatchResult(MaybeOfUint(229639), MaybeOfUint(913764), "Ҹꃈ䮣ᬬ컵嶐", "㻗﬽팊�슍郫홟㕤");
    Test_CheckProps_MatchResult(MaybeOfUint(698153), MaybeOfUint(), "듍꩐瘁", "狥Ü매剟䝛튟뿎ວ");
    Test_CheckProps_MatchResult(MaybeOfUint(924696), MaybeOfUint(521868), "먔᫣읈聹匂", "㧯䦴귏毥᥃嗯䵌‱");
    Test_CheckProps_MatchResult(MaybeOfUint(272553), MaybeOfUint(480081), "㈾នﯸ滣轁竁怒ৈ", "酁଱");
    Test_CheckProps_MatchResult(MaybeOfUint(733567), MaybeOfUint(143921), "淲ﺆ", "");
    Test_CheckProps_MatchResult(MaybeOfUint(753018), MaybeOfUint(357901), "", "妐檣袿칉谜訷໰胖");
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(180139), "䬹칭烈罽췜", "䨣뉐㕋퇪㷗");
    Test_CheckProps_MatchResult(MaybeOfUint(917384), MaybeOfUint(323729), "쯰㗟豺", "ꁄ枙꥞琷᯵テ䪮䅎");
    Test_CheckProps_MatchResult(MaybeOfUint(457180), MaybeOfUint(), "瀓", "复䚃ᖓ嵐");
    Test_CheckProps_MatchResult(MaybeOfUint(677985), MaybeOfUint(965014), "㼘ⵏ骗", "⋵隸꫍痈");
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(666968), "绽ᅧ猣�嚖", "v鬕");
    Test_CheckProps_MatchResult(MaybeOfUint(755458), MaybeOfUint(534398), "ꏛ", "犌郉鷪䈥⏀淓둬ਈ");
    Test_CheckProps_MatchResult(MaybeOfUint(508154), MaybeOfUint(684210), "䃿fྔ㐔ᡄ鷂", "섎");
    Test_CheckProps_MatchResult(MaybeOfUint(794190), MaybeOfUint(847881), "䮖揉筢㲸肅", "");
    Test_CheckProps_MatchResult(MaybeOfUint(557301), MaybeOfUint(491704), "Ꙭꇰ⦥๤즿ㄨ穂Hᡶ⛥", "俍埯퐥ঠ἗넾");
    Test_CheckProps_MatchResult(MaybeOfUint(), MaybeOfUint(300778), "婓菨뻟௎", "诨⥇Ш");
  }
  
  bool unitTestResults_MatchResult_Getters = runAsync(Tests_RegisterAll_MatchResult_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_MatchResult_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_MatchResult', UnitTest_OpEqSimple_MatchResult);
  }
  
  MatchResult@ lastChecked = null;
  
  bool OpEqSimple_Check(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant, const string &in zone) {
    MatchResult@ o1 = MatchResult(rank, score, participant, zone);
    MatchResult@ o2 = MatchResult(rank, score, participant, zone);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_MatchResult() {
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(393455), "ﷰ눵뭩㵷衟춗䵩", "쭶퍉첯㚥涬");
    OpEqSimple_Check(MaybeOfUint(26686), MaybeOfUint(535487), "਀ꩣ釪�麑遬徨탏", "壝玃勑뤋펍캒ᨶ");
    OpEqSimple_Check(MaybeOfUint(511262), MaybeOfUint(489079), "", "킅�叴뢦");
    OpEqSimple_Check(MaybeOfUint(601448), MaybeOfUint(591080), "璊诛퇟鯚핦壉", "獔");
    OpEqSimple_Check(MaybeOfUint(479941), MaybeOfUint(112534), "垛峵כֿ鐄ℛݙᚬ", "︐좙");
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(749954), "ᬤ쿊", "ﶇ䚱윲冥㶶밑幖");
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(26440), "䫆ើ鹆ʊ冿�Ⓢꖠ⋳", "뭀ꃲ썵㞫");
    OpEqSimple_Check(MaybeOfUint(358019), MaybeOfUint(288195), "", "는ꒋ㑶");
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(690858), "", "蹎쟳");
    OpEqSimple_Check(MaybeOfUint(241597), MaybeOfUint(541699), "", "");
    OpEqSimple_Check(MaybeOfUint(12172), MaybeOfUint(145172), "", "똮ꨕ");
    OpEqSimple_Check(MaybeOfUint(999207), MaybeOfUint(222332), "娣", "汀ᆣ");
    OpEqSimple_Check(MaybeOfUint(391329), MaybeOfUint(840953), "", "쏥䁏ਮ虴");
    OpEqSimple_Check(MaybeOfUint(5573), MaybeOfUint(), "䀿虿砍", "픽鳐ꈉ");
    OpEqSimple_Check(MaybeOfUint(885000), MaybeOfUint(909595), "쬟칁껁", "㽤᪮壐辡�㏊뻹媋痰碩");
    OpEqSimple_Check(MaybeOfUint(785418), MaybeOfUint(766369), "⃠嚅", "栥鏡");
    OpEqSimple_Check(MaybeOfUint(172033), MaybeOfUint(303381), "ꅯ껳ሌ", "耽裮ዖ锲釹ឰ墐");
    OpEqSimple_Check(MaybeOfUint(884234), MaybeOfUint(457344), "ᨣ㤬꾷ټ໿", "汢ꏠ⮶䋧館胄ા즣傪");
    OpEqSimple_Check(MaybeOfUint(880649), MaybeOfUint(997818), "", "�ﭝ豲氹φ䚧");
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(780762), "�둕껅汆", "玹桗喐橀");
    OpEqSimple_Check(MaybeOfUint(521754), MaybeOfUint(332229), "ᔃ㣛צ츷⩮�ώ꒏퓂", "");
    OpEqSimple_Check(MaybeOfUint(819938), MaybeOfUint(758489), "ⱬ褑", "");
    OpEqSimple_Check(MaybeOfUint(32483), MaybeOfUint(457029), "묯릕⛲㕤�⧙", "瓪ﲥ疬᳢䩶㩒홌ꃢ｡");
    OpEqSimple_Check(MaybeOfUint(539939), MaybeOfUint(909840), "콨�赭墨큽咪઼", "蛕䥓佴ꛬ苵䎥�쭲");
    OpEqSimple_Check(MaybeOfUint(929569), MaybeOfUint(759681), "粄⅝挝㠊", "共䳶넊ᙓࡀ컒");
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(475985), "뱜悶ꂋ鰲", "");
    OpEqSimple_Check(MaybeOfUint(481138), MaybeOfUint(), "䚨篱鬻피䌱踀", "챀");
    OpEqSimple_Check(MaybeOfUint(575611), MaybeOfUint(141600), "⟹驵盲ⓟ娣ዯ", "賥硬⭷혀ⴿ㓶ࣛﬣ");
    OpEqSimple_Check(MaybeOfUint(129575), MaybeOfUint(690603), "螥㗓", "ᚭࣳ�﨑ğ");
    OpEqSimple_Check(MaybeOfUint(800263), MaybeOfUint(417084), "띟璦Ⴗ婑遚㌌⻄㕹", "䨾㶜☭ෳ");
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(284057), "", "庈");
    OpEqSimple_Check(MaybeOfUint(378032), MaybeOfUint(296593), "멖�", "녮ง");
    OpEqSimple_Check(MaybeOfUint(410731), MaybeOfUint(68111), "瞐奺", "㎭啷⨍揉");
    OpEqSimple_Check(MaybeOfUint(171082), MaybeOfUint(395321), "㝳䵉貟↟ڹ錠쟓쎭뗧", "罚");
    OpEqSimple_Check(MaybeOfUint(69729), MaybeOfUint(543714), "냖럢쩪媭", "鼗䘚秱ᗱ閯ﺸ娂ᑠ");
    OpEqSimple_Check(MaybeOfUint(291997), MaybeOfUint(463120), "磃헮躁潿鬐", "̉韺輨浉ㆠ㌔Ú");
    OpEqSimple_Check(MaybeOfUint(888785), MaybeOfUint(574276), "", "ꊈ껿譍扆䡖図罛⢲Ȃ");
    OpEqSimple_Check(MaybeOfUint(), MaybeOfUint(607334), "ﻯ機", "龕ຽҷ䋰ꭔ䧂脑");
    OpEqSimple_Check(MaybeOfUint(213556), MaybeOfUint(958667), "숬勯ﵜ쳮쬤", "䷗넱�㙫姦䟧ఊꪫ");
    OpEqSimple_Check(MaybeOfUint(265296), MaybeOfUint(703199), "奋豮ⴈ֑", "일ٸ顚辑죹⪱濱놿");
    OpEqSimple_Check(MaybeOfUint(640546), MaybeOfUint(796197), "膞坫窀훱Ⅺ", "씅煍尪읒쪭剈");
    OpEqSimple_Check(MaybeOfUint(665073), MaybeOfUint(), "੿퉛꿪⹳ꈰ뗵丷ө㩣", "艌");
  }
  
  bool unitTestResults_MatchResult_OpEq = runAsync(Tests_RegisterAll_MatchResult_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_MatchResult_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_MatchResult', UnitTest_SzThenUnSz_MatchResult);
  }
  
  bool Test_SzThenUnSz_Check(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant, const string &in zone) {
    MatchResult@ tmp = MatchResult(rank, score, participant, zone);
    assert(tmp == _MatchResult::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_MatchResult() {
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(), "ﳙ㻲翾鵜靀㍒㋪", "텆编�朹鎟");
    Test_SzThenUnSz_Check(MaybeOfUint(419070), MaybeOfUint(325863), "藴킅Ề쯣欚엻렒哾๺⾖", "밄ꊦ⊼⿕氎꼻");
    Test_SzThenUnSz_Check(MaybeOfUint(415169), MaybeOfUint(179363), "汛瀹ፎﬡ賄�匼", "䮞丵�￝");
    Test_SzThenUnSz_Check(MaybeOfUint(555317), MaybeOfUint(263354), "푲෗蔃䓥㻥", "䟃넲䗵蹟牪");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(322150), "潔箯㉽", "ꅇ᭧봅≹䎢");
    Test_SzThenUnSz_Check(MaybeOfUint(18764), MaybeOfUint(394778), "㠵ᢐၛⶍ쎦㋥霈", "좳");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(), "", "髣蘟먝瞄⧛鉼竲");
    Test_SzThenUnSz_Check(MaybeOfUint(274766), MaybeOfUint(966343), "踆⌾ꎳ㏰鉓켯τ㪔ﻊ", "Ὼ㐚ꂖ摇䞰鄕ꈽ洞⤦");
    Test_SzThenUnSz_Check(MaybeOfUint(255911), MaybeOfUint(964248), "繤牉᳔䬳⑇勿", "퍻䳥最徐㭾멭Პ");
    Test_SzThenUnSz_Check(MaybeOfUint(687772), MaybeOfUint(), "奞ͩ줞䟥ፕ⎃", "ᚸᄺ膲㑅诜돚");
    Test_SzThenUnSz_Check(MaybeOfUint(37562), MaybeOfUint(761537), "", "剼᪲");
    Test_SzThenUnSz_Check(MaybeOfUint(49662), MaybeOfUint(485401), "", "鐮軅㧦胷");
    Test_SzThenUnSz_Check(MaybeOfUint(227617), MaybeOfUint(129142), "ㅡ螘笣䨯䄸", "璫⃔煡욣");
    Test_SzThenUnSz_Check(MaybeOfUint(150994), MaybeOfUint(471390), "곟ᢏ淡钡೾", "줒女ѽ泡誄狋");
    Test_SzThenUnSz_Check(MaybeOfUint(357453), MaybeOfUint(356559), "㋽빽睍뉥៦佌Țꡮ", "殤膕躯蓬㥊ᆺ");
    Test_SzThenUnSz_Check(MaybeOfUint(54809), MaybeOfUint(647392), "�〿Ꝼ샛ᣱ沲툕ී쨳", "ӑ䞖猏鐪﹀ྏ䅳税");
    Test_SzThenUnSz_Check(MaybeOfUint(883773), MaybeOfUint(), "䰑挤③享", "ൃ䶀椼ズꡃ᫔");
    Test_SzThenUnSz_Check(MaybeOfUint(116704), MaybeOfUint(613456), "殤掙얷ᐮጧ뎆", "ᓌﻸꚡ䯯桾뭎");
    Test_SzThenUnSz_Check(MaybeOfUint(31957), MaybeOfUint(300346), "ﲀ⧝�䄳凜嬚", "ྉ樦纍");
    Test_SzThenUnSz_Check(MaybeOfUint(30265), MaybeOfUint(), "ꉁᏚ", "");
    Test_SzThenUnSz_Check(MaybeOfUint(6692), MaybeOfUint(597747), "羔ﾧ鋣ꊌ멉녍ഩ਽", "憎");
    Test_SzThenUnSz_Check(MaybeOfUint(63243), MaybeOfUint(209790), "៳╝⁋컱ⳃ", "刪ᖑ᭬퇠");
    Test_SzThenUnSz_Check(MaybeOfUint(681227), MaybeOfUint(606450), "₺洉疧ꅦ뭲끀䗶찀믌", "㌲㯊䂁∐⒳伷鳯⽸︧濜");
    Test_SzThenUnSz_Check(MaybeOfUint(921699), MaybeOfUint(247650), "︆᤾℟", "沶ꫴ痺ﾖ︔");
    Test_SzThenUnSz_Check(MaybeOfUint(694611), MaybeOfUint(), "䶂簜饋᲏඿", "䷗鷪묡拠銢᜼錢");
    Test_SzThenUnSz_Check(MaybeOfUint(629219), MaybeOfUint(380426), "ԙꇖⲽ櫉疷", "ꘓ");
    Test_SzThenUnSz_Check(MaybeOfUint(623212), MaybeOfUint(449721), "풠氂", "ຶꔽﾜᵏ");
    Test_SzThenUnSz_Check(MaybeOfUint(462625), MaybeOfUint(360995), "⯟骙䁣豅琧뗇躏òꘄᷡ", "펽꩙负釺锼珟፩�埊쎆");
    Test_SzThenUnSz_Check(MaybeOfUint(10462), MaybeOfUint(559916), "푔⼧巇麃", "斻ை牖Ⲋ䆮⊂农陣띰");
    Test_SzThenUnSz_Check(MaybeOfUint(), MaybeOfUint(808646), "㪁▫윁벼寥ﴋᮝ臢", "鲑頸헳ᑭᷡƫ믅༐");
    Test_SzThenUnSz_Check(MaybeOfUint(810641), MaybeOfUint(505384), "箯浔陳᳚乹ﻺ鮷囫я", "䮋");
    Test_SzThenUnSz_Check(MaybeOfUint(661744), MaybeOfUint(315247), "쎡韠ᣳ翠�", "삈켳劻�桮럫憍ᕝ");
    Test_SzThenUnSz_Check(MaybeOfUint(949213), MaybeOfUint(), "觰�", "�並㈛贆�⬧");
    Test_SzThenUnSz_Check(MaybeOfUint(826967), MaybeOfUint(), "", "縰�㔭");
    Test_SzThenUnSz_Check(MaybeOfUint(877839), MaybeOfUint(), "暱", "ﷺ⋏晆뗭⴬똣");
    Test_SzThenUnSz_Check(MaybeOfUint(132572), MaybeOfUint(27512), "ы䞀�ᐑꖢ䞶ꡡ훅꼦", "႙趹攘ꆓ");
    Test_SzThenUnSz_Check(MaybeOfUint(143075), MaybeOfUint(47427), "䚦럕ț頛臾ÍἩ", "託鱫댫");
    Test_SzThenUnSz_Check(MaybeOfUint(328156), MaybeOfUint(478307), "욜푭", "仚饩�Ꮚ혹霭䞓盅");
    Test_SzThenUnSz_Check(MaybeOfUint(399064), MaybeOfUint(), "扻ꋨ䳘쏡卋鳊鍽扐", "鞞㉪屹팑龚⿞䅰ꡉፀ");
    Test_SzThenUnSz_Check(MaybeOfUint(412880), MaybeOfUint(416887), "㕋�鯃嘐ኽੱ晤斔�", "튤⟫砚乸̛瀎ᭆ㍰");
    Test_SzThenUnSz_Check(MaybeOfUint(680518), MaybeOfUint(999603), "뒭㺡࣊砅婌ਠ", "");
    Test_SzThenUnSz_Check(MaybeOfUint(108423), MaybeOfUint(159725), "ᦲ", "왓꿨᳁ْଠ墻ἰ쟽뻗");
  }
  
  bool unitTestResults_MatchResult_RowSerialization = runAsync(Tests_RegisterAll_MatchResult_RowSerialization);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_MatchResult_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_MatchResult', UnitTest_ToFromBuffer_MatchResult);
  }
  
  bool Test_ToFromBuffer_Check(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant, const string &in zone) {
    MatchResult@ tmp = MatchResult(rank, score, participant, zone);
    Buffer@ buf = Buffer();
    print('buf size pre: ' + buf.GetSize());
    tmp.WriteToBuffer(buf);
    print('buf size post: ' + buf.GetSize());
    buf.Seek(0, 0);
    print('buf size post seek: ' + buf.GetSize());
    assert(tmp == _MatchResult::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_MatchResult() {
    Test_ToFromBuffer_Check(MaybeOfUint(), MaybeOfUint(), "ﳙ㻲翾鵜靀㍒㋪", "텆编�朹鎟");
    Test_ToFromBuffer_Check(MaybeOfUint(419070), MaybeOfUint(325863), "藴킅Ề쯣欚엻렒哾๺⾖", "밄ꊦ⊼⿕氎꼻");
    Test_ToFromBuffer_Check(MaybeOfUint(415169), MaybeOfUint(179363), "汛瀹ፎﬡ賄�匼", "䮞丵�￝");
    Test_ToFromBuffer_Check(MaybeOfUint(555317), MaybeOfUint(263354), "푲෗蔃䓥㻥", "䟃넲䗵蹟牪");
    Test_ToFromBuffer_Check(MaybeOfUint(), MaybeOfUint(322150), "潔箯㉽", "ꅇ᭧봅≹䎢");
    Test_ToFromBuffer_Check(MaybeOfUint(18764), MaybeOfUint(394778), "㠵ᢐၛⶍ쎦㋥霈", "좳");
    Test_ToFromBuffer_Check(MaybeOfUint(), MaybeOfUint(), "", "髣蘟먝瞄⧛鉼竲");
    Test_ToFromBuffer_Check(MaybeOfUint(274766), MaybeOfUint(966343), "踆⌾ꎳ㏰鉓켯τ㪔ﻊ", "Ὼ㐚ꂖ摇䞰鄕ꈽ洞⤦");
    Test_ToFromBuffer_Check(MaybeOfUint(255911), MaybeOfUint(964248), "繤牉᳔䬳⑇勿", "퍻䳥最徐㭾멭Პ");
    Test_ToFromBuffer_Check(MaybeOfUint(687772), MaybeOfUint(), "奞ͩ줞䟥ፕ⎃", "ᚸᄺ膲㑅诜돚");
    Test_ToFromBuffer_Check(MaybeOfUint(37562), MaybeOfUint(761537), "", "剼᪲");
    Test_ToFromBuffer_Check(MaybeOfUint(49662), MaybeOfUint(485401), "", "鐮軅㧦胷");
    Test_ToFromBuffer_Check(MaybeOfUint(227617), MaybeOfUint(129142), "ㅡ螘笣䨯䄸", "璫⃔煡욣");
    Test_ToFromBuffer_Check(MaybeOfUint(150994), MaybeOfUint(471390), "곟ᢏ淡钡೾", "줒女ѽ泡誄狋");
    Test_ToFromBuffer_Check(MaybeOfUint(357453), MaybeOfUint(356559), "㋽빽睍뉥៦佌Țꡮ", "殤膕躯蓬㥊ᆺ");
    Test_ToFromBuffer_Check(MaybeOfUint(54809), MaybeOfUint(647392), "�〿Ꝼ샛ᣱ沲툕ී쨳", "ӑ䞖猏鐪﹀ྏ䅳税");
    Test_ToFromBuffer_Check(MaybeOfUint(883773), MaybeOfUint(), "䰑挤③享", "ൃ䶀椼ズꡃ᫔");
    Test_ToFromBuffer_Check(MaybeOfUint(116704), MaybeOfUint(613456), "殤掙얷ᐮጧ뎆", "ᓌﻸꚡ䯯桾뭎");
    Test_ToFromBuffer_Check(MaybeOfUint(31957), MaybeOfUint(300346), "ﲀ⧝�䄳凜嬚", "ྉ樦纍");
    Test_ToFromBuffer_Check(MaybeOfUint(30265), MaybeOfUint(), "ꉁᏚ", "");
    Test_ToFromBuffer_Check(MaybeOfUint(6692), MaybeOfUint(597747), "羔ﾧ鋣ꊌ멉녍ഩ਽", "憎");
    Test_ToFromBuffer_Check(MaybeOfUint(63243), MaybeOfUint(209790), "៳╝⁋컱ⳃ", "刪ᖑ᭬퇠");
    Test_ToFromBuffer_Check(MaybeOfUint(681227), MaybeOfUint(606450), "₺洉疧ꅦ뭲끀䗶찀믌", "㌲㯊䂁∐⒳伷鳯⽸︧濜");
    Test_ToFromBuffer_Check(MaybeOfUint(921699), MaybeOfUint(247650), "︆᤾℟", "沶ꫴ痺ﾖ︔");
    Test_ToFromBuffer_Check(MaybeOfUint(694611), MaybeOfUint(), "䶂簜饋᲏඿", "䷗鷪묡拠銢᜼錢");
    Test_ToFromBuffer_Check(MaybeOfUint(629219), MaybeOfUint(380426), "ԙꇖⲽ櫉疷", "ꘓ");
    Test_ToFromBuffer_Check(MaybeOfUint(623212), MaybeOfUint(449721), "풠氂", "ຶꔽﾜᵏ");
    Test_ToFromBuffer_Check(MaybeOfUint(462625), MaybeOfUint(360995), "⯟骙䁣豅琧뗇躏òꘄᷡ", "펽꩙负釺锼珟፩�埊쎆");
    Test_ToFromBuffer_Check(MaybeOfUint(10462), MaybeOfUint(559916), "푔⼧巇麃", "斻ை牖Ⲋ䆮⊂农陣띰");
    Test_ToFromBuffer_Check(MaybeOfUint(), MaybeOfUint(808646), "㪁▫윁벼寥ﴋᮝ臢", "鲑頸헳ᑭᷡƫ믅༐");
    Test_ToFromBuffer_Check(MaybeOfUint(810641), MaybeOfUint(505384), "箯浔陳᳚乹ﻺ鮷囫я", "䮋");
    Test_ToFromBuffer_Check(MaybeOfUint(661744), MaybeOfUint(315247), "쎡韠ᣳ翠�", "삈켳劻�桮럫憍ᕝ");
    Test_ToFromBuffer_Check(MaybeOfUint(949213), MaybeOfUint(), "觰�", "�並㈛贆�⬧");
    Test_ToFromBuffer_Check(MaybeOfUint(826967), MaybeOfUint(), "", "縰�㔭");
    Test_ToFromBuffer_Check(MaybeOfUint(877839), MaybeOfUint(), "暱", "ﷺ⋏晆뗭⴬똣");
    Test_ToFromBuffer_Check(MaybeOfUint(132572), MaybeOfUint(27512), "ы䞀�ᐑꖢ䞶ꡡ훅꼦", "႙趹攘ꆓ");
    Test_ToFromBuffer_Check(MaybeOfUint(143075), MaybeOfUint(47427), "䚦럕ț頛臾ÍἩ", "託鱫댫");
    Test_ToFromBuffer_Check(MaybeOfUint(328156), MaybeOfUint(478307), "욜푭", "仚饩�Ꮚ혹霭䞓盅");
    Test_ToFromBuffer_Check(MaybeOfUint(399064), MaybeOfUint(), "扻ꋨ䳘쏡卋鳊鍽扐", "鞞㉪屹팑龚⿞䅰ꡉፀ");
    Test_ToFromBuffer_Check(MaybeOfUint(412880), MaybeOfUint(416887), "㕋�鯃嘐ኽੱ晤斔�", "튤⟫砚乸̛瀎ᭆ㍰");
    Test_ToFromBuffer_Check(MaybeOfUint(680518), MaybeOfUint(999603), "뒭㺡࣊砅婌ਠ", "");
    Test_ToFromBuffer_Check(MaybeOfUint(108423), MaybeOfUint(159725), "ᦲ", "왓꿨᳁ْଠ墻ἰ쟽뻗");
  }
  
  bool unitTestResults_MatchResult_ToFromBuffer = runAsync(Tests_RegisterAll_MatchResult_ToFromBuffer);
}
#endif