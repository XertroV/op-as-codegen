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
  
  bool Test_ToJsonFromJson_Check(uint id, uint startDate, uint endDate, MaybeOfUint@ matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, MaybeOfString@ region, MaybeOfString@ description, MaybeOfUint@ registrationStart) {
    Competition@ tmp = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region, description, registrationStart);
    assert(tmp == Competition(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_Competition() {
    Test_ToJsonFromJson_Check(129450, 573551, 355425, MaybeOfUint(), 712811, 690814, "㹦ꑳﭤℊ", "��勩ִ", "ʀሯ", MaybeOfString("ᲁ澯"), MaybeOfString("軻ᖧ⭾뒍뿣확"), MaybeOfUint(294609));
    Test_ToJsonFromJson_Check(403118, 996210, 292599, MaybeOfUint(481904), 681748, 661401, "礽ᚪ�司䌭덉", "䞫", "簔�좕큇", MaybeOfString(), MaybeOfString("ꊛ⍛謢䔩ᮃ놜冺"), MaybeOfUint(744556));
    Test_ToJsonFromJson_Check(199466, 509010, 762937, MaybeOfUint(936174), 391029, 656514, "䡓", "响憴பꋣ", "杒୒D䀗ꬨ憽畏", MaybeOfString("炤䩦ᛥ婫囼"), MaybeOfString("ﵴ"), MaybeOfUint(125510));
    Test_ToJsonFromJson_Check(201887, 700350, 291599, MaybeOfUint(13629), 499137, 549667, "꽝낸똞ꚣ筣", "", "撛首譤攊ԭ藙聍㚃", MaybeOfString("῏⻖蚇ங⨗萃"), MaybeOfString(""), MaybeOfUint(275663));
    Test_ToJsonFromJson_Check(198407, 474515, 501721, MaybeOfUint(70765), 360170, 925873, "⁥츟惦鷰ᖺ䖛", "뢵䗕", "뎧檺憃涳뛙䳗݃", MaybeOfString("ꧾ큽ⷾ뮁d更든Η"), MaybeOfString("መ꣡嗚㥱"), MaybeOfUint(61319));
    Test_ToJsonFromJson_Check(220027, 23962, 61424, MaybeOfUint(473376), 335004, 732228, "⩊", "", "됢菙ၰ㡽걅", MaybeOfString("៯ꭍڑ쀈ⵗ㏬"), MaybeOfString("ཞꑓ뷾�뤴焦"), MaybeOfUint(625858));
    Test_ToJsonFromJson_Check(828508, 617347, 317170, MaybeOfUint(296391), 575887, 254207, "�೻壎ⴍ�", "", "ꢗ軤衜", MaybeOfString("Ⱬꖗ႘ᖦﭭ见"), MaybeOfString(), MaybeOfUint(468463));
    Test_ToJsonFromJson_Check(312335, 554346, 17181, MaybeOfUint(864624), 348997, 47391, "", "ꆢ", "ଌ蓼﫤", MaybeOfString("㢝蔹"), MaybeOfString("暮쬂뾟ૢ"), MaybeOfUint(235494));
    Test_ToJsonFromJson_Check(8576, 23152, 201380, MaybeOfUint(245093), 672482, 129795, "쟬ﱩ媡요쉒▹ﯖ號㪳", "", "롥峡", MaybeOfString("㏲ᔲ逥"), MaybeOfString("㶴٨"), MaybeOfUint(811960));
    Test_ToJsonFromJson_Check(415355, 760015, 272504, MaybeOfUint(551413), 573011, 871194, "¨믕鋜㩋뭪莮홣�", "␁ﮛ", "�᭩앋�Ʞ恂慳", MaybeOfString("髷漻拹ⓨ淪"), MaybeOfString("湴ﳄᚬᖹ響"), MaybeOfUint(354192));
    Test_ToJsonFromJson_Check(471506, 827710, 844727, MaybeOfUint(321300), 249428, 456094, "䟘鱐ꄝ标妒䗶", "苅", "昢Ｈ罧㣜樐㽼㿝啻", MaybeOfString("髍澇㤘▝ħ蔋팪絠촊"), MaybeOfString("謒鞤ᶥ톪�"), MaybeOfUint(883112));
    Test_ToJsonFromJson_Check(765603, 958172, 390405, MaybeOfUint(733371), 931353, 523510, "扁⫦㿕롔", "㺋Ɏ㥂矮冠ឍ馒", "ꐊἸ᜸萿", MaybeOfString("ɯ밥�틭姻韷ሸ蜰晵"), MaybeOfString("킬簱ᡋᡰ墍"), MaybeOfUint(645878));
    Test_ToJsonFromJson_Check(24547, 424004, 580415, MaybeOfUint(248233), 513580, 543139, "✧", "䭅Ⅸ佰綐⨱㇟ꪒ飗", "", MaybeOfString("혭㞥"), MaybeOfString(""), MaybeOfUint(448613));
    Test_ToJsonFromJson_Check(64905, 260294, 13752, MaybeOfUint(834340), 741034, 291881, "Ⱆ뼣撁銹瞝ۄ", "�胛๫좧7䳟盒繕﷑㯌", "縼矢遲੿ᥫ虝Ѐ", MaybeOfString("釄⅟᥌"), MaybeOfString(""), MaybeOfUint(283554));
    Test_ToJsonFromJson_Check(524348, 300962, 104905, MaybeOfUint(), 726580, 59326, "�ࣔ潛", "邽쪿淬ฏ垄塍嵓", "�䰃", MaybeOfString(), MaybeOfString(), MaybeOfUint(379745));
    Test_ToJsonFromJson_Check(812903, 162028, 311819, MaybeOfUint(958812), 685947, 542289, "ᶀ䍾㎦猱銼௒", "⣳燘㉹", "扈僿䞚䲈㌒皬毸圌蒵", MaybeOfString("댍〱둫"), MaybeOfString("쇈๛"), MaybeOfUint(462683));
    Test_ToJsonFromJson_Check(26762, 578239, 536202, MaybeOfUint(), 590010, 497508, "", "쎊", "犆뗄㿻ꨕ䦳翧⤅", MaybeOfString("Ϩ죂갗爑"), MaybeOfString("඾"), MaybeOfUint(192767));
    Test_ToJsonFromJson_Check(674254, 176502, 230185, MaybeOfUint(756493), 683825, 419462, "⨮덢榚樤㞹㿼昡˶", "ݏ", "᠓᥵ۚ", MaybeOfString("㜆⏰‖馞褗"), MaybeOfString(""), MaybeOfUint(302662));
    Test_ToJsonFromJson_Check(890783, 322790, 990125, MaybeOfUint(759884), 506613, 251574, "ᭊ初", "至쐱ྟ찕崾흨", "샛Ꝩ騫㡪ῥ舙鬱", MaybeOfString("婯맕赕磳섇邋�⬞"), MaybeOfString(), MaybeOfUint());
    Test_ToJsonFromJson_Check(430147, 952656, 421799, MaybeOfUint(106956), 933416, 194770, "允틼潨ⶌ㚍뾮", "鞺꬯ᑯ鶠褒ó퓓驏", "Ꮳ煭휶㩎겘", MaybeOfString("⇹瓒䬓騀♖"), MaybeOfString("ᘅᆋ⍜༟䬻껀썅"), MaybeOfUint(176037));
    Test_ToJsonFromJson_Check(227185, 557533, 245926, MaybeOfUint(715973), 908975, 106381, "⸰", "᷑铁뮱ོ再푷", "�ᑠ蜴쬣ܹ㈸襁盟", MaybeOfString("抈⽊얳礞䛜"), MaybeOfString("ナᱽ⁚嘊ᦨ䏊"), MaybeOfUint(748249));
    Test_ToJsonFromJson_Check(341415, 715158, 536447, MaybeOfUint(155432), 293496, 876293, "烷", "蔝娞⠸จ͔䳠", "", MaybeOfString(), MaybeOfString("�ꚴ"), MaybeOfUint(55990));
    Test_ToJsonFromJson_Check(602416, 833884, 394098, MaybeOfUint(), 136229, 798602, "ପ厐䗌�䫁", "圾ᴿ", "耵", MaybeOfString("埈㩜ﾴ连㻰쮛"), MaybeOfString(), MaybeOfUint(454857));
    Test_ToJsonFromJson_Check(519051, 164551, 322748, MaybeOfUint(860289), 157374, 575994, "", "怢팃쪶蒌惴礰튫탱", "ꍏﾌ錁鳲", MaybeOfString("͆⩒轖떜饚兓꽻뺿"), MaybeOfString("ⱷ蕴峪蛅䬈줺ᠣᨲ瀔ሑ"), MaybeOfUint(347957));
    Test_ToJsonFromJson_Check(551658, 346280, 823493, MaybeOfUint(929475), 140354, 307753, "鄣㇦縡嚐ꇵ个豭῝", "擫đ益⬫꽎铖†㥯", "鮧ײַं〮맒꺧ۨ鰭∋", MaybeOfString("Ⱕ⤑ﻂ殩"), MaybeOfString("⧖"), MaybeOfUint(264554));
    Test_ToJsonFromJson_Check(645752, 38413, 854347, MaybeOfUint(962674), 954905, 514111, "�ؙꓦ挱", "萢䉄嗝嵾ⶻ姾큚ࢸ헗땚", "궜쁶縂⦠쮔", MaybeOfString("腬킰䷡伜㉜"), MaybeOfString("邏協걚"), MaybeOfUint(700426));
    Test_ToJsonFromJson_Check(957934, 789300, 756269, MaybeOfUint(298416), 90139, 689195, "쥙�蛳×ᜨ稡", "閣", "鄃燵笖띖䈝╙鄩覇", MaybeOfString("뮾眲餻"), MaybeOfString("ᙄ蠬咭詫界땆礷汫"), MaybeOfUint());
    Test_ToJsonFromJson_Check(904511, 913697, 587688, MaybeOfUint(272392), 451499, 314207, "≽⣙옔偀茹庱", "몄껱詞磥벹靆补푮", "썗겼ႝ엃븸⦽擱裊", MaybeOfString("Nခ툎妊⧔扦㿏Ⴇ⳵"), MaybeOfString("ꨞ﷨"), MaybeOfUint(133474));
    Test_ToJsonFromJson_Check(619631, 402655, 369631, MaybeOfUint(15795), 327023, 523424, "꪿䒼큝耷넲㴝ส뺔툰", "뎫횏ᩅ果룗̍", "쀞઎썬ㄙ", MaybeOfString("覞잰聡ﳆ"), MaybeOfString("ዄગဠ"), MaybeOfUint(218039));
    Test_ToJsonFromJson_Check(799550, 650221, 475412, MaybeOfUint(976713), 23857, 853388, "鍀㇕蟃෵㥔̳姇", "ᔼ燤⟐䶢⍈놋勊︈", "臠㾼ూ莚箌䄇䱱팝⑄", MaybeOfString("ୠ앧茾⷗냱"), MaybeOfString("鹬岣"), MaybeOfUint(521412));
    Test_ToJsonFromJson_Check(15466, 725515, 556412, MaybeOfUint(452588), 146125, 172722, "斜⭝毡쵴", "툕", "ㆋ⢳䏮", MaybeOfString("줏气ቮꓛᦱ軽"), MaybeOfString("쾾䂆䇩馴ᗡ태�별Ἰ絽"), MaybeOfUint(603419));
    Test_ToJsonFromJson_Check(166255, 761946, 851937, MaybeOfUint(254905), 727601, 870024, "絯", "䟁穳冥�ꠓ�쀇띧癤", "潍ෂꉫ닏詖", MaybeOfString("쥟뽿趰"), MaybeOfString(), MaybeOfUint(374360));
    Test_ToJsonFromJson_Check(353933, 373576, 63877, MaybeOfUint(757943), 917766, 78456, "杪䊫纂记ኂ〳螦䪾", "ᢘ곎", "羊斉깭", MaybeOfString("목楥ᾥ軫ꕠ"), MaybeOfString("鈉谯絾"), MaybeOfUint(927977));
    Test_ToJsonFromJson_Check(393537, 756072, 114684, MaybeOfUint(767444), 983379, 78003, "좦㔧ꛝ隗뱇ꍯ믥ፙ", "洴ⵐ멥阊", "笽ᓴ猦⩋ᗐ", MaybeOfString("쭁农祝ꠋ��숽"), MaybeOfString("㋖忙暨埆岥"), MaybeOfUint(150200));
    Test_ToJsonFromJson_Check(644538, 292130, 298748, MaybeOfUint(), 996103, 775344, "駱", "崖꒎ﺎ쵍븿�", "运Ꝉꊁᖚ", MaybeOfString("ﰹ珛㸤⇢㫢긩保넍颓"), MaybeOfString(""), MaybeOfUint(669562));
    Test_ToJsonFromJson_Check(174011, 213737, 623477, MaybeOfUint(193559), 683023, 92384, "㸁橏퉒⑧", "㌒줃鼏၌戙", "ᘐ₞", MaybeOfString("及帾衞틢"), MaybeOfString("Ⴗ鲧"), MaybeOfUint(95525));
    Test_ToJsonFromJson_Check(950017, 643452, 801136, MaybeOfUint(858090), 597958, 318819, "굆", "䙨兊蜛쭅ⲩ껒釙", "檘", MaybeOfString(), MaybeOfString("䩏沂䮄⍋"), MaybeOfUint(587926));
    Test_ToJsonFromJson_Check(278526, 343351, 679391, MaybeOfUint(181292), 805981, 660204, "", "굄ᩞ꿻᱕⽲�鶩�頌�", "伹└㸸", MaybeOfString(), MaybeOfString(), MaybeOfUint(493940));
    Test_ToJsonFromJson_Check(377649, 42869, 805623, MaybeOfUint(162899), 796322, 412163, "둪⸤Ὕ袧拣㰂", "仝觪蜌첿ꞌ", "ቺ⊴䒁逬빡￥ࢽ㺸", MaybeOfString("⁸"), MaybeOfString("獉橒�彮"), MaybeOfUint(695100));
    Test_ToJsonFromJson_Check(897533, 812680, 345656, MaybeOfUint(276803), 140684, 78261, "뙱節ಒጒ翯㺘", "嗽鬒挿⎜䬇心", "ᬏ뮩줙㠉ៅ倖催", MaybeOfString("턺"), MaybeOfString(""), MaybeOfUint(283138));
    Test_ToJsonFromJson_Check(536334, 435024, 599752, MaybeOfUint(45065), 112234, 465807, "䁿잸嘼挜䆪ֱ뺠ᶳ鵫᭡", "Õ툙복䠄", "ꪳ︑勇뤃㠛꿭", MaybeOfString("龽⽓瞁絨㰵恕೹⊅簬"), MaybeOfString("侺"), MaybeOfUint(220793));
    Test_ToJsonFromJson_Check(886074, 381838, 959028, MaybeOfUint(616386), 50250, 109296, "愰宫掽밣燭뒰", "�擏꿑썃�㢥搩", "섺㟷댜陆濲縈뭨琏⭁玎", MaybeOfString("⚩ꐰﴗ"), MaybeOfString("卣끒灛揩�譃嬨备ƨ"), MaybeOfUint(417675));
  }
  
  bool unitTestResults_Competition_ToFromJSONObject = runAsync(Tests_RegisterAll_Competition_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_Competition_Getters() {
    RegisterUnitTest('UnitTest_Competition_Getters', UnitTest_Competition_Getters);
  }
  
  bool Test_CheckProps_Competition(uint id, uint startDate, uint endDate, MaybeOfUint@ matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, MaybeOfString@ region, MaybeOfString@ description, MaybeOfUint@ registrationStart) {
    Competition@ tmp = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region, description, registrationStart);
    assert(id == tmp.id, 'field id with value `' + id + '`');
    assert(startDate == tmp.startDate, 'field startDate with value `' + startDate + '`');
    assert(endDate == tmp.endDate, 'field endDate with value `' + endDate + '`');
    assert(matchesGenerationDate == tmp.matchesGenerationDate, 'field matchesGenerationDate');
    assert(nbPlayers == tmp.nbPlayers, 'field nbPlayers with value `' + nbPlayers + '`');
    assert(leaderboardId == tmp.leaderboardId, 'field leaderboardId with value `' + leaderboardId + '`');
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(liveId == tmp.liveId, 'field liveId with value `' + liveId + '`');
    assert(creator == tmp.creator, 'field creator with value `' + creator + '`');
    assert(region == tmp.region, 'field region');
    assert(description == tmp.description, 'field description');
    assert(registrationStart == tmp.registrationStart, 'field registrationStart');
    return true;
  }
  
  void UnitTest_Competition_Getters() {
    Test_CheckProps_Competition(394184, 158696, 888896, MaybeOfUint(157486), 388682, 89158, "湩ᣖ迦", "寔옛�ᠱ", "꟪뢖棱꡺鼀ൃ橗", MaybeOfString("�싺"), MaybeOfString("萦﫦䉕㌄搡즗쿵"), MaybeOfUint(490383));
    Test_CheckProps_Competition(813542, 54851, 704714, MaybeOfUint(211084), 990278, 845199, "Ѳ䊣", "", "݋隘诹謁﹞ඵ壿", MaybeOfString("�拺윰蘆"), MaybeOfString("饯ꜘ"), MaybeOfUint());
    Test_CheckProps_Competition(548490, 493314, 149817, MaybeOfUint(335271), 362667, 409053, "覵鲃實㍜ꮗ", "충멵", "ꋟ툴䜮ᚗ", MaybeOfString("ᒧឝ밇�拣䵱䌏�"), MaybeOfString("㶈�㻡뼇ṽ杢⅄"), MaybeOfUint(837902));
    Test_CheckProps_Competition(183274, 457496, 643726, MaybeOfUint(56077), 281728, 935876, "ﺷ蹳姈⑻㤏�撵ߨ䯂", "뇎≌膅๴޷Მᑨ", "챳䫑", MaybeOfString("惍됞ᨴ㪂ꦽ㎀"), MaybeOfString("楚"), MaybeOfUint(703391));
    Test_CheckProps_Competition(945399, 696757, 381002, MaybeOfUint(81777), 23362, 255319, "歡洔槰", "늒竛뗧돥轈ꭾ", "턆뙚높䋪", MaybeOfString("㶑ꔘₜ齬聎雄攩澴"), MaybeOfString("挶㊜䱁"), MaybeOfUint(469838));
    Test_CheckProps_Competition(153273, 853065, 927946, MaybeOfUint(), 146796, 378085, "䑵蚖䜙莬晰ࠚ㟜덡믗", "炔ᒚ레휺", "築뢰珊틑", MaybeOfString("痒"), MaybeOfString("넚敦壁ꦏ썱줖"), MaybeOfUint(330938));
    Test_CheckProps_Competition(514263, 582603, 546302, MaybeOfUint(252345), 927020, 868627, "⬋㫟슷", "죂砗죋穽⽍捲껠ﲜ", "ꎴ흨榼", MaybeOfString("䨗ও�휋"), MaybeOfString(""), MaybeOfUint(27558));
    Test_CheckProps_Competition(40242, 181358, 266408, MaybeOfUint(), 233096, 807284, "⠤迤빩夞", "뼗␺", "ஙᆴ걾�蹦⛛걍", MaybeOfString(), MaybeOfString("ࠆ祊"), MaybeOfUint(930379));
    Test_CheckProps_Competition(437549, 920471, 402801, MaybeOfUint(77000), 83132, 874988, "嫈", "顎", "琢췹쓍湐ય", MaybeOfString(), MaybeOfString("좗謧痀㬙"), MaybeOfUint());
    Test_CheckProps_Competition(518141, 153623, 2628, MaybeOfUint(585479), 848405, 917537, "쯟㝒⒄색Ї", "鏟灭", "횄", MaybeOfString("༏큝㫓"), MaybeOfString("퉾돂띨體륯幈᠀㯱"), MaybeOfUint(973039));
    Test_CheckProps_Competition(431245, 878595, 679739, MaybeOfUint(719941), 357930, 229639, "叼熃ᐳፎ䮐잝", "银撸쪄", "", MaybeOfString("㻗﬽팊�슍郫홟㕤"), MaybeOfString("⁏㸸㓌࡯"), MaybeOfUint(945184));
    Test_CheckProps_Competition(162544, 40744, 132029, MaybeOfUint(608398), 924696, 705766, "姺㼙", "齶褱炋�Ժ蕧枪ⳳ", "℺꣺췽㇋嘘泅돖", MaybeOfString("轁竁怒"), MaybeOfString("攤訞♹⑼驏᩽嬨"), MaybeOfUint(805260));
    Test_CheckProps_Competition(752226, 396439, 143921, MaybeOfUint(147686), 969575, 818681, "", "ॡ弨犳㮲", "屨蜍蕠俠尉紸?", MaybeOfString("烈罽췜歵ȧ"), MaybeOfString("坊₰糣"), MaybeOfUint(482768));
    Test_CheckProps_Competition(925363, 355531, 140197, MaybeOfUint(917384), 404377, 165205, "ﶊ响⮷�쒢ﻖ쾁᳓", "圙枩紂鯴떩ℭ", "", MaybeOfString("骗뱼扟킋泎ⲅ朓复䚃"), MaybeOfString("�"), MaybeOfUint());
    Test_CheckProps_Competition(961252, 156441, 490015, MaybeOfUint(), 895579, 267089, "견ﮜ镕㠇", "ㅠ", "⮵⧿堫竎", MaybeOfString("䈥⏀"), MaybeOfString("뒏鋦ឱ釂䕳"), MaybeOfUint(289630));
    Test_CheckProps_Competition(747574, 598425, 333296, MaybeOfUint(794190), 137515, 526337, "챆맰", "嶽衃鳱", "詻", MaybeOfString("ᡶ⛥杭貴"), MaybeOfString("㯴"), MaybeOfUint(717791));
    Test_CheckProps_Competition(449432, 307209, 349405, MaybeOfUint(688307), 12745, 392138, "", "㣄咊ꟁ䣝", "䗎稦⡠式㏩됤蓼", MaybeOfString("膎"), MaybeOfString("졧娒㜽㆒"), MaybeOfUint(463792));
    Test_CheckProps_Competition(482375, 442104, 534976, MaybeOfUint(119300), 422635, 583148, "�씼旝吾捣嶟廌⁹", "股폰拉﫜禧ᝃ", "鉵朖Ⴈ", MaybeOfString(""), MaybeOfString("⯤槯梾⛬㬻৷䪨꒥"), MaybeOfUint(489560));
    Test_CheckProps_Competition(284881, 92853, 841821, MaybeOfUint(896621), 60867, 995994, "쟹膗堳뾒뮦놘蘜뗌痿", "䩶Ϡᱮዖ�匶", "嫀᮶๑肬區뫴ᵼ뾆", MaybeOfString("⇐춻嶻"), MaybeOfString(), MaybeOfUint(56836));
    Test_CheckProps_Competition(500196, 187953, 516520, MaybeOfUint(878758), 333793, 604829, "㘦恿땊₏텿", "켳⌁읚罻�ꨯꧼᖝ", "卨펟漜႔婴矲", MaybeOfString("⷗륶땣ᢦ"), MaybeOfString("脟篱"), MaybeOfUint(849193));
    Test_CheckProps_Competition(814728, 974617, 284426, MaybeOfUint(321742), 688748, 728971, "묒ꀓ䤢౤", "蓸�舆", "η㝯ӧ㛏図䋘䮢", MaybeOfString("ည쥙鎫籄"), MaybeOfString("ᝁﲏ牼"), MaybeOfUint());
    Test_CheckProps_Competition(524510, 747628, 727307, MaybeOfUint(), 967723, 55659, "잫긬ᒦ窸䃿ﲩ�脰矫", "Ჿ䟪롶꠸텤㦺", "塀", MaybeOfString("󇸷"), MaybeOfString("밅"), MaybeOfUint(889541));
    Test_CheckProps_Competition(778262, 501081, 742990, MaybeOfUint(454580), 681249, 128288, "兡䏰糗鿾돵", "푈簵", "", MaybeOfString(), MaybeOfString("搛"), MaybeOfUint(475422));
    Test_CheckProps_Competition(89833, 478706, 227812, MaybeOfUint(841486), 207862, 97523, "", "ꢍ灰㩈㉡", "�亭瓩얩䛯Ⳗ粓䞎", MaybeOfString("ĕ�뎿�"), MaybeOfString("嵭ｼ筬薥㤌"), MaybeOfUint(397931));
    Test_CheckProps_Competition(421838, 392152, 54503, MaybeOfUint(563227), 406325, 567517, "鰸ꆕ⺕缫茧餌", "軫锸", "ﭝﬂ冺惼ᆵ춳Ầ퇷慉", MaybeOfString("偌눘胪⌊핤촆᠅絵橱"), MaybeOfString(), MaybeOfUint(146269));
    Test_CheckProps_Competition(71779, 802021, 713501, MaybeOfUint(813733), 127503, 850176, "", "暪棱館迠", "疭멵耨퀯万ᴕ゚蠇", MaybeOfString("騆�䂁ㅽ遦ﾅ偂忺"), MaybeOfString(), MaybeOfUint(948044));
    Test_CheckProps_Competition(926072, 121232, 341477, MaybeOfUint(171027), 499359, 987325, "�ﮗ棼檹㪡", "缶", "虒俀耥౩ꡯ᧠", MaybeOfString("鳼歿捺퇵�렡ڣ"), MaybeOfString("滔㘎ᔳ땳쎢䓲Ự"), MaybeOfUint(743958));
    Test_CheckProps_Competition(236077, 527817, 419668, MaybeOfUint(81624), 316700, 872577, "谓", "Ꮞ飑ႎ", "螈蘰⩉呢唼Ṑ", MaybeOfString("冠愃躊ꁸᶝ"), MaybeOfString("栧ꝱ⺺Ҩ蓟"), MaybeOfUint(952904));
    Test_CheckProps_Competition(610985, 292558, 647747, MaybeOfUint(239218), 799355, 37192, "㥴岊隸蟅襎", "튡᷿㒶欳ꗵ", "삢〨휓퀒᯺싵뚔", MaybeOfString("ᒟ"), MaybeOfString("ፂ�꿘腷頀׭벾䎺"), MaybeOfUint(526193));
    Test_CheckProps_Competition(22511, 291255, 45409, MaybeOfUint(543725), 336679, 60944, "괘᪄", "罫䵮웤", "菽䡐膅⫳㸷앉뤸퉡", MaybeOfString("됨㾕봠簜߲쫋侵"), MaybeOfString("裘쾕䮝�દ咾釫薁飏"), MaybeOfUint(699301));
    Test_CheckProps_Competition(751134, 568489, 713956, MaybeOfUint(), 241452, 155058, "屳", "묈䳖튞║ｷܫ䪡�", "", MaybeOfString("師뇆쟨ਘ獘줪⏉"), MaybeOfString("ဖ륒ਭപ䂬⛦わ힢啽"), MaybeOfUint(209998));
    Test_CheckProps_Competition(923497, 674052, 634565, MaybeOfUint(), 51694, 373873, "", "댋", "㦌ꯊૂ", MaybeOfString(), MaybeOfString(), MaybeOfUint(483076));
    Test_CheckProps_Competition(416819, 559176, 215951, MaybeOfUint(458722), 18020, 332778, "㧛�庁㻐쐱ꥵ썳羨ʻ", "␱ᄴ", "恶�", MaybeOfString("종ᕉ豼೵㧑훷뢱⃹⑾⿚"), MaybeOfString("힄팁牛붔଴㏧"), MaybeOfUint(393001));
    Test_CheckProps_Competition(753390, 647034, 50284, MaybeOfUint(127133), 482767, 613995, "숵", "녱撅턒", "᭵", MaybeOfString(), MaybeOfString("憧쀓웞"), MaybeOfUint(615038));
    Test_CheckProps_Competition(802924, 663322, 343050, MaybeOfUint(295740), 740829, 699975, "ꚰﾹࣴ", "麻룯흹댒䌤∇�넢", "ﰹ槉꽽还", MaybeOfString("䯻犖檣䗜띪鼖㛁귿"), MaybeOfString("ﵓ"), MaybeOfUint(674031));
    Test_CheckProps_Competition(466166, 200762, 94034, MaybeOfUint(880448), 954290, 631994, "․嵉�晴鞔ᥞ", "ꄀ䇿ʇ⽕鯪", "堷㐕ᶺ쥬ⳝ뮯�", MaybeOfString("铙ឡ撨㱫㻃뤉�鐠੷"), MaybeOfString("敚ꊔ䝻ᗓ騵ꦎ鈌䧢"), MaybeOfUint());
    Test_CheckProps_Competition(788000, 733152, 736344, MaybeOfUint(165383), 681803, 578728, "醭偿紥", "᪊靍㱦ᇉ", "芘뱷", MaybeOfString("裪≖葉"), MaybeOfString("꾟눗ᠤጾ焤☜"), MaybeOfUint(396884));
    Test_CheckProps_Competition(885502, 557099, 861827, MaybeOfUint(684080), 802195, 601746, "㬉溸ѳ", "뻽钰嚚", "隌셑�ᜯ䜲횧", MaybeOfString(), MaybeOfString("몲쨉�똣럴"), MaybeOfUint(780395));
    Test_CheckProps_Competition(556563, 896246, 710665, MaybeOfUint(560918), 202947, 551677, "塆猉즊镴型�", "눏", "괳≈乆ใ", MaybeOfString("봣쩰ᾑ笍"), MaybeOfString("杕ी玫伜埢㶴象랖鉏"), MaybeOfUint(722458));
    Test_CheckProps_Competition(429359, 403193, 160095, MaybeOfUint(268205), 405090, 452727, "긆䭆떞硞햅", "뤧옠䝳﷠", "", MaybeOfString("�拼ᤩㄛ嶂"), MaybeOfString(""), MaybeOfUint(942830));
    Test_CheckProps_Competition(950069, 241230, 693739, MaybeOfUint(), 721455, 385268, "顑惱㱚뢮", "", "懵�偣鍝", MaybeOfString(""), MaybeOfString("榮￬뜙吖"), MaybeOfUint(273664));
    Test_CheckProps_Competition(885074, 424335, 60414, MaybeOfUint(), 101696, 802063, "큓禥�", "蒢僟", "떕걒Њ薋⛢�", MaybeOfString("䶚똭丢먊ਏ"), MaybeOfString("鷵"), MaybeOfUint(842090));
  }
  
  bool unitTestResults_Competition_Getters = runAsync(Tests_RegisterAll_Competition_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_Competition_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_Competition', UnitTest_OpEqSimple_Competition);
  }
  
  Competition@ lastChecked = null;
  
  bool OpEqSimple_Check(uint id, uint startDate, uint endDate, MaybeOfUint@ matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, MaybeOfString@ region, MaybeOfString@ description, MaybeOfUint@ registrationStart) {
    Competition@ o1 = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region, description, registrationStart);
    Competition@ o2 = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region, description, registrationStart);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_Competition() {
    OpEqSimple_Check(393455, 392207, 212987, MaybeOfUint(860435), 499239, 803100, "抳滛ỉ꟢펫픶", "", "罳臁", MaybeOfString("탏핈霋흽"), MaybeOfString("꒲풜豈窏ｅ"), MaybeOfUint(693970));
    OpEqSimple_Check(221991, 960330, 377064, MaybeOfUint(511262), 903418, 366202, "풜ᬃ⿠", "렰佹膴", "﩯ᘞ쉓㻇娍쪁ᆬ鬹⁺", MaybeOfString("峵כֿ鐄ℛݙᚬ쇳濶"), MaybeOfString("퐕썷ᯱꛞ쏒㚉뙶"), MaybeOfUint(131073));
    OpEqSimple_Check(236713, 75537, 164045, MaybeOfUint(833738), 3897, 413385, "Ŧ⃡釄Ἂ떋雄忙凌", "ꂅ䔲", "后⡆鍙莕", MaybeOfString(""), MaybeOfString("쮟허"), MaybeOfUint(288195));
    OpEqSimple_Check(531474, 7923, 471876, MaybeOfUint(691948), 847881, 20283, "", "싙", "㾢笏㶆ʱ䄔鍚뵭", MaybeOfString("ꨕẽ뮱"), MaybeOfString("떚核륙呷良ꥰ﵀쨔"), MaybeOfUint());
    OpEqSimple_Check(468715, 840953, 20188, MaybeOfUint(658055), 862477, 765765, "매㘆천⥠", "", "Ⅵ", MaybeOfString(), MaybeOfString("慹"), MaybeOfUint(718449));
    OpEqSimple_Check(909595, 422278, 333641, MaybeOfUint(468333), 37294, 25526, "䔘⾆䲺", "胤ⲞꫢᲉ䞧શ", "崒⁗∾웇Ⓩᱭ", MaybeOfString(), MaybeOfString("ﲁ들≱髀饁䱯淵"), MaybeOfUint(207068));
    OpEqSimple_Check(397768, 292550, 12795, MaybeOfUint(211191), 794253, 325731, "奟㜫䞞祡", "赬ى", "휇莖错캈⧥", MaybeOfString("괗饖㪟믢"), MaybeOfString("靿ᩬ□"), MaybeOfUint(704848));
    OpEqSimple_Check(780762, 891985, 853751, MaybeOfUint(538820), 716907, 777120, "썊䯲⏔銄ធݤ謇든", "睟娬䇒侮ꀵٽ촷䒠ბ", "�ЊЫ", MaybeOfString("ⱬ褑ཧ捺"), MaybeOfString("׊�猋┕緰튅"), MaybeOfUint());
    OpEqSimple_Check(522160, 104104, 809489, MaybeOfUint(854291), 590083, 445348, "뱉᧡⬆ꁓ縬", "ၧᮑώᘢ㵅绰혏", "ස", MaybeOfString("콨"), MaybeOfString("օ⥶批钅ೢꨉ�툱"), MaybeOfUint(279639));
    OpEqSimple_Check(759681, 255643, 98074, MaybeOfUint(), 427331, 254977, "춣ꯎ竚ꂠꋽঞ꼥ᗁ", "㸵", "扮", MaybeOfString("덍갽郭뱜悶"), MaybeOfString("࿏"), MaybeOfUint(754367));
    OpEqSimple_Check(793096, 894254, 829588, MaybeOfUint(303636), 575611, 276400, "脫", "戃䶆ꙕ殺", "�ꁟᾅ", MaybeOfString("賥硬⭷"), MaybeOfString("畞锑舨䳑秲櫩䗥讖宦뻸"), MaybeOfUint(48706));
    OpEqSimple_Check(794688, 783622, 424914, MaybeOfUint(642478), 569423, 617826, "薾ꔲ", "�냀㛛ꂧ", "ᕺ摃⎎㚽ցޅ郹똹텽㙝", MaybeOfString("녮งꦠ멖�ͥ᣾"), MaybeOfString("쎑ˬ퍪쉹٥"), MaybeOfUint(943082));
    OpEqSimple_Check(475754, 917838, 203988, MaybeOfUint(), 62424, 863464, "ꡂ၌鳿윀꡴⻜銵", "뮓荔", "ﺙ▧坡ꍎ㴱皀梆", MaybeOfString("閯ﺸ娂ᑠ쟀냖럢쩪"), MaybeOfString("旌"), MaybeOfUint(421894));
    OpEqSimple_Check(463120, 610831, 834401, MaybeOfUint(835211), 290586, 543146, "鵐剈箆玬㖳驡囈", "半⩩⁦皝义㗡뺅捻", "厳눟ਵ⺊", MaybeOfString("䧂脑囲ﻯ機"), MaybeOfString("묺�좢統"), MaybeOfUint(968043));
    OpEqSimple_Check(958667, 223128, 253073, MaybeOfUint(787386), 605167, 497191, "ଵ峎㐇苘殾ﰃ", "甂濚濺췲룮ྮ", "", MaybeOfString("奋豮ⴈ֑"), MaybeOfString("䊀덒턗屷硷ﵜ⫌"), MaybeOfUint(796197));
    OpEqSimple_Check(147837, 128962, 901043, MaybeOfUint(292877), 851901, 572024, "媿餧윭ࢫꂘ", "䗦悛燓뢅䃐ೃḡ些窩", "譇橾⻊䮰", MaybeOfString("蝅迨︧兀ࢺ鱈䛳"), MaybeOfString("퐔"), MaybeOfUint(696064));
    OpEqSimple_Check(331215, 897341, 155958, MaybeOfUint(199578), 42866, 410482, "䟒⹗㭁왓ꄟ屽", "膃", "▴れꘅ澏ⱜ率Ⅳ魨粑", MaybeOfString("癓"), MaybeOfString("憚邷塙ꢖ嶰읦逕"), MaybeOfUint(111470));
    OpEqSimple_Check(573616, 37300, 800704, MaybeOfUint(812180), 101815, 86998, "먓", "龜릇v⍱隊Ⳃ", "㻢뜵㺸䞭촁챑", MaybeOfString("繶藩륍韚킉迊ṱ帮—"), MaybeOfString("퐍⟳庶✨"), MaybeOfUint(549628));
    OpEqSimple_Check(303267, 239582, 15682, MaybeOfUint(970359), 225588, 654100, "", "礚쑲∆ⴝ", "⶯协⌜᳜", MaybeOfString("偶텒綒"), MaybeOfString("烨"), MaybeOfUint(498402));
    OpEqSimple_Check(637479, 838732, 495566, MaybeOfUint(), 40671, 948715, "ᚠ듞莹桏져墩먘ꀛ쏕", "", "西뙶븳㊯갘༙ᇳ", MaybeOfString("⏏᧎䫁"), MaybeOfString("斍⏀쌛Ⓛ薚懙룙㎐"), MaybeOfUint(932869));
    OpEqSimple_Check(720897, 315764, 558349, MaybeOfUint(805278), 515030, 486011, "䆀", "闻", "㌼瑨ᘂㄺƫ㪙뇞轓", MaybeOfString("魍镠렳"), MaybeOfString(), MaybeOfUint(454708));
    OpEqSimple_Check(733824, 28598, 546073, MaybeOfUint(40017), 186066, 605805, "㌌ࡍ埔캫", "㼗䉕ꐡ딞눼诠ﱐ", "෨끌", MaybeOfString(), MaybeOfString("梖ᮺ勫Ꭼ"), MaybeOfUint(849529));
    OpEqSimple_Check(225780, 941754, 696577, MaybeOfUint(19538), 996245, 955059, "踼㛃踟괮", "ᾓ瞀鵰삫ᾄ龲尬度ⶰ", "牌", MaybeOfString("闥媰⹄̥グ㘁"), MaybeOfString("惢䘒�쪄"), MaybeOfUint(346449));
    OpEqSimple_Check(602322, 102070, 771852, MaybeOfUint(335875), 5427, 68808, "惑涑홨凚ⷕ鑽뎎", "◹۝", "秘号", MaybeOfString("Ư⥣䞘询獽ᗒ攅樘犝"), MaybeOfString("뿹ꚍꖂ翏坌뵱푑"), MaybeOfUint(446889));
    OpEqSimple_Check(193240, 762141, 56696, MaybeOfUint(), 121879, 914953, "䇹筽㪥듚悕ﳊ", "灐퇽", "俁㿾Ꮳ⢝전粨ꭊ鑊驠", MaybeOfString(), MaybeOfString("㳏⽀"), MaybeOfUint(582402));
    OpEqSimple_Check(67959, 550126, 747140, MaybeOfUint(967331), 975449, 762468, "倢豊ǌ皁꺼㲇߇", "㼅﬎梡깺⨎㢂", "岁岮賛㚡�", MaybeOfString("♈ꭰ蘣㴧튂䄕"), MaybeOfString("瓜ᬥ镹ꕰ喭﬚﹢"), MaybeOfUint(611520));
    OpEqSimple_Check(92494, 619517, 74358, MaybeOfUint(960369), 596394, 805620, "⹰럠靫ѫﶝ鍏톴", "ꉼ嵠", "붺︈გ萩➽縴邾滁﫿", MaybeOfString(), MaybeOfString("檖"), MaybeOfUint(718283));
    OpEqSimple_Check(904672, 144455, 463234, MaybeOfUint(847424), 120708, 360974, "㍙⊘", "╱赏欣ﳋ乯댌", "䣛䯬䴻甼䧁ፍ�踝悐", MaybeOfString("热⹉㊘၁᫄鍹䨢"), MaybeOfString("灪藂Ԭ剻敝"), MaybeOfUint(374859));
    OpEqSimple_Check(280413, 225358, 115423, MaybeOfUint(854985), 92252, 834957, "䓓潶꜓⵬㊇ᖕ⺸⣥", "�憕€鹷蛶鞱穥", "拳沈", MaybeOfString(""), MaybeOfString(), MaybeOfUint(879936));
    OpEqSimple_Check(783001, 936371, 854275, MaybeOfUint(867662), 786369, 395215, "䲛ꌲ", "딝", "", MaybeOfString("긺簼곽⺲"), MaybeOfString(), MaybeOfUint());
    OpEqSimple_Check(461071, 968142, 182715, MaybeOfUint(21479), 131544, 294880, "蚞ꨑ困絵舸", "隆", "䱨换ᵘ蒭ᦇ䳖뻏䞒㴭䔥", MaybeOfString("䜦鈷兔呃율ᤞ鍜ꆟ"), MaybeOfString(""), MaybeOfUint(22390));
    OpEqSimple_Check(363250, 943936, 907649, MaybeOfUint(), 174588, 79375, "衈ܔ肽粪噷鼚㏊", "㏙伥╙灌띎噋ꌲ皒퉰鞗", "음垮�", MaybeOfString(), MaybeOfString(), MaybeOfUint(279708));
    OpEqSimple_Check(643840, 872409, 192506, MaybeOfUint(824996), 599798, 150838, "䧱돉㘖惢ꂂ", "ꇮ�꣖ⱍ", "␲浧뭧핾მ", MaybeOfString("義瘺픲䨴쏸"), MaybeOfString("፡␯撂ᴥ䂽ᧁ"), MaybeOfUint(639847));
    OpEqSimple_Check(59050, 856622, 671591, MaybeOfUint(736679), 549988, 466985, "苔ꆡ郮", "谔˧憦䫀袗", "䋠갎炚潟", MaybeOfString(), MaybeOfString(), MaybeOfUint(569972));
    OpEqSimple_Check(753179, 122070, 50692, MaybeOfUint(753175), 224869, 232545, "㨫", "ࠋ嬫嗶胕库⇬", "䴳攃", MaybeOfString(), MaybeOfString(), MaybeOfUint(556133));
    OpEqSimple_Check(532394, 922379, 638577, MaybeOfUint(265953), 434696, 161861, "⧹", "唤槷埋攻", "Һ", MaybeOfString(), MaybeOfString("㲊覌筎ⶩ"), MaybeOfUint(745545));
    OpEqSimple_Check(576553, 504590, 387499, MaybeOfUint(878556), 304429, 433054, "⯌ꯘ眝ب", "탨轭쫓", "�⒚¢飸⣌䂜쾣", MaybeOfString(), MaybeOfString("㾕臨쬩㶷玖"), MaybeOfUint(942010));
    OpEqSimple_Check(349531, 221720, 286849, MaybeOfUint(217295), 172280, 399294, "Ჶᔲ疡谉闷䖕✚", "ᕀⲑ症鿸큿㱘嚶", "衐⾕쩿ी狲篌", MaybeOfString("㌅닯"), MaybeOfString(""), MaybeOfUint(397942));
    OpEqSimple_Check(958870, 972984, 878946, MaybeOfUint(984216), 882559, 596054, "ᦦ�", "씨蔀ᖃ᫣똇", "Ḅ箿ﹸ髕篌", MaybeOfString("汃Q䵈"), MaybeOfString("ꄧ岶ࠑ"), MaybeOfUint(59487));
    OpEqSimple_Check(31576, 129914, 725477, MaybeOfUint(847615), 688227, 384502, "묻褹ꐶ⓴′", "�❨膧郾ᨓ", "葥汿뗼Ⲉꅩ糧", MaybeOfString("픢㻯蕛⑰"), MaybeOfString("焸镄辠㼉瑸"), MaybeOfUint(270279));
    OpEqSimple_Check(488481, 681282, 91594, MaybeOfUint(273790), 9880, 45791, "膑", "Ⲇ璡⩘烈ઓ籎뵡", "馮", MaybeOfString("ඛ뼧ￎ注࿍塾ᨑ"), MaybeOfString(), MaybeOfUint(805078));
    OpEqSimple_Check(245452, 87934, 541446, MaybeOfUint(837186), 574364, 520926, "跤鼝", "틍냿ꬎஎ⃳੫貺軁测ᠾ", "႒鐽⍒싊딯", MaybeOfString("뙦鰠ﰁど谙"), MaybeOfString("莰䍇औᇆ㿾揚낆놆"), MaybeOfUint(316615));
  }
  
  bool unitTestResults_Competition_OpEq = runAsync(Tests_RegisterAll_Competition_OpEq);
  
  /* Test // Mixin: ToFromBuffer */
  void Tests_RegisterAll_Competition_ToFromBuffer() {
    RegisterUnitTest('UnitTest_ToFromBuffer_Competition', UnitTest_ToFromBuffer_Competition);
  }
  
  bool Test_ToFromBuffer_Check(uint id, uint startDate, uint endDate, MaybeOfUint@ matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, MaybeOfString@ region, MaybeOfString@ description, MaybeOfUint@ registrationStart) {
    Competition@ tmp = Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region, description, registrationStart);
    MemoryBuffer@ buf = MemoryBuffer();
    tmp.WriteToBuffer(buf);
    buf.Seek(0, 0);
    assert(tmp == _Competition::ReadFromBuffer(buf), 'ToFromBuffer fail: ' + tmp.ToString());
    return true;
  }
  
  void UnitTest_ToFromBuffer_Competition() {
    Test_ToFromBuffer_Check(490366, 613160, 426468, MaybeOfUint(621746), 118288, 431365, "槪", "਄劦", "㥂哙㍜殮⧽", MaybeOfString(), MaybeOfString("䄍缕臉"), MaybeOfUint(312237));
    Test_ToFromBuffer_Check(729506, 512209, 123656, MaybeOfUint(150495), 239060, 142066, "쥲拝", "쪚ꗼ", "⣃ﻝ蛗뙱", MaybeOfString("ࣤ"), MaybeOfString("ꌉ⦿䫏찣"), MaybeOfUint());
    Test_ToFromBuffer_Check(760473, 549906, 156703, MaybeOfUint(504678), 286481, 447451, "핽�᫏ᇵ͈㺒郊ᄾ", "긒译Ố椮㕋琲", "傒撵", MaybeOfString("粜唬䃩벋"), MaybeOfString(""), MaybeOfUint(612549));
    Test_ToFromBuffer_Check(248742, 307951, 966690, MaybeOfUint(), 352464, 913879, "㶆㿙冫৐ᩒӄ", "ｲ㾔臰븊륅�챴쳯", "裎⒉ꙹ", MaybeOfString("Ⴒ"), MaybeOfString(), MaybeOfUint(499243));
    Test_ToFromBuffer_Check(691784, 326971, 688420, MaybeOfUint(603293), 843770, 592914, "㚥≐", "ꦏ", "", MaybeOfString("蛬�卻恀"), MaybeOfString("ꀜ䗹叚ឫ"), MaybeOfUint());
    Test_ToFromBuffer_Check(342121, 252686, 330939, MaybeOfUint(816502), 588370, 525529, "", "峽ᱪⓣ䝚ࠌ臼", "싔", MaybeOfString(), MaybeOfString("써ꝍ约׊へ坾䇲"), MaybeOfUint(691552));
    Test_ToFromBuffer_Check(740264, 459935, 217232, MaybeOfUint(), 709915, 790967, "쑶敭큇ᤅ⩭", "ຨの⧚諍愥", "", MaybeOfString("㫴ݲ䗞儾㏻劣❜料痁혈"), MaybeOfString("룩䚪怐齵連�ړ犺"), MaybeOfUint(764515));
    Test_ToFromBuffer_Check(954519, 85293, 537186, MaybeOfUint(), 494885, 205541, "醱", "䵝洔榌", "Ꚃ╥柱", MaybeOfString("큎뒏⫛⪃璔氉恌"), MaybeOfString("뢂梱쒰ᘤ�6蠕씹"), MaybeOfUint(983162));
    Test_ToFromBuffer_Check(115545, 260709, 491002, MaybeOfUint(24133), 633860, 560069, "㙿어瘠", "", "౜撷", MaybeOfString("湧섳⒜㓚苵孇"), MaybeOfString("쟝䫂⊘放"), MaybeOfUint(632768));
    Test_ToFromBuffer_Check(406274, 898687, 319491, MaybeOfUint(350748), 450463, 68765, "", "ꦧ훭⮘祘ᠶ灏숆", "粪ጃ퓣䒦⪢㈍", MaybeOfString("⨏취ಗᨠﳄ"), MaybeOfString("䜋蠎䵪㻌諯"), MaybeOfUint());
    Test_ToFromBuffer_Check(127483, 93957, 358699, MaybeOfUint(571741), 449880, 492424, "贷誸暭", "ᜰ︺ꮛ", "뀃궳顂", MaybeOfString("ᆄᒩ﷿"), MaybeOfString("૔"), MaybeOfUint(645363));
    Test_ToFromBuffer_Check(681555, 998119, 932286, MaybeOfUint(124661), 194583, 816724, "襢픘켻㵛�꣎⺞㨱㘌䫀", "䠃엛誐졑๋ѕ", "䕮쯦὜㖔巍", MaybeOfString("玶暤"), MaybeOfString(""), MaybeOfUint(512740));
    Test_ToFromBuffer_Check(35511, 107080, 18330, MaybeOfUint(556642), 360037, 748583, "ꍌ섴날ꧾ截௻⅘ﮪ䭐", "", "᮵樇", MaybeOfString(""), MaybeOfString("쮎㸣ఁ媶홪麉醙�"), MaybeOfUint(949646));
    Test_ToFromBuffer_Check(787347, 55243, 100513, MaybeOfUint(), 70629, 374592, "㟊쌭㧮琭⮜뎬뫛", "쾻骯䴳垇跌ꂺ㟭莇", "粄繧ở蘝", MaybeOfString("쑔ᣛﻃ瞽�쀮ꢸ쭾甤"), MaybeOfString("몗헗ᘖ疰厔ǜ韊槾᜴"), MaybeOfUint(779022));
    Test_ToFromBuffer_Check(849299, 534295, 545877, MaybeOfUint(533765), 34746, 563132, "ⰾ肧뛅皤ꘑ閾਽ލ", "", "罔㕮࠺쨾曽", MaybeOfString("䢫굽㤞㱸䶃鬨"), MaybeOfString("Ï篒ꝱ쭁ｹ䷿￫蕬"), MaybeOfUint(169190));
    Test_ToFromBuffer_Check(678725, 418005, 95318, MaybeOfUint(528577), 664365, 366476, "Ɉ失仗러", "䝜ˎ", "⺢喳爕ᡟ", MaybeOfString("⣔蓷璉ὕ᳊ꀕ绪됉"), MaybeOfString("︠封쥞渐ﰖ鿶쐌ꝕᛆ"), MaybeOfUint(580200));
    Test_ToFromBuffer_Check(790541, 654169, 825340, MaybeOfUint(253464), 733018, 937372, "ⓑ�陻졠甹굱䈳", "箒Ừ⠹ꆥس尭뵂ִ譲里", "츰쉝⚛", MaybeOfString("⒙魨殉빰椻๦牛�"), MaybeOfString(""), MaybeOfUint(552342));
    Test_ToFromBuffer_Check(632030, 940477, 454262, MaybeOfUint(625035), 487753, 410160, "", "矑柳䢍꺽", "顸퍘尤ꤨ㚔地౒", MaybeOfString(), MaybeOfString("魎߳皬蓇"), MaybeOfUint(168367));
    Test_ToFromBuffer_Check(335304, 136567, 572743, MaybeOfUint(), 547833, 842066, "볧ံ閵养ѓ", "䕊Г竈䏸ᝐ釙뉑", "额䦼馆䕲㠏", MaybeOfString("빾搊舴ڌ῟옘"), MaybeOfString("੤⟕鯲倡⭘光雡푘"), MaybeOfUint(587594));
    Test_ToFromBuffer_Check(134097, 965283, 971910, MaybeOfUint(304872), 841434, 637645, "ٺᗮ�翊焤", "ⱍ䛬", "鄉ㅃ舶쎏庿", MaybeOfString("榝ࠂ㡽䄁㹽ࠒ"), MaybeOfString("贁軏"), MaybeOfUint(816568));
    Test_ToFromBuffer_Check(821574, 817179, 686954, MaybeOfUint(904311), 975925, 609618, "", "", "ₙ첐鴯韁ꕾㇽ鳄ᔿꁓ", MaybeOfString("႞䲄"), MaybeOfString("㩷"), MaybeOfUint(102543));
    Test_ToFromBuffer_Check(909543, 106567, 767392, MaybeOfUint(519341), 270063, 314391, "먬偩㤐쏀詽", "", "満Ꭾ앩㙛", MaybeOfString("嶎褾詙곈"), MaybeOfString(), MaybeOfUint(707293));
    Test_ToFromBuffer_Check(891454, 408359, 366280, MaybeOfUint(624852), 711982, 774752, "쓩ｽଷ쌒ᢃ腒ꊠ兟ľ", "ᏻ篾曕྄췴", "Ӓ돗左ᶢ繑⥦眣", MaybeOfString("᷽ꂶ锢꼂鞘븫꽨ൂ甝弑"), MaybeOfString("ꄋ壆됕"), MaybeOfUint(338141));
    Test_ToFromBuffer_Check(268597, 951819, 937377, MaybeOfUint(809031), 25050, 481410, "豾풐�冇", "઱㳵唵Ἐ痪䌂", "↍ꇒ園喒躬ᚑ", MaybeOfString("쐔칌更"), MaybeOfString("れሳ"), MaybeOfUint(965560));
    Test_ToFromBuffer_Check(45130, 358198, 20038, MaybeOfUint(983556), 939073, 448307, "힂燦编풜死킗", "ꅞｗၸⅶ鈆돰᥹", "愍ᳬԂ㛲蚾", MaybeOfString("䖪ꂊ퇃갎"), MaybeOfString("섋"), MaybeOfUint(818936));
    Test_ToFromBuffer_Check(605978, 317549, 256275, MaybeOfUint(716961), 440970, 921680, "掓ᖔ홻퐆ᕄᬞ䪳", "", "", MaybeOfString("暻࢙⦩䚏쳂藏芗"), MaybeOfString("ᤀĄɄ핻"), MaybeOfUint(423942));
    Test_ToFromBuffer_Check(665226, 909264, 950940, MaybeOfUint(346851), 662479, 700243, "ⱅ❧맖늊ﶤ", "벙穝쒝攏", "ຽ㢒이隔", MaybeOfString("ূゕﱜﺸꀊ"), MaybeOfString("㥲쿱댧訛"), MaybeOfUint(688888));
    Test_ToFromBuffer_Check(849270, 262615, 335695, MaybeOfUint(109407), 613797, 940109, "料긆곙梔�㴺빱", "궪ⴙꨶ䑀鸱듾纖靉", "⩃᏾尡㢗推ᲃ", MaybeOfString("Ԗ擔觻ᚙ㪢�"), MaybeOfString("⁮⃏㢲ᙲ拊嬗⁩"), MaybeOfUint());
    Test_ToFromBuffer_Check(39536, 322209, 801900, MaybeOfUint(938644), 478799, 451150, "ᓤ", "ℋ轴", "좟", MaybeOfString(), MaybeOfString("钄⯯ƕ"), MaybeOfUint(39475));
    Test_ToFromBuffer_Check(969982, 908901, 694198, MaybeOfUint(943249), 759872, 239653, "튷�误ಷ峇⌊⇓ꏽ", "塻ネ턞㛢攽㗹₠㩁꥘", "洎겸檴ᕽ⣑䡑㵶㮛", MaybeOfString("襄口ǹ勆袣"), MaybeOfString("譮亚"), MaybeOfUint(522574));
    Test_ToFromBuffer_Check(665892, 130101, 573132, MaybeOfUint(65930), 269643, 754064, "돉㌖楇轆戗涠″殺", "巬㻠㝝堳떨눦⁊囩쿈", " ", MaybeOfString("▁ٍ㣑嗳ㆧ䪅㹈눰⼗"), MaybeOfString("쵧�碯䦝ꔐ狚륌췧"), MaybeOfUint(313988));
    Test_ToFromBuffer_Check(413692, 293499, 717623, MaybeOfUint(570322), 88239, 125762, "", "숾", "棗Ɤ⹷�혬⦑壇ሚ箽", MaybeOfString("騐㎱䮠匱"), MaybeOfString("頝㷠ㄔ荠ⵉ虇ꠠ"), MaybeOfUint(653697));
    Test_ToFromBuffer_Check(265041, 233, 860114, MaybeOfUint(571762), 233018, 609005, "옴�ǲ숢", "", "ꊃἱ⌿", MaybeOfString(""), MaybeOfString("爢틆⟶腈ἐঢ়ꧥ蜒"), MaybeOfUint(833142));
    Test_ToFromBuffer_Check(660756, 661993, 106810, MaybeOfUint(941903), 583859, 123874, "ᤫ륌䄽甪ᣏ猴", "궏챤닎浄﷉", "", MaybeOfString("才ẕ⥃ឞ瓧뤧"), MaybeOfString("芭瘇薀̍࠘᳁߼"), MaybeOfUint(586115));
    Test_ToFromBuffer_Check(658034, 981212, 269777, MaybeOfUint(), 765969, 527180, "束Ⳑ엢", "댻秛隢", "ⷒ뀈㞴퇙", MaybeOfString("衢Ⱐ謹ꐺ⨿茎烫"), MaybeOfString("鮟"), MaybeOfUint(333868));
    Test_ToFromBuffer_Check(420491, 585475, 997735, MaybeOfUint(242983), 57466, 467842, "嶫잼ᦃ⋞", "䕼濢ᡏ୳𢡄㒉ト鷞", "Ĺ㎜릀ᤢ", MaybeOfString(), MaybeOfString(""), MaybeOfUint(963699));
    Test_ToFromBuffer_Check(418658, 814236, 134126, MaybeOfUint(28003), 605197, 133446, "ᵷ瀪⣝᫟줙拇탏", "�ื㕌", "唤", MaybeOfString("蔟ꫂᾺⅉ᧜"), MaybeOfString("諯캓"), MaybeOfUint(686262));
    Test_ToFromBuffer_Check(282066, 81400, 174531, MaybeOfUint(901397), 434773, 978110, "갭历绝䆁", "ꊘ", "憻窶鑪ฯ夐ဪ桚", MaybeOfString("甝엥럛"), MaybeOfString("Ồ锇埑�똟ჲ娪"), MaybeOfUint(859114));
    Test_ToFromBuffer_Check(106124, 568325, 413688, MaybeOfUint(362427), 738104, 970490, "箛⋀�", "洔ⱸ䵉룒㛈ᔟ", "⫚⡩ࣰ鸡廋Ⴂ꣍貛葻", MaybeOfString("펌볡�봯猹"), MaybeOfString(""), MaybeOfUint());
    Test_ToFromBuffer_Check(678965, 877655, 665454, MaybeOfUint(615320), 698908, 693362, "", "ၧ", "", MaybeOfString("쬔㸛怍"), MaybeOfString("�폆ᑒछ�⧢폣"), MaybeOfUint(549073));
    Test_ToFromBuffer_Check(102900, 926599, 966773, MaybeOfUint(854074), 552183, 240146, "ﴼ", "", "ヅ䛆�胻蔱", MaybeOfString("뭻年刺廰ቝ瀮꥽"), MaybeOfString("ᗅ栺﷾"), MaybeOfUint(463926));
    Test_ToFromBuffer_Check(177996, 532333, 179440, MaybeOfUint(862929), 824988, 862536, "޵팴", "쿵ʁ鸹⚅", "䆘廍ᑴﹽ徵ﯮ൪ᴶ", MaybeOfString("榁"), MaybeOfString("䬗ﵳ茔"), MaybeOfUint(752682));
  }
  
  bool unitTestResults_Competition_ToFromBuffer = runAsync(Tests_RegisterAll_Competition_ToFromBuffer);
}
#endif