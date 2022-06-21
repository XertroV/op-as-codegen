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
  
  bool Test_ToJsonFromJson_Check(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, MaybeOfString@ teamLeaderboardComputeType, const string &in matchScoreDirection) {
    CompRound@ tmp = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    assert(tmp == CompRound(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_CompRound() {
    Test_ToJsonFromJson_Check(129450, 573551, 355425, 263911, 126408, 191439, "ᱶ", "䚏꼸䃧쁐", "澯�჌", MaybeOfString(), "軻ᖧ⭾뒍뿣확庢");
    Test_ToJsonFromJson_Check(331709, 704518, 900608, 203969, 755012, 475975, "톶", "ᚪ�司䌭덉羌ฬ擪", "䂟", MaybeOfString("峝뻴촮摂ꖶ鍁紙㕿"), "客㒞᫯볠箢暂遐");
    Test_ToJsonFromJson_Check(509010, 762937, 553541, 857256, 67966, 842264, "⦱", "䞚", "旰蓡柿ஷ", MaybeOfString("杒୒D䀗ꬨ憽畏"), "ﵴ뙕统눪꽏뛧䁖");
    Test_ToJsonFromJson_Check(105538, 592964, 28857, 789486, 77932, 906041, "鏑郺", "♱솎頺⫛ఝẴॶ૱덙", "똞ꚣ筣๏ᇠ", MaybeOfString("엣ᩁ㟅ഽᒽ罆鹌ﲒ咧놪"), "⻖蚇ங⨗萃쎉뮏");
    Test_ToJsonFromJson_Check(782152, 275663, 198407, 474515, 501721, 203400, "褢鶳ᄶ窐踎윉懜", "躀퓹ꔴ㳇୭鹥灦㣋충왦", "ꧾ큽ⷾ뮁d更든Η", MaybeOfString("መ꣡嗚㥱"), "फᝌᣇ꒨㟋릔ሮ");
    Test_ToJsonFromJson_Check(673225, 473376, 335004, 732228, 627702, 6572, "沍됢菙ၰ", "焦�素斫ﶮ籝鳐�", "뷾�", MaybeOfString("ᢻ샞饤浏䴾퍂蘇賻ᜳ"), "符䭭澀⽹ᱶ爅螝⬣");
    Test_ToJsonFromJson_Check(454929, 489123, 522901, 419173, 213551, 646581, "Ⱬꖗ႘ᖦﭭ见", "瑁캳륣쑋쎧ᨘ퉁濑", "엽뷗뢑", MaybeOfString("ꆢ귐쩱"), "ଌ蓼﫤");
    Test_ToJsonFromJson_Check(188851, 767183, 560953, 7765, 188934, 214175, "齢", "", "笜ꢩ쭋胋젮Ⱑ뷰", MaybeOfString("龎쬩ꨝꮄ轓᧦㗭再섚"), "ᔲ逥좣㉒㇜ꗸ롼ᬁ籕");
    Test_ToJsonFromJson_Check(798815, 951763, 811960, 415355, 760015, 272504, "딙授↳웡", "턜㧷わ銂⧼馣谱", "鈧䴨餶갯", MaybeOfString("�᭩앋�Ʞ恂慳"), "響醖첎䔻镩෾萫郅");
    Test_ToJsonFromJson_Check(650080, 328084, 497081, 131607, 237800, 321300, "瘬黊ᇴ", "啻苅㍧䟘鱐ꄝ标妒", "כֿ昢Ｈ罧㣜樐㽼", MaybeOfString("㵗髍澇㤘▝ħ蔋팪絠"), "穏뫤࡙攴");
    Test_ToJsonFromJson_Check(801176, 883112, 765603, 958172, 390405, 245672, "ᒢ湾", "৹", "霋", MaybeOfString("扁⫦"), "㺋Ɏ㥂矮冠ឍ馒");
    Test_ToJsonFromJson_Check(120250, 568242, 791291, 61098, 293637, 611399, "첕풠躹伲킬簱", "�", "俷큥ꄓ", MaybeOfString(), "䮔췬鼋탐缜檜⛟왪噧㉊");
    Test_ToJsonFromJson_Check(156113, 507600, 235111, 448613, 64905, 260294, "ᖀ㨎乕紇答㺳萵", "쉑ᢰ靡ﮃ嚄譵", "맆晝劬瘪剈授", MaybeOfString("縼矢遲੿ᥫ虝Ѐ"), "曘⮢꓾ȝ䨕碣됶豦");
    Test_ToJsonFromJson_Check(228067, 466997, 726580, 59326, 899003, 10972, "ฏ垄", "邽쪿", "�䰃", MaybeOfString(), "");
    Test_ToJsonFromJson_Check(379745, 812903, 162028, 311819, 995447, 14342, "㕚别꼭㗶澃軬ꇈ", "䦳�榺骽䭄궉쎟鷬", "쳷계쳣㪏汄ガ", MaybeOfString("詓鐋䎶뵆扈僿䞚"), "䇲�䍛쇈๛");
    Test_ToJsonFromJson_Check(472626, 829236, 590010, 497508, 935082, 496130, "犆뗄㿻", "鈝젾늇媎笖", "඾", MaybeOfString("孃뷌齟蜰ộ念ꓩꦼ�"), "⊐檢䩬媴白");
    Test_ToJsonFromJson_Check(432442, 20231, 116955, 720361, 803992, 583411, "蛢䲲", "㜆⏰‖馞", "暈೵횽祋阈", MaybeOfString("ᭊ初�䯊ךּ垊욊톲"), "至쐱ྟ찕崾흨");
    Test_ToJsonFromJson_Check(214393, 4952, 837347, 950209, 938928, 612040, "୅", "䃪ಅ䈣ঈࢧ믂⥖", "", MaybeOfString(), "똼顯얮듖踉弹겸");
    Test_ToJsonFromJson_Check(296220, 373373, 471592, 172674, 49348, 653111, "똛엫ᦡ⯓Ŧ묓", "㽗ⷻ찄䛉笘ꚠ", "", MaybeOfString("䞿"), "虺艧늚�");
    Test_ToJsonFromJson_Check(375371, 603639, 884330, 482035, 708526, 337199, "览", "ઋԞ൪ቄ忸៥", "娬", MaybeOfString("뀀ᵧ塻盩鮕雮亦釪"), "윊䰟爒ˣꌋ");
    Test_ToJsonFromJson_Check(369123, 318861, 254586, 205240, 87298, 204640, "෎턒柬઒궅", "☍஬街잜徺〶", "", MaybeOfString(""), "弄뮮");
    Test_ToJsonFromJson_Check(876293, 300467, 859739, 493846, 255071, 831451, "锃�ꚴ램ഔ쁴蔝娞⠸", "ﱴ�⧐㗪ⲷ窕ꄧ", "㚳쯕", MaybeOfString("ⱪ탵"), "陚＝ⶇ�");
    Test_ToJsonFromJson_Check(729860, 913604, 398554, 711541, 903843, 272557, "黌", "㩜ﾴ连㻰쮛䣔搵垑雛", "暡欐걗�", MaybeOfString("ͨﯨ"), "ꕦ䝵");
    Test_ToJsonFromJson_Check(157374, 575994, 35733, 558988, 613915, 91732, "ꍏﾌ錁鳲", "㑯虲错ᾚ", "ꗴ⩕", MaybeOfString(""), "뷞ᠮ裡");
    Test_ToJsonFromJson_Check(712383, 486223, 788234, 347957, 551658, 346280, "蛊ꠌ⋞ネ", "곑凋�蔐鴁⅘굡", "냢", MaybeOfString("⬫꽎铖†㥯吨"), "鰭∋擫đ");
    Test_ToJsonFromJson_Check(323688, 703275, 265097, 32282, 975179, 7995, "굾⧖妬聸顤咙", "﴿⩚�몘었", "䊜", MaybeOfString("뾬䰦ⷅ뮹"), "");
    Test_ToJsonFromJson_Check(68906, 149252, 195022, 302371, 630695, 315557, "伜", "腬킰", "⧚ᕱ㇦ᘄ躙", MaybeOfString("ޜＶ쓎檃㘙搅쥢�"), "崋쥙�蛳×ᜨ稡䩧");
    Test_ToJsonFromJson_Check(547046, 711783, 395907, 642233, 383492, 740992, "挡ﺜ", "", "ᙄ蠬咭詫界땆礷汫", MaybeOfString(), "̭郑墼ኣ䍅Ꝙ");
    Test_ToJsonFromJson_Check(369495, 550400, 228408, 132636, 233611, 788811, "ᄯ⫼䇤屴콙", "밄폒ꩼ", "᝹", MaybeOfString(), "㬺ᬥͬ⩉ࠍ㥄縄썗겼");
    Test_ToJsonFromJson_Check(121045, 995393, 125761, 434254, 954594, 475809, "한팬೻偉㝙倎卌", "넲㴝ส뺔툰氃Ꮸ㐐", "ᩅ果룗̍뫯꪿䒼큝", MaybeOfString(""), "⠧뚇မͿ掗ν");
    Test_ToJsonFromJson_Check(825583, 560035, 398893, 188284, 795235, 800187, "ᛙ牗ּ", "⇹", "䆖ើ銨〘ほ跱倭䗷", MaybeOfString("ᔼ燤⟐䶢⍈놋勊︈"), "臠㾼ూ莚箌䄇䱱팝⑄");
    Test_ToJsonFromJson_Check(83683, 125148, 181121, 68628, 888133, 756055, "ᶜ㮉嵥ꨜ鹬", "", "荤佀ഇ礲", MaybeOfString("聇㻇ຫ"), "葄㿮");
    Test_ToJsonFromJson_Check(338469, 634986, 924168, 134123, 365100, 569962, "", "逊퉈䨽턋ᄙ噕숲ॣ᧸", "瘏", MaybeOfString(""), "褅吢㨞罱쏭�ꢁ�榓⑺");
    Test_ToJsonFromJson_Check(727601, 870024, 343513, 630321, 531641, 616485, "䟁穳冥", "潍ෂꉫ닏詖", "", MaybeOfString("쭗緞쐼ჲ쥟뽿"), "㿥ᢧ맦䎀");
    Test_ToJsonFromJson_Check(63877, 233469, 942759, 87997, 954580, 653807, "ⲱꢊ牢஬麋�縣", "ꕠ�", "閠쯨목楥ᾥ", MaybeOfString("㉽珊�⇼鈉"), "ⓓ꛶二ᬭ泩姺");
    Test_ToJsonFromJson_Check(983379, 78003, 195917, 456664, 916603, 548009, "", "멥阊谅좦㔧ꛝ隗", "猦⩋ᗐ댯洴", MaybeOfString(""), "农祝ꠋ��숽쉳");
    Test_ToJsonFromJson_Check(799321, 649165, 291812, 481002, 204818, 150200, "溨콕ʔ镸〿ᭆ䅲砮˻ꇟ", "୑", "ᆰ뜬٬", MaybeOfString(), "ⅷ⦰⊂衤运Ꝉꊁ");
    Test_ToJsonFromJson_Check(594832, 600907, 144308, 245375, 735124, 563790, "拕휄슎蕢ᆟ䭼", "퉒", "戙花㸁", MaybeOfString("䈩휲"), "ﳘ鯇剸錛⧡");
    Test_ToJsonFromJson_Check(982115, 310009, 104684, 425509, 143767, 95525, "缜圆䐰饄音", "", "䞌锑敦暒쇠覡邯", MaybeOfString("�ꋊ檘ᔐ䙨兊"), "䮄");
    Test_ToJsonFromJson_Check(873915, 534883, 675446, 18188, 431893, 624517, "༇呸⋤ч▵", "꿻᱕⽲�鶩�頌�蘃ꞌ", "", MaybeOfString(), "");
    Test_ToJsonFromJson_Check(494129, 622649, 391788, 690690, 129974, 493940, "鸚圲枴Іﰹ奡Ṵሗ", "놬׺ㅯ껶祓䲛虋", "⣍", MaybeOfString("ቺ⊴䒁逬빡￥ࢽ㺸"), "");
    Test_ToJsonFromJson_Check(807355, 571537, 668434, 288425, 251195, 868033, "Ὥ", "뙱節ಒጒ翯㺘휍", "䬇", MaybeOfString(""), "섐裔힑Ӄ");
  }
  
  bool unitTestResults_CompRound_ToFromJSONObject = runAsync(Tests_RegisterAll_CompRound_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_CompRound_Getters() {
    RegisterUnitTest('UnitTest_CompRound_Getters', UnitTest_CompRound_Getters);
  }
  
  bool Test_CheckProps_CompRound(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, MaybeOfString@ teamLeaderboardComputeType, const string &in matchScoreDirection) {
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
    assert(teamLeaderboardComputeType == tmp.teamLeaderboardComputeType, 'field teamLeaderboardComputeType');
    assert(matchScoreDirection == tmp.matchScoreDirection, 'field matchScoreDirection with value `' + matchScoreDirection + '`');
    return true;
  }
  
  void UnitTest_CompRound_Getters() {
    Test_CheckProps_CompRound(394184, 158696, 888896, 284583, 980813, 825164, "", "⢢羋", "╝㸌鐁", MaybeOfString("꟪뢖棱꡺鼀ൃ橗"), "쿵ᒄ暭쑁㚷");
    Test_CheckProps_CompRound(87722, 931445, 242516, 292448, 340145, 211084, "갏䭯岊⒆肭", "Ѳ䊣", "", MaybeOfString("⨸۫芁≲彲⏈먳�"), "�拺윰蘆");
    Test_CheckProps_CompRound(321608, 715346, 402362, 548490, 493314, 149817, "那", "젮훇懓奲쮄⸔옯듡", "ᓭ褾㵹徲㼏嘿ꑙ尚豈", MaybeOfString("冼"), "⊫햷ሕﯷ⸱");
    Test_CheckProps_CompRound(443180, 672021, 217370, 780640, 56077, 281728, "姈⑻㤏�撵ߨ䯂䭱", "뇎≌膅๴޷Მᑨ쾳ﺷ", "챳䫑", MaybeOfString("惍됞ᨴ㪂ꦽ㎀"), "皌撏랭즫ᇁ﹀");
    Test_CheckProps_CompRound(945399, 696757, 381002, 591738, 926979, 620839, "嗍珐瀮㍿웦", "阚⦈郶炼椾", "弊䮷⃷쨗蝢ᳳ쁼", MaybeOfString(), "切횾却㑆");
    Test_CheckProps_CompRound(761214, 191737, 785867, 207480, 715112, 70718, "", "ꟗ唡ஊ", "霭㸙襩쳉", MaybeOfString("�ꒉ㳀䈾뙱䕂륦홰"), "鐷痚ꄻ");
    Test_CheckProps_CompRound(705388, 321952, 89935, 469141, 215862, 388432, "䌽ୣ筃痒胊의䉶", "墒≜蔗", "᠟Ꮍ⁭豹理癙⤊웪", MaybeOfString("뽽�"), "껠ﲜቚ⬋㫟슷崠ᕧ");
    Test_CheckProps_CompRound(835767, 597733, 906029, 246229, 161933, 299639, "ꓟ砥㜬⋣亶", "", "뿽", MaybeOfString("ࢆ⑧䩦뽼퍑ꗸ"), "ₙ묇森ⶍ");
    Test_CheckProps_CompRound(707776, 850420, 513331, 362086, 22089, 401867, "ソ⿈鄠", "龲ꇗ⡔辅", "颦蚕蔟", MaybeOfString("琢췹쓍湐ય"), "");
    Test_CheckProps_CompRound(724656, 653215, 669169, 952030, 876047, 795275, "疶뫰", "ᶳ쯟㝒⒄색Ї쑅閜", "嚱ᇊᙷ펁佗횄俁鏟", MaybeOfString("ힼ㼓"), "⁮ꕕ뉲�工턈鉚枛");
    Test_CheckProps_CompRound(878595, 679739, 182317, 694416, 783971, 913764, "Ҹꃈ䮣ᬬ컵嶐", "㻗﬽팊�슍郫홟㕤", "䝛튟뿎ວ扚듍꩐瘁쪟怢", MaybeOfString("좎㜶錏"), "ⳳ흰姺㼙光♤흆");
    Test_CheckProps_CompRound(823370, 6804, 91659, 26692, 970711, 573283, "℺꣺췽㇋嘘", "⑼驏᩽嬨默䚥�糣㊊", "胣颡攤訞", MaybeOfString("샱镧畉弐狝פ뤫"), "䚴鵁틖ꎀ�淲ﺆ跏");
    Test_CheckProps_CompRound(952652, 684445, 422863, 180139, 623725, 647698, "뚪䬹칭烈", "豺댜￰귥ጢ䨣뉐㕋퇪", "꥞琷᯵テ䪮䅎쯰", MaybeOfString("圙枩紂鯴떩ℭ"), "");
    Test_CheckProps_CompRound(599862, 677985, 368913, 429159, 122643, 807118, "�", "", "詮柃ㄼ鲶헞", MaybeOfString("沈v鬕绽ᅧ猣�"), "ꭢ");
    Test_CheckProps_CompRound(575293, 650559, 361945, 900907, 753475, 684210, "䃿fྔ㐔ᡄ鷂", "섎", "늋", MaybeOfString("켍Ⰼ"), "嶽衃鳱䊞챆맰쵛㣇ꨒ");
    Test_CheckProps_CompRound(310206, 557301, 476432, 846547, 440819, 488851, "", "퓿ￅ촨ﶗ峹ﵭᨳ礌贈憚", "셝凐", MaybeOfString("婓菨뻟௎"), "诨⥇Ш");
    Test_CheckProps_CompRound(848668, 123956, 594259, 142735, 684845, 571451, "", "膎", "䔐炒悄௶揸ꥒ叵﨑밍뇘", MaybeOfString("᏾쟰囍"), "掠욿");
    Test_CheckProps_CompRound(732079, 235155, 801047, 65331, 583163, 934111, "鉵朖Ⴈ", "䪨꒥䉊浊믪뙪", "槯梾⛬㬻", MaybeOfString("慺㗻壺旻슽铟Ꙓ鐻"), "䟎他�");
    Test_CheckProps_CompRound(633121, 813324, 412232, 772864, 760754, 963563, "�䅴", "阊额禱鍾齪床὏勐", "㐙㷀뵌慔駐윳陑镉⣀", MaybeOfString("䅿ꦧ"), "搰Ѕ㴧輩若᷸");
    Test_CheckProps_CompRound(878758, 333793, 604829, 579821, 275704, 673537, "ꨯꧼᖝ໵㘦恿", "읚罻", "ㅝ⧲卨펟漜႔婴矲깒켳", MaybeOfString("ꝶ擆⷗륶땣"), "℈");
    Test_CheckProps_CompRound(814728, 974617, 284426, 833786, 120825, 886726, "蛫龆뇘", "숢嗖ᘖ᮳➄䛳碸䀠열", "﯐ည쥙鎫籄艍큋詁", MaybeOfString(), "ﲏ");
    Test_CheckProps_CompRound(240192, 803963, 257288, 868628, 675094, 967723, "ﲩ�脰矫蛼", "긬ᒦ窸", "롶꠸텤㦺؟", MaybeOfString("젟󇸷쾨쯚迪"), "ڄ课");
    Test_CheckProps_CompRound(889541, 778262, 501081, 742990, 906532, 84793, "缰", "", "껲﹍", MaybeOfString("푈簵"), "");
    Test_CheckProps_CompRound(186260, 74594, 843103, 283212, 472852, 836459, "鼁蓔浏඾繫䷩", "㩈㉡㘬䑰끰㕵", "粓䞎⨞ꢍ", MaybeOfString(""), "�뎿�ྊ䐊罶㭹");
    Test_CheckProps_CompRound(961882, 830731, 630533, 716065, 929088, 739279, "擭硈勋⊲ǫ礳惴瘿", "⼝줠딳落", "⿎譟䏭哧唨䌲㓂䗻", MaybeOfString(), "ᆵ춳Ầ");
    Test_CheckProps_CompRound(632578, 795357, 550737, 587979, 212632, 208373, "㡫ꮬ拓൑", "ᘫ턒ዳ纉彾࿅ఱꉦ咙", "", MaybeOfString(), "▦");
    Test_CheckProps_CompRound(846078, 895695, 880971, 170971, 979748, 654928, "�䂁ㅽ遦ﾅ偂忺紘票彣", "剠ﺯ�", "ㇱ팜锏▽ꇲ䱐敫뒦숾", MaybeOfString("檹㪡㈥텒"), "�ﮗ");
    Test_CheckProps_CompRound(977444, 37441, 328511, 529932, 92965, 198832, "鞼�駷�ℷ鼈㐏", "㖦", "滔㘎ᔳ땳쎢䓲Ự", MaybeOfString("욤츙촐㲃朓紸늹鷲"), "䥾箉穘ꇠ䫧䟧儷");
    Test_CheckProps_CompRound(815651, 294566, 547396, 797806, 953142, 777612, "", "腪쓟", "ǋ鯮镘嫊冠愃躊ꁸ", MaybeOfString("ꥒﮉ⣞Բᱳ磡栧"), "蟅襎鿎⌯醞ᢂ蜱姿잚");
    Test_CheckProps_CompRound(781192, 594554, 354045, 968472, 843363, 156269, "휓", "벾䎺訮⧏跰䃟삢", "₎ㄊፂ�꿘腷頀", MaybeOfString("�"), "쥒瓶➣빃鞿");
    Test_CheckProps_CompRound(523512, 908342, 413918, 545721, 162581, 68212, "ඛ䈱렐ﴂ凘뭇⅖픻", "됨㾕봠簜߲쫋侵", "뾆濾庰", MaybeOfString(""), "⮈푥ఽ슆즠裘쾕");
    Test_CheckProps_CompRound(241452, 155058, 345955, 654464, 858338, 16302, "", "掜丗콪䛆䎼", "쀞镸", MaybeOfString("鷞≦烛ྦ蠔嬙వ蜐"), "�쒿뱴墆�∗");
    Test_CheckProps_CompRound(214250, 163447, 420662, 483076, 416819, 559176, " ↥�", "窺◫", "瘤", MaybeOfString("�庁㻐쐱ꥵ썳羨"), "␱ᄴꨛ");
    Test_CheckProps_CompRound(315667, 608860, 405295, 872934, 125690, 100278, "", "砎", "힄팁牛붔଴㏧汕胙貃", MaybeOfString("␫幣䤁瀱鏙藅"), "䳷쾞ꚛ쯢脹⣞");
    Test_CheckProps_CompRound(635918, 240742, 27156, 77124, 71326, 676911, "딇", "嵨㟠㕆蔎椑豫鰏솞", "��졪᤼", MaybeOfString("⎳퀳ﻴ뚓◚꒟�ῼ"), "ࣴ㦎䵽为");
    Test_CheckProps_CompRound(243411, 426363, 224495, 444321, 527463, 418346, "ﰹ槉꽽还", "쟰ొ锓仡婧裂", "赪湥", MaybeOfString("㶜⸉⁭䥉腪壋⣮坐"), "樨");
    Test_CheckProps_CompRound(94034, 565833, 682734, 21914, 119397, 683862, "睚혤薦䜾ຩῐ朿", "ᾠ唏ࠔ㥳x䝦绅", "", MaybeOfString(), "ꭸせ泴볹䰝Ḍ");
    Test_CheckProps_CompRound(261816, 469386, 614186, 286706, 618745, 559359, "腈༉", "", "쐐", MaybeOfString("┞"), "鏉쫿뙡쀿蚺輂");
    Test_CheckProps_CompRound(200159, 148163, 947192, 242925, 30247, 738440, "麖", "ꔛ覩䢕槓", "盿農", MaybeOfString("㷨䓜诽舁楍㔓襥"), "嚚휜㬉溸ѳ㣄");
    Test_CheckProps_CompRound(32181, 657970, 732857, 939593, 251205, 985051, "똣럴舟滐隌셑", "쨉", "ဣ", MaybeOfString("ﵥ⁥㦠ꣃ뛉"), "끕蘆㉰춈");
    Test_CheckProps_CompRound(493238, 316128, 126556, 599626, 996704, 2630, "쩰ᾑ笍ᐠꟊ䱤㖹鐶", "䄀ੱ࢟킱", "翪ৢ촩媑㡙噬", MaybeOfString(""), "鰳삋쌶ඨ╋ꦩ䁿");
    Test_CheckProps_CompRound(405090, 452727, 182791, 11096, 141675, 748455, "", "", "", MaybeOfString("拼ᤩㄛ嶂�浼쵑"), "");
  }
  
  bool unitTestResults_CompRound_Getters = runAsync(Tests_RegisterAll_CompRound_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_CompRound_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_CompRound', UnitTest_OpEqSimple_CompRound);
  }
  
  CompRound@ lastChecked = null;
  
  bool OpEqSimple_Check(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, MaybeOfString@ teamLeaderboardComputeType, const string &in matchScoreDirection) {
    CompRound@ o1 = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    CompRound@ o2 = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_CompRound() {
    OpEqSimple_Check(393455, 392207, 212987, 218290, 83728, 476217, "쭶퍉첯㚥涬凙", "霋흽묌铱蝔ᔁ䀓", "਀ꩣ釪�麑遬徨탏", MaybeOfString("ᛱ떡ꖯ"), "芖쬬뵉삕⁪ؠ技呝");
    OpEqSimple_Check(332990, 845106, 544173, 75238, 601448, 18341, "﩯ᘞ쉓㻇娍쪁ᆬ鬹⁺", "嗣ᮌ曄ꚉ桀楫뇊", "썷ᯱꛞ쏒㚉뙶娜ᣟ⫀", MaybeOfString("ﶇ䚱윲冥㶶밑幖許"), "ʊ冿�Ⓢꖠ⋳䝅攨鑽烆");
    OpEqSimple_Check(515156, 280342, 310378, 392143, 117677, 288195, "", "는ꒋ㑶", "␜῰蹎쟳횱宙홧", MaybeOfString("뼡㾢笏㶆ʱ"), "늭豈䖡");
    OpEqSimple_Check(435630, 300568, 999207, 174236, 821821, 262309, "旨ᜇꩥ᫦", "ᐢ㲛㧣⿾꛴倒", "매㘆천⥠", MaybeOfString("噦颤픽鳐ꈉʜ"), "");
    OpEqSimple_Check(422278, 333641, 830012, 82116, 511281, 629572, "ꮸ", "鏡螫⃠嚅⒝ࣾ惝�嬅糓", "껳ሌ괙⬲櫇ꟙ", MaybeOfString("㑭畼〭⤓ﲁ"), "͓墳룠డ㫠瀚䊠");
    OpEqSimple_Check(540196, 594524, 544378, 470200, 38908, 411404, "캈⧥", "꾋ྣ驣Ⴥ烶ꦴ휇莖", "⮴柷ꥧ荣ᢕ縠靿ᩬ□ꮟ", MaybeOfString("뛰�둕"), "秨玹桗喐");
    OpEqSimple_Check(814326, 317042, 332229, 631334, 680607, 279276, "ⱬ褑ཧ捺슅엎筄䄗灰ᔃ", "", "�⧙곢歒愪ᱧᫎ", MaybeOfString("鲖㝛侢"), "᧡⬆ꁓ縬鉸");
    OpEqSimple_Check(539939, 422967, 594924, 97497, 213686, 159354, "ミօ⥶批钅", "ঞ꼥ᗁቲ堽ᬵ꽧ﺵⰪ௝", "ꋽ", MaybeOfString("䳶넊"), "♕");
    OpEqSimple_Check(475985, 789265, 36996, 322382, 381895, 433068, "鬻피䌱踀뤅芸", "娣ዯ﷤賚�챀曹䚨", "⟹驵盲", MaybeOfString("᧊㑗蟒⌧츂�ꁟᾅ죐"), "秲櫩䗥讖宦");
    OpEqSimple_Check(310600, 891295, 329660, 994850, 800263, 642478, "薾ꔲ昽꜓ᵃ", "㛛ꂧ팲", "", MaybeOfString(), "䈒䨾");
    OpEqSimple_Check(296593, 97859, 343909, 463281, 327759, 609845, "텩㚽댯맑", "瞐奺ဂ", "㎭啷⨍揉", MaybeOfString("꡴⻜銵뒮ꬴ새"), "梆ﵭ뮓荔ꡂ၌鳿");
    OpEqSimple_Check(69729, 884034, 6880, 361522, 557596, 291997, "啴", "囈椐༁틋�鯺䅷⮙", "鵐剈箆玬㖳", MaybeOfString("Ȃ㹪쉰龊"), "扆䡖図罛");
    OpEqSimple_Check(371477, 170942, 386377, 607334, 518187, 971400, "䋰ꭔ", "ຽ", "랔ꖒ鬋", MaybeOfString("鯄꟒䠂桁�ည葀՗鄱"), "飛曀");
    OpEqSimple_Check(763064, 291793, 630661, 657020, 406777, 369335, "濺췲", "㐈狀䌤譢䳷饡៰ള甂", "屷硷ﵜ⫌Ꞻ", MaybeOfString("ٸ"), "�鸋₫");
    OpEqSimple_Check(796197, 147837, 128962, 901043, 641360, 925617, "尪읒", "轏씅", "੿퉛꿪⹳ꈰ뗵丷ө㩣", MaybeOfString(), "䝈⊻弋ꑓ踠䦺褃帷蛲譇");
    OpEqSimple_Check(878514, 492262, 172612, 265254, 232311, 71737, "왓ꄟ屽肀嫲�쓋쾙", "粑飼膃峧䟒⹗", "率Ⅳ魨", MaybeOfString("韠"), "녑");
    OpEqSimple_Check(445761, 857000, 976480, 455033, 111470, 573616, "൹貈垸뀰过", "挧ﳗ졝", "暮㟄䷫킹륦了", MaybeOfString("ㅾ돂㻢뜵㺸䞭촁챑ᩓ龜"), "淨�薮쮮磫呃温뗝쥨뽙");
    OpEqSimple_Check(520379, 554187, 837917, 742931, 971554, 693589, "龂Ƞ�뱄⯈퀍낼", "", "礚쑲∆ⴝ", MaybeOfString("綒搅聍Ꟑᨎﳌ祊⠤"), "쎙竗硨ɯ䃟偶");
    OpEqSimple_Check(406292, 109178, 333940, 20634, 443493, 24041, "", "䫁詵䯻꼊赖뇁", "⏏", MaybeOfString("斍⏀쌛Ⓛ薚懙룙㎐"), "");
    OpEqSimple_Check(695104, 240354, 578316, 86272, 805278, 515030, "䫸貓", "㪙뇞轓얖闻鷝", "", MaybeOfString(), "렳墄䖢⊎�ꮏ");
    OpEqSimple_Check(38661, 223824, 454708, 733824, 28598, 546073, "꼡姐䊂⤭�Ჺⅶ엱ǫ", "�捐챵", "簾뱟땈", MaybeOfString("끌"), "勫Ꭼ頰ㇹ");
    OpEqSimple_Check(949731, 981280, 424590, 422442, 62975, 19538, "괮툘ꋧ", "", "㛃", MaybeOfString("䀷픿ᨏ衔"), "グ㘁ȃㅞἄ辰思莽䱪");
    OpEqSimple_Check(765047, 733492, 665455, 765188, 346449, 602322, "", "海Ⴗ״", "띴勇啸俵㧠儂攑짱", MaybeOfString("鑽"), "");
    OpEqSimple_Check(759338, 191343, 812598, 72590, 702681, 423956, "廌ढ़秘", "⻌閉笢뾊諽髩浙䭬", "坌뵱푑燄", MaybeOfString("眭᫜侯억맖"), "姴챞");
    OpEqSimple_Check(762141, 56696, 106429, 773269, 4480, 434225, "쟓銀氢봃鿒碀", "冥풭", "뇗嵢ⵜ㲰핋嶣䇙寇", MaybeOfString("㳏⽀"), "랄⬄䴎뚶豗馌⬝ᒄᤊ");
    OpEqSimple_Check(762468, 473475, 575644, 745993, 290249, 350436, "㚡�闧㼅﬎梡깺", "演읎떩煤⼉岁岮", "喭﬚﹢멊┰ಂℳ", MaybeOfString("妝㩁⸳"), "⹅㫋�べ瞃");
    OpEqSimple_Check(949698, 530481, 340379, 536663, 440082, 987124, "岌ഠ㞞炈㸸毰", "棌�곔櫽ꐫ␓쌍油蒨", "ꫀ缎遁ᘤڷ寀�바", MaybeOfString("㍙⊘�౟"), "欣ﳋ乯");
    OpEqSimple_Check(59634, 83712, 793431, 918845, 694666, 443186, "敝ﲁ꛱ 뭻", "勣낉婡ᩥἙ훬랅灪藂Ԭ", "빂맴嗰荎觵緘顎ૢ", MaybeOfString("扐葁"), "Ỵ莙▸");
    OpEqSimple_Check(905196, 734911, 788433, 99741, 209115, 19479, "⻋忡過ᖃ", "ഷঢ㻀⼚况脪", "묽ᴂ㰶剎䌅糣", MaybeOfString(), "賂둁圡芪ȯ딝륷䲛");
    OpEqSimple_Check(508756, 697242, 500238, 787683, 207888, 977132, "朲쪗ࡤዒ桠", "蚞ꨑ困絵舸ͽ畺�", "隆", MaybeOfString("嵵棓쿏"), "");
    OpEqSimple_Check(310993, 540887, 254967, 223849, 361776, 456055, "䞸鄈鲤戙᤿䜦鈷", "몚첈㋨", "ң�黾ᔏ", MaybeOfString("빧衈ܔ肽"), "");
    OpEqSimple_Check(903288, 356714, 358443, 658673, 420361, 171274, "�음垮�馰㏙", "뢬垑锖", "", MaybeOfString("㛠஑뚀�⑴"), "✷㈳﷥똭퓄﮵");
    OpEqSimple_Check(189651, 33867, 718284, 847734, 537946, 938933, "轘", "䨴쏸휞", "즹␥㼳쬺義瘺", MaybeOfString(""), "孈틕଀蒍");
    OpEqSimple_Check(106280, 354006, 629327, 89860, 736679, 549988, "苔ꆡ郮蜵ᦜ濓", "谔˧憦䫀袗", "䋠갎炚潟", MaybeOfString(), "깾귵獦㣋");
    OpEqSimple_Check(122070, 50692, 674568, 941312, 710424, 134924, "媂ᆠɓקּ", "噫歪嵞䄁緯", "䬰왊姭칲ﲤ荏嬸虶댓", MaybeOfString("唤槷埋攻"), "Һ");
    OpEqSimple_Check(34644, 844730, 459806, 104933, 398237, 146071, "ᱜꍗ⟷嵫ꅄ卒̶", "쫓됻⯌ꯘ眝", "", MaybeOfString("ﾽ꒿㣶喒⅒瓮㫬䠜"), "佪솫劊좂響ض쭂");
    OpEqSimple_Check(942010, 349531, 221720, 286849, 318429, 919121, "᷼嬺꼨㉫࠵", "ꉋ什ꋃ鱚", "�橈ꔟ㑯⌇쩆", MaybeOfString("ी狲篌髋ᕀⲑ症"), "衐⾕");
    OpEqSimple_Check(723929, 715890, 336965, 233465, 137701, 983615, "疯ᡨ㻴驓ࣳ㣣咽玮棁", "辎晇巒쮭龥俩嬬", "᫣똇㱈ᦦ", MaybeOfString(), "痡뗏�");
    OpEqSimple_Check(481985, 832754, 538512, 664123, 769864, 964169, "먍", "ڪ", "캊偛ᖧ⠀㲰", MaybeOfString("婢㭖系㍲솹㵊"), "誟");
    OpEqSimple_Check(688227, 384502, 958803, 243436, 356906, 330979, "❨膧郾ᨓ罍", "ꅩ糧⪮", "뗼Ⲉ", MaybeOfString("㹘捲픢㻯蕛⑰ㆤ헑"), "ꅧξ랇㲑");
    OpEqSimple_Check(871005, 513059, 270279, 488481, 681282, 91594, "謏믷γѦ㙉", "扚彡㉆䥅", "귬ﶝ䤄嫿", MaybeOfString("寲疥῰馮얠"), "꽹䕵ᙃ퐄廚㉧╘⌀");
    OpEqSimple_Check(137895, 837186, 574364, 520926, 983193, 265388, "எ⃳੫貺軁测", "냿", "뻣႒鐽⍒싊딯䷔", MaybeOfString("鰠ﰁ"), "꒟釛ｂꝞ冷硃⶘⁌");
  }
  
  bool unitTestResults_CompRound_OpEq = runAsync(Tests_RegisterAll_CompRound_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_CompRound_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_CompRound', UnitTest_SzThenUnSz_CompRound);
  }
  
  bool Test_SzThenUnSz_Check(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, MaybeOfString@ teamLeaderboardComputeType, const string &in matchScoreDirection) {
    CompRound@ tmp = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    assert(tmp == _CompRound::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_CompRound() {
    Test_SzThenUnSz_Check(823221, 663647, 352245, 777791, 86592, 719979, "朹鎟ﳙ", "编", "엻렒哾๺⾖㻄쪼ﰙ⠁玭", MaybeOfString("錭鿩꤉䵚ࢂ浮翅쿕"), "䃜");
    Test_SzThenUnSz_Check(150771, 415169, 519885, 208676, 187232, 661191, "䤍ř챉鋱", "ﬕ૆ࣥ蕇벃堝ᛟ", "뾠粯ꣿ僨躗괱韲瓄ﲼ᭫", MaybeOfString("潔箯㉽貺ᠤᝯ曞䟃넲"), "ꅇ᭧봅≹䎢");
    Test_SzThenUnSz_Check(723328, 337261, 394778, 629002, 832887, 693999, "㽥︠걿좳樁㠵ᢐ", "먝瞄⧛鉼", "䗇髣", MaybeOfString("�緂️㳻컅䊈퇷䕖⭮�"), "笐");
    Test_SzThenUnSz_Check(344041, 479132, 313581, 51991, 683426, 294888, "", "絮᳦", "̊鳩཮㤷⣐", MaybeOfString("퍻䳥最徐㭾멭Პ䑰"), "䟥ፕ⎃ﲀᦓ솛格둪");
    Test_SzThenUnSz_Check(234787, 700902, 853957, 759104, 336591, 877257, "᪲ꮚ", "", "ⰳ팑ꇬ䋶慸", MaybeOfString("兵∋沴挣ה철攣"), "䗽ﵱꐎ굻⛩");
    Test_SzThenUnSz_Check(92430, 176289, 263591, 976559, 150994, 558367, "簳", "Ԧ懁ㅲ砤㉾滑肜", "ബ踳蝘䳡逶澸", MaybeOfString("㥊ᆺ⻖㋽빽睍뉥៦佌"), "蓬");
    Test_SzThenUnSz_Check(269534, 991003, 730997, 820813, 647490, 647392, "�〿Ꝼ샛ᣱ沲툕ී쨳", "ӑ䞖猏鐪﹀ྏ䅳税", "③享㐟ꯩ", MaybeOfString("읨껏卹籫ᆄᆖ�"), "翹া䦾灋䗆ᵭ");
    Test_SzThenUnSz_Check(743612, 549842, 501045, 680772, 31957, 253805, "︮䡴", "춸�", "இᜳꍪ�뱆", MaybeOfString(), "ꉁᏚ");
    Test_SzThenUnSz_Check(860757, 909951, 951620, 840455, 597747, 283451, "ꊌ멉녍ഩ", "앪衚ध⿺⯌憎祖羔ﾧ", "៳╝⁋컱ⳃ", MaybeOfString("ƒ蠐前袊⬸"), "ើ溥");
    Test_SzThenUnSz_Check(800390, 199047, 512146, 651310, 973513, 674998, "㖨벑뀁矣₳迿", "肯䨏﻿ꓼ构", "�鸓㮝ႝ䖟哢ꐽ", MaybeOfString("饋᲏඿븹䤭ذ沶"), "銢᜼錢樆䶂");
    Test_SzThenUnSz_Check(168286, 980432, 494166, 450685, 913447, 380426, "ԙꇖⲽ櫉疷", "ꘓ", "풠氂ᔾ쁄綯", MaybeOfString("ᄜ☝㺸긧�䵘㐯㾙"), "ꊓ�쳉⺋");
    Test_SzThenUnSz_Check(999224, 249786, 43724, 646739, 703179, 605664, "櫵妊", "天䉵凴᯹", "ോ㖰", MaybeOfString("⊂农陣띰摼푔⼧"), "ை牖Ⲋ");
    Test_SzThenUnSz_Check(808646, 898762, 882280, 290313, 95401, 233228, "㌠商ᅾ鲑頸헳ᑭᷡƫ믅", "乹ﻺ鮷囫я戵", "撠檗䮋ꏔ箯浔陳", MaybeOfString(), "뼖ቬ뫁귫");
    Test_SzThenUnSz_Check(711262, 7803, 676619, 934577, 352230, 84355, "긳佒稄㟧歒", "", "⤦鄻隳", MaybeOfString("쒿№妝"), "�");
    Test_SzThenUnSz_Check(854263, 301209, 922503, 865162, 644143, 558944, "ﷺ⋏晆뗭⴬똣", "狤í똫", "믔ы䞀�ᐑꖢ䞶ꡡ훅", MaybeOfString("�夛篢椞◌꽣⎄"), "ꠌ⤦");
    Test_SzThenUnSz_Check(528846, 320808, 161072, 328156, 309883, 52673, "颋", "㔻ᓵ倽䨬㭺邇맣", "矨ﱳ刎퍒", MaybeOfString("鳊"), "⿞䅰ꡉፀ븯扻ꋨ䳘쏡");
    Test_SzThenUnSz_Check(184788, 227017, 552448, 416887, 193882, 131058, "�鯃嘐", "䞓㕋", "砚乸̛瀎ᭆ", MaybeOfString("ᯋ錍჎"), "⶚ꖿ鈳");
    Test_SzThenUnSz_Check(790880, 108423, 165515, 737512, 516414, 77008, "ꓫ츭⅑뻌腂꟠䖓", "췙鏰ᕑ쥋蒕媕矔泔", "루ᙧ譛ⲡ퟊폟", MaybeOfString("놲싵뇵"), "ꇑﾷꃦꅕ熪饍㨋8辝쵌");
    Test_SzThenUnSz_Check(808501, 953518, 283816, 334966, 17733, 693496, "冁᯳Ⱄㄺ꛼㻔", "Ⲣ", "魶㭷栳ﮂ窗䊨㎠", MaybeOfString(""), "鹒狧믱");
    Test_SzThenUnSz_Check(463622, 248976, 458420, 194529, 159641, 586261, "례呞폹ꬻᷪ汍䃿檔", "⛐Ꜿ�ℨ㓩濥岤鹥䘂躴", "ퟖ슲氕ڞ꩹㧾抺", MaybeOfString("ಖⳡ忆悑翐䈐풼"), "鏿");
    Test_SzThenUnSz_Check(412956, 219851, 254572, 722283, 416051, 450180, "토ф⮭갭띨켊෦聁�", "憖ꀖ銱❕蒚ₖ", "纹謐ሙ䪩引", MaybeOfString("൹袴義겋"), "ꥍ臿陋㋫艠濖");
    Test_SzThenUnSz_Check(48336, 5749, 928098, 629344, 701117, 125398, "緙퇄⯛婃ꬃ똊鱴䐡낀", "備㵛䓤≴ꠋ", "宁", MaybeOfString(""), "?�ﲙ྇");
    Test_SzThenUnSz_Check(126346, 591190, 373405, 583731, 707258, 894617, "葑氊듳", "遺错䆈罹Ⰲ룟", "�﫦", MaybeOfString("흶裠"), "臘༝吽턛惠璐擃");
    Test_SzThenUnSz_Check(803062, 209586, 479899, 294808, 74374, 287422, "≱ꢩ뫛", "꽉೵", "啈냢໚", MaybeOfString("帻鈿橦"), "榄诶");
    Test_SzThenUnSz_Check(132876, 768987, 543580, 352358, 362634, 72752, "ꗱ᫞菓", "꫈ᨋ》竫퓣䲊폫", "臕", MaybeOfString("ᡣ䓌⤳烗坘䖧骤㛦"), "ꗨ紓뻽");
    Test_SzThenUnSz_Check(190609, 552528, 616526, 274838, 833852, 784074, "�梛怋컲쀕歛瓩O", "浗导�ṶԹ", "", MaybeOfString("⨝쭻䏤ᢠ䫖葻"), "킄읋溛륹甄");
    Test_SzThenUnSz_Check(746125, 314857, 332208, 339274, 484862, 916822, "", "േ᥹뛼", "⼏歖맹훿웴⏪", MaybeOfString("݄"), "ꔏ䟾嶩⩧");
    Test_SzThenUnSz_Check(83397, 843681, 725397, 469213, 208906, 715528, "", "磡", "릚", MaybeOfString("뙥斨从鹜瘁⟱쫯ዼ"), "ꎭﰎ�䢈");
    Test_SzThenUnSz_Check(243548, 167998, 288457, 646320, 731491, 41462, "┗�莘럜", "搅䉗꙱", "঍ꆡ�鯉罨", MaybeOfString("噧䯪蛯뤔ྉኛ㾜왠"), "");
    Test_SzThenUnSz_Check(225516, 605540, 347391, 998847, 287718, 553675, "徯ˮ뀁诛祼蝵챼", "Ꝋ钧죿揊ꄊ석恍Ꚇ脽", "�娯딉슝拓䥵�", MaybeOfString("妗�Ț"), "皎䊭匑");
    Test_SzThenUnSz_Check(279735, 981829, 706774, 173686, 777534, 710652, "卤㵠휄Ｋ", "⅛䉠稯ꛬ焄－噈", "⅌滛ⷖ뿂⬔", MaybeOfString(), "䔋");
    Test_SzThenUnSz_Check(928013, 332830, 517757, 877749, 981158, 268955, "ꔻ䪣续蹘", "ồ趌ݸﰙ囦鷎", "耼⫰ﭒ䜹", MaybeOfString("憷Ὄဨ㘳顫踠"), "�ㄌ㗫䐮勍㮼");
    Test_SzThenUnSz_Check(756483, 269129, 980780, 439734, 212480, 361747, "", "䀒䍊빇曁绀溜ⅅ࿿倴", "畵䯖쫟艖", MaybeOfString("틪ۥ焳ｑն鋋"), "");
    Test_SzThenUnSz_Check(398948, 355957, 668800, 722626, 425594, 459576, "廤�ꑷ堓儝맒샭", "", "꼈ꘁ﬩险檑�Ʋ", MaybeOfString("➲"), "色톽ⱥ졗볆丕鈂");
    Test_SzThenUnSz_Check(135421, 668347, 602585, 271835, 514223, 706528, "飗㠝茼邬䃳䡝㹅楨", "濁檍ਜ", "ე뉺ྕ", MaybeOfString("줾㓒셡㿸Ꙍ㦩"), "猝᫺鱴䝧ꁥ﷨津䮵");
    Test_SzThenUnSz_Check(81465, 877945, 855287, 521675, 370152, 58430, "", "建龰ᘃ㵶燞⻱", "", MaybeOfString(""), "许䑐㸬涂�");
    Test_SzThenUnSz_Check(26718, 163713, 237945, 391276, 436377, 222921, "휋ཞ턂Ỏ", "칿ᱟ㉞Æ斫", "ⱇ墙ୋ蹽鵔", MaybeOfString("뭶ዘ�㷣䷐"), "㰙샛煶끮悫");
    Test_SzThenUnSz_Check(968553, 558485, 33883, 759363, 973625, 476366, "ⷧ䎚蠠ﵸ亏ʐ鸓쇵", "⍚ꃿ琢뒞", "磮쓛㔔�꺛⎒", MaybeOfString(), "곑釕쒮狛㩪");
    Test_SzThenUnSz_Check(541904, 739183, 762638, 931856, 159623, 222027, "涠�淿ὤ", "魟䡏鉕�迬�ᔓ", "", MaybeOfString("괴⸸瘓嵱"), "ﷻ");
    Test_SzThenUnSz_Check(584620, 983140, 879185, 522381, 866549, 706487, "汆얓萿", "", "鑍⛦뚈組仕充쿦ꁇ", MaybeOfString("ⲏ䞹悩牪ᬏ핍"), "ⷷ莣겄㖡⦲");
    Test_SzThenUnSz_Check(658967, 917238, 215409, 870029, 442569, 544475, "酀Ⅱ渚", "�뜙翕鏅ᩒ딢ⳙ뫊ȁ", "", MaybeOfString(), "�롧䱐Ė٬魒쪘");
    Test_SzThenUnSz_Check(917862, 129611, 255304, 57045, 121162, 977187, "젒҃⹁ꈥ䗯", "ޞ鍪瞨෢ꨛ", "碵煛克듒籍쬀ጫ㶾�", MaybeOfString("쮜"), "�メ犷");
  }
  
  bool unitTestResults_CompRound_RowSerialization = runAsync(Tests_RegisterAll_CompRound_RowSerialization);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_CompRound_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_CompRound', UnitTest_ToFromBuffer_CompRound);
  }
  
  bool Test_ToFromBuffer_Check(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, MaybeOfString@ teamLeaderboardComputeType, const string &in matchScoreDirection) {
    CompRound@ tmp = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    Buffer@ buf = Buffer();
    print('buf size pre: ' + buf.GetSize());
    tmp.WriteToBuffer(buf);
    print('buf size post: ' + buf.GetSize());
    buf.Seek(0, 0);
    print('buf size post seek: ' + buf.GetSize());
    assert(tmp == _CompRound::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_CompRound() {
    Test_ToFromBuffer_Check(823221, 663647, 352245, 777791, 86592, 719979, "朹鎟ﳙ", "编", "엻렒哾๺⾖㻄쪼ﰙ⠁玭", MaybeOfString("錭鿩꤉䵚ࢂ浮翅쿕"), "䃜");
    Test_ToFromBuffer_Check(150771, 415169, 519885, 208676, 187232, 661191, "䤍ř챉鋱", "ﬕ૆ࣥ蕇벃堝ᛟ", "뾠粯ꣿ僨躗괱韲瓄ﲼ᭫", MaybeOfString("潔箯㉽貺ᠤᝯ曞䟃넲"), "ꅇ᭧봅≹䎢");
    Test_ToFromBuffer_Check(723328, 337261, 394778, 629002, 832887, 693999, "㽥︠걿좳樁㠵ᢐ", "먝瞄⧛鉼", "䗇髣", MaybeOfString("�緂️㳻컅䊈퇷䕖⭮�"), "笐");
    Test_ToFromBuffer_Check(344041, 479132, 313581, 51991, 683426, 294888, "", "絮᳦", "̊鳩཮㤷⣐", MaybeOfString("퍻䳥最徐㭾멭Პ䑰"), "䟥ፕ⎃ﲀᦓ솛格둪");
    Test_ToFromBuffer_Check(234787, 700902, 853957, 759104, 336591, 877257, "᪲ꮚ", "", "ⰳ팑ꇬ䋶慸", MaybeOfString("兵∋沴挣ה철攣"), "䗽ﵱꐎ굻⛩");
    Test_ToFromBuffer_Check(92430, 176289, 263591, 976559, 150994, 558367, "簳", "Ԧ懁ㅲ砤㉾滑肜", "ബ踳蝘䳡逶澸", MaybeOfString("㥊ᆺ⻖㋽빽睍뉥៦佌"), "蓬");
    Test_ToFromBuffer_Check(269534, 991003, 730997, 820813, 647490, 647392, "�〿Ꝼ샛ᣱ沲툕ී쨳", "ӑ䞖猏鐪﹀ྏ䅳税", "③享㐟ꯩ", MaybeOfString("읨껏卹籫ᆄᆖ�"), "翹া䦾灋䗆ᵭ");
    Test_ToFromBuffer_Check(743612, 549842, 501045, 680772, 31957, 253805, "︮䡴", "춸�", "இᜳꍪ�뱆", MaybeOfString(), "ꉁᏚ");
    Test_ToFromBuffer_Check(860757, 909951, 951620, 840455, 597747, 283451, "ꊌ멉녍ഩ", "앪衚ध⿺⯌憎祖羔ﾧ", "៳╝⁋컱ⳃ", MaybeOfString("ƒ蠐前袊⬸"), "ើ溥");
    Test_ToFromBuffer_Check(800390, 199047, 512146, 651310, 973513, 674998, "㖨벑뀁矣₳迿", "肯䨏﻿ꓼ构", "�鸓㮝ႝ䖟哢ꐽ", MaybeOfString("饋᲏඿븹䤭ذ沶"), "銢᜼錢樆䶂");
    Test_ToFromBuffer_Check(168286, 980432, 494166, 450685, 913447, 380426, "ԙꇖⲽ櫉疷", "ꘓ", "풠氂ᔾ쁄綯", MaybeOfString("ᄜ☝㺸긧�䵘㐯㾙"), "ꊓ�쳉⺋");
    Test_ToFromBuffer_Check(999224, 249786, 43724, 646739, 703179, 605664, "櫵妊", "天䉵凴᯹", "ോ㖰", MaybeOfString("⊂农陣띰摼푔⼧"), "ை牖Ⲋ");
    Test_ToFromBuffer_Check(808646, 898762, 882280, 290313, 95401, 233228, "㌠商ᅾ鲑頸헳ᑭᷡƫ믅", "乹ﻺ鮷囫я戵", "撠檗䮋ꏔ箯浔陳", MaybeOfString(), "뼖ቬ뫁귫");
    Test_ToFromBuffer_Check(711262, 7803, 676619, 934577, 352230, 84355, "긳佒稄㟧歒", "", "⤦鄻隳", MaybeOfString("쒿№妝"), "�");
    Test_ToFromBuffer_Check(854263, 301209, 922503, 865162, 644143, 558944, "ﷺ⋏晆뗭⴬똣", "狤í똫", "믔ы䞀�ᐑꖢ䞶ꡡ훅", MaybeOfString("�夛篢椞◌꽣⎄"), "ꠌ⤦");
    Test_ToFromBuffer_Check(528846, 320808, 161072, 328156, 309883, 52673, "颋", "㔻ᓵ倽䨬㭺邇맣", "矨ﱳ刎퍒", MaybeOfString("鳊"), "⿞䅰ꡉፀ븯扻ꋨ䳘쏡");
    Test_ToFromBuffer_Check(184788, 227017, 552448, 416887, 193882, 131058, "�鯃嘐", "䞓㕋", "砚乸̛瀎ᭆ", MaybeOfString("ᯋ錍჎"), "⶚ꖿ鈳");
    Test_ToFromBuffer_Check(790880, 108423, 165515, 737512, 516414, 77008, "ꓫ츭⅑뻌腂꟠䖓", "췙鏰ᕑ쥋蒕媕矔泔", "루ᙧ譛ⲡ퟊폟", MaybeOfString("놲싵뇵"), "ꇑﾷꃦꅕ熪饍㨋8辝쵌");
    Test_ToFromBuffer_Check(808501, 953518, 283816, 334966, 17733, 693496, "冁᯳Ⱄㄺ꛼㻔", "Ⲣ", "魶㭷栳ﮂ窗䊨㎠", MaybeOfString(""), "鹒狧믱");
    Test_ToFromBuffer_Check(463622, 248976, 458420, 194529, 159641, 586261, "례呞폹ꬻᷪ汍䃿檔", "⛐Ꜿ�ℨ㓩濥岤鹥䘂躴", "ퟖ슲氕ڞ꩹㧾抺", MaybeOfString("ಖⳡ忆悑翐䈐풼"), "鏿");
    Test_ToFromBuffer_Check(412956, 219851, 254572, 722283, 416051, 450180, "토ф⮭갭띨켊෦聁�", "憖ꀖ銱❕蒚ₖ", "纹謐ሙ䪩引", MaybeOfString("൹袴義겋"), "ꥍ臿陋㋫艠濖");
    Test_ToFromBuffer_Check(48336, 5749, 928098, 629344, 701117, 125398, "緙퇄⯛婃ꬃ똊鱴䐡낀", "備㵛䓤≴ꠋ", "宁", MaybeOfString(""), "?�ﲙ྇");
    Test_ToFromBuffer_Check(126346, 591190, 373405, 583731, 707258, 894617, "葑氊듳", "遺错䆈罹Ⰲ룟", "�﫦", MaybeOfString("흶裠"), "臘༝吽턛惠璐擃");
    Test_ToFromBuffer_Check(803062, 209586, 479899, 294808, 74374, 287422, "≱ꢩ뫛", "꽉೵", "啈냢໚", MaybeOfString("帻鈿橦"), "榄诶");
    Test_ToFromBuffer_Check(132876, 768987, 543580, 352358, 362634, 72752, "ꗱ᫞菓", "꫈ᨋ》竫퓣䲊폫", "臕", MaybeOfString("ᡣ䓌⤳烗坘䖧骤㛦"), "ꗨ紓뻽");
    Test_ToFromBuffer_Check(190609, 552528, 616526, 274838, 833852, 784074, "�梛怋컲쀕歛瓩O", "浗导�ṶԹ", "", MaybeOfString("⨝쭻䏤ᢠ䫖葻"), "킄읋溛륹甄");
    Test_ToFromBuffer_Check(746125, 314857, 332208, 339274, 484862, 916822, "", "േ᥹뛼", "⼏歖맹훿웴⏪", MaybeOfString("݄"), "ꔏ䟾嶩⩧");
    Test_ToFromBuffer_Check(83397, 843681, 725397, 469213, 208906, 715528, "", "磡", "릚", MaybeOfString("뙥斨从鹜瘁⟱쫯ዼ"), "ꎭﰎ�䢈");
    Test_ToFromBuffer_Check(243548, 167998, 288457, 646320, 731491, 41462, "┗�莘럜", "搅䉗꙱", "঍ꆡ�鯉罨", MaybeOfString("噧䯪蛯뤔ྉኛ㾜왠"), "");
    Test_ToFromBuffer_Check(225516, 605540, 347391, 998847, 287718, 553675, "徯ˮ뀁诛祼蝵챼", "Ꝋ钧죿揊ꄊ석恍Ꚇ脽", "�娯딉슝拓䥵�", MaybeOfString("妗�Ț"), "皎䊭匑");
    Test_ToFromBuffer_Check(279735, 981829, 706774, 173686, 777534, 710652, "卤㵠휄Ｋ", "⅛䉠稯ꛬ焄－噈", "⅌滛ⷖ뿂⬔", MaybeOfString(), "䔋");
    Test_ToFromBuffer_Check(928013, 332830, 517757, 877749, 981158, 268955, "ꔻ䪣续蹘", "ồ趌ݸﰙ囦鷎", "耼⫰ﭒ䜹", MaybeOfString("憷Ὄဨ㘳顫踠"), "�ㄌ㗫䐮勍㮼");
    Test_ToFromBuffer_Check(756483, 269129, 980780, 439734, 212480, 361747, "", "䀒䍊빇曁绀溜ⅅ࿿倴", "畵䯖쫟艖", MaybeOfString("틪ۥ焳ｑն鋋"), "");
    Test_ToFromBuffer_Check(398948, 355957, 668800, 722626, 425594, 459576, "廤�ꑷ堓儝맒샭", "", "꼈ꘁ﬩险檑�Ʋ", MaybeOfString("➲"), "色톽ⱥ졗볆丕鈂");
    Test_ToFromBuffer_Check(135421, 668347, 602585, 271835, 514223, 706528, "飗㠝茼邬䃳䡝㹅楨", "濁檍ਜ", "ე뉺ྕ", MaybeOfString("줾㓒셡㿸Ꙍ㦩"), "猝᫺鱴䝧ꁥ﷨津䮵");
    Test_ToFromBuffer_Check(81465, 877945, 855287, 521675, 370152, 58430, "", "建龰ᘃ㵶燞⻱", "", MaybeOfString(""), "许䑐㸬涂�");
    Test_ToFromBuffer_Check(26718, 163713, 237945, 391276, 436377, 222921, "휋ཞ턂Ỏ", "칿ᱟ㉞Æ斫", "ⱇ墙ୋ蹽鵔", MaybeOfString("뭶ዘ�㷣䷐"), "㰙샛煶끮悫");
    Test_ToFromBuffer_Check(968553, 558485, 33883, 759363, 973625, 476366, "ⷧ䎚蠠ﵸ亏ʐ鸓쇵", "⍚ꃿ琢뒞", "磮쓛㔔�꺛⎒", MaybeOfString(), "곑釕쒮狛㩪");
    Test_ToFromBuffer_Check(541904, 739183, 762638, 931856, 159623, 222027, "涠�淿ὤ", "魟䡏鉕�迬�ᔓ", "", MaybeOfString("괴⸸瘓嵱"), "ﷻ");
    Test_ToFromBuffer_Check(584620, 983140, 879185, 522381, 866549, 706487, "汆얓萿", "", "鑍⛦뚈組仕充쿦ꁇ", MaybeOfString("ⲏ䞹悩牪ᬏ핍"), "ⷷ莣겄㖡⦲");
    Test_ToFromBuffer_Check(658967, 917238, 215409, 870029, 442569, 544475, "酀Ⅱ渚", "�뜙翕鏅ᩒ딢ⳙ뫊ȁ", "", MaybeOfString(), "�롧䱐Ė٬魒쪘");
    Test_ToFromBuffer_Check(917862, 129611, 255304, 57045, 121162, 977187, "젒҃⹁ꈥ䗯", "ޞ鍪瞨෢ꨛ", "碵煛克듒籍쬀ጫ㶾�", MaybeOfString("쮜"), "�メ犷");
  }
  
  bool unitTestResults_CompRound_ToFromBuffer = runAsync(Tests_RegisterAll_CompRound_ToFromBuffer);
}
#endif