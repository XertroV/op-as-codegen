#if UNIT_TEST
namespace Test_DictOfTmMap_WriteLog {
  /* Test // Mixin: Common Testing */
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
    print('\\$26fUnit Test Start: UnitTest_Common_Nop (42 tests)');
    print('\\$2f6Unit Test Success: UnitTest_Common_Nop (42 tests)');
    return;
  }
  
  bool unitTestResults_DictOfTmMap_WriteLog_CommonTesting = true
    && runAsync(CoroutineFunc(UnitTest_Common_Nop))
    ;
  
  /* Test // Mixin: Dict Backing */
  bool Test_ProxyFns_DictOfTmMap_WriteLog(DictOfTmMap_WriteLog@ testDict, uint n, const string &in key, TmMap@ value) {
    testDict.Set(key, value);
    _DictOfTmMap_WriteLog::KvPair@ tmpKV = _DictOfTmMap_WriteLog::KvPair(key, value);
    string e = ' for test #' + n + ', k: ' + key;
    assert(value == testDict.Get(key), '.Get' + e);
    assert(value == testDict[key], '.opIndex' + e);
    assert(testDict.Exists(key), '.Exists' + e);
    assert(testDict.GetItem(key) == tmpKV, '.GetItem' + e);
    assert(n == testDict.GetSize(), '.GetSize' + e);
    assert(n == testDict.GetKeys().Length, '.GetKeys.Length' + e);
    assert(n == testDict.GetItems().Length, '.GetItems.Length' + e);
    assert(0 <= testDict.GetKeys().Find(key), '.GetKeys.Find' + e);
    assert(testDict.Delete(key), '.Delete' + e);
    assert(n == testDict.GetSize() + 1, '.GetSize+1' + e);
    assert(!testDict.Exists(key), '!.Exists' + e);
    testDict.Set(key, value);
    yield();
    return true;
  }
  
  void UnitTest_DictBacking_DictOfTmMap_WriteLog() {
    print('\\$26fUnit Test Start: UnitTest_DictBacking_DictOfTmMap_WriteLog (42 tests)');
    DictOfTmMap_WriteLog@ testDict = DictOfTmMap_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfTmMap_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", TmMap("豜䍤ꍚ㦁谱ᬜ", "쫷蚙폢", "弯䁝籤", "", "㵜ܘ閿", "乄䉹", "", "뼙", "칍ⷃ筯颔↢", "優缴댷턾ﮞ栋", "氏鰥鎾脔䚃ꑒ鼑혅", "覫돬홊稛㏭", "៲䔸僯ʚ땚㰎", "ʿꤜ즱妖䜇붧", "㏣咊䈍4ᥜ勼ⲓ", "ٵ搕霆ս㈖", "叆䈋㷸㕈�뙷瀊", "謪謓"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 2, "䉫ޒࡏ堶", TmMap("瘖暹ꝝ벤゜皁", "㤯沣﯄ஂﺻ꧂", "Ɓ㢛㠘풂ﱊ傹鮠糈", "쁇愾ࡽ", "ꑼ建皟䆆", "艚泄", "ꚛ躩˔�˗釹춎༬⏴翏", "쪘싣", "Ⓑ㘇径밋㧀", "ꝁ聞", "겣柆璢뎙�葘ꫵ", "�竀", "ﹲ缂釺耄隒", "⬺ʁ籁蔒헃㷸肳", "�燨捞ῧ泦탞ꙹ", "튧�웽", "꒠퉝更誓皵䯬껠ﾨئ", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 3, "번⤫愪ᑐ㥠⍟퇄푇柳", TmMap("믕㸊奯숑㚯붣쮑ꡛ", "ƣ튧鶬�", "", "�餥娧礁밵", "ꌣ", "ᣃ刖ꛥｇ믡", "玥", "椾", "⌎媑̟", "ﱋ", "躒蚗徱", "ꣵ죰爲", "䛊⳱獡筕됋䏄峹䀲", "홨", "錮앬撏雇㧱", "뽬쐁쳟", "簁劀ޓ匴薻릃难꘱䮲", "흭扑㒽㰹Ἒ㘂"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 4, "ꭹ膺ᓣ㔺͒", TmMap("ꋹ᧿뛀퀫ু롇", "휹ᬸꤏ", "羓氊❘刑ᡅ", "쿘죃ٽ鋷⠺닮䤡뎠", "벨ۻ珑", "呱鋜髫➙꟒", "", "橩먴�ຸ趓", "㦐ﰴ��㊚⊚嘄﬛", "ㆮ寗��", "：쫂ᜪꥶ詊讳", "퐮巧滯鷚�詛芑⊪", "⇗㸣ᠼ❰Ꝁ둑❶宄᮰", "畗⚻ꜚ嵡᷂ꏨ�", "뗛悗畆䃱", "펥䑽ࡰ�뎽䡚俄岵ᨪ敢", "揘韞", "ម흃鑳耮⠸ꀞ㪑蔇"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 5, "ٝ", TmMap("箱ﴩ", "乪剤⹥먃ꑐ㷠얌苫", "䞭橄䨛㾢┪�ဩ", "۸", "둭껦퓵뺟⪂䞨", "莫攃嶁ড়鏧呲䞿", "멃㳦꛹槛컙瞘䝩땑", "⺫晋败땒ဍ䞽隫", "ᇬ떝᱒ꑽ欄풼♃飙杒Ꜯ", "", "캐ꜞߴ圎䣃흂ꕱ", "ᨛ清鏵�Ḏ", "귷軿賨㠙踎鑲⨲", "읶㥄伟녈ꎨ♾췲", "ጄ㱛㩧⸎뺀癑", "꛸�", "䎬綏ಃ", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 6, "ꍝ", TmMap("㔚ﳂ뙾덲ᆰ씳҄�", "섞⌱방", "�漉ᖔ⬚줏藜㯓㑫峋抬", "", "䰍亿⟻᏷椈佟", "", "Ⰸ蓐ॣ栋", "仡", "年鴔꠿र칛첑彠", "럀斲밃", "�츺⋧保퓖躱阘㸄ꖡ", "ൊ", "", "鈥�쾋", "찙婁", "﫵ꫯ詡ࣲ'壯⹋࡭", "꼮䱹㠀ʿ穅�㡲걟蕅꠭", "�᫻"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 7, "蘗膐Ζ쇛台柖ꞑ䉾", TmMap("݄옐ஃ슁⾵蛆剞�求᱒", "펌㙪ᮑ䲲㜡鞰帚ꮛ", "䄁អ棩눫檞ᶮ", "⪇鳃왚꛾", "", "䛄ꊟ旾害컃", "펼藹嶦巯ฐ�悅", "�緧ꘖ䔟", "䎏燑ﻜ檈쾮蛣", "鷇㧭뚳틽駌䅋땀廀㶭", "韹菱뻏", "樝쟴訛팖Śਛ젦釞", "鏯ᯣ", "ᢪꃀݝ㢗", "移", "㽗뜐텙è핊摝簾", "熭贮봣靈샣", "塗퓖ᥙ㠗"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 8, "龪흛뾫˝", TmMap("ʊ郰ፄ훺", "筙", "⃱혳ᬪ섣", "촇煎", "⩷謝㱮奜ជ鵳", "㿚껍Ṑ䰯", "洠⸹䅒ꉓ虸팊ᐢ쳲ꄎ", "", "�퓔炵Ⴏ⠈⣦≜", "", "ᑛ", "", "ꦜق쩡ጁ⠦ደ藐", "㕛�", "٨縁㎄䰸࢕쿅硬겙", "Ფ褐怺㠂챡ὰ䙛", "鮿恱礼䍘汜⌓蹁", "鑟㓹껶⮏娧"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 9, "⚿벣家≉夞芨", TmMap("͉砅慄馢䲏쿁", "⽈쏎ﴣ㩔Ἃ돍뾔", "䱒ገ䒥", "㏰栝㥻䈲", "⍑୫屢㭘⹯탳ꍏ", "", "쏄쵯將룆햑菢ᴘ즬", "㔈慕⻆ᙠ", "䱲膯", "ꦰ⾩錛居芟큳괛䆏䨄ᤰ", "築䨪", "끓切", "緤猥廥绢␪䅇瓉", "", "Ӑ鲵粮䟊咬", "ᲁᝁ꾿", "굣㮚䶹", "쪩奓栥廻ೆ淽윭ꆹ"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 10, "艱ឥͶ葾볡怡ݴ", TmMap("䧭ྏ誓筿", "ↈ髞", "ᨸ輿緅", "��褖켵�怶", "趗婆引兘", "釅艵Ꜯ謃꛼䅭䭁", "〥", "", "�Ⱦ燷⑅", "쨙肮⇭�ራ䀄乡웪", "社Ŗ", "ꓻ親꬈䂺", "霅眾讅䃻齁긒⟵", "ㄖઃ롘ẕᶯ낪辸", "虰ҭ㶂", "툩晍睵A雖ᖦ", "堜", "᪊ꬻ"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 11, "၌�椔敲榹瘚蘘萷흱病", TmMap("瓩ᦽ�", "灗헱义咭䧛퉨꧈ົ", "䷙駒ꖷ贰ꗰ", "愁ཹຣ串飘蒑翰펵", "감潥＝暼鋦", "좫뺋㷠ꨐ클홈᧕๮", "䟈틻ﷺ", "ᖕ撬咍捗≱ᒎ⨻", "긭䣫ᬽ", "ⴅ�卟멞崅", "ꊪ�蚞쉺�抮", "鏗Ų霶ㇵ䐞⫋", "攦ꕫ쮥⪴ℽ靼຦贱绚꿗", "띤⻯胣迾쥡", "죋襰㹅慻콨畿", "þ㱚奏", "ꍽ嘚盿媗ꙍ쇄殒끄", "͹ᮈ"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 12, "朰듒逐(ꠕ", TmMap("ୟ젆嶐墿䡱勥㳿嬨쌴", "픜模첳편", "⍭ᢹ鞄�籾쩜瑸", "", "ḷ玫ꎯ", "쥩谅Ɯ觕ʉ첃氁�", "谊ㆵꋈ勵寀儍漥맩᠀", "癑눋Ẉ됕ﾼ伈", "쾙", "䞰", "㛇ﯶ⥄", "蛭譟", "慱η䉚ಒ碙", "", "⟨쵂秮籹", "", "⏛줨䈲닌郆涋헂", "㌄쿳"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 13, "�", TmMap("ॸ鑬䁚궗젥턤ΐ", "驎", "", "ᤦƼ뵕Х芁幃㚌⊇", "씳鮄녞⽝摰꧷", "㣁", "虴镀郑ꬭ恢㲟", "鈾箶묀䘥", "ᔂ킁募㱌鳑鿹", "ۙ囵䚱阉ﻬ㦇", "⤡쌩繄歚ᦆ⫮뾧Ў죬", "茿⠿챯顈꓀鼏", "ץ", "屏ᦻ", "蓹鷞笗", "�瘯匿觺洚䲥", "営", "Ų�ೲ㏎Ԁ碂拭"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 14, "⊄哆〽혗蹙ů悢⺐ﺵ姬", TmMap("繧", "巖綡條", "轐緋�ᕖ", "䒲ፃ䐆ꏣ躘䀐틬茶涌娣", "⸪ꤹả쏸", "Ⴢᓊ픨挠", "ᴉ鵂", "얤䡔폃븴귩ၛ", "�", "", "䊟☢톡嬜嚨", "믶", "鐼ꈲ㪑填䐎쇵", "᜚痓裠艷陆쥿��", "⯇嘣", "̘ࢲ", "훨蛘똷ꭍ﹄嗢ᣳ䡛", "⪱"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 15, "ඍ粑給ឥ豈ꡎ虌ᤨ눒", TmMap("淂菢�䲕㿨", "M쒸냼搳", "俅䵮䕑鲆㣐쵧", "釁要倓ഔሟ", "䆕篔", "쾊㣦ᷙ�뉆", "，㿀㎮䜫㯉", "", "", "벝ꊢꊜ甆⇫⌞赍", "ᵸ笑퍩쑬", "ﶶ꼺昰뻝Ẓ偦", "殏㞻ᓵ῁쀐", "ゔ䌝難鯼ᬚ虑䖏", "䗒숊਷຺茻ᡑ鵞", "葳⡶⳻镟", "걲䏺", "ᖖ䒞ﱧଉꮭ㫚⤌"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 16, "ɔﱙ䑓輑䏘諚厶쳧", TmMap("田", "宠쬯ꗳ", "﶑꽤२莀켙㎉㯨鶆", "糒", "", "䦅詉翰쭧杀㣖讝�駥", "浿ᥝ䎄ᇫ", "镋覴뷵㿱", "됹쉜넿", "댶夷芒ѫ", "諶泶漀卆㚪褝◮ꋍ廙", "곍๘콳쀥缿娉", "Ʊ", "㴼誏埤�ꐳ㭓桂즻", "࿎霓", "ⵁ", "ᙀꦣ", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 17, "⿰摹и虇孪", TmMap("퀔ꂙ", "继鄚힟㞀", "䨿밪屼໠緸ῌꮏ", "뢬瘉ᓔƮ", "ݶ", "ꋇ�", "", "ᆛ", "ᆔ峂ူ᫦", "颋惲ᭀﾢ澬ꮛ꺻᜛宂劀", "觪", "戮댬꾆⚝浩爷퉓", "쾙緭", "悔嫨犃돋⪠斥怺돔긖", "Ṽ홞寷ﵣﳸﳉቇ蔥妄", "ẻ趁稓닇뽴팬쓨�", "䉃ꛫĚ", "雦ډ⁷츟"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 18, "�苯趯Ὧ⼆謻쭃ᘇ", TmMap("䐩ꨪ皷䂉", "穐浩", "䘜텓", "빅馣㮳㓸皫䯣≯䘏䚹", "րᑒ㾟娠琴䄽쉵�크仍", "숟⒗닪礗삶ᒎ咲", "�ຯ昤玠㑇旧ﾔ址", "菥킁務沿뭧", "꿲", "諻陥蹍庎⪱奁볌諳命", "奋ᖰ퍎민뿷䐉", "볱⵼ᰒ减ഘ㻎秪䫨", "䝼퍃", "餂⁻멒ϝ䤄멵溑摿芟", "�ż䘛࿎麭짱늱겜寢", "﷢䬻࿑�", "焑ⱈ௖菪䮥䫝鮞䬇ૃ猊", "큽鮗細"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 19, "讙뢠Ⰸꎨ続㊪쟣", TmMap("⭈6ᅩ僦�", "", "�櫿꣡畓ꆸ", "虫젷倡", "㎜", "權欥", "햽埼轏쒀뙨", "ꯤᮀ", "", "�", "热化", "ꎝ埁ꧠ뫕♈혗", "틗괃", "鸧囮", "졛妩㻨콖ꣳ", "ꎘ龎ꬣ", "杍�俨Ͱﮕ䜝隳௞㟈", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 20, "癩砠쨧䗾遝憙", TmMap("衮ॎ䠑᠏쓚摐䇁䍗", "榗", "륗䉂꺄᠎", "ˠ벝", "踻挣頳滽", "埅㶧좡뇷牵", "", "", "圞", "朩땩ᛥ", "竅沃Ⅴ", "潮긏褒�Ʒ톴ⴘ왳", "ᯰ륡", "ᴒ瓆᰼툶ᔲ溓岦", "遒轘៭鼢", "簎��鬜板墔ﭠ꽉", "ⰾ㻷", "ꚡ拷"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 21, "⼭", TmMap("", "", "ퟹኊ", "ᖻ奏思躷֨", "ꑋ뉉⇜熔", "롊", "", "䔖틝탽↷돣홈", "", "❘ᆛ柘콮", "", "谷⧚훔Ꝉ㞅", "薹䰡ѐ简", "歍﫟蟦쾇啁쿀", "쀧ﳇ", "黚", "屴䨛쵊黹礪⾿", "␮帱"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 22, "렎᠈�﻿", TmMap("䶟锛ﺄⵥ㷨", "㞅匂♈ʣ", "⺭⬭迪", "妗⬴㊯၉⪵സ", "⧟韽๹⿼샮�", "ᜨꈾ앪ﱋ쳼攆뉃", "輄", "묉�콉�", "椿磍올", "뮀㴿퍱г㈓あ泥", "猉先뭠欉", "䷤ㇼ喉縚囆꥘", "䚑", "璫睜騲˚뉣", "㎿週㯻룂ｆ㋳ꇌ㿈볱", "", "〉໻蚤ꁎ", "ﰇ銳䵄뛗适皶秺"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 23, "နꋌ", TmMap("瞌", "㥱꙾⾩ㄘ", "釦", "�耶⬦騁䰟剄✅料灮඀", "뾥漒", "岮큱沨畓", "쇗ⴵｒꍉ뷉苲", "⾡", "", "", "ﰙ", "喇덉覟㌩蔊", "쮆⪘", "憮쬠�র펶靎", "໑讒䙠끐Ãﭓ䗟傝", "", "劎쀎붱ʬ", "묭㢜緞խ乸➄쀟"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 24, "ᭆ㻦䋰荡", TmMap("崮纆讙뒖镳ﯘ渝悮㻐", "ꬱ", "千쀿藒", "锽뭢", "稁䑆⸏嶨䨓ㅾ纺쀞", "戼쭐뾑磉脘", "掱袯�큂詮㹦", "㟙馈죰", "녠", "鵆맻㎀ᳺ왃魶", "厀ኙ�訓", "彿⎺ܩ", "锸ꞧ䤂扃좧", "⍽", "鿥珣ŏ", "땔尰踝픇➧瑖ẟ", "ශ䬑䎴", "䑺ᏻϩ歡"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 25, "膕⋂�끭�㊌ˀ", TmMap("扯㮰ⱻ", "歙�興삪�횺끟뫔듲", "⮴鰬筨䏒", "홪雑쾥봂ɥⰑꉹ", "縣좲洓㎪ᒙ鳲", "簈㠎�⮗䲜툭�ቫ", "엙⍡♲딃䭄敪뱩ᐊȧ佦", "⎠椺㙚捊", "ᓯ⋴籉㛰ੋ", "䚇", "ꮗꞺʶ፩쭢譈ꆏ멁꫈", "", "ꘐ፱鮺孴ᓇ盅", "︲୶竿ꐚ厈", "䶒怬뀤坥磪ⱝ⦤㠂ツ", "㎟", "虙慗", "㜭"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 26, "窏Ϭ偭뾜緃跐聏낟", TmMap("", "ἤ፠趃쵠ㄢ", "䢘רּ熩", "䶢늬뚒ﬔ䖿灹", "矲易驉竣", "턭쳔䙢ﵪ偺洰", "⢭", "�䱳⫕⽎", "羆猆䨕೶啩裾烑俚諽", "믩", "ਥ峆춣螚�䄖곦ෳ湍", "釔촲梏䔼", "ﺊ⽧Ἲ냡", "䅚⇾뢁깃䁊栟�㇡", "俸⾁㤽莣", "咺軦螭ᢐ㰦淯㧭ၓ", "堞뒨", "쉮汎윮퍺뻜ᾘ橛"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 27, "犳ॾ훞鳛", TmMap("倸⪞䳴銹", "⡐洉䤃树敍埘趬䡿鮔", "⬝얗⢊ಜᏜ", "せ", "㣴Ꙉ嘎", "緶⽋थ⼂䣃๘̩٧⟄", "땉໥g毗", "ᰌ㟳飳嶄ᐺﲦ牜", "곙ᴱ焌䫅렐昙妠", "㾞", "်﬩융巉籢", "ׯ沯詋ỷ佀꒻䯌᛽", "䅤痠梦", "䘰㵣뵦ꛓ", "⒃㻶旡⅄檽", "ƶꚗ㸴镝ꇙ", "䖮윽櫈矩", "㹽쌜갡狿㧌痗탥"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 28, "�㑺诏돐矑䗏", TmMap("ࠃ咐ω脈ᾈ蕜ㄏ怹", "ꋯ菙", "ꮝ狊ꁩ", "秜�ት僉❓롖䨻㪚틖", "쩉繉⺖靸ꘙ錨蘇熼俈⓭", "頼岚럖�鯒乪✖", "퐢", "̿ᆪ됏揿칳㨹", "资", "꘿互䌝턁첔倲ꁼᗟ梛찦", "蹈歍쀏᭛", "嫕莗翺ꏵ", "㨼䑺ն", "", "", "", "䵾약", "�瘓"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 29, "䂚Ḽ羬࠼㛨", TmMap("袼", "셯䑔램㸐", "痧᭓", "풋픽퍱", "䜙ʤ峻", "㞄⼬旻尳冧⾲", "슡", "릢맭", "䐥ꞡ掠횺헚릈", "؆", "煰ͣୡ쀇兖尫䟟", "櫀믾蛤౩", "ࡠﵥꂙ셚㧣", "蕜ᦃ蹆�笰熯ﶠ錹ྭ觟", "ﴅ젢㪳區酤鬦墬⍳", "큈惑憕ښ瘨䦭嵡ᩫ휸眂", "ꌞ됭䙷�", "窴㿹痕㫴ꆷ跸潨適웁�"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 30, "ं", TmMap("遵毺瓖㕵펢", "￼ꬎ", "唥閜걫", "贤Čޘ겻䌨輮๫ꧣ记", "섛쎻", "Ꮕ", "፵歼夀䴖奀", "ᣮ뱌멎ꛆ寨뫔", "", "里틨昻卵♦Ằ鬽妰멉", "卷ꞎ", "潬쀇霾곜髹ᡀ", "�⽦榰ઍ썼ន쎸", "⬍鬖厳럐背媩ﬡ䑪醟", "╧꾴됗Ლ㑳縀쩶", "毋禶㕍늳茞휆", "䡍澎៕", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 31, "흯螀척ⰺ샯௴", TmMap("甥ᕐ嬣陵信돷맔钘䞺䄹", "�셚䜒", "", "ᩩ颪躰胏霵鲕慷䩫䭰", "�", "黚必ᐽ拚⩮ᒏ賛貜", "赎䖼宦�蜡䞉ۡ", "氜�忻牃ಂ볩挢裺", "▭", "ꌪ㝏迡؟侯䵟 䉴", "䫴≦鸸㨭ﶙ", "쾫籃㵢ꉥ퐭", "郙ꇧ軔薊냹텴", "⛋褓ْꇤ", "䛂罐㜤襔☃꣨ꎉ", "≹⿣괏핽䋀鐋깛蟚", "໹꒵睖搖�鶙㪊፤܎", "纏陵詵七ᴴ⮵덚嶎鶹"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 32, "嶥ꘈ먂ᅚ馩⟪", TmMap("뮑顁稜椨埥㨧澛❾", "馕ꬑਢ쬨톆", "綒灷젖෈㍩햿깨㭦", "ｽᾔ꿱豣吤ퟥ쑮蘍龲", "嚰陫廗껢䌓缹뱉恼㸊鮈", "℈", "띰낻", "ダ픆좦Ӈ协闭ꔀ懓", "괚쒁䆚鲭ⷉꧡ", "눗ﴏꃘ몳啿", "ҋ", "錋噆", "ῲ", "", "晗棹⚗䲟", "맊䕸ᾝ犫莜㩚줪", "퐰ଫ", "ᖨ塛䙎潓"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 33, "禮", TmMap("毀቉昱ອ苡聞", "䮨鬿힤Ɽ瘅⥩嗔忴蹮豠", "鏿晵仾曊삩閄魄䯃", "趛葊⼤ᦾ�傔欧", "᳂", "短取泱", "쇘׼줒얼陜୪⦇", "", "", "뗂舟瘣", "ᜧ嬱鞸峭", "头澪䪰녨ɴ䮮䒼벞噵꛿", "鷊⸞툍뙜૟帒䰋", "﹘網ℍ䛥", "하╓懘", "", "ཬ", "楞"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 34, "둫ƶ͇؁�옶➇̗", TmMap("帒櫴迿쏏", "蕣揣웃貤䔦큩伈", "龝ፊ셭젽ﴤ鍟쪆", "橁崟椌", "Ղ", "லṤ", "늰㚉쌱廥偁", "", "즿묣䖱췜钺冝鈜怌ኚ䶏", "ả䈛⾱ி��펈", "⃻͓䚏욉⇪ྚ", "ߪ", "滵ᨊ", "", "뮅�梁嚄", "镫", "█邝桤Ӑ혮", "貓"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 35, "⽐⼬ㆻ꼃", TmMap("룇ꯃ", "润಍陱ᔀ뺢", "䣕싒磮⬋몉", "ﻴ㰡죴ダϿ穵難⺫猌", "ⶈ扊,ɔ", "ᄷ✸둙㠢", "솋�絊", "", "뀳삉툖╹峒", "♢춞ㄸ㵴櫬걄撵䙊㢲앾", "", "蘬ﳁ㹧摣稍뷐挚쩎", "距�闧", "", "", "䢤䞢亦", "ᢳΖ", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 36, "㟥㕝딦", TmMap("駂擔玺", "㱊ꓳ搋⋆詆", "졪秣ᯐ㧄鮂Œ㧒繠", "ꐳ⡮鏯沏ቀἽ", "饞ㄊ갌�誱", "騺Ỡ榖", "踸紥", "扔図뽑笍럦", "勗坭蕆㜐ᇖ", "Უ븻鏡畸꺄", "헲嫼㱆㑟饂近", "렵躁刟㋀娑趲섄帟鲸", "ꩣඵ挨", "", "퐣懶�Ĥ", "᮸衵�", "", "�ꩪ瀞옶횀裖↾纤"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 37, "呶枂␠", TmMap("ꣳꦶ璒⨋麕⣠ﰽ", "岄㦁⢺춸", "儤ꥱ鞫靕崔⠪⤺", "ꗺ�ⶃ㖮쌱鿈㝮", "ࣄ鳑", "꺠嶑Ð蕴햀剘嗵", "壾퍦흅", "빦䁢䌸҃挬ଢ훋헍㕈꣉", "", "瓾", "죦᱆劑⇕帕㧔", "ᭅﻫⵂ", "ಝ�⻦쮵秧ᮡ読렚", "歡պ飥茉샰衄⓯Ⲓ", "䀪㮼令嗂ㄩ씚ꬼ掎", "㦑コ쁐빘㉕⫾鼕挆峽", "釀�", "袅❷"));
    assert(37*2 == countFileLines(IO::FromDataFolder('Storage/codegenTest/test/DictOfTmMap_WriteLog.txt')), "Should have written exactly 37*2 lines to the log.");
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfTmMap_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfTmMap_WriteLog.txt');
    assert(37 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize());
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
    print('\\$2f6Unit Test Success: UnitTest_DictBacking_DictOfTmMap_WriteLog (42 tests)');
    return;
  }
  
  bool unitTestResults_DictOfTmMap_WriteLog_DictBacking = true
    && runAsync(CoroutineFunc(UnitTest_DictBacking_DictOfTmMap_WriteLog))
    ;
}
#endif