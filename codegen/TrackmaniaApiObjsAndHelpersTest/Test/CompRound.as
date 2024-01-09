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
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_CompRound_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_CompRound', UnitTest_ToFromBuffer_CompRound);
  }
  
  bool Test_ToFromBuffer_Check(uint id, uint qualifierChallengeId, uint position, uint nbMatches, uint startDate, uint endDate, const string &in name, const string &in status, const string &in leaderboardComputeType, MaybeOfString@ teamLeaderboardComputeType, const string &in matchScoreDirection) {
    CompRound@ tmp = CompRound(id, qualifierChallengeId, position, nbMatches, startDate, endDate, name, status, leaderboardComputeType, teamLeaderboardComputeType, matchScoreDirection);
    MemoryBuffer@ buf = MemoryBuffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _CompRound::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_CompRound() {
    Test_ToFromBuffer_Check(490366, 613160, 426468, 135885, 791352, 176508, "�", "靷딦꬈�ᦞ壩", "�", MaybeOfString("∉㥂"), "䄍缕臉");
    Test_ToFromBuffer_Check(521024, 882402, 114032, 201236, 995865, 150495, "", "蛗뙱頸쪚ꗼ鵨쥲拝ﳋ", "ꌉ⦿䫏찣䄺㔼﬌㒩⣃ﻝ", MaybeOfString(), "忭�");
    Test_ToFromBuffer_Check(549906, 156703, 1464, 468056, 543129, 261603, "玵⌂", "⒯둷盚ⳬ斮ț븶餦", "ꏅ㜔庯쎿命", MaybeOfString(), "");
    Test_ToFromBuffer_Check(959434, 707390, 547310, 612011, 126838, 853771, "Ⴀ샛ܪ", "競ჟ⮏쌜ꥮ", "", MaybeOfString("徕䧎࠺蒔"), "嗇웖峔䞠⧖奡玜");
    Test_ToFromBuffer_Check(509962, 254406, 213099, 191530, 655960, 499243, "䲏Ȥ", "䴊芺➞ᷟᦊ럃礱", "�", MaybeOfString(""), "晞");
    Test_ToFromBuffer_Check(112876, 53015, 676202, 744839, 219369, 124573, "ኟ狵愹㮠", "鴳툞Ⅳ箲", "峽ᱪⓣ䝚ࠌ臼", MaybeOfString("髞뺥"), "抅뻱ℤ䃧");
    Test_ToFromBuffer_Check(691552, 740264, 459935, 217232, 841908, 364463, "솸綯", "褺끤찙뗿", "㍀ᠼᨁ꒚憑ȍ", MaybeOfString("䷙踯鉙謎ㅩ顃쀒펧"), "連�ړ犺愸岺�槧");
    Test_ToFromBuffer_Check(336023, 901057, 605427, 447868, 239425, 451658, "醱✨딦鹟㙾", "柱䵝洔榌ⴄ", "Ꚃ", MaybeOfString("큎뒏⫛⪃璔氉恌"), "䋇ﮥ㇮");
    Test_ToFromBuffer_Check(125448, 152899, 543420, 506392, 983162, 115545, "�짺ၑ珤꼟絕", "홐", "ּ", MaybeOfString("ଧ銣㢬鍑忯"), "䫂⊘放髋鬥");
    Test_ToFromBuffer_Check(101793, 911184, 386132, 46906, 314091, 350748, "䎂礱ﾡῼ�ﭾ싌", "⮘祘ᠶ灏숆燰ꛪ", "ጃ퓣䒦⪢㈍䞙ꦧ", MaybeOfString("嶈Қ⨏취ಗᨠﳄ�"), "");
    Test_ToFromBuffer_Check(328793, 438882, 795188, 127483, 93957, 358699, "兇᤮㘄ᯈ샅邯镇", "棯볿鋄郆奡", "", MaybeOfString("쯁欦뀃궳顂헧ᜰ"), "㠐ྉ�");
    Test_ToFromBuffer_Check(714903, 327246, 124661, 194583, 816724, 499804, "켻㵛�꣎⺞㨱㘌", "ѕ鸰襢", "䠃엛誐졑", MaybeOfString("玶暤쯈侇仟寱佶�"), "");
    Test_ToFromBuffer_Check(512740, 35511, 107080, 18330, 198104, 874256, "俐姹뾖", "驻剌", "鑈ꍥ", MaybeOfString("᮵樇麉쩎ꍌ"), "葊");
    Test_ToFromBuffer_Check(438625, 784760, 699561, 192698, 224190, 276691, "뎬뫛쫴곳焋ᙩ왟ɳ늂", "㧮琭", "跌ꂺ㟭莇ᇾ㟊", MaybeOfString("렓猪ꄴ"), "퀜㛟넸");
    Test_ToFromBuffer_Check(560058, 460247, 149648, 841348, 461453, 841223, "ힲ䜎", "｜ﭒ☏ꄳ醭獙", "挏䆭䐜�䖩仍", MaybeOfString(""), "ލ⓮㷂쭰");
    Test_ToFromBuffer_Check(665702, 46353, 573179, 281383, 657550, 284903, "", "罔㕮࠺쨾曽", "⻖겨䨎࿇", MaybeOfString("蚥▒䢫"), "�䛝쏔柿");
    Test_ToFromBuffer_Check(169190, 678725, 418005, 95318, 133548, 591520, "ﱼ鉴鼋皿ꮺ玚疭", "됉韲媲푭�瞮鬛㐕", "魠齁⣔蓷璉ὕ᳊ꀕ", MaybeOfString(), "봎︠封쥞渐ﰖ鿶");
    Test_ToFromBuffer_Check(163623, 349905, 715153, 375334, 962398, 843559, "ﮥ릥�鉭烄뎔唍撻짳稆", "䈳ᛣ︲揹牅", "졠甹", MaybeOfString("룄踂뷡焱．㿾괫࿖╸"), "鍍�ᗈ勡퇻훒");
    Test_ToFromBuffer_Check(404741, 604555, 177518, 368132, 609312, 26341, "", "뾛㸜꘡", "炳ᮊᘷ펓", MaybeOfString("鯴뱠큣"), "빞嶺蠷ⰴ홼䚟");
    Test_ToFromBuffer_Check(928611, 593292, 129294, 14562, 890428, 45077, "캑쵅魎߳皬蓇녙遟顸", "ㅜ墤혬ﱥꪒ", "閵养ѓ폣", MaybeOfString(""), "᫅鯚㾴䈪肉蒗課꽐༪벃");
    Test_ToFromBuffer_Check(801423, 666157, 334018, 135788, 867334, 650901, "ⷘ橸빾搊", "", "蒘裥冹╁ⰾ쎃�", MaybeOfString("ᱺ욫ᜲꗃ筐뇺ਪ"), "ٺᗮ�翊焤");
    Test_ToFromBuffer_Check(591704, 157680, 25808, 72860, 662139, 662332, "", "", "찆䔽襛╮쫘贁軏⦲⭠㽴", MaybeOfString("桉�麇㶼믔な"), "䫥븊㢘焠쏩熽筝촣ܶ풭");
    Test_ToFromBuffer_Check(676880, 664448, 114560, 823098, 154126, 553380, "႞䲄", "㦞ꉞ쇁9࿕鯶痒", "", MaybeOfString("㽺阣죸鉓렧赘⯅㖰"), "澻誣ల");
    Test_ToFromBuffer_Check(314391, 263009, 331373, 71901, 702561, 338333, "", "満Ꭾ앩㙛", "翂䯠傒ᒓ憜챠ﾟ", MaybeOfString("쳆碲"), "谗췵痡");
    Test_ToFromBuffer_Check(526507, 665960, 569910, 725764, 648356, 692579, "丟㘓", "扴", "䰟裹ᔅ뗞﷍똧", MaybeOfString("諾鉕湬Ӓ돗"), "㤖⽔뵅䙤�ձᲗ㹧⃯");
    Test_ToFromBuffer_Check(322695, 198564, 283639, 651695, 944653, 531116, "ت", "冇穌", "઱㳵唵Ἐ痪䌂㼫豾풐", MaybeOfString("更䩟㤑ꬍ╧沥歟쮉"), "쐔");
    Test_ToFromBuffer_Check(997307, 58758, 127899, 965560, 45130, 358198, "䭘㏣", "鯄ⶢ򲢬ꌷ๊붷", "�䦽", MaybeOfString("蚾㺴ꅞｗၸⅶ"), "愍ᳬԂ");
    Test_ToFromBuffer_Check(774157, 878956, 389123, 731064, 118721, 400537, "롐摛籰ᑈ鏛࿑䕥", "䪳앰뙱Ł", "试缤즙掓ᖔ홻퐆ᕄ", MaybeOfString(), "䦬熯暻࢙⦩䚏쳂藏");
    Test_ToFromBuffer_Check(724290, 181266, 697872, 423942, 665226, 909264, "㞝ᐶ吅펄델鍱骨", "㯥㌋鰵나", "", MaybeOfString(""), "ⶂ뛹ຽ㢒이隔扭벙");
    Test_ToFromBuffer_Check(617813, 425773, 301375, 801616, 672856, 819587, "褅錉㖲怹毩棱䈋⬧㇫", "", "料긆곙梔�㴺빱", MaybeOfString("繉"), "㢦ￆ㽦廙쯱");
    Test_ToFromBuffer_Check(584196, 246194, 687126, 825443, 467464, 150886, "舖笺Ԗ", "漵溋⽼仈뷀㰤ꏜ�ꄎ", "", MaybeOfString("쉠瓊ế"), "좟၂ℋ轴ᓤ⁓蟅㏗");
    Test_ToFromBuffer_Check(967581, 106850, 50218, 413571, 902116, 345438, "ỹ듛", "갸紬揑땚⽴", "튷�误ಷ峇⌊⇓ꏽ", MaybeOfString("మ톓ᒂꢧ镆"), "䊆஺絠믤");
    Test_ToFromBuffer_Check(377634, 121851, 2053, 554840, 260809, 634415, "碖斥ശ鈛旚Ʃ", "椉", "㬸瓃册삿렔锼햊넢", MaybeOfString(""), "눦⁊囩쿈繦돉㌖楇轆戗");
    Test_ToFromBuffer_Check(557442, 758456, 441830, 52858, 523047, 983710, "륌췧⨏Ӿᬲ嗰", "䦝ꔐ", "䮋쵧�", MaybeOfString("㟝"), "Ꞹڟ튆랣㥳ᳱ筞뫊");
    Test_ToFromBuffer_Check(139714, 741864, 226681, 234519, 35999, 187399, "㎱䮠匱఻䭁ⓝ", "ִಚ㍥啷", "�烙ᜧ怖", MaybeOfString(), "ꆀὲ鋞♙⦒팾瑇");
    Test_ToFromBuffer_Check(571762, 233018, 609005, 691212, 899245, 224612, "㐺䲥ꊃἱ⌿炵籠", "爢틆⟶腈ἐঢ়ꧥ", "㌺䂮墬醈疹з㛧ጾ", MaybeOfString("办썾챔偫殫➔"), "瓧뤧薁俳ひኛ὚ꋚ�");
    Test_ToFromBuffer_Check(146837, 332417, 95267, 853353, 161551, 157026, "䁅졈", "㖺뼳ﻄ⮍⿦땄꘭麄", "꣧뵐", MaybeOfString("댻秛隢"), "ⷒ뀈㞴퇙");
    Test_ToFromBuffer_Check(946705, 540885, 15998, 527064, 501131, 206346, "贺ꡥ颕訑", "︾鵎押뮅", "ト鷞ℬ嶫잼ᦃ", MaybeOfString("欀댴兢"), "〶焻꺚ꥆᠨ煚㙊");
    Test_ToFromBuffer_Check(797565, 963699, 418658, 814236, 134126, 923362, "糑앗鑔녣銆", "᧜댷톇銘�笉ꌯ莦哳", "Ὰ", MaybeOfString(""), "〖");
    Test_ToFromBuffer_Check(214148, 483951, 901397, 434773, 978110, 191245, "ဪ桚䥸ꊘႼ갭历绝", "罉唅椸鉰憻窶鑪ฯ", "ჲ娪똡", MaybeOfString("鍗䯟堏㓉ᾄ"), "ꔵ갵");
    Test_ToFromBuffer_Check(106124, 568325, 413688, 88634, 930187, 561146, "峥읆畃糄됿퇋祑ﴌ阜잟", "ﰏ⥌㤘懣ﷅ紞䏸䠩", "炏쭊", MaybeOfString("鈱䔑Ɠ蜿埻짤"), "");
    Test_ToFromBuffer_Check(624639, 433708, 615320, 698908, 693362, 543369, "폣阱迕䶮ἐ￲鉳", "ᄋḭ㳠⚫�폆ᑒछ�", "୭흞惺聟", MaybeOfString("Ꙅ緐┓㏞☉ꇧ"), "꥽氻照飩艸䇄⹼�");
  }
  
  bool unitTestResults_CompRound_ToFromBuffer = runAsync(Tests_RegisterAll_CompRound_ToFromBuffer);
}
#endif