#if UNIT_TEST
namespace Test_Message {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_Message_CommonTesting() {
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
  
  bool unitTestResults_Message_CommonTesting = runAsync(Tests_RegisterAll_Message_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_Message_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_Message', UnitTest_ToJsonFromJson_Message);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in type, Json::Value@ payload, const string &in visibility, User@ from, float ts) {
    Message@ tmp = Message(type, payload, visibility, from, ts);
    assert(tmp == Message(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_Message() {
    Test_ToJsonFromJson_Check("", Json::Value(), "ꠂ쮰", User("ᮔ﵇獣", "ᱶ谛䆳ꔼ躜ಙ㟊罐㳋뽄", 0.1243694751171253, MaybeOfString("澯�჌江䚏꼸䃧")), 0.10297646750834606);
    Test_ToJsonFromJson_Check("軻ᖧ⭾뒍뿣확庢", Json::Value(), "돻딘ꃺꆈჸ땶", User("뜣힐", "䌭덉羌ฬ擪孻", 0.25862961414206287, MaybeOfString("큇玪䞫䂟礽ᚪ")), 0.8784672561467007);
    Test_ToJsonFromJson_Check("", Json::Value(), "峝뻴촮摂", User("客㒞᫯볠箢暂遐", "澵z懇", 0.979606354133974, MaybeOfString("ࣅ䞚㌴⦱扬껰朣뵧칒튪")), 0.0532410778353182);
    Test_ToJsonFromJson_Check("ꬨ憽畏⹬响憴ப", Json::Value(), "䀗", User("눪꽏뛧䁖ؐ杒୒", "븯剬鯫ﾪ঒ﵴ뙕", 0.8137869116914398, MaybeOfString("ఝẴॶ૱덙꾜鏑郺ἁ")), 0.21201406196319222);
    Test_ToJsonFromJson_Check("鞙栥唃徭ྈ佛ͽ", Json::Value(), "咧놪☼앇炄㐕", User("罆鹌", "엣ᩁ㟅ഽ", 0.6321303400360655, MaybeOfString("銗䔜῏⻖蚇ங⨗萃쎉")), 0.3492743444392804);
    Test_ToJsonFromJson_Check("", Json::Value(), "鵸詤ぐӵ＀Ậ౯�뾋", User("⁥츟惦鷰ᖺ䖛", "뢵䗕", 0.7049692988884493, MaybeOfString("")), 0.033134902842871336);
    Test_ToJsonFromJson_Check("ꨘ躀퓹ꔴ㳇୭鹥", Json::Value(), "", User("�ꧾ큽ⷾ뮁d更", "鍡轔", 0.5012867774354698, MaybeOfString("ᣙ욗")), 0.412357613170686);
    Test_ToJsonFromJson_Check("㓉⩊转ᢶ퇈侘룒फᝌᣇ", Json::Value(), "됢菙ၰ㡽걅", User("鳐�", "�素斫ﶮ", 0.5630223595365055, MaybeOfString("뷾�")), 0.3798953766840954);
    Test_ToJsonFromJson_Check("ᢻ샞饤浏䴾퍂蘇賻ᜳ", Json::Value(), "符䭭澀⽹ᱶ爅螝⬣", User("∝", "ᖦﭭ见禁䡼淣럸튦蘥気", 0.8629635567138733, MaybeOfString()), 0.46680086733158715);
    Test_ToJsonFromJson_Check("�Ͼ斐", Json::Value(), "ᴝ삱鄎吐", User("招곢贕没", "蓼﫤䄉ꆢ귐쩱柝", 0.014713618445542464, MaybeOfString("쬂뾟ૢ랶侥荽꜐")), 0.7219187778988475);
    Test_ToJsonFromJson_Check("ꄻ�ঽ㎒�郁", Json::Value(), "쒜≁", User("ᘭ☖甩ῶ", "ꨝꮄ轓᧦㗭再섚", 0.16778719758977517, MaybeOfString("좣㉒㇜ꗸ롼ᬁ籕ￌ")), 0.24182768223892323);
    Test_ToJsonFromJson_Check("灩", Json::Value(), "ഀ㶴٨ῦ", User("꭭䊘睈宥목簡", "讼Ѯ", 0.8787253377394403, MaybeOfString("믕鋜㩋뭪莮홣")), 0.17773400721034688);
    Test_ToJsonFromJson_Check("䴨", Json::Value(), "겶຾", User("淪熷颤짒傉峩ᯕᔺ", "恮뺪髷漻拹", 0.10518072922955302, MaybeOfString("�ꢶ嗲聅䄳ㆳ尉")), 0.4737492848531107);
    Test_ToJsonFromJson_Check("끁롣", Json::Value(), "黊ᇴ뚖", User("䟘鱐ꄝ标妒䗶", "苅", 0.6423254504996936, MaybeOfString("徤澌כֿ昢Ｈ罧㣜樐㽼㿝")), 0.4198365376423283);
    Test_ToJsonFromJson_Check("ħ蔋", Json::Value(), "穏뫤࡙攴쑋㵗髍澇㤘", User("뾋뿰秮", " 讈䗺⼎Ԍ臋뽦殠齒", 0.9411703510867294, MaybeOfString("霋枒৹聸ᒢ")), 0.8438494023139819);
    Test_ToJsonFromJson_Check("扁⫦", Json::Value(), "㺋Ɏ㥂矮冠ឍ馒", User("ꐊἸ᜸萿", "ṧᬔ", 0.10241707326025566, MaybeOfString("믙㬢娵ⵌ⫿鰰⇹")), 0.42997451053465463);
    Test_ToJsonFromJson_Check("꺗⯒", Json::Value(), "靮垆规☉᡽햅𤋮柅", User("噧㉊㚨줫⧑㙵覆ೕ", "炙띤䮔췬鼋탐缜檜⛟", 0.0062821507483172, MaybeOfString("ۚ")), 0.8087897141504985);
    Test_ToJsonFromJson_Check("璖姂淓", Json::Value(), "馵ᆪ鱹", User("ꦺᙱ֤", "⢻疳쨟ጦ", 0.33387420109187915, MaybeOfString("撁銹瞝")), 0.8488426943537046);
    Test_ToJsonFromJson_Check("瘪剈授䎫쉑ᢰ", Json::Value(), "곔遲祆䊼Ꙕ맆晝", User("", "鑭嵿釄⅟᥌⇝䱓", 0.9996745586393748, MaybeOfString("吢ↈ種祶⯔䥮")), 0.33113253411424);
    Test_ToJsonFromJson_Check("�ࣔ", Json::Value(), "邽쪿淬ฏ垄塍嵓", User("�䰃", "藃 ⏎늻텿錈", 0.49082383303475746, MaybeOfString("ﴪỗᯁ蚧쯕胫鍼륭朰")), 0.12773098569723357);
    Test_ToJsonFromJson_Check("", Json::Value(), "䦳�榺骽䭄궉쎟鷬", User("쳷계쳣㪏汄ガ", "", 0.4895256066180419, MaybeOfString("�댍〱둫鱆㈹�")), 0.6568041223365833);
    Test_ToJsonFromJson_Check("錰㸦䇲�䍛쇈๛", Json::Value(), "쎊騔덁闧⽺裰轛", User("犆뗄㿻ꨕ䦳翧⤅", "鈝젾늇媎笖", 0.9933770149915372, MaybeOfString("柳ᓒ혖")), 0.7929870890420802);
    Test_ToJsonFromJson_Check("", Json::Value(), "뷌齟蜰ộ", User("媴白矷", "⊐檢䩬", 0.3525713362510183, MaybeOfString("䎇")), 0.4847562026627158);
    Test_ToJsonFromJson_Check("ݏ", Json::Value(), "᠓᥵ۚ", User("‚ᓒ潰Ⳉペ", "", 0.22576124790392874, MaybeOfString("誉穞煮")), 0.9108419515708657);
    Test_ToJsonFromJson_Check("膀璠뎝⺧䛙픮翽", Json::Value(), "䙖ᲀ㭔⬥襶喩ᓅ䍕ꆹ", User("͢떳窖鬦", "浸酒袑橒", 0.0007257568653327212, MaybeOfString()), 0.40864503262967106);
    Test_ToJsonFromJson_Check("ࢧ믂", Json::Value(), "躎㊭亂귮䮖㔚䃪ಅ䈣", User("箉礠덡", "⯉", 0.18260454814071048, MaybeOfString("ó퓓驏陽允틼潨ⶌ㚍")), 0.16250655016047252);
    Test_ToJsonFromJson_Check("笘ꚠࡒ", Json::Value(), "뼘㽗ⷻ찄", User("騀♖쥁", "⇹瓒", 0.8654848280667722, MaybeOfString("▘녝裂ꦍ")), 0.8260989877516864);
    Test_ToJsonFromJson_Check("㦮尭칉桸", Json::Value(), "忸៥览䫞", User("Ԟ൪", "⸰", 0.34863164618081954, MaybeOfString("盟駪᷑铁뮱ོ再")), 0.8925203652551958);
    Test_ToJsonFromJson_Check("윊䰟爒ˣꌋ", Json::Value(), "柬઒궅抈⽊얳礞䛜꜠", User("〶力෎", "", 0.021438033795653857, MaybeOfString("")), 0.7252418830642672);
    Test_ToJsonFromJson_Check("쓿璟溫弄뮮⹉팗쨳〛", Json::Value(), "鰫", User("䳠", "ꚴ램ഔ쁴蔝娞⠸จ", 0.4038923524338251, MaybeOfString("⧐㗪ⲷ窕ꄧ迴")), 0.6549232479440622);
    Test_ToJsonFromJson_Check("髀ⱪ탵Ⰽ妬눌鏩틽", Json::Value(), "＝ⶇ", User("壀唑骿䋛頹㱭汦", "쮛䣔搵垑雛깵", 0.4409954740856753, MaybeOfString("ꄺ暡欐걗�埈㩜ﾴ")), 0.08308129947776036);
    Test_ToJsonFromJson_Check("튫탱ⶽន焦藒ꕦ䝵龌ͨ", Json::Value(), "鳲�怢팃쪶蒌惴", User("ᾚ촑ꍏﾌ", "瘻嶰幃녽ꗴ⩕㑯虲", 0.7814240869048164, MaybeOfString()), 0.8399789956584475);
    Test_ToJsonFromJson_Check("㧱疦鹰냣", Json::Value(), "咫", User("蛊ꠌ⋞ネ얽䦵೿緋빢", "곑凋�蔐鴁⅘굡늤", 0.21246786658301384, MaybeOfString()), 0.4768773100696864);
    Test_ToJsonFromJson_Check("吨鄣", Json::Value(), "擫đ益⬫꽎铖†", User("鮧ײַं〮맒꺧ۨ鰭∋", "咙䤔轃", 0.024646950897130628, MaybeOfString("⧖妬")), 0.7297021037571607);
    Test_ToJsonFromJson_Check("뮹瀨砦끜윮ﵳ琜䰶韧", Json::Value(), "䰦", User("鴈濙", "⮱苸�篦䙸䜋�", 0.4042358879950996, MaybeOfString("遛㔧ꡜ㵷枸첓嬅쭸尊")), 0.4382117187782245);
    Test_ToJsonFromJson_Check("骵銶⮧흯筺궜쁶縂", Json::Value(), "邏協걚膦ำ♴", User("쥢�턬䵕", "稡䩧톿ޜＶ쓎檃㘙", 0.7189601346473024, MaybeOfString("閣崋쥙�蛳")), 0.9305983604540109);
    Test_ToJsonFromJson_Check("励돠", Json::Value(), "埈핹", User("폺뮾眲餻Ჩ栬飒홟", "뱏熫鏵밃碻ᶁ", 0.105697501034335, MaybeOfString()), 0.10019056410537593);
    Test_ToJsonFromJson_Check("⅍", Json::Value(), "꜖ਤ翉ᑲ䧪Ⴒ⍠", User("茹庱釚왗", "푮멠≽⣙옔", 0.5382294382612358, MaybeOfString("벹")), 0.4336120427742656);
    Test_ToJsonFromJson_Check("", Json::Value(), "ᄯ", User("밄폒ꩼ", "᝹", 0.09433339261186001, MaybeOfString("Ⴇ⳵�뀧›䢬")), 0.1198373945056635);
    Test_ToJsonFromJson_Check("ꨞ﷨뺛穿濶蝆쌥㬺ᬥ", Json::Value(), "೻偉㝙倎卌硚鮳裴", User("뺔툰氃Ꮸ㐐혆한", "̍뫯꪿䒼큝耷넲㴝", 0.7498903389786791, MaybeOfString("뎫횏ᩅ")), 0.08373397313232253);
    Test_ToJsonFromJson_Check("⠧뚇မͿ掗", Json::Value(), "砐ᤌ�媓㊵覞잰聡", User("辣⇹鞫ᛙ牗ּㄯ", "ꆠ䆖ើ銨〘ほ跱倭", 0.3562204322573824, MaybeOfString()), 0.8713825255964801);
    Test_ToJsonFromJson_Check("䱱팝⑄䩘ᔼ燤⟐䶢⍈놋", Json::Value(), "ూ莚箌", User("叫�鍺ঽ瑧燽ຢ�臠", "ᶜ㮉嵥ꨜ鹬岣", 0.3559304840657536, MaybeOfString()), 0.6516312903965038);
  }
  
  bool unitTestResults_Message_ToFromJSONObject = runAsync(Tests_RegisterAll_Message_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_Message_Getters() {
    RegisterUnitTest('UnitTest_Message_Getters', UnitTest_Message_Getters);
  }
  
  bool Test_CheckProps_Message(const string &in type, Json::Value@ payload, const string &in visibility, User@ from, float ts) {
    Message@ tmp = Message(type, payload, visibility, from, ts);
    assert(type == tmp.type, 'field type with value `' + type + '`');
    assert(payload == tmp.payload, 'field payload');
    assert(visibility == tmp.visibility, 'field visibility with value `' + visibility + '`');
    assert(from == tmp.from, 'field from');
    assert(ts == tmp.ts, 'field ts with value `' + ts + '`');
    return true;
  }
  
  void UnitTest_Message_Getters() {
    Test_CheckProps_Message("�￿躮䮠馩�", Json::Value(), "㧖⢢羋⽪㎜৏렊", User("鰉橿蜽韋�╝㸌", "疍", 0.18134318114320896, MaybeOfString("힞�싺")), 0.07621820134865967);
    Test_CheckProps_Message("㌄搡", Json::Value(), "﫦䉕", User("礃ឝਛ轱蚴", "䊣�갏䭯岊⒆肭꘤쥹变", 0.115009106283546, MaybeOfString("")), 0.2440319174174368);
    Test_CheckProps_Message("⨸۫芁≲彲⏈먳�", Json::Value(), "�拺윰蘆", User("㞪㷗᤾虝䰒ஷ", "듡鷰那춴庂ᄼ", 0.7350865326519527, MaybeOfString("ꑙ尚豈젮훇懓奲쮄")), 0.03649224202916596);
    Test_CheckProps_Message("툴䜮", Json::Value(), "ሕﯷ⸱쁍冼ǻ쥝", User("杢⅄⊫", "�㶈�㻡뼇", 0.017031668227646346, MaybeOfString()), 0.2998539336490696);
    Test_CheckProps_Message("鏓", Json::Value(), "㈣揘䢊儞祹㚏", User("묹뭷┼쿽騍", "鈤ꦀ", 0.4497845528879131, MaybeOfString("㎀꿈�ᴶ๏㕭∸缲䁏")), 0.7841881889776272);
    Test_CheckProps_Message("﫛", Json::Value(), "ឞ楚㔊夷", User("鞆㤨ॽ", "㢲", 0.5899327712086647, MaybeOfString("桑툆뵋")), 0.36758372577260423);
    Test_CheckProps_Message("䵙嗍珐瀮㍿웦쭜", Json::Value(), "阚⦈郶炼", User("弊䮷⃷쨗蝢ᳳ쁼", "㶑ꔘₜ齬聎雄攩澴", 0.7346497265317709, MaybeOfString("過ଚ㩕ၪ㩾껫")), 0.43129645028677605);
    Test_CheckProps_Message("霭㸙襩쳉", Json::Value(), "芓냡ᢹ㰒餿띩", User("蚖䜙莬晰ࠚ㟜덡", "틑吲炔ᒚ레휺堷", 0.605707060362076, MaybeOfString()), 0.6888228062022583);
    Test_CheckProps_Message("의", Json::Value(), "痒", User("웪墒≜蔗塚䌽ୣ", "ⵑ᠟Ꮍ⁭豹理癙", 0.1086578388273054, MaybeOfString()), 0.9333841311435142);
    Test_CheckProps_Message("㫟슷崠ᕧ◃", Json::Value(), "ﲜቚ", User("穽⽍捲", "ꎴ흨榼㸵죂砗죋", 0.349102787836037, MaybeOfString("耓봸鱚뿽룣ӟꓟ砥㜬⋣")), 0.16556858744731573);
    Test_CheckProps_Message("퍑", Json::Value(), "", User("森ⶍභࢆ⑧", "沕К߄뽇㪢㸿ᓮₙ", 0.2996426850090002, MaybeOfString()), 0.4123603805957178);
    Test_CheckProps_Message("Ԕࠆ", Json::Value(), "刑ᅘ", User("", "⾬顎嫈룭밒᥃", 0.4361259492282411, MaybeOfString("")), 0.3185274281159637);
    Test_CheckProps_Message("쐭ғ㒴퟽ᗦ㴟봨", Json::Value(), "", User("㱷ဥ院", "䃹눭쯺", 0.9199758674576766, MaybeOfString("")), 0.9631901429794683);
    Test_CheckProps_Message("쯟㝒⒄색Ї", Json::Value(), "鏟灭", User("횄", "偙߿嚱ᇊᙷ펁", 0.05246872131362032, MaybeOfString("띨體륯幈")), 0.21403278886062688);
    Test_CheckProps_Message("⁮ꕕ뉲�", Json::Value(), "ಟ", User("뼊谥", "็۟弜쌘㙛핺﫽㑪", 0.6487897842418355, MaybeOfString("覑甃")), 0.8475645891612231);
    Test_CheckProps_Message("熃", Json::Value(), "Ⲃ叼", User("쪄", "㭐ᩳ삝뵶鳱㶋硂银", 0.716671640852779, MaybeOfString("䕃")), 0.7463144849735845);
    Test_CheckProps_Message("䝛튟뿎ວ扚듍꩐瘁쪟怢", Json::Value(), "狥Ü매", User("聹匂仰䭬鹃ȟ薲", "䵌‱䘢먔᫣", 0.7275495616381753, MaybeOfString("㧯䦴귏毥")), 0.34926323655492775);
    Test_CheckProps_Message("℺꣺췽㇋", Json::Value(), "⑼驏᩽嬨默䚥�糣㊊", User("胣颡攤訞", "ᥕ剃爆爣膡꛶", 0.8071342561427197, MaybeOfString("弨犳㮲ნ꫃뻪㬲Մ")), 0.14664078603807873);
    Test_CheckProps_Message("妐檣袿칉谜訷໰胖", Json::Value(), "뚪䬹칭烈罽췜歵ȧㄚ", User("豺댜￰귥ጢ䨣뉐㕋퇪", "꥞琷᯵テ䪮䅎쯰", 0.239059494919637, MaybeOfString("嵐䓸瀓䳻Ჵ﨑")), 0.1133740651949188);
    Test_CheckProps_Message("䢝୙", Json::Value(), "�쁰ꢚﲆ䉳诲뺔", User("�", "", 0.30986731932957995, MaybeOfString("")), 0.052215782949801434);
    Test_CheckProps_Message("훃덙", Json::Value(), "绽ᅧ猣�嚖竝", User("v鬕", "ធ", 0.5294649566195276, MaybeOfString("ꏛ")), 0.0283130514567313);
    Test_CheckProps_Message("ﲢ츸࣓렎䰩⮵", Json::Value(), "緱뒏鋦ឱ釂", User("늽趽ማ鐆ᒓ俲⼿", "켍Ⰼᜤ朠㹒稃", 0.17584579073630544, MaybeOfString("鳱䊞챆맰쵛㣇")), 0.9771046787393767);
    Test_CheckProps_Message("⛥杭貴溪৥롰꬜䮖", Json::Value(), "H", User("Ꙭꇰ⦥๤즿ㄨ", "俍埯퐥ঠ἗넾", 0.10229633846427144, MaybeOfString("⥇Ш啞婓菨뻟௎餵")), 0.7681944415756475);
    Test_CheckProps_Message("咊ꟁ", Json::Value(), "", User("䗎稦⡠式㏩됤蓼", "娒㜽㆒蠩鉜拓", 0.6787625773245295, MaybeOfString("")), 0.42658477901787717);
    Test_CheckProps_Message("쑥밃괦㮜䔐炒悄", Json::Value(), "䇶Ν曶됚简贙殺뱆ᩖ", User("⏾齫ﾌ", "๠쌩䖐ⱝ", 0.9059712290326, MaybeOfString()), 0.6186537638393481);
    Test_CheckProps_Message("䉊浊믪뙪뻼鉵", Json::Value(), "댄⯤槯梾⛬㬻৷䪨", User("잔⿴㦺暄➍屴ଳ薭", "䲥ꂵ꛽빗�厷ア炦勭", 0.9152325703367743, MaybeOfString("匶⨏쟹膗堳뾒뮦놘蘜뗌")), 0.9387735072238247);
    Test_CheckProps_Message("阊额禱鍾齪", Json::Value(), "㐙㷀뵌慔駐윳陑镉⣀", User("㾥괶됼헽⇐춻", "앨⛳唏", 0.9230351117081173, MaybeOfString("剭ﺏ柙㕤쩢姽ἆ奨啈")), 0.5927943501587931);
    Test_CheckProps_Message("", Json::Value(), "ꨯꧼᖝ໵", User("읚罻", "ㅝ⧲卨펟漜႔婴矲깒켳", 0.8722573392429656, MaybeOfString("揉⫲脟篱꯫慙㘊荏")), 0.5625489831727691);
    Test_CheckProps_Message("륍虋陱濣", Json::Value(), "莻ጺ䭉胼ᑝ쨀", User("蛫龆뇘", "숢嗖ᘖ᮳➄䛳碸䀠열", 0.43894014807368636, MaybeOfString()), 0.2574730675003832);
    Test_CheckProps_Message("ꒋלּ⚶", Json::Value(), "牼똳䁶䉇ꖸ", User("蹘ŷ뇉ᝁ", "�脰矫蛼䚼炈䑚ￕᙅ", 0.4571897380320307, MaybeOfString()), 0.1219909727210137);
    Test_CheckProps_Message("个幚뗔", Json::Value(), "", User("з", "迪뢾풕", 0.14595251956300462, MaybeOfString("󇸷")), 0.4168354330662803);
    Test_CheckProps_Message("밅", Json::Value(), "≲턺ᐅ�绬", User("傗䘠桌", "쐑벒푈簵㟦兡䏰糗鿾", 0.07293450556366449, MaybeOfString("Эᳺ푰�蒮")), 0.08064227554977046);
    Test_CheckProps_Message("ᖦ涹㵲�젽ઌ㳲嘁�", Json::Value(), "멫캿욀쿏靆", User("罶㭹뱍᭲긞膐", "ĕ�뎿�ྊ", 0.404983723724719, MaybeOfString("ݹ話亢൓")), 0.5334342972065482);
    Test_CheckProps_Message("⪤�蝭靡힥虻", Json::Value(), "茧餌僸", User("퇷慉炷軫锸뺢鰸ꆕ⺕", "⬟⬆餽ﭝﬂ冺惼ᆵ춳", 0.6120272924248257, MaybeOfString("겿躂노")), 0.8635505791118139);
    Test_CheckProps_Message("䈭䋟嵎桅꣒뙤偌", Json::Value(), "▦⼛傟ꕅ⊥꜔䤩卑̐", User("턴䅕ℶ࠿ㆸ", "票彣饽", 0.17560456654783552, MaybeOfString("遦ﾅ偂")), 0.24299280263622888);
    Test_CheckProps_Message("켻", Json::Value(), "뚬淾", User("", "", 0.019674241551977695, MaybeOfString("볐⇿弗蚰覀茣")), 0.6655868630230366);
    Test_CheckProps_Message("幚쓼ሩꡂꎥ띎�琳", Json::Value(), "", User("಼떍魾Ꞃ譮缫穘覃", "鳼歿捺퇵�렡ڣ", 0.5274478776973895, MaybeOfString("尣⫞떵�鷜™櫃諄")), 0.45467384553266404);
    Test_CheckProps_Message("ጪ쥒ᒅ쳃骺ᄞ", Json::Value(), "卒谓⪪�᩺㱰←ꠣ�", User("", "Ṑ蝫Ꮞ", 0.18635485981886968, MaybeOfString("룹螈蘰⩉呢")), 0.5000944465864889);
    Test_CheckProps_Message("ǋ鯮镘嫊冠愃躊ꁸ", Json::Value(), "췥뾴ⴾ愫팹룼崬銌", User("郐濂", "꩓ꓛꝘﺿю䗗ꕩ髽㱮䂗", 0.9906127452806629, MaybeOfString("�裹挬裀")), 0.8844558637982495);
    Test_CheckProps_Message("삢〨휓퀒᯺싵뚔", Json::Value(), "벾䎺訮⧏跰", User("₎ㄊፂ�꿘腷頀", "꒻⼧闂Ꭴ詓燥", 0.044632467462044426, MaybeOfString("괘᪄")), 0.598684832732512);
    Test_CheckProps_Message("픻脍䣢", Json::Value(), "", User("䈱렐ﴂ凘뭇", "㾔", 0.8232776107374941, MaybeOfString("庰⮁됨㾕봠簜߲")), 0.2727829368192623);
    Test_CheckProps_Message("쾕䮝�દ咾", Json::Value(), "슆즠", User("⮈푥", "", 0.8642049752474785, MaybeOfString()), 0.6838161701726803);
  }
  
  bool unitTestResults_Message_Getters = runAsync(Tests_RegisterAll_Message_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_Message_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_Message', UnitTest_OpEqSimple_Message);
  }
  
  Message@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in type, Json::Value@ payload, const string &in visibility, User@ from, float ts) {
    Message@ o1 = Message(type, payload, visibility, from, ts);
    Message@ o2 = Message(type, payload, visibility, from, ts);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_Message() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", Json::Value(), "춗䵩첏㞟", User("㚥涬凙ﷰ눵뭩㵷", "⃩쭶퍉", 0.3589599064360186, MaybeOfString("霋흽묌铱蝔")), 0.5811439154581837);
    OpEqSimple_Check("窏ｅ㛵涜", Json::Value(), "", User("技呝쵄ᛱ떡ꖯ꒲", "뵉삕⁪", 0.15847324633899762, MaybeOfString("詘렰佹膴ᳲ풜ᬃ⿠왾")), 0.021334145228068414);
    OpEqSimple_Check("璊诛퇟鯚핦壉", Json::Value(), "獔", User("峵כֿ鐄ℛݙᚬ쇳濶", "ᬤ쿊菆︐좙桭", 0.8671171105779322, MaybeOfString("䚱윲冥㶶밑")), 0.5706124257159477);
    OpEqSimple_Check("凌띫趻", Json::Value(), "䔲뼟Ŧ⃡釄Ἂ떋雄", User("", "后⡆鍙莕", 0.5851601662976482, MaybeOfString("띌렯岺쮟허盯")), 0.9078805315810631);
    OpEqSimple_Check("횱宙홧㉜는ꒋ㑶", Json::Value(), "⧝耏盧я␜῰蹎", User("", "ꨕẽ뮱", 0.3525745106640153, MaybeOfString()), 0.46396398379652015);
    OpEqSimple_Check("뗒떚核륙呷良ꥰ﵀", Json::Value(), "旨ᜇꩥ᫦", User("ᐢ㲛㧣⿾꛴倒", "매㘆천⥠", 0.7396033311912805, MaybeOfString("Ⅵ")), 0.12649929017131184);
    OpEqSimple_Check("픽鳐", Json::Value(), "⣣뾈噦", User("⻰쬟칁", "�㏊뻹媋痰", 0.6324298440629755, MaybeOfString()), 0.8244158336075097);
    OpEqSimple_Check("胤ⲞꫢᲉ䞧શ�䔘", Json::Value(), "崒⁗∾웇Ⓩᱭ", User("饁䱯淵す", "〭⤓ﲁ들≱", 0.4161871315055467, MaybeOfString("齦")), 0.21025278894708155);
    OpEqSimple_Check("�뙑耽", Json::Value(), "ټ໿ꍱ꟤", User("ા즣傪꼻ᨣ㤬", "㪟믢汢ꏠ⮶䋧館", 0.6439605474676753, MaybeOfString("")), 0.6501760159852803);
    OpEqSimple_Check("⮴柷ꥧ荣ᢕ縠靿ᩬ□ꮟ", Json::Value(), "ݤ謇든㣗짰ꌂ윝뺭눎", User("䒠ბ썊䯲⏔銄", "侮ꀵٽ", 0.9786182399739596, MaybeOfString("웆覕䃄�ЊЫᯱ睟")), 0.5282303553671718);
    OpEqSimple_Check("곢歒愪ᱧᫎ솠轼", Json::Value(), "�⧙", User("ꃢ｡뫇묯릕⛲", "瓪ﲥ疬᳢䩶㩒", 0.7752729164321315, MaybeOfString("鄻콨�赭墨큽咪઼側똶")), 0.253187472584279);
    OpEqSimple_Check("ꨉ�", Json::Value(), "ミօ⥶批钅", User("ঞ꼥ᗁቲ堽ᬵ꽧ﺵⰪ௝", "ꋽ", 0.7384812276523939, MaybeOfString("竚")), 0.8730193846267739);
    OpEqSimple_Check("", Json::Value(), "♕", User("", "뱜悶ꂋ鰲", 0.3437922598532365, MaybeOfString("踀뤅芸덍")), 0.8556584822273154);
    OpEqSimple_Check("�⺭é췍砟ᙵ굩ᱟ骲", Json::Value(), "덖", User("脫", "戃䶆ꙕ殺", 0.9136019488394269, MaybeOfString("뻸᧊㑗蟒⌧츂�ꁟ")), 0.28165930895212077);
    OpEqSimple_Check("螥㗓꒭→", Json::Value(), "ᚭࣳ�﨑ğ", User("બ⚟鰉ᡖ梉", "㌌⻄", 0.5325869673549137, MaybeOfString("䨾㶜☭ෳ鈴띟璦Ⴗ")), 0.0047310506947017515);
    OpEqSimple_Check("ցޅ", Json::Value(), "", User("䇨蘛ǆ簃偵펫ῥ遮ᕺ摃", "", 0.35876081015856975, MaybeOfString("䍇ﷰ쎑ˬ퍪쉹٥")), 0.3407934686824649);
    OpEqSimple_Check("⨍", Json::Value(), "䢼�䌐ೕ㎭", User("錠쟓쎭", "վ罚宿㝳䵉貟↟", 0.46170307298270197, MaybeOfString("聿妒ᫍ")), 0.2452742342116657);
    OpEqSimple_Check("䀡", Json::Value(), "૰", User("旌佌糏ꕤ�", "啴㟡䂸☸便", 0.27297223604888293, MaybeOfString("囈椐༁틋�鯺䅷⮙")), 0.02238474554493313);
    OpEqSimple_Check("輨", Json::Value(), "㹪쉰龊〢ᔖ̉", User("�ꊈ껿譍扆䡖図罛⢲", "䧂脑囲ﻯ機", 0.43996333351357064, MaybeOfString("믒趰忳쎓랔ꖒ鬋龕ຽҷ")), 0.7162241771427096);
    OpEqSimple_Check("", Json::Value(), "ﰃ҅飛曀푧鯄꟒䠂桁", User("췲룮ྮ韑ଵ峎㐇苘", "甂濚", 0.06683311335129342, MaybeOfString()), 0.7290049370978982);
    OpEqSimple_Check("ⴈ֑⡋", Json::Value(), "顚辑죹⪱濱놿宦奋", User("훱Ⅺ킠�鸋₫일", "", 0.634037503802235, MaybeOfString("쪭剈䴲")), 0.4561182509437754);
    OpEqSimple_Check("些窩遜媿餧윭ࢫꂘび", Json::Value(), "䗦悛燓뢅䃐ೃ", User("", "", 0.1967497371122007, MaybeOfString("踠䦺褃帷蛲")), 0.5271222188729431);
    OpEqSimple_Check("㵟蝅迨", Json::Value(), "ᄈ믋왚ꯂ喿�", User("䣇ᚇ梅翂㳕࢏", "縰㷇", 0.0725287529977638, MaybeOfString()), 0.5289865399380151);
    OpEqSimple_Check("膃", Json::Value(), "▴れꘅ澏ⱜ率Ⅳ魨粑", User("憚邷塙ꢖ嶰읦逕礸蟽", "రȴཱིՋ㈭窟w䏭", 0.9221365335034842, MaybeOfString("꠹款晏픪຿゠")), 0.3919001833498013);
    OpEqSimple_Check("䷫킹륦", Json::Value(), "䂃堮㹺暮", User("ṱ帮—뜔愄츿첣⦝脘", "㳞繶藩륍韚킉", 0.48612564079748727, MaybeOfString("磶▧汶틤榸倢슭")), 0.19621092136772858);
    OpEqSimple_Check("⯈퀍낼민翍쵓", Json::Value(), "礚쑲∆ⴝ䨥踯龂Ƞ�", User("⶯协⌜᳜", "ᮈⵌ桷烨띆㩧⏕Ҭ辙", 0.058275141314731514, MaybeOfString("져墩먘ꀛ쏕玗붐퍛㼉")), 0.7499776476761222);
    OpEqSimple_Check("䮕밤ᬣ뾩ᨶ␫祡", Json::Value(), "᧎䫁詵䯻꼊赖뇁讌弴", User("륳", "ྦྷ擊㣙㾯禗뻧쌜⺢뀁", 0.997457470278003, MaybeOfString("炰၃鉝")), 0.015412949498469452);
    OpEqSimple_Check("闻鷝䆀䫸貓햽褒췧㎵", Json::Value(), "㌼瑨ᘂㄺƫ㪙뇞轓", User("뗭蜢穽ᓪ辜", "鈩⥁", 0.21225071661744765, MaybeOfString("食ꆔ뾘�浹珩댶")), 0.6362415652890884);
    OpEqSimple_Check("捐챵ꏹ꼡姐䊂⤭", Json::Value(), "뱟땈ᛁ", User("븥ꖙ∴", "綽ケ摓릺칻啗", 0.6342174958597019, MaybeOfString("듴䎇")), 0.4710563637647109);
    OpEqSimple_Check("괮툘ꋧ힂汀䤦岐", Json::Value(), "ผ踼㛃踟", User("龲尬度", "캑ﴆ牌핧ᾓ瞀鵰삫", 0.13012653548742018, MaybeOfString("逡痺䐤")), 0.2847479322388526);
    OpEqSimple_Check("ໞ탬鏩Ⓜ恇", Json::Value(), "근邺㣿䟫랴ퟭ씤�房댬", User("", "海Ⴗ״", 0.3178545601283454, MaybeOfString("俵㧠儂攑짱")), 0.6348219419060377);
    OpEqSimple_Check("뎎⒲鸅", Json::Value(), "鑽", User("", "麼◹۝塴惑涑홨", 0.17722291740459525, MaybeOfString("뾊諽髩浙䭬ࡸ廌ढ़")), 0.7721227080431406);
    OpEqSimple_Check("峼�澷Ư⥣", Json::Value(), "侯억맖Ⴙ", User("", "㳻툇姴챞䢿", 0.06326541912894017, MaybeOfString("ꎝ")), 0.019550688108220086);
    OpEqSimple_Check("㪥듚悕ﳊ漝硕", Json::Value(), "", User("ꭊ鑊驠⟉灐퇽멱", "㿾Ꮳ⢝전", 0.5679307368434643, MaybeOfString("⽀料")), 0.47692054532324923);
    OpEqSimple_Check("蘁䞼壄桀蜿쾖", Json::Value(), "", User("┉堼彠", "�噊딠㶷蠃ᚙ鋩ඎ", 0.2666259111215481, MaybeOfString("씌ည햍�")), 0.1607460035759704);
    OpEqSimple_Check("岁岮賛㚡", Json::Value(), "﹢멊┰ಂℳా演읎떩煤", User("ൣｴ川瓜ᬥ镹ꕰ喭﬚", "�晚", 0.6508132590217578, MaybeOfString("㉲")), 0.6342640428963415);
    OpEqSimple_Check("�躌續", Json::Value(), "毰덷僀ᖊἦ", User("␓쌍油蒨騵岌ഠ㞞炈", "ㆎ棌�곔櫽", 0.27968602733671943, MaybeOfString("")), 0.4221628952874629);
    OpEqSimple_Check("ᕓℶ换ਾ暵", Json::Value(), "锜", User("�", "䷴╱赏欣ﳋ乯댌㍙", 0.7568295075357098, MaybeOfString("䴻甼䧁ፍ�")), 0.33316166528182184);
    OpEqSimple_Check("热⹉㊘၁᫄鍹䨢䵟ۄ", Json::Value(), "떶⨨ᘟ戣⦻䭋톓", User("ீ憨ቒ녈㰚", "뇺扐葁霤黟ꮪ辝뙉", 0.4443155706135163, MaybeOfString("筙Ỵ")), 0.5134283772266602);
    OpEqSimple_Check("鞱穥ⷨ䓓潶", Json::Value(), "�憕€鹷", User("拳沈", "疱↢컪�趸", 0.2632708965164008, MaybeOfString("憝")), 0.864460771374619);
    OpEqSimple_Check("묽ᴂ㰶剎䌅", Json::Value(), "餥", User("⺲댾麎靜ꖛ", "긺簼", 0.04963821454422465, MaybeOfString()), 0.579590490823421);
    OpEqSimple_Check("集ꦫ詓꣜", Json::Value(), "給軞䞕", User("ዒ", "", 0.35276485530322643, MaybeOfString("ͽ畺�堹朲")), 0.21713700109028117);
  }
  
  bool unitTestResults_Message_OpEq = runAsync(Tests_RegisterAll_Message_OpEq);
}
#endif