#if UNIT_TEST
namespace Test_GameInfoFull {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_GameInfoFull_CommonTesting() {
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
  
  bool unitTestResults_GameInfoFull_CommonTesting = runAsync(Tests_RegisterAll_GameInfoFull_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_GameInfoFull_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_GameInfoFull', UnitTest_ToJsonFromJson_GameInfoFull);
  }
  
  bool Test_ToJsonFromJson_Check(const User@[] &in players, uint n_game_msgs, const string[] &in teams, const int[] &in map_list, const string &in room, const string &in lobby) {
    GameInfoFull@ tmp = GameInfoFull(players, n_game_msgs, teams, map_list, room, lobby);
    assert(tmp == GameInfoFull(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_GameInfoFull() {
    Test_ToJsonFromJson_Check({}, 190300, {"汯粌鉅", "�ᲁ澯�჌江䚏", "䃧쁐욘ᱶ谛䆳ꔼ躜ಙ㟊", "㳋뽄旤ᮔ﵇獣ແ"}, {-787357, -962186}, "ჸ", "돻딘ꃺ");
    Test_ToJsonFromJson_Check({}, 292599, {"䞫", "礽ᚪ�", "䌭", "羌ฬ擪孻"}, {34736}, "", "峝뻴촮摂");
    Test_ToJsonFromJson_Check({User("统눪꽏뛧䁖ؐ杒", "ﵴ", 0.6741896712566677, MaybeOfString("")), User("ꬨ", "䀗", 0.32688456323318393, MaybeOfString()), User("딢셐鐨⛦屻㚡딽", "兡", 0.8515947027372172, MaybeOfString("畏⹬响憴பꋣ")), User("", "⍛", 0.45353629135225726, MaybeOfString("䍕᫃ᔼ"))}, 592964, {}, {77932, -496288, 789486, 28857}, "꾜鏑郺ἁ", "Ẵॶ૱");
    Test_ToJsonFromJson_Check({User("鞙栥唃徭ྈ佛ͽ", "咧놪☼앇炄㐕", 0.5697951049403265, MaybeOfString("ᒽ罆"))}, 493396, {"ꥈ", "䘢封撛首譤"}, {-452795}, "坯켫ꗥ쟭銗", "懜翊신꨻በ↥鿊");
    Test_ToJsonFromJson_Check({User("", "뎧檺憃涳뛙", 0.717315852044763, MaybeOfString("`")), User("鷰", "", 0.5125611091556778, MaybeOfString("懴뢵䗕旫"))}, 886253, {"鍡轔援�ꧾ", "큽ⷾ뮁"}, {969783}, "转ᢶ퇈侘룒फᝌᣇ꒨㟋", "ၰ㡽걅៵㓉");
    Test_ToJsonFromJson_Check({User("⼸៯ꭍڑ쀈ⵗ㏬蠑", "벛ﳾ啃둸", 0.6648844632622248, MaybeOfString("蘇"))}, 625858, {"茻", "簈"}, {-525904}, "ꒋ符䭭澀⽹ᱶ", "�");
    Test_ToJsonFromJson_Check({User("ᷙ㧖齢鬰㖦ӵ", "쭋胋젮Ⱑ", 0.7295991046026344, MaybeOfString("㪳ᒶ퐞也툃뻬")), User("招곢贕没", "蓼﫤䄉ꆢ귐쩱柝", 0.014713618445542464, MaybeOfString("쬂뾟ૢ랶侥荽꜐")), User("ꢗ軤衜", "瀙娎", 0.2482498051823349, MaybeOfString("ᴝ삱鄎吐�Ͼ斐임㾂"))}, 503847, {"", "豣閑㏲ᔲ逥좣㉒", "ꗸ롼", "籕ￌ龎"}, {-216782, 148290, -229346, 969638}, "Ѯꤘ꭭䊘睈宥", "¨믕鋜㩋뭪莮홣�");
    Test_ToJsonFromJson_Check({User("☰�ꢶ嗲聅䄳ㆳ", "䐪䈞䞞䜋", 0.4383112538784329, MaybeOfString("৷몖괩퉧瑏求")), User("겶຾", "淪熷颤짒傉峩ᯕᔺ", 0.17263334438793052, MaybeOfString("ź恮뺪髷漻"))}, 49476, {"嗟徤澌", "昢Ｈ罧㣜樐㽼㿝啻"}, {674608, -296666}, "穏뫤࡙攴쑋㵗髍澇", "뾋뿰秮");
    Test_ToJsonFromJson_Check({User("큥ꄓ�ﰥ", "܍", 0.5473255941399027, MaybeOfString("")), User("믙㬢娵ⵌ⫿鰰⇹숄", "ᡰ", 0.7046770838576728, MaybeOfString("풠躹伲킬簱")), User("㥂矮冠ឍ馒", "Ἰ᜸萿ᑈ㺋", 0.31177964401979913, MaybeOfString("ṧᬔ")), User("횊穧", "땓꟭뗏聲", 0.11108504660012436, MaybeOfString("⫦㿕롔蜡い"))}, 352251, {"혭㞥", "轔렫炙띤䮔췬鼋탐", ""}, {-810339, 117543, -5739}, "ᆪ", "ᙱ֤");
    Test_ToJsonFromJson_Check({User("䱓䎸帍곔遲祆䊼Ꙕ", "釄⅟᥌", 0.15933599237321688, MaybeOfString("祶⯔䥮䒸龅鑭")), User("紇", "靡ﮃ嚄譵ʢᖀ㨎", 0.5068352783596307, MaybeOfString("맆晝劬瘪剈授䎫쉑"))}, 423624, {"藃 ⏎늻텿錈", "�䰃", "邽쪿淬ฏ垄塍嵓", "�ࣔ潛"}, {-805007, 450978, 14342, 995447}, "꼭㗶澃", "鷬헡㕚");
    Test_ToJsonFromJson_Check({User("詓鐋", "䇲�䍛쇈๛", 0.7084764669223114, MaybeOfString("騔덁闧⽺裰轛멭錰")), User("ᶀ", "⣳燘㉹", 0.2801357737184203, MaybeOfString("뵆扈僿䞚䲈㌒皬毸圌"))}, 935082, {"爑䬼덃耕굗"}, {841277, 869677, 749228, 476766}, "읒럕࠘ᮍ怅䓗柳ᓒ", "㞹㿼昡˶鵺ﯶᲑ篥");
    Test_ToJsonFromJson_Check({User("暈೵횽祋阈熲㜆", "뎝⺧䛙픮", 0.022635161887218785, MaybeOfString("温膀")), User("䎇", "蛢䲲闞ꩍ㨧㞆豽", 0.7838541636168278, MaybeOfString("‖"))}, 45787, {"訁至쐱", "찕崾"}, {995705, 195560}, "ᆄ浸酒袑", "婯맕赕磳섇邋�");
    Test_ToJsonFromJson_Check({User("", "Ꮳ煭휶㩎겘", 0.32326939204859984, MaybeOfString("")), User("⯉肱箉礠덡蟞躎㊭", "允틼潨ⶌ㚍뾮", 0.22747971640316755, MaybeOfString("꬯ᑯ鶠褒ó퓓"))}, 107194, {"", "㽇䙃珍㉡", "郺黋▘녝", "ꦍꜚ䪗⇹"}, {-887052, -754132, -577187, 715973}, "Ԟ൪", "⸰");
    Test_ToJsonFromJson_Check({User("徺〶力෎턒柬઒", "", 0.18305420651242799, MaybeOfString("")), User("뀀ᵧ塻盩鮕雮亦釪", "윊䰟爒ˣꌋ", 0.35975681355211736, MaybeOfString("抈⽊얳礞䛜"))}, 536447, {"弄뮮", ""}, {276151, 338922, 676304, 98021}, "䧒태ᢥ䔂旓彥", "䅏᷄ꘖ蚜");
    Test_ToJsonFromJson_Check({User("䕲璷瘑ᩰ넑쨧ᆔ耵攰圾", "ꕦ䝵龌ͨﯨ撦ꥯ얩倳䊜", 0.8753343778081863, MaybeOfString("탱ⶽន")), User("ꆑ榻秱�", "", 0.10911078895866443, MaybeOfString("퀡ପ厐")), User("⧐㗪ⲷ窕ꄧ迴", "�㚳쯕獎ﱴ", 0.7550023886165593, MaybeOfString("〇踃"))}, 558988, {"뷞ᠮ裡", "⩒轖떜饚兓", "뺿쭠贑麏揅שּ㰄⅝Ҥ襤"}, {-942695, -175602, 952526}, "犄ⱷ蕴", "");
    Test_ToJsonFromJson_Check({User("蛊ꠌ⋞ネ", "곑凋�蔐鴁⅘굡", 0.21246786658301384, MaybeOfString())}, 830567, {"굾⧖妬聸", "咙䤔轃", "鮧ײַं〮맒꺧ۨ鰭∋", "擫đ益⬫꽎铖†㥯"}, {-700692, -980653}, "", "끜");
    Test_ToJsonFromJson_Check({User("廔授뫑", "ꓦ挱嘏", 0.03822794930926894, MaybeOfString("큚ࢸ헗땚硭�"))}, 846810, {"腬킰", "伜㉜ؤ�", "璧頒⹜遛㔧ꡜ㵷"}, {348543, 313857}, "턬䵕廌邏", "톿ޜＶ쓎檃㘙搅쥢");
    Test_ToJsonFromJson_Check({User("퉃瀍ﱬ⠔軙", "⫼䇤屴콙诘䒂厍", 0.11963376222161286, MaybeOfString("밄폒ꩼ")), User("袘䯞", "墼ኣ䍅", 0.5330773771428864, MaybeOfString("䘴୵㘱䢨")), User("폺뮾眲餻Ჩ栬飒홟", "뱏熫鏵밃碻ᶁ", 0.105697501034335, MaybeOfString()), User("थに", "돠艄훔�웖륞㍃", 0.4811112556984235, MaybeOfString("埈핹"))}, 943826, {"㬺ᬥͬ⩉ࠍ㥄縄썗겼"}, {-223813, -531960, 843584}, "砑툾ਫ਼騩ࡷ飵", "");
    Test_ToJsonFromJson_Check({User("氃Ꮸ㐐혆한팬", "넲㴝ส뺔", 0.9003307255452176, MaybeOfString(""))}, 834162, {"ᤌ�媓㊵覞잰聡ﳆ⠧뚇", "Ϳ掗ν䗍郐≫邝פᜃ"}, {209077, 449978, 507252, -895327}, "斠矨蒷⫥", "蟃෵㥔̳姇");
    Test_ToJsonFromJson_Check({User("馤", "뾯抃䱈೵谬", 0.008532105949023788, MaybeOfString("茾")), User("뽟몦呻", "", 0.7958965370412434, MaybeOfString("輂䥻扩唃쟚"))}, 926335, {"쵴鸪荤佀ഇ", "�⁋ᶜ㮉", "ꨜ鹬岣"}, {-162337}, "ᦱ軽ꂜ춙K䱯㨯葄㿮쇴", "⹯줏气ቮ");
    Test_ToJsonFromJson_Check({User("쏭�ꢁ�榓", "褅吢㨞", 0.16693403765882087, MaybeOfString()), User("ද퐅쾾䂆䇩馴ᗡ태�", "", 0.02040843619984036, MaybeOfString())}, 870024, {"趰ꑘ嗀嬺", "灙", "�ﵺ", "㫨὇ų᫝檃添쏯籰"}, {-959001, -770377, -919445, 288954}, "垫맻੕Ⲣ눙좓", "螦䪾癌䠗夋Ἲ");
    Test_ToJsonFromJson_Check({User("牢஬麋�縣䉁ꨆ㏪", "ⲱꢊ", 0.3188445038715585, MaybeOfString("목楥ᾥ軫ꕠ"))}, 719431, {"㉽珊�⇼鈉"}, {841147, -55461}, "ḅ♁뚌ⶣޯ", "ꔊ줮㿮ᚶ堩ᘟ縏");
    Test_ToJsonFromJson_Check({User("ﺎ쵍븿�", "", 0.5950809040083926, MaybeOfString("运Ꝉꊁᖚ")), User("ꞹ쎼䁡ༀ꡺㓠旝꛴늊Ʉ", "ૹ䱕᛺㋖忙暨埆", 0.5672242248278224, MaybeOfString("麑䲩ꌲ⿰")), User("阊谅좦㔧", "ⵐ", 0.10874484857020195, MaybeOfString("笽ᓴ猦⩋ᗐ"))}, 222273, {"", "꨷", "驸ﰹ珛㸤⇢㫢긩保"}, {563790}, "拕휄슎蕢ᆟ䭼", "퉒");
    Test_ToJsonFromJson_Check({User("锑", "柚촵", 0.22294546627576717, MaybeOfString("餢관쫣娪颥驗䂨Ɱ✬")), User("缜圆䐰饄音䏙∹ꛌ", "", 0.11348181921685199, MaybeOfString("暒쇠覡")), User("䈩휲쾹짨뵅윪", "ﳘ鯇剸錛⧡", 0.8535089669066989, MaybeOfString("ԗ䕔誮₏蛉鶋及帾"))}, 587926, {"ч▵㕓��"}, {284453, 38709}, "긶嘍唾滯룮욏䩘", "쇱묜դ旱嗙鸙뺦疂");
    Test_ToJsonFromJson_Check({User("彮ᢳ卜ቺ⊴䒁逬빡", "�嗡獉橒", 0.08436801335046441, MaybeOfString("Ὥ鬎紩泶ꏟ諹蔌쭚浸")), User("拣㰂岈鉤粤唸綔ᕃ臫", "ꞌ௣둪⸤Ὕ", 0.904775679998461, MaybeOfString("ࢽ㺸仝觪"))}, 140684, {"畜鄴쑬"}, {486925}, "鬒挿⎜䬇心", "倖催셱");
    Test_ToJsonFromJson_Check({User("瞁", "頿邬︺핬⤔臃龽", 0.40890543600959023, MaybeOfString("䰧욘")), User("ꇽᶅ쟂ꥪ趓ꃧ", "ꏞ餩ꐅ刹糝꣄㷪簾밺", 0.898605673992357, MaybeOfString("㰵恕೹⊅簬蘲擘粔ḁ㵎")), User("愴讲", "⽛ᶶ⒮딙턺䓑�秊", 0.641352122482542, MaybeOfString("⼵ﶾ䝩ᘘס겫"))}, 959028, {"ᅙ鮶"}, {-645971, -262629}, "꙰罸", "⣯苒漒꤇ᨫ࿪逽ᴲ");
    Test_ToJsonFromJson_Check({User("犍卣끒灛揩�譃", "羃࣯ࠨ龁", 0.01328889420874831, MaybeOfString("덯ꙛ骦敁䪴")), User("觇ﵓ䋯섺㟷댜陆濲縈", "ƨ柠", 0.12962431746051847, MaybeOfString())}, 4033, {"뻌५�啵⸁煿忲", "刾澌敲Þ욎", "픻䬔驱", "�硿ᨍ鲪Ω櫴"}, {-590807}, "⡆", "`");
    Test_ToJsonFromJson_Check({User("腎罈퀮鐘㬸짏⮊⼶疓", "Ù뭷ݏ괎崵�뚩쇟", 0.5806488127357554, MaybeOfString("퍑짏虲棖჻㿥")), User("ඌᘅǆ칁柴떦瘸鍶", "㾡琎鱡", 0.09902233495331478, MaybeOfString("略铃롒匴撘膺였睯")), User("Ⴥ⬚唴ꭄ傑㠒弱洊", "걲凌韵�", 0.20280762817841377, MaybeOfString("ʥ䦐㺇櫷犊")), User("힪�滹꫺簴", "", 0.6062206000118612, MaybeOfString("勳ꕭ㤂텟"))}, 219405, {"ᭌ쵇㟙ᖼ꺱ᄞ﹓", "", "蜘㍭ਕ�䳈닡"}, {502276, -220105}, "᰸鍠ꁚ᧬䑹", "荠ݲ");
    Test_ToJsonFromJson_Check({User("", "", 0.9580301772607631, MaybeOfString())}, 77517, {"䌹，㬿뜪ն"}, {876806, 818363, -573303}, "", "譋햙Ⅱ㞩ꚗ옴鬸");
    Test_ToJsonFromJson_Check({User("蓤Ẹ儂즀룗鰔", "顕﮽紒魝抍诫镤", 0.5411194570088385, MaybeOfString("녹桏࿣珟"))}, 721646, {"혘䂹", "㒛", "좇", "혦"}, {811926, -186066}, "胋焻좻︀牥諹淩", "");
    Test_ToJsonFromJson_Check({User("", "ṳ遺鹾㮉꤅犫", 0.6892049134193011, MaybeOfString("甴四�ૐ쐓揗鿽꥟")), User("ꚏ", "锃儝ඃጱ", 0.8184957885269522, MaybeOfString("㵺")), User("읜ಛȋ", "ꘌ", 0.035551049297466435, MaybeOfString()), User("", "赼䧡ڽ܏⼊뻴", 0.648458400111859, MaybeOfString("഍ᤵ襝籪浴腫"))}, 317842, {"巵䉌ㆂ뾏ᐤ�瀍䞳뎡擥", "貼"}, {-145198}, "읻↮愉佻纨ﳂ賕䩬식㾓", "丑胟筦");
    Test_ToJsonFromJson_Check({User("ᓴ櫷⠞䓪⊷傠䶏䳄몡", "�ᄌ詨俫럷ሇ穗", 0.4882487792001333, MaybeOfString("徐碹")), User("輎︗﷋", "癁㕻跽嶴ବ᜺䋉Ị㾹", 0.46010633765724784, MaybeOfString("䐍㣯댱乣溵䭼쫓致")), User("綳", "駮䥹�ᗸ", 0.5443555347362327, MaybeOfString(""))}, 227847, {"角᜾ꅢ캮猫존툘", "�卐", "ᐎ皦"}, {128866, 403684, -640612}, "Ա䉘૜ᄀ", "굵ߤ");
    Test_ToJsonFromJson_Check({User("⏙㞐�", "␘雼ꖰ埗�", 0.6195178072059144, MaybeOfString("逋"))}, 835766, {"ｼ", "㰗ɇ蟛䉟푐", "륩⯴�"}, {-476713}, "꾅ꆇ跿", "쇓");
    Test_ToJsonFromJson_Check({User("ឣ", "平Ꝇ겉男뒽鋆", 0.13045552332441113, MaybeOfString("摀")), User("税䟗ꪻ", "蘠ꑻ틸䔷귾렓", 0.26682551683244554, MaybeOfString("‎爉щ㜔龓Ⱳ")), User("ꁇ꩝", "", 0.0036360006796363744, MaybeOfString("")), User("䜆㬸", "伙窽ꯁ諱梁䴧롷饧", 0.45529567424920186, MaybeOfString("雳ⱅ"))}, 581206, {"㠱ዌ몖馻뛉␶ᔎ䆼", "柟饤禅㒕⑅횿"}, {195897, 45301}, "䎲༘窑ꩫ鋘ᶯ硰", "᯻");
    Test_ToJsonFromJson_Check({User("瀇蹣", "걳冯ㅕ쏬ᙶﵡ凞獇쎦", 0.2597104046771817, MaybeOfString("㖘�")), User("๫혯辒守獭䍰떌䭃ụ쳹", "７鲨㫠㚚ح뀇", 0.7725705242588048, MaybeOfString("宇ణ嗹省㆏")), User("�㆝䗆㔏띥탍餤", "ꨚ剧뉧樂", 0.3286835138353908, MaybeOfString("轴㎅崮寐徘ꡞ륡ﬔἏ")), User("ᵞ⯏኱팋", "", 0.8549523916351387, MaybeOfString("䥢㦕�룝紜攁䖦찋"))}, 626305, {"", "啪℘⬊"}, {-964196}, "䴐㶡趯₶棋ਜ", "�厗➚揤柡暝ㄵ隟");
    Test_ToJsonFromJson_Check({User("Ȯ挹챛鸠⃻�幞琯", "찖㎳鑰⠋ࢴ鱾", 0.18128126914672613, MaybeOfString("쁍⩖�ꦮ㚽Ꙫꡙ쐴翭䎗")), User("ᒋ瞈ﭤㇽ", "⢺씻ᷓ⺲趷썎賰ᣨ", 0.27812750557350346, MaybeOfString("⡽ግ哢遱뀧"))}, 49913, {"齎傾渾浶弗䒽丗澱", "䱐ၮ徬篚Ꮽ犍놙薣"}, {-859006}, "钦匲횭䂽秃", "蜯焢ꃺ");
    Test_ToJsonFromJson_Check({User("ᾳ�쳃轓꨻䴻艉芲", "┡", 0.4157958381882849, MaybeOfString("᥽ꜝ쪃醒")), User("蝂㛰", "좏뢮皽晌", 0.2358023003841761, MaybeOfString("�쉵圶㡘"))}, 168466, {"俇뚣䝧첳磛", "虑绹"}, {371853}, "䥑㶎ꎵ霆몞", "잗흔ࠅЇ箃讧ꊘ罞");
    Test_ToJsonFromJson_Check({User("춇⹻韁䶖", "硁뼰ᨦ촖ফ퀓僢ⵛ듛", 0.015054595663703324, MaybeOfString("隚唙콮냂ﲳ鈛")), User("৯ꇚ⪏䒱", "딐렴蔸系尴빮镮", 0.8148111374186404, MaybeOfString("羰䛷祇ᮖ臡臨듇ꟿᡐ휪")), User("寙臓ힳ蘏", "◗ન튘㕧෨櫕毭�", 0.8045932034983267, MaybeOfString("拓鉡�ৃ셒")), User("ఽ⃕紼ᔚ쒜皍娡㐵", "쨸싩ﶴ佯", 0.6109561657584068, MaybeOfString("㗃춯様%౜"))}, 984591, {"VΕ殪", "⚮첤眍쑗墏쪒", "극뮧撶"}, {365419, 372929}, "꽖�ᦅ", "㲞╒잜霽쒯");
    Test_ToJsonFromJson_Check({User("ꏻ�", "岐", 0.31470543673015455, MaybeOfString())}, 427841, {"ࢇ欥⪱嵗", "쌦ㄒ韎ᠧꝼㅌ믒"}, {-72270, -886112}, "", "ꄴ");
    Test_ToJsonFromJson_Check({User("篤꓃穴潃熕", "敯ꝣᵡ≐쭂", 0.35803831804452385, MaybeOfString("ⓡꈾ⠂"))}, 194913, {"紽集嶙㶱", "઩㘚೮�泌偣씻", "ᯕ࿜漋臣뤓奵汝瘙"}, {198707, 759290, -743571}, "洇⥌", "");
    Test_ToJsonFromJson_Check({}, 547950, {"칳ꫣ䞩ᑛ⁻", "", "ቑ죄ᑩ", "瑷䌆ଢ଼¢⚯婽"}, {919261, -785047, -858013}, "쨡零왈㉨☉鴉쨮�ႎ", "");
    Test_ToJsonFromJson_Check({User("䶃ែ槉浳ἧ鰙", "諔", 0.30026987628092516, MaybeOfString("㱓䩌攁ڤ࿊붉"))}, 111292, {"﫵഼豚", "ꄢ⅒뻉ꍱ쌱붇鿶⛍", "鵚赫୼黢"}, {-598565, 84290, 536024, -930061}, "嬊䁄흗˯韜", "꣉榑ᮍ䊒真吘햾");
  }
  
  bool unitTestResults_GameInfoFull_ToFromJSONObject = runAsync(Tests_RegisterAll_GameInfoFull_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_GameInfoFull_Getters() {
    RegisterUnitTest('UnitTest_GameInfoFull_Getters', UnitTest_GameInfoFull_Getters);
  }
  
  bool Test_CheckProps_GameInfoFull(const User@[] &in players, uint n_game_msgs, const string[] &in teams, const int[] &in map_list, const string &in room, const string &in lobby) {
    GameInfoFull@ tmp = GameInfoFull(players, n_game_msgs, teams, map_list, room, lobby);
    assert(players == tmp.players, 'field players');
    assert(n_game_msgs == tmp.n_game_msgs, 'field n_game_msgs with value `' + n_game_msgs + '`');
    assert(teams == tmp.teams, 'field teams');
    assert(map_list == tmp.map_list, 'field map_list');
    assert(room == tmp.room, 'field room with value `' + room + '`');
    assert(lobby == tmp.lobby, 'field lobby with value `' + lobby + '`');
    return true;
  }
  
  void UnitTest_GameInfoFull_Getters() {
    Test_CheckProps_GameInfoFull({}, 259677, {"╝㸌鐁", "⢢羋⽪㎜৏렊빬�", "躮", ""}, {-544397, 397204}, "뢖棱꡺", "ᒄ暭쑁㚷￣");
    Test_CheckProps_GameInfoFull({User("彲⏈", "拺윰蘆콬⨸۫芁", 0.2955936576684907, MaybeOfString("㞪㷗᤾虝䰒ஷ")), User("ꂆऒ涮�뗗텓酞", "漽똮覧﶑䙢꺰ꦞᩘ", 0.04260425457852159, MaybeOfString("�⿵枵ⴾ㬪●ꜛ"))}, 149817, {"ሕﯷ⸱쁍冼ǻ쥝ꋟ", "䜮ᚗҳ충멵ᶼ覵", "實㍜ꮗ꿘䋳ꠊ軈"}, {-863655, -723578}, "�뽥뤎", "鏓윃ᆟ퇚箺᧸䤩");
    Test_CheckProps_GameInfoFull({User("㤏�撵ߨ䯂䭱ꋔ", "姈", 0.41827590596781855, MaybeOfString("膅๴޷Მᑨ쾳"))}, 83749, {"�׭駭겯ƴ", "撏랭즫ᇁ", "賊惍됞ᨴ㪂ꦽ", "꿈�ᴶ"}, {-257359, -35785, -50235}, "丟", "歡洔槰");
    Test_CheckProps_GameInfoFull({User("痚ꄻ滇�ꒉ㳀", "쯳枦섍", 0.8669693329683362, MaybeOfString("의䉶杻�죝ᝫ᥾鼾㮦")), User("뭱過ଚ㩕ၪ㩾껫墰", "䕂륦홰떌䱇盰쩑虿", 0.12587531009962563, MaybeOfString()), User("ᳳ쁼﬩阚⦈郶", "弊䮷⃷쨗", 0.13365017908329618, MaybeOfString("㶑ꔘₜ齬聎雄攩澴"))}, 494491, {"㫟슷崠ᕧ◃뽽�额", "䥍ⅸ⯃쩆搊늜넚敦", "ꦏ"}, {-43258, 982620, -592072, -568754}, "ᐡ赪읝", "벷쨭욢璞");
    Test_CheckProps_GameInfoFull({User("", "奚좗謧痀㬙菣꿫", 0.6936034549463557, MaybeOfString("閜䈀疶뫰")), User("ࠆ祊", "嫈룭밒᥃탃�刑ᅘ鳰", 0.18248168992925515, MaybeOfString("쓍湐ય⾬")), User("걍퐮뼗", "�蹦", 0.9351039863820672, MaybeOfString("藄ங")), User("耓봸鱚뿽룣ӟꓟ砥㜬", "줯党Ὥ䜚", 0.7928762453575042, MaybeOfString("ᤳ⠤迤빩"))}, 917537, {"༏큝㫓", "嶹堠", "耢鬗⁴炆ᔻ"}, {23260, -301178, -57502}, "퉾돂띨體", "䡎ꋐﰸ⩱刞爆쁘攇");
    Test_CheckProps_GameInfoFull({User("", "쌘㙛핺", 0.35055312251232246, MaybeOfString("覑甃縎貥็"))}, 913764, {"쪄Ⲃ"}, {-565816, -746393, 309649, -85927}, "쪟怢瞱㻗﬽팊�슍郫", "뿎ວ扚듍꩐");
    Test_CheckProps_GameInfoFull({User("?탎", "", 0.1329194522150417, MaybeOfString("�㙇甬ꩵ屨蜍蕠")), User("胣颡攤訞", "ᥕ剃爆爣膡꛶", 0.8071342561427197, MaybeOfString("弨犳㮲ნ꫃뻪㬲Մ")), User("齶褱炋�Ժ蕧枪ⳳ", "℺꣺췽㇋嘘泅돖", 0.4926464816055477, MaybeOfString("⑼驏᩽嬨默䚥�糣")), User("튜좎㜶錏齜", "♤", 0.35081553335805216, MaybeOfString("姺㼙"))}, 972876, {"嵐䓸瀓䳻Ჵ", "ꁄ枙꥞琷᯵テ䪮䅎", "쯰㗟豺", "￰귥ጢ䨣뉐㕋"}, {-814345, -215942, 599862, -43735}, "䉳", "鲶헞雟❢�䖗�쁰ꢚﲆ");
    Test_CheckProps_GameInfoFull({User("犌郉鷪䈥⏀淓둬ਈ", "䃿fྔ㐔ᡄ鷂啕ኞ衍", 0.5910033265086838, MaybeOfString("鯪")), User("v鬕绽ᅧ猣�嚖竝嬑", "ធ", 0.5294649566195276, MaybeOfString("ꏛ"))}, 487252, {"嶽衃鳱䊞챆맰쵛"}, {766638}, "ᡶ⛥杭貴溪", "⦥๤즿ㄨ穂");
    Test_CheckProps_GameInfoFull({User("", "㣄咊ꟁ䣝", 0.5040179973021234, MaybeOfString("")), User("촨ﶗ峹ﵭ", "셝凐퓿", 0.7733385161372547, MaybeOfString("㧝䅴헜"))}, 598027, {"䳙䇶Ν曶됚简贙殺", "ᩖ彐쑥밃괦", "䔐炒悄௶揸ꥒ叵﨑밍뇘", "膎㠇趣馸揉"}, {-981066, -133965, -237636}, "뻼鉵朖Ⴈὥ股폰", "䪨꒥䉊浊믪");
    Test_CheckProps_GameInfoFull({User("駐윳陑镉⣀跺阊额", "嶻㐙㷀뵌", 0.00931580737666963, MaybeOfString("")), User("ၲႪ", "Ⰶ�䅴抭␹鈖躇탩", 0.5432770548124225, MaybeOfString("鍾齪床὏勐")), User("旻슽铟Ꙓ鐻ų⊺�ࠫ", "鴆䟎他�慺㗻", 0.7905579604164501, MaybeOfString())}, 427811, {"ꧼᖝ໵㘦恿땊₏", "霈뼧꽾뢟⇇", "欭矻쏖㤝", "Ѕ㴧輩"}, {-988127}, "�嚌솱挂ꁪ", "ᢦ폛⶯弸龭");
    Test_CheckProps_GameInfoFull({User("㛏図䋘", "똳䁶䉇ꖸ渡ꒋלּ⚶η㝯", 0.4400045994855485, MaybeOfString("蹘ŷ뇉ᝁ")), User("ꀓ䤢౤ᅺ鑪", "貆", 0.8166688274669781, MaybeOfString("蓸")), User("篱꯫慙㘊", "ട墳譐鯮㚰揉⫲", 0.16927879125311915, MaybeOfString("뿗"))}, 257288, {"뗔ゃ諪ﰞပ꙳㜢㠱뮄"}, {705336, -755839, -224287, -251972}, "롶", "Ჿ");
    Test_CheckProps_GameInfoFull({User("껲﹍", "輖", 0.9574405452969673, MaybeOfString("")), User("", "缰", 0.10002050413751067, MaybeOfString()), User("ڄ课幝젟󇸷쾨", "�⥉嫾쀵ꑐ", 0.5205555840025449, MaybeOfString(""))}, 810229, {"㩈㉡㘬䑰끰㕵", "鼁蓔浏඾繫䷩", "Эᳺ푰�蒮"}, {955306, 36520}, "䐊罶㭹뱍", "൓⾽㖉ĕ�뎿�");
    Test_CheckProps_GameInfoFull({User("�蝭靡힥虻鸞儸", "餌僸쐯", 0.19670441290210205, MaybeOfString())}, 692881, {"䪵", "푍봴�⿎譟䏭哧"}, {632578, -628766}, "闗彎⬟⬆餽", "㡫ꮬ拓൑孳洂겿躂");
    Test_CheckProps_GameInfoFull({User("剠ﺯ�", "ㇱ팜锏▽ꇲ䱐敫뒦숾", 0.5434649849978578, MaybeOfString("")), User("䅕ℶ࠿ㆸ僥▦⼛傟", "偂忺紘票彣饽柿", 0.1440124861635326, MaybeOfString("�䂁ㅽ")), User("̐Ⲯ", "꜔䤩", 0.2597230292203478, MaybeOfString())}, 431019, {"虒俀耥౩ꡯ᧠苶缶ϱ�", "棼檹"}, {-629721, -578170}, "垇疫鳼歿捺퇵�", "떵�鷜™櫃");
    Test_CheckProps_GameInfoFull({User("銇", "쳃骺", 0.9335319148067068, MaybeOfString("欬ጪ"))}, 81624, {"묁폹", "䥾箉穘ꇠ"}, {-764192, -394664}, "ꎕ珳룹螈蘰⩉呢唼", "Ҩ蓟㪽軔靹");
    Test_CheckProps_GameInfoFull({User("�裹挬裀", "眧畹㘅놔筶ꑢ", 0.12895811960518272, MaybeOfString("擝ֈ胑苒ᒟ൒")), User("팹룼崬", "䂗蓇郐濂笝췥뾴ⴾ", 0.22769235317953507, MaybeOfString("勵꩓ꓛꝘﺿю䗗ꕩ"))}, 667170, {"燥킅₎", "ፂ", ""}, {-618633, -701891}, "쥒瓶", "脍䣢椃錂");
    Test_CheckProps_GameInfoFull({User("︍歳컧묈䳖", "掜丗콪䛆", 0.3298187196859246, MaybeOfString("쬇쀞")), User("폓�印", "屳", 0.028634202679914518, MaybeOfString("║ｷܫ䪡")), User("裘쾕䮝�દ咾釫薁飏", "ఽ슆", 0.3905518727333061, MaybeOfString("ཧ씵袖")), User("뤸", "䡐膅⫳㸷", 0.6474535533447999, MaybeOfString("づ뮔죯뱿锄�ꦸ슇훃�"))}, 769082, {"�∗楦鷞≦烛ྦ蠔"}, {308086, 36399}, "弩蒬쬒閨്쟵㖥", "㹆㦌ꯊૂ혺");
    Test_CheckProps_GameInfoFull({User("虋", "锔ﴫ", 0.1823436139069235, MaybeOfString("종ᕉ豼೵㧑훷뢱⃹")), User("◫Ī ↥�獠罠㝎", "蔥瘤հ", 0.11891654930958363, MaybeOfString("ᘈ缥躒�펀ᯒ㙬ͳ"))}, 638707, {"푻郿", "�슌욵ｪ餤１", "⢈蹜衪蘒힄"}, {240742, -501602, 635918}, "䡖딇␮弢㒴캹차", "᤼蟋嵨㟠㕆蔎椑豫鰏");
    Test_CheckProps_GameInfoFull({User("ﻴ뚓◚꒟�ῼ錦鳕", "넢ꉥꚰﾹࣴ㦎䵽为ぼ⎳", 0.21661084621055557, MaybeOfString())}, 426363, {"䯻犖檣䗜띪鼖㛁귿", "辞羡褡✸", "", "鈛ⰻப"}, {-329823, 199049, 82105}, "蔨䠭ᄝ畨폮哨", "嵉�晴鞔ᥞ⇸퓎");
    Test_CheckProps_GameInfoFull({User("쪊솱⶯铊", "ᅼ┞弑쥶뙎䈢䞨泿쥄뒅", 0.5757174396774347, MaybeOfString("쀿")), User("", "铙ឡ撨㱫㻃뤉�鐠੷", 0.6554283321161887, MaybeOfString("貥喅览")), User("혤薦䜾", "绅ⷊ", 0.22085088222327218, MaybeOfString("ᾠ唏ࠔ㥳"))}, 642390, {}, {200159, -180087}, "葉崵崜뼺쪌", "器裪");
    Test_CheckProps_GameInfoFull({User("ꄅ", "�⸆", 0.6913804145024067, MaybeOfString("ꢑ塆猉즊镴型")), User("柳", "곰炤릻쨧፳�红", 0.14279190271291506, MaybeOfString("")), User("�ᜯ", "隌", 0.002084768843876556, MaybeOfString("몲쨉�똣럴")), User("Ж꾟눗ᠤጾ焤", "쌀㷨䓜诽舁楍㔓襥⦠ᩏ", 0.0950736860256054, MaybeOfString("횧碵뻽钰嚚휜㬉溸"))}, 747758, {"킱봣쩰ᾑ笍ᐠꟊ䱤"}, {-238744, -707727}, "ी玫伜埢", "鰳삋쌶ඨ╋ꦩ䁿ﯹឿ");
    Test_CheckProps_GameInfoFull({User("送", "㙢벾㄄엲┄杮", 0.8734825564890553, MaybeOfString("魐節�믜耿ᨈ蒁Ʞ")), User("尛ᬜ큀鬏⾍塰祛", "", 0.15092263051817317, MaybeOfString("䢒墻ߊ⭔䘷")), User("ㄛ嶂�", "咛夢ണ�拼", 0.28528044525779805, MaybeOfString("ꗎ�ꪮ㲸ⓤݜ撌窘룛")), User("㊢", "鑶㺽而텞줌벴", 0.0508262082239735, MaybeOfString("쵑쌂�恜"))}, 262291, {"", "鷵ኺ微ꋓ缪⫋⋔ှ瀞"}, {903837}, "豩ફ筌", "⤎首");
    Test_CheckProps_GameInfoFull({User("ᝨ뭈턡", "摃咹ｘ븠쎧㏆", 0.618531312615858, MaybeOfString()), User("", "첰", 0.1797405300567581, MaybeOfString("")), User("ഫ勺ݯ켾粼ò䙄䍩", "췮玙ަᗱ⸡┎", 0.5049529362027314, MaybeOfString("ꊟꁸᢠ炟摝侾"))}, 224693, {"⺩", "蚗뭘뗫�ᎆ"}, {-580713, -651574, -356563, -777582}, "쵑弶촒塯별໅ᷚﬂ꼻", "噥娟");
    Test_CheckProps_GameInfoFull({User("锨꒘", "빇⿜೚�卄蕦㨮ᩲ", 0.8233953168724641, MaybeOfString()), User("꫒ࣀ⒔舒勴⽭䭢旷鱑", "좿僤꛶갔쾟疦욋䳾", 0.594727709235031, MaybeOfString()), User("紵뎃", "േ歿ﳤ䬀떊", 0.49134235339767407, MaybeOfString("钽뿲虲"))}, 277019, {"궈鶨�"}, {54167}, "照愄⛁匚䅆炝㼏럘㊔", "謉");
    Test_CheckProps_GameInfoFull({User("ﱑ瓐ꢐፕ꿖", "빜Ǌᐜ⏢呡岿෹䎋ⱦ", 0.41740983278369986, MaybeOfString("䊍檭祬훼▜ऺ꾆")), User("玼", "㷀ꯝ抻", 0.10873933653754152, MaybeOfString("♓⺔ⓗ")), User("왟", "ꕿ䗲鞼⠆띠Ҵ偨", 0.27859475476601847, MaybeOfString())}, 711918, {"릎"}, {-886754}, "滓", "靐�昂㉆⭺쌵䫲");
    Test_CheckProps_GameInfoFull({User("", "瓐醘쥓㷹簝执쀰", 0.8818693551616135, MaybeOfString("꽃魝愯兝⢛")), User("", "䑰〵", 0.542196230749691, MaybeOfString("�閫ጒ쿟�蠝⍸⭫愡")), User("해쁯㔩裏鵟", "悜", 0.8168988124546124, MaybeOfString("౟稵")), User("淘", "౑啖З띜ʐ훣嶄䫢", 0.244309219179819, MaybeOfString())}, 643626, {""}, {253381, -511574, -849825, 862152}, "ꗉ놱ᡙ随", "푘낫դ묢苶픲");
    Test_CheckProps_GameInfoFull({User("灊", "쯇鶯逐蘆京ퟷ점型", 0.5318974380064279, MaybeOfString("ﯜ㤽")), User("亖䎜滺涸ⲩ墚", "玢㲳踮ꑃ웍錻ഝ", 0.6569102502693004, MaybeOfString("")), User("澜觛", "條괰럕", 0.6720926336348488, MaybeOfString("�퐁쩊"))}, 590747, {"㊀Ꞅ鵓蛜귮ꭉ贁"}, {-557120}, "ꀦ嶁䀬蹛鬏젮", "郰");
    Test_CheckProps_GameInfoFull({User("暼େﻍ芬ᠶ", "뗻ஹ誼䌵盅唄", 0.935483073319999, MaybeOfString("稣㴺")), User("옐皈酕", "悶樥쨧", 0.09428561343545355, MaybeOfString("㖤᠌�瓤��耎珎")), User("⭍ȃ䞋ቭ괟헽鞒법廑", "犏潯汄蹛", 0.08078583659640785, MaybeOfString("ﺶ솊姿㋿赟ꫤ揩価柅㥴"))}, 388, {"", "靂腏"}, {-582901, -660472}, "瓞㼆", "湖");
    Test_CheckProps_GameInfoFull({User("龱㽲", "귪�쵅齪ꉣ㜑ߦ捠ꞟ㵔", 0.16974716268933712, MaybeOfString("ꥢ쉿ᛲ孮ᐔ珸뀮")), User("", "䚆⼿诫䇽훠", 0.2971742787850901, MaybeOfString("퍰")), User("ធ뀣봌⾂ꘋ耬ꅿ", "ኢ纡骋ᮍ♛�佷�囒壟", 0.6082436952778342, MaybeOfString("ᤴ⑦辴ᅭᜢ䌠慹"))}, 880554, {"尺㝁ࡍḀ�", "荅릃⃶㨀幺՜硃"}, {39635}, "汈铅", "뚼䲵ꏃ㭠쎾鶠됋仡틧寶");
    Test_CheckProps_GameInfoFull({User("훡楃ꤢ", "睌棫楺龺搛", 0.02838465898688168, MaybeOfString("儊걟곽晁ᙐ犙藃⿅㿕")), User("蠪컉쏾ΐ⃽铘", "궥鹖��ᵤ薝焷燀", 0.5379086400093085, MaybeOfString("灀῟ͮ㪆⾽梋ጰ隅搰")), User("", "멚", 0.741627648352472, MaybeOfString()), User("咇斁榇싰䞵", "ꅨ撠똝祳싄䉬벴쟀", 0.3647919280290566, MaybeOfString("鲤닐↕屩芧卥"))}, 114185, {"", "ﾧ㤌�瞼煮前", "敚ꌢ"}, {-663627, -636601}, "㼚�࣡紙⼅ঐ�", "");
    Test_CheckProps_GameInfoFull({User("覊콮㋯밎夘㧲毢థ", "ꑸ犫", 0.2665179829422934, MaybeOfString()), User("", "䝋Ⱡ઎﫾㸅휌ẜ", 0.6449054855131104, MaybeOfString("麛䴓헟퍙ꕘ﫯큲뿆")), User("�岭", "찑寶糌", 0.15331778077097508, MaybeOfString("È뼔퍏ⷶꎚ"))}, 703669, {"膳肴⻜੬ⷶ", "☃", "苾ﾅ恬캧覔寔"}, {844201, 937474}, "埒", "ᯫ뽱뢽ᢤꑾ훾");
    Test_CheckProps_GameInfoFull({User("쓗툆㰛ą㒫姉彧", "ᮠ", 0.15076720442192965, MaybeOfString("꼼찗쳻Ꮊ핀⡖뀮ෛ")), User("붲䓂赀쏽꿨", "索㤓늗쥠롈㦾", 0.2954156269763669, MaybeOfString())}, 132655, {"ꈘ꘣뀭蜼흚", "∌剁�ᶎ", "ꪐ毧⢤Ԑ⋅坓敘电"}, {-834170, 908265, -538567}, "퉧ۇ㘻�龈ĕ怋됗", "꟥쉟宮⡱쨨");
    Test_CheckProps_GameInfoFull({User("윛Ꝍ뱴煰갛吮ȸ", "忖ꄝḫ봖⪦諮꒙쯯䐾", 0.23383762418936826, MaybeOfString("멖闬胨굮ⲇ婗"))}, 656419, {"澑땲䁫璎ំ"}, {69905}, "襳㺙恓蛻㗲믐", "塪曆");
    Test_CheckProps_GameInfoFull({User("儡琡﷊牘쩗뎌", "⩗", 0.14653544460727622, MaybeOfString("㵮")), User("", "㝮囹ཫ斃彸蕗䡀왠㺜", 0.5301223138953197, MaybeOfString("�Է舨♼刴"))}, 224318, {"㻳", "ヅ", ""}, {-440595, -988544}, "晗䃺믛溧꽎ᛴ톄", "汗");
    Test_CheckProps_GameInfoFull({User("⽑ᛜ㣽沒묋﬊", "޴큄愅釵䳛蠽谻髃鵍", 0.44838154197129493, MaybeOfString("䈺暦")), User("ㄧʁ鹠톲㽗ል剱豥", "躋带쎌Ὂ⺜囮傽", 0.8724211151117557, MaybeOfString("ᄔ鎔ꄉ삄뤹")), User("", "묲ﷵ͚囟蓵ʐɑຄ", 0.1299363976018207, MaybeOfString("䝟ꗺ엁้겫⎩❌ﯼ")), User("繾䰆㎿ꩡ闱∾돊罐", "㼧ｼꍞ媮쭻郘兾", 0.28894161818965414, MaybeOfString("蹪ㇹ"))}, 233501, {"ﴼ䭣ﯜ둉", "", "欍ℳ쯍뇼"}, {642303, 393540}, "", "⋜⌘獉ኹ竁ោ昉");
    Test_CheckProps_GameInfoFull({User("徸㖎銎熚榿谘ꖗ", "䗴鲐ὖ⧧ᒔ藼", 0.4852390394011694, MaybeOfString("鷺崫湮戀")), User("왗㬐ᨰ윕没㿊팏", "⃻䣾꣜聽듫灀⼮漖ꫧ", 0.1356758811211567, MaybeOfString("◬ࣧ鴛ⵇ璯ꛫ")), User("湻愇䘐꾋໰�", "ഺ䆹屛", 0.03649468209431259, MaybeOfString("뜜摷綤ᑏ⑹貆羦磣縗"))}, 874755, {"ˎ", "㩊䰝ꆓ؋"}, {137299, -198556}, "", "伺♍뎂⊺볟Ꞌ");
    Test_CheckProps_GameInfoFull({User("ꂒ鲁㚤㮝鷠俆왮", "᰽؊玑띬ѷꓪ鵒", 0.6549423298123024, MaybeOfString("㬿㟜")), User("脩咀䊨㈟듀꧒", "ﺧ埲섹", 0.7075438600534312, MaybeOfString("洷鮛슯欌萹药")), User("鯳䰈쉓亘鵦豑ᶒ꧊㣕", "䠬榗", 0.3947556272124665, MaybeOfString("걋⫰燮輢䥟ﺼ퇑ᄠ"))}, 881074, {"읔琾ឺ䉲擾뢺鰧ᱱ", "㋳潸", "", "柯돒냛얎乗彛"}, {663552}, "գ쇼㐃≁櫠", "觰耫");
    Test_CheckProps_GameInfoFull({User("ϑԓ㈢⡌�", "", 0.18277031052055318, MaybeOfString("ᐄⶑ")), User("䖥ݿҬ缦豄", "붚넏殺䗛摆軒", 0.7817160192791913, MaybeOfString("༗↥꓿ඈ槶胅")), User("嵦쿊퉈", "垃鼐ꥷ吢", 0.6994125385300315, MaybeOfString("�괫麨"))}, 743259, {"撀䒵", "⿉巧", "툐뵌ᵘ", "㵁哵븎챫"}, {-632078, 947132, 665720}, "좜루⚷녻ꞧ㥋㦑䛱", "輀례燪㓅痢⟪盆⻜");
    Test_CheckProps_GameInfoFull({}, 430625, {"鎞㾪㗪녠⠻좺", "峥韩㟕", "詼塹⼿�琘萖鍨", "끺ᢩ勎︟"}, {-760289, 854108, -805016, 251866}, "᳀놏溿찕엛છ쫢Ĝ�", "ힾ�Ḍ뼙");
    Test_CheckProps_GameInfoFull({User("㳱⭨․덥ꕾꇾ㜓䈠", "賱婽ఈ�甥鮻ꫛ鈳裘", 0.21666036370054836, MaybeOfString("쭻郒")), User("ꏢ", "翉", 0.5442870569155956, MaybeOfString("坆訳蚶䔫涄䓇鐒㻑"))}, 148951, {"﫢暁콇", "꺉୕醅ꭿ⠼⿰", "픾鷡큀", "ᖚ袪"}, {913827, -972647, 816058, 78520}, "뼩檧冯銮鏤㇠痜淟붆", "ꔠ⟨");
    Test_CheckProps_GameInfoFull({User("笴䇔惆", "", 0.7995719885451589, MaybeOfString())}, 157429, {"ᝧ憅긓쎱㩕�", "￦᫅ᨥ涢︭᥌뺞帘⩚", "訔韻꽩豱"}, {-679608, -411497, 255585, -304116}, "廗굨辇埉�躊瓆諢⃴", "�盧龊লȘ꤅㇑");
    Test_CheckProps_GameInfoFull({User("ྰ", "͑�綝䑷㺄␂", 0.47002085972112645, MaybeOfString("�ﯯ볉㰱⪾"))}, 35629, {"ꄺ⧿䊤ጰ", "⨇냭ᆱ纲縶飕왁䐴", "꘤蠡Ἔῳč᣹滼", "嚈娖䬛邉�䐫"}, {83055, 373404, 809916, 174267}, "", "蟨儑쑝榀襢㬛就䁙慞");
  }
  
  bool unitTestResults_GameInfoFull_Getters = runAsync(Tests_RegisterAll_GameInfoFull_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_GameInfoFull_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_GameInfoFull', UnitTest_OpEqSimple_GameInfoFull);
  }
  
  GameInfoFull@ lastChecked = null;
  
  bool OpEqSimple_Check(const User@[] &in players, uint n_game_msgs, const string[] &in teams, const int[] &in map_list, const string &in room, const string &in lobby) {
    GameInfoFull@ o1 = GameInfoFull(players, n_game_msgs, teams, map_list, room, lobby);
    GameInfoFull@ o2 = GameInfoFull(players, n_game_msgs, teams, map_list, room, lobby);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_GameInfoFull() {
    OpEqSimple_Check({}, 666515, {"㚥涬凙ﷰ눵뭩㵷", "춗", "첏", "ప欽᩻⫤"}, {-892555, -31923, -665256, -737541}, "ｅ㛵涜䉍ዯ뻚罳", "ᛱ떡ꖯ꒲풜豈");
    OpEqSimple_Check({User("뢦⇩㵣䎵甄壝玃勑", "", 0.5280612271875428, MaybeOfString())}, 591080, {"", "뇊챾﩯ᘞ", "㻇娍쪁"}, {174256, -617500, 783443}, "︐좙桭垛峵כֿ鐄", "冥㶶밑幖許ᬤ쿊菆");
    OpEqSimple_Check({User("䔲뼟Ŧ⃡釄", "", 0.8423379705484668, MaybeOfString("后⡆鍙")), User("䎕", "", 0.7456527895972378, MaybeOfString("Ἂ떋雄忙"))}, 358019, {"蚵⧝耏盧", "␜῰蹎쟳횱宙홧㉜는ꒋ", "摃䍎␷윸ຯ", ""}, {45080, -704891, 12172}, "䖡", "늭");
    OpEqSimple_Check({User("픽鳐", "⣣뾈噦", 0.7057623992235225, MaybeOfString("⻰쬟")), User("䀐硩", "䀿虿砍", 0.16778451864038804, MaybeOfString()), User("ࠡ", "汀ᆣ젙娣ʱᯜ鱦", 0.27617375984609766, MaybeOfString("쏥䁏ਮ虴簪䤀揾噚셑"))}, 830012, {"胤ⲞꫢᲉ䞧શ�䔘⾆䲺", "䜧侉"}, {-29005, 636232, 59523, 453007}, "櫇ꟙ栥", "ሌ괙");
    OpEqSimple_Check({User("蟉꾋ྣ驣Ⴥ烶ꦴ휇", "靿ᩬ□", 0.4413032994797934, MaybeOfString("짰ꌂ윝뺭눎㋨⮴柷ꥧ荣")), User("㑭畼〭⤓ﲁ", "͓墳룠డ㫠瀚䊠", 0.4670345822661345, MaybeOfString("错캈⧥疡赬ى⢍奟㜫"))}, 74999, {"ⱬ褑ཧ捺슅엎筄䄗灰ᔃ", "צ츷⩮", "ώ", "퓂䉰ꋗ嗳ರꈾ"}, {-70936}, "厙׊�猋┕", "蛖ꬹ");
    OpEqSimple_Check({User("뱜悶ꂋ鰲", "", 0.5815545742314098, MaybeOfString("鬻피䌱踀뤅芸")), User("粄⅝挝㠊", "共䳶넊ᙓࡀ컒", 0.01654610178272524, MaybeOfString("")), User("", "ꛬ苵䎥�쭲鄻콨�", 0.16696054356496806, MaybeOfString("�丮祒蛕")), User("᳢䩶㩒홌ꃢ｡뫇묯릕", "瓪ﲥ", 0.4717850212342036, MaybeOfString("큽咪઼側"))}, 829588, {"脫㕿덖揙�"}, {-314625, 370081}, "ⴿ㓶ࣛﬣ�", "賥硬⭷");
    OpEqSimple_Check({User("⠨ᄇឰ", "꜓ᵃ퇎赊ﴋ鎘", 0.5157240668850598, MaybeOfString("薾")), User("秲櫩䗥讖宦", "", 0.1571097137206745, MaybeOfString("畞"))}, 788261, {"庈", "撍䈒", "䨾㶜☭ෳ"}, {-446630}, "偵펫ῥ", "");
    OpEqSimple_Check({User("罚", "", 0.46170307298270197, MaybeOfString("聿妒ᫍ")), User("", "", 0.6835300743968832, MaybeOfString("㝳䵉貟↟ڹ錠쟓쎭뗧")), User("녮", "奺ဂ䳇텩㚽댯맑힊骝", 0.07801236355584691, MaybeOfString("㎭啷⨍揉"))}, 543714, {"", "犮"}, {-895289, -860904, -538153, 921986}, "彄纇鼗䘚秱", "㌔Ú銼磃헮躁潿鬐鿹");
    OpEqSimple_Check({User("좢統佩", "ည葀՗鄱쭾炞푵묺", 0.591653238791811, MaybeOfString("ﰃ҅飛曀푧鯄꟒䠂")), User("捻飰鵐剈箆玬", "�半⩩⁦皝义㗡", 0.4870917212623599, MaybeOfString("訲꼟榜Ô聈厳눟"))}, 291793, {"顚辑죹⪱濱놿宦奋", "", "֑⡋늟䣵", "렞흌ꄽ圦긡㴽䷗넱�"}, {-240161, 486696, 640546, -103525}, "럴咨ᮭ岾", "ꂘび�瘣댮杣ඟ姡");
    OpEqSimple_Check({User("ө㩣�轏", "⹳ꈰ뗵丷", 0.781670705313641, MaybeOfString())}, 138540, {"嫲�쓋쾙樂⏭⾗", "陉", "褼䅷퐔䝈⊻弋", "踠䦺褃帷蛲"}, {372367, 375620}, "縰㷇", "∁衽");
    OpEqSimple_Check({User("憚邷", "゠礊튵రȴཱིՋ㈭窟w", 0.42456420111682464, MaybeOfString()), User("率Ⅳ魨", "礸蟽袸▴れꘅ澏", 0.30004787878135586, MaybeOfString("ꢖ嶰읦"))}, 101815, {"—뜔愄츿첣⦝脘곅䂃堮", "㹺", "㟄䷫킹륦了"}, {-262968}, "淨�薮쮮磫呃温", "歓퐍⟳庶");
    OpEqSimple_Check({User("絟", "禾ﾫ䅖ꏊ軃頴", 0.4185838980686776, MaybeOfString("滆旌"))}, 508624, {"㼉媻뉾ᮈⵌ", "烨", "㩧⏕Ҭ辙巴⶯", "⌜᳜⌻"}, {-384895, -61296}, "ᨶ␫祡扁拚ꑧ⩱ꛏ", "밤ᬣ");
    OpEqSimple_Check({User("㪙뇞轓얖闻鷝", "", 0.05573202299686709, MaybeOfString("")), User("碫", "췧", 0.157741233314267, MaybeOfString("䫸貓")), User("懙", "斍⏀쌛Ⓛ", 0.4739580817865013, MaybeOfString("寮侬䐾ʌ蛆")), User("뙶븳㊯갘", "ᜯ㧳", 0.9969314369358735, MaybeOfString("㎐꟡썇"))}, 357193, {"ꩀ옲죥魍镠렳"}, {40017, 56856, 935449, 975296}, "食ꆔ뾘", "뼄");
    OpEqSimple_Check({User("븥", "摓릺칻", 0.5077152180055693, MaybeOfString("듴䎇꺥侚")), User("ꏹ꼡", "뱟땈ᛁ�捐", 0.9506422886395093, MaybeOfString(""))}, 225780, {"䐤ⴢ摅캑ﴆ牌핧ᾓ瞀鵰", "ᾄ龲尬度ⶰผ", "", "踟괮툘ꋧ힂汀䤦"}, {733492, 765047, -653412, -745878}, "탬鏩", "");
    OpEqSimple_Check({User("鑽", "", 0.8093244404575436, MaybeOfString("ढ़秘号麼◹۝塴惑涑")), User("項投᮪쥕箏﻿甆Ĺ甗", "౵泐詝潑", 0.15747195536153016, MaybeOfString("뎎⒲鸅煾❴⎋︡﹭Ѩ"))}, 288387, {"�", "Ư⥣䞘询獽", "", ""}, {103144, 191659, -533874, 202987}, "뽑Ϣ儦飼鯵駥", "饔");
    OpEqSimple_Check({User("", "┉堼彠", 0.6459683299278693, MaybeOfString("딠㶷蠃ᚙ鋩")), User("핋嶣", "쾖촱痛窆섀뇗嵢ⵜ", 0.6982797410796768, MaybeOfString("蘁䞼壄")), User("룦ύ", "봃鿒碀㿷", 0.2605245016797094, MaybeOfString("寇鼹冥풭樮쟓銀"))}, 751776, {"﹢멊┰ಂℳా演읎떩煤", "岁岮賛㚡", "闧㼅﬎梡"}, {}, "輒营ꗭ", "妝㩁⸳");
    OpEqSimple_Check({User("�晚", "ﶝ鍏톴᱀ꪙ韓㉲�", 0.265961967066844, MaybeOfString("﫿ყꉼ嵠﬙⹰럠"))}, 387569, {"ㆎ棌�곔櫽ꐫ␓쌍"}, {33190}, "ᕓℶ换ਾ暵", "锜");
    OpEqSimple_Check({User("葁霤黟ꮪ辝", "랂筙Ỵ莙▸뇺", 0.4856058044757721, MaybeOfString("곞ᘾꃥ촄㍕札펂ឝ")), User("떶⨨ᘟ戣⦻䭋톓", "ீ憨ቒ녈㰚", 0.21195091503297486, MaybeOfString()), User("旺沣￟㸄ໟ䄺ꐶ⯀", "䎲⠋젿糖앻嶚", 0.8497510547050047, MaybeOfString("热⹉㊘၁᫄鍹䨢䵟ۄ"))}, 19479, {"", "爙⋥Ⓠ�憝蕘", "疱↢", "�趸Ꙝ"}, {937115, 975752}, "⺲댾麎靜ꖛ", "긺簼");
    OpEqSimple_Check({User("集ꦫ詓꣜", "給軞䞕", 0.3853511118261847, MaybeOfString("쪗ࡤ"))}, 21479, {"嵵棓쿏", "᠟釿뾂䌑ᕊ愑㫷ൈ�"}, {-680624}, "য뗮訆脲溷䱨换ᵘ", "㞝苫�眊뭬甓");
    OpEqSimple_Check({User("쏸휞⬔轘␼", "㼳쬺義瘺픲", 0.38748035272000375, MaybeOfString()), User("⠟፤✷㈳﷥똭퓄﮵빑", "", 0.9752081283252724, MaybeOfString("짉⣻ّ")), User("珱鲅昿ⅵ�졻ꏳ沗怛", "㤾䝤㰯䕼", 0.060851917164796925, MaybeOfString("஑뚀�")), User("ꎢң�黾ᔏ셂몚첈", "ݿ", 0.20014436272911, MaybeOfString("Ӑ铨䄴ꓛ"))}, 726525, {"˧憦䫀袗Կ苔ꆡ", "蜵ᦜ濓୬堜ꗞ룝烀", "", "魔吓ꈾ孈틕଀蒍"}, {468193, 887225}, "륑깾귵獦㣋幺ਗ਼", "昳占㵊㱲﹒푽씛듷");
    OpEqSimple_Check({User("ጃ䴳攃ꃶࠋ嬫嗶", "玀톔榉", 0.49700651015015623, MaybeOfString())}, 477344, {"ﲤ"}, {-530797}, "攻엛", "Һᶌ唤槷");
    OpEqSimple_Check({User("", "䂓㯄좑콤삓ȴ劗ᄼ", 0.5736755573068166, MaybeOfString("㣶喒⅒瓮㫬䠜ヸ")), User("ꑆ鷍뒦羊テ", "烖ᩬ䎠", 0.8593378424920783, MaybeOfString())}, 527494, {"ꍈ", "", "㾕臨쬩㶷玖"}, {286849, -540378, 221720}, "鱚઄᷼嬺꼨㉫࠵聮怴䭝", "");
    OpEqSimple_Check({User("쩿ी", "㆒衐", 0.8610236113243847, MaybeOfString("棁༙㭮嗷㠽�୽")), User("鿸큿㱘嚶溇Ჶᔲ", "ᕀⲑ", 0.3577273955371824, MaybeOfString(""))}, 203441, {"匇", "绱㑝韼", "�磁齑"}, {596054}, "ᦦ�", "씨蔀ᖃ᫣똇");
    OpEqSimple_Check({User("蕛⑰ㆤ헑仺䐟ᘇ枙", "䞃俯ꅧξ랇㲑�㹘捲픢", 0.013078692840914565, MaybeOfString("믷γѦ㙉ﰵ鹖氫�᧬")), User("ࠄ裞ꥭ峘갤噴崤", "熭彰滬䫌", 0.4393614085574455, MaybeOfString("궶譪翝镵⮖铢뢇懅")), User("캊偛ᖧ⠀㲰", "ﵢ띣莹⫖㺄", 0.41716777319888015, MaybeOfString()), User("", "汃Q䵈戨葎푔", 0.17483106636201548, MaybeOfString("ڪ"))}, 927238, {"⩘烈ઓ籎"}, {378434}, "ڡꇹ", "࿍塾ᨑ垢");
    OpEqSimple_Check({User("낆놆舆곗", "औᇆ㿾", 0.1570250639491831, MaybeOfString("〬绾褟修쩶ꏒ莰")), User("ᠾ塨跤鼝흠쑛", "딯䷔틍냿ꬎஎ⃳੫貺軁", 0.8804959402794466, MaybeOfString("嗊ዕ뻣႒鐽")), User("廚", "꽹䕵ᙃ", 0.04756336847672396, MaybeOfString("쏳费糸荺伡燌"))}, 498049, {"뵷鉌䳷ጥ頦眞", "丟娜츀М符푰뽲"}, {-975908, 719823, 580044, -573425}, "閩쒉能䜶", "ᦱ塉");
    OpEqSimple_Check({User("ꖜ鹷춂﹋", "鑟➙虒", 0.33949963624565843, MaybeOfString(""))}, 921952, {"닭", "Ⅺڬ麇㕕㺘쩢ꇭ", "鈹혝ﴽ", "땗뎨๯엔"}, {-737490, -129340}, "⯏", "䖰⚈쨳皓咆");
    OpEqSimple_Check({User("싑뾃볆ⶋ啿모샄", "⠨℈뽋矧", 0.7664744512953211, MaybeOfString("㖉뭣粒䠖ꢜ鸑ᬙ韊")), User("캓磆ꏄꛛ籟휚﷐슽", "ꕮ罛搷衏홌蹙庍怆", 0.7299637187877501, MaybeOfString()), User("媃溼楌⟏鶰鑮㍴", "席醡裉䷪䶑輌ףּ", 0.840404935572485, MaybeOfString("")), User("㷊ꋥᣪ儺덥胹苢", "⭇鯸䓚Ꝁ", 0.9297352009125683, MaybeOfString(""))}, 137666, {"鐾㌉앷貶", "큚槲뷖悗롁ꯕ", ""}, {547714, -921718, -679909}, "잋䔚섄鄁굇垐", "笂鍙");
    OpEqSimple_Check({User("ꁦɹ�䴦㚝氅巃", "曰ꖦꪞ⹥돝鹁ྈ杫", 0.032857398983490375, MaybeOfString())}, 463075, {"騶ɣ໨ꝁ�", "鈔箲ჭ꿣꾶Ƞ", "ꪔ붢俟", "銂ꖓ噰醅祶�த"}, {-596021}, "�๰挎࣬裯", "癣못餌礵");
    OpEqSimple_Check({User("�罺쿔蘀綎씃め", "嘩﷜ᬁ狿昫", 0.6638399672991783, MaybeOfString("좑袆뷢斩ᶷ锦")), User("홁貽⛅엋駛", "ഔ縒Ԃ䐘♠넌", 0.8977260714851907, MaybeOfString()), User("䑩˨忩膃㿲鸌脜⧯", "翦㡏錅蠉l豠徴఺쿔芽", 0.3425370279431981, MaybeOfString("㛫狞ꪔ䋑๨똜넳景"))}, 322820, {"᤺ᔅ휢", "Π"}, {680704}, "먈�", "ꎷ镹뫮난");
    OpEqSimple_Check({User("㯂죷쯢ᅸ", "潃뮚己唙淐", 0.04514109764487534, MaybeOfString())}, 201767, {"ꔶƉ蹟", "", ""}, {-665660}, "篏ꃸ㗛擱�", "䛨鹭");
    OpEqSimple_Check({User("咍뇎䆎癐ᖀ㪥ⶶ龪", "聁큽꣔ᙑ鋃姸", 0.6291062764958973, MaybeOfString("擤᠎坑⹉")), User("崌ᙥ줊ꄻ뉒例", "", 0.054780640664873946, MaybeOfString("س▀롹舆၆")), User("䷧蛵竖췸ܫከꔙ", "鱤濫戝", 0.7030733999344863, MaybeOfString()), User("誺燛頄᪚桀䮭", "启ࢥ龇ᕞ웸ꣴ動⹠햲", 0.4189978695563031, MaybeOfString("漖ꄃ跚"))}, 317263, {"ﮣﱔ抃໊뛵溭ᲊ", "ﶷ⢵佫예ꓜ", "嫟剾܃९�ḭ駐쟅"}, {398751, -185292, 682623, 460421}, "᲍", "ᯱ㜬쇅轓");
    OpEqSimple_Check({User("", "綠ꫛⓙ朴硜홨ꁾ齬✌", 0.8920195241887213, MaybeOfString("蚶荕縰ᤡ⅍")), User("", "ྪ찘罳", 0.4166229969899277, MaybeOfString("ḿ⭢炙⸤甬塗"))}, 233909, {"驚", "﫣烎ぬః뙏콪", "舄甯ሄ˒鮻", "˂ૂ▴퀷ሱ줝妣"}, {614552, 274688, 704976, 532942}, "꽀ႈ胗჎롢㋎", "�쫫퇊");
    OpEqSimple_Check({User("낷㪶堵⒥헻ᜆ", "峀呈楗◰鍩匵礀陉⚏", 0.03405038688054792, MaybeOfString("寧"))}, 755395, {"쵗诱嘡ꋉ"}, {580710}, "⌋껚挷", "ꛚ鞫픏︂");
    OpEqSimple_Check({User("羊鰫鹰", "๠䬮颼", 0.49644268047830215, MaybeOfString("퍸枎ॣᗆ�㷹톝뙤麶"))}, 721250, {"밑㐥柔몍᫃횀㬀⊨玛", "怴撎涯밅᪬"}, {-393992, -686440, 598831}, "", "⎚箶쭀쫵漸歇鯏");
    OpEqSimple_Check({User("閪驲酙᥾쭓퉮ꦎꪽ", "築籹쀽쉪ⰿ⾕扚", 0.7195764378270024, MaybeOfString("⊶")), User("哅પ㊜뒶ᄴ湾㓋", "驿㘸�删", 0.5117357776089272, MaybeOfString("䬃房撻淆崰"))}, 365249, {"奩꩏缷π呖"}, {-270945}, "脆쁐�곬陵汹㲐ᡞ", "蒠ﱰ㢣");
    OpEqSimple_Check({User("᏿上둆᳣ᔍ䕶", "", 0.7185732371725949, MaybeOfString("䈖达鮻㺄گ틄㉌忹枎졎")), User("", "醶䢶", 0.8274666903668394, MaybeOfString("ᛀ䏰䵼뉭듓︣")), User("‣軎껬ヰ", "ﵑ妩䤽춫�羶㲨", 0.819222567518811, MaybeOfString("ꖗ"))}, 166136, {"毬稂퇄ꋇ", "放", "缢", "혗령즟㰺홈⋼昔"}, {-272447, 507230}, "뷬ꋵ厯꽦哈퍶", "ᢇ憖䯞愒ㄟ⯧");
    OpEqSimple_Check({User("", "覮๬녻舗賥䙳㱤㶺", 0.5637084122578186, MaybeOfString("䭼ﲱﱤꁯ寇롘"))}, 280731, {"櫒徼倱", "㝑韪汅"}, {303108, -919837, -894142}, "᫑≬෶㌼ᔯೲ韺쉟", "");
    OpEqSimple_Check({User("넩쨀틋", "秕왉碉⿟ꣷ㎑", 0.2764739353565843, MaybeOfString("⏑␔ູᲴ䮻颱槾ᮻ®"))}, 859529, {"畅ﭽ䀢瘠ಀं", "႘㝶觅ᦺ", "讛馲扻ᄫ쏰⟻", "ڈ崓けᒙ闤Ν氆䍱⥃"}, {604156, -157240}, "", "⦨푶饲");
    OpEqSimple_Check({User("", "덓", 0.16606353650151917, MaybeOfString())}, 170293, {"⍕컅Ổ̬", "힧柃걔䫄ꀬ紦諒", "✂ꈨ⬭෢"}, {499219, -115380, -965203}, "爓", "风袗绻");
    OpEqSimple_Check({User("ឡ唐淀⤉", "䛡ꑑ", 0.4240602936707718, MaybeOfString("츭")), User("珯︍ु歫仦î긆�इ", "애痸芥둹랃䋍࿽", 0.7327108884848239, MaybeOfString("ꨮ龓ꏭ訌헕春ꄬ隫ఌ")), User("擼릏堻ꕳ볌꺣", "奄�慞", 0.006994021128394651, MaybeOfString("〿턉䵏䭛㼪ᚯ⮍瀔"))}, 493054, {"㻁ﰕ", "⪻肖䣿`읠⾷뫝鉸䏦挌", "㘁믌ᑳ䔢∽ഔ⍥쪖", "璏뀬羿"}, {73684, 462398, -50741}, "蒷᫣惡᫩⊭�變쏺", "뻑�㙻");
    OpEqSimple_Check({User("틴죥", "콢ᡂ甿誕껰捉", 0.7182614098853718, MaybeOfString("ェꔱ폔⾉牢飛ࣲ賐音")), User("ᙖퟫƓ冐ཾĎ贿뙆縶", "ꍮﱏ喱鑐ꇮ陱ᨻ", 0.14012356528086753, MaybeOfString("Ⳛ"))}, 682623, {"챝ᾩ츫眻煯쓷᣻亅퓫峏", "삢", "뗘쓀獌꡺蒤昌ｕ", "Ɥ뒮"}, {327310}, "ꫩ꬗ẕ妙⪄䅼", "");
    OpEqSimple_Check({User("⸉ግ甆曁쾷", "ᎄ羽孨函灡掴칖", 0.7963607608323734, MaybeOfString()), User("竧㠍侮꽙༬", "媙", 0.4639622692316595, MaybeOfString("")), User("䪙ﱱ읇睦伓訫㻨", "ഛ胠볰㥪˱麎㔅", 0.18011421299544825, MaybeOfString("魙槷✔袡毲下")), User("헗褩ᴥ翭ꊕਫᾗ", "", 0.6476804021036627, MaybeOfString("ᝲ벝죃"))}, 249659, {"࠙", ""}, {-956073, -148019}, "烎柧쟄칂ᘁ캜鏕ഐ", "궕쀵薧ᄫʛ隸赐광ꢲ濰");
  }
  
  bool unitTestResults_GameInfoFull_OpEq = runAsync(Tests_RegisterAll_GameInfoFull_OpEq);
}
#endif