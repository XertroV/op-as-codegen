#if UNIT_TEST
namespace Test_DictOfTmMap_WriteLog {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfTmMap_WriteLog_CommonTesting() {
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
  
  bool unitTestResults_DictOfTmMap_WriteLog_CommonTesting = runAsync(Tests_RegisterAll_DictOfTmMap_WriteLog_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfTmMap_WriteLog_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfTmMap_WriteLog', UnitTest_DictBacking_DictOfTmMap_WriteLog);
  }
  
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
    if (IO::FileExists(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfTmMap_WriteLog.txt')) {
      IO::Delete(IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfTmMap_WriteLog.txt');
    }
    DictOfTmMap_WriteLog@ testDict = DictOfTmMap_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfTmMap_WriteLog.txt');
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 1, "⃐빌ᗙᕱ꥞䞥᭖䍵", TmMap("豜䍤ꍚ㦁谱ᬜ", "쫷蚙폢", "弯䁝籤", "", 584122, 8624, 257855, 444245, "뼙﷞䷨乄", "칍ⷃ筯颔↢", "優缴댷턾ﮞ栋", "氏鰥鎾脔䚃ꑒ鼑혅", "覫돬홊稛㏭", "៲䔸僯ʚ땚㰎", 828138, "ᥜ勼ⲓﶄʿꤜ즱", "搕霆ս㈖瑅㏣咊䈍", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 2, "叆䈋㷸㕈�뙷瀊", TmMap("謪謓", "䉫ޒࡏ堶", "瘖暹ꝝ벤゜皁", "㤯沣﯄ஂﺻ꧂", 432877, 369191, 827732, 585107, "䆆㸾쁇愾ࡽ蘅", "泄釳ꑼ建", "躩˔�˗釹춎༬⏴翏堙", "㘇径밋㧀䊧쪘싣Ｋ", "聞풖", "뎙�葘ꫵ悂", 320871, "", "喠�竀", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 3, "ﹲ缂釺耄", TmMap("⬺ʁ籁蔒헃㷸肳", "�燨捞ῧ泦탞ꙹ", "튧�웽", "꒠퉝更誓皵䯬껠ﾨئ", 938887, 548107, 275210, 746771, "쮑ꡛ쏜번⤫", "樹믕㸊奯숑㚯", "ƣ튧鶬", "", "�餥娧礁밵", "ꌣ", 19055, "玥覫ᣃ刖ꛥｇ", "椾", "⌎媑̟"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 4, "ﱋ", TmMap("躒蚗徱", "ꣵ죰爲", "䛊⳱獡筕됋䏄峹䀲", "홨", 65272, 321869, 537084, 432401, "쐁", "릃难꘱䮲哎", "", "扑㒽㰹Ἒ㘂�簁劀ޓ", "롇�ꭹ膺ᓣ㔺͒桝", "㿎휹ᬸꤏꋹ᧿뛀퀫", 303837, "뎠쫫羓氊❘", "", "닮"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 5, "ٝ", TmMap("箱ﴩ", "乪剤⹥먃ꑐ㷠얌苫", "䞭橄䨛㾢┪�ဩ", "۸", 230141, 522418, 611883, 411634, "攃嶁ড়", "㳦꛹槛컙瞘䝩땑̀", "⺫晋败땒ဍ䞽隫ा", "ᇬ떝᱒ꑽ欄풼♃飙杒Ꜯ", "", "캐ꜞߴ圎䣃흂ꕱ", 530573, "", "鑲⨲豯ᨛ清鏵", "췲뫤귷軿賨㠙"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 6, "㥄伟녈ꎨ", TmMap("㩧⸎뺀癑厘", "", "䎬綏ಃ�꛸�蔵ጄ", "", 360730, 876609, 417401, 832404, "ﳂ뙾", "䅠", "꽰섞⌱", "藜㯓㑫峋", "᏷椈佟䏼௥�漉ᖔ⬚", "蓐ॣ栋㢺䰍亿", 372790, "仡", "年鴔꠿र칛첑彠", "럀斲밃"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 7, "�츺⋧保퓖躱阘㸄ꖡ", TmMap("ൊ", "", "鈥�쾋", "찙婁", 360745, 797319, 648241, 182563, "㠀ʿ穅�㡲걟蕅", "쇛台柖ꞑ䉾ᑄ�᫻꼮", "슁⾵蛆剞�求᱒蘗膐", "䲲㜡鞰帚ꮛ݄옐", "អ棩눫檞ᶮ宴펌㙪", "ꀠ⪇鳃왚꛾", 44122, "䛄ꊟ旾害", "펼藹嶦巯ฐ�悅", "�緧ꘖ䔟"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 8, "䎏燑ﻜ檈쾮蛣", TmMap("鷇㧭뚳틽駌䅋땀廀㶭", "韹菱뻏", "樝쟴訛팖Śਛ젦釞", "鏯ᯣ", 735984, 328733, 466309, 428539, "移", "㽗뜐텙è핊摝簾", "熭贮봣靈샣", "塗퓖ᥙ㠗", "龪흛뾫˝", "ʊ郰ፄ훺", 669412, "섣婄", "⃱혳", "촇煎"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 9, "⩷謝㱮奜ជ鵳", TmMap("㿚껍Ṑ䰯", "洠⸹䅒ꉓ虸팊ᐢ쳲ꄎ", "", "�퓔炵Ⴏ⠈⣦≜", 446623, 737218, 547731, 179184, "쿅硬겙犋㕛�ⱪꦜق", "縁㎄䰸", "怺㠂챡ὰ䙛࿾", "恱礼䍘汜⌓蹁틖Ფ", "㓹껶⮏娧鮆鮿", "", 569937, "馢䲏쿁㵾⚿벣家≉夞", "뻲͉砅", "⽈쏎ﴣ㩔Ἃ돍"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 10, "䱒ገ䒥", TmMap("㏰栝㥻䈲", "⍑୫屢㭘⹯탳ꍏ", "", "쏄쵯將룆햑菢ᴘ즬", 772445, 749289, 946736, 783365, "錛居芟큳괛䆏䨄ᤰ闟䱲", "瓉赼끓切ꎕ築䨪컰ꦰ", "廥绢␪", "참☦緤", "鲵粮䟊", "ᵁ굣㮚䶹淹ᲁᝁ꾿൚", 336000, "ೆ", "쪩奓栥", "艱ឥͶ葾볡怡ݴ"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 11, "䧭ྏ誓筿", TmMap("ↈ髞", "ᨸ輿緅", "��褖켵�怶", "趗婆引兘", 80948, 811357, 897023, 124520, "〥", "", "�Ⱦ燷⑅", "쨙肮⇭�ራ䀄乡웪", "社Ŗ", "ꓻ親꬈䂺", 106838, "", "齁", "霅眾讅"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 12, "ㄖઃ롘ẕᶯ낪辸", TmMap("虰ҭ㶂", "툩晍睵A雖ᖦ", "堜", "᪊ꬻ", 6306, 621961, 911765, 545224, "ົͥ瓩ᦽ�∠", "", "헱义咭䧛", "睫䷙駒ꖷ贰ꗰ�", "愁ཹຣ串飘蒑翰", "감潥＝暼鋦", 951561, "≱ᒎ⨻뛗䟈틻ﷺﺱ좫", "䣫ᬽ�ᖕ撬咍", "藫ⴅ�卟멞崅₰"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 13, "ꊪ�蚞쉺�", TmMap("鏗Ų霶ㇵ䐞⫋", "攦ꕫ쮥⪴ℽ靼຦贱绚꿗", "띤⻯胣迾쥡", "죋襰㹅慻콨畿", 786239, 907307, 537631, 171434, "ᮈ﷾ꍽ嘚", "䒴朰듒逐(ꠕ梅", "ꁹୟ젆嶐墿䡱勥㳿嬨", "쩜瑸뺊픜模첳", "⍭ᢹ鞄�", "躏ḷ玫ꎯ扬", 241918, "᠀⿚쥩谅Ɯ觕", "伈ᑭ谊ㆵꋈ勵寀儍漥", "쾙᎗癑눋Ẉ됕"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 14, "䞰", TmMap("㛇ﯶ⥄", "蛭譟", "慱η䉚ಒ碙", "", 71658, 992189, 530089, 93399, "쿳䖛", "䝁卆", "䕾唵ᙡ멧荞돲㊳홐㌦", "뗩옢懰", "錜큢ﴈ粌햰讟蘥់붠", "료㜧፭壷鹦䎇㒊", 656523, "嗝첹幥⊬愊꺳", "䖜ٳྱ᎙", "퐭뗌缸틸젓쏪㹊ಶ斍"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 15, "㔇岪判䏩", TmMap("煄", "", "羈椄쌆瘅䤌", "摛帏ꏌ", 21323, 542072, 283977, 285704, "", "ꯟᢪ敎鋝뵻䄈謴뤊쾲", "큁슍茒泗쓁", "�", "ॸ鑬䁚궗젥턤ΐ", "驎", 316309, "ᤦƼ뵕Х芁幃㚌⊇", "씳鮄녞⽝摰꧷", "㣁"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 16, "虴镀郑ꬭ恢㲟", TmMap("鈾箶묀䘥", "ᔂ킁募㱌鳑鿹", "ۙ囵䚱阉ﻬ㦇", "⤡쌩繄歚ᦆ⫮뾧Ў죬", 764723, 922231, 27869, 629368, "屏ᦻ헣ץ霭茿⠿", "蓹鷞笗", "�瘯匿觺洚䲥", "営", "Ų�ೲ㏎Ԁ碂拭", "⊄哆〽혗蹙ů悢⺐ﺵ姬", 504961, "ᕖ抺巖綡條븣", "涌娣轐緋�", "躘䀐틬"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 17, "쏸㫣䒲ፃ䐆", TmMap("挠頡⸪ꤹ", "晤Ⴢᓊ픨", "ᴉ", "얤䡔폃븴귩ၛ", 44241, 545110, 425348, 535505, "嬜", "⃫믶⥥䊟☢", "鸴鐼ꈲ㪑填䐎", "裠艷陆쥿�", "὜⯇嘣לּ᜚", "䡛櫩̘", 976091, "", "훨蛘똷ꭍ﹄", "⪱"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 18, "ඍ粑給ឥ豈ꡎ虌ᤨ눒", TmMap("淂菢�䲕㿨", "M쒸냼搳", "俅䵮䕑鲆㣐쵧", "釁要倓ഔሟ", 148152, 821242, 20883, 596703, "㷽", "뱽㤶䈗，㿀㎮䜫", "벝ꊢꊜ甆⇫⌞", "Ẓ偦ᄅᵸ笑퍩", "࿕ﶶ꼺昰", "㞻ᓵ῁쀐", 376447, "ゔ䌝難鯼ᬚ虑䖏", "䗒숊਷຺茻ᡑ鵞", "葳⡶⳻镟"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 19, "걲䏺", TmMap("ᖖ䒞ﱧଉꮭ㫚⤌", "ɔﱙ䑓輑䏘諚厶쳧", "田", "宠쬯ꗳ", 407067, 762301, 642097, 304455, "杀㣖讝�駥﫰ﴄ", "븖浿ᥝ䎄ᇫￖ䦅詉翰", "쉜넿㲁镋覴뷵", "芒ѫ긠", "泶漀卆㚪褝◮ꋍ廙銶댶", "쀥缿娉퇯", 525525, "얗㴼誏埤�ꐳ㭓桂즻㷴", "ヰ셹ᙀꦣ謁ⵁ戻࿎", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 20, "⿰摹и", TmMap("퀔ꂙ", "继鄚힟㞀", "䨿밪屼໠緸ῌꮏ", "뢬瘉ᓔƮ", 789461, 471851, 705421, 800636, "ᭀﾢ澬ꮛ꺻᜛宂劀ᆔ", "浩爷퉓ᕵ觪폦颋", "", "戮댬", "쾙緭", "悔嫨犃돋⪠斥怺돔긖", 64069, "�䕯Ṽ홞寷ﵣﳸﳉቇ蔥", "뽴팬", "稓"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 21, "䉃ꛫĚ躻ẻ", TmMap("雦ډ⁷츟", "�苯趯Ὧ⼆謻쭃ᘇ", "䐩ꨪ皷䂉", "穐浩", 201741, 102356, 160713, 4456, "㓸皫䯣≯䘏", "빅馣㮳", "րᑒ㾟娠琴䄽쉵�크仍", "숟⒗닪礗삶ᒎ咲", "�ຯ昤玠㑇旧ﾔ址", "菥킁務沿뭧", 306866, "奁볌諳命囥", "", ""));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 22, "", TmMap("�櫿꣡畓ꆸ", "虫젷倡", "㎜", "權欥", 231960, 522629, 141813, 226223, "", "�", "热化", "ꎝ埁ꧠ뫕♈혗", "틗괃", "鸧囮", 212308, "௞㟈턩ꎘ龎ꬣ瑤졛妩㻨", "�俨Ͱﮕ䜝", "遝憙쌘擑"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 23, "砠쨧", TmMap("摐䇁䍗늏", "", "䉂꺄᠎㎍榗儃衮ॎ䠑", "ˠ벝쎛", 613585, 371717, 768848, 3156, "埅㶧좡뇷牵", "", "", "圞", "朩땩ᛥ", "竅沃Ⅴ", 465204, "륡哒潮긏", "溓岦᎞", "ᴒ瓆᰼툶"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 24, "遒轘៭鼢", TmMap("簎��鬜板墔ﭠ꽉", "ⰾ㻷", "ꚡ拷", "⼭", 30575, 276233, 859973, 873720, "ꑋ뉉⇜熔ᤥᖻ", "롊", "", "䔖틝탽↷돣홈", "", "❘ᆛ柘콮", 339111, "谷⧚훔Ꝉ㞅", "薹䰡ѐ简", "歍﫟蟦쾇啁쿀"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 25, "쀧ﳇ", TmMap("黚", "屴䨛쵊黹礪⾿", "␮帱", "렎᠈�﻿", 166591, 393307, 271255, 387947, "", "㞅匂♈ʣ", "⺭⬭迪", "妗⬴㊯၉⪵സ", "⧟韽๹⿼샮�", "ᜨꈾ앪ﱋ쳼攆뉃", 315111, "묉�콉�", "椿磍올", "뮀㴿퍱г㈓あ泥"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 26, "猉先뭠欉", TmMap("䷤ㇼ喉縚囆꥘", "䚑", "璫睜騲˚뉣", "㎿週㯻룂ｆ㋳ꇌ㿈볱", 699593, 288153, 549039, 847687, "ﰇ銳䵄뛗适皶秺", "နꋌ", "瞌", "㥱꙾⾩ㄘ", "釦", "�耶⬦騁䰟剄✅料灮඀", 472971, "뷉苲詤岮큱沨畓❠", "ⴵｒ", "㋲硟⾡惙"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 27, "ﰙ", TmMap("喇덉覟㌩蔊", "쮆⪘", "憮쬠�র펶靎", "໑讒䙠끐Ãﭓ䗟傝", 891519, 537602, 854674, 546289, "乸➄쀟ᰙ劎", "㢜緞", "�ᶞ᪆", "◸⺿ꀇ", "맩", "鋯澊괮", 698512, "좤奘", "鮄ᬮ", "殴Զ鋲牥哾贁"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 28, "ㇵ愪뭹ㆸ䐚", TmMap("㗬", "磞䇗돁黲釞䱠਍", "艅", "딘跴軼凞", 947839, 968102, 908865, 218470, "翆瘙ﲿ㤬㔃", "∗ʊ뀁腔�", "䌄", "", "迏", "燋�뾙", 357058, "䖝ଢ଼Ტ宆ͷ₤嵾牔☤", "ﯘ渝悮㻐ᰇᭆ㻦䋰", "ꬱⴟ崮纆讙뒖"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 29, "棅千쀿藒筸", TmMap("ெ锽", "磉脘竈稁䑆⸏嶨䨓ㅾ纺", "戼쭐", "掱袯�큂詮㹦", 695913, 25521, 264789, 422554, "厀ኙ�訓로鵆맻", "扃좧韝彿⎺ܩ㔬", "鿥珣ŏ쌱⍽ᱧ锸ꞧ", "땔尰踝픇➧瑖ẟ", "ශ䬑䎴", "䑺ᏻϩ歡", 850503, "끭�㊌", "⋂", "듲�扯㮰ⱻ틂"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 30, "�興삪�횺끟뫔", TmMap("ꉹ⤕⮴鰬筨䏒ไ", "홪雑쾥봂ɥ", "툭�ቫ⦽縣좲洓㎪ᒙ", "ȧ佦ᓈ簈㠎�⮗", 434616, 753499, 981754, 15670, "㛰ੋ㳷⎠椺㙚", "", "鷱ᓯ⋴", "멁꫈", "Ꞻʶ፩쭢譈", "", 573108, "ꘐ፱鮺孴ᓇ盅", "︲୶竿ꐚ厈", "䶒怬뀤坥磪ⱝ⦤㠂ツ"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 31, "㎟", TmMap("虙慗", "㜭", "窏Ϭ偭뾜緃跐聏낟", "", 380785, 807100, 481543, 558626, "뚒ﬔ䖿灹꺙䢘רּ熩琶", "驉竣陶䶢", "偺洰뱞矲", "扺턭쳔䙢", "섁", "俚諽꣏�䱳⫕", 402619, "羆猆䨕೶啩", "믩", "ਥ峆춣螚�䄖곦ෳ湍"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 32, "釔촲梏䔼", TmMap("ﺊ⽧Ἲ냡", "䅚⇾뢁깃䁊栟�㇡", "俸⾁㤽莣", "咺軦螭ᢐ㰦淯㧭ၓ", 936241, 372409, 75696, 273803, "ᠨྏࡅ", "ꬳ㡶Ἁႇ䍮", "뀠흉伝㗽", "蘒ϱ嫂꫐쉰뚿⃄ꀁ㬼", "膌䑦ꏼ蝨ꋆ�볍", "㩃絽ꝏﱝ捼", 334170, "钤", "", "腥⸫ஂ�鏤栩묏"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 33, "宖ꯐ셅ﳻ쫅ⶇ؏Ｗĥ", TmMap("ꯒ䜳膚阎㆙ⅈᤁ혶", "啿ꄨ왪ྤ楻Ė憋", "Ʊ忧雿ᤷꠉ矆쵖", "㡤聓��嵂ᯛ", 213956, 478636, 75055, 159777, "邃骳唄呍ᇛ䊀", "ᚬᦔ甈ᄤܐ", "䳴銹㨰犳ॾ훞鳛돐", "埘趬䡿鮔ﾾ倸", "⢊ಜᏜ윮⡐洉䤃树", "", 830173, "䜮", "䣃๘̩٧⟄▂㣴Ꙉ", "땉໥g毗緶⽋थ"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 34, "ᰌ㟳飳嶄ᐺﲦ牜", TmMap("곙ᴱ焌䫅렐昙妠", "㾞", "်﬩융巉籢", "ׯ沯詋ỷ佀꒻䯌᛽", 366151, 238240, 650573, 967118, "檽睏䘰", "ꇙ諆⒃㻶旡", "镝", "櫈矩嚾ƶꚗ", "狿㧌痗탥臨䖮윽", "㹽쌜", 653946, "", "ᾈ蕜ㄏ怹㛿�㑺", "菙䓟ࠃ咐ω"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 35, "狊ꁩ䞕", TmMap("儐", "僉❓롖䨻㪚틖", "秜�", "쩉繉⺖靸ꘙ錨蘇熼俈⓭", 21483, 927728, 348103, 878693, "㨹阨퐢╇頼岚럖�", "ᗟ梛찦폿资竏̿ᆪ됏揿", "互䌝턁첔倲", "᭛孡", "奖嫕莗翺ꏵ蠝蹈歍", "弐㨼䑺", 367016, "잙䵾약馵꿎", "腪�", "걩"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 36, "⶚靌㞃", TmMap("Լ꽗䕤蟓ⓜ鈡", "䥩锱ᢠ㶀", "�", "ʀ鳙ᐂﵠ", 297450, 976159, 94480, 994351, "䶴鱥ꛓ其쓻畒䮱�屲", "킈休㢮趤鑤", "", "欔", "䍴㲤諏�㍛빿쉙駫詯㍪", "粳況誽⣬∋淍", 116824, "", "祁彽�輗ᨳ䋘", "罵ﴯ쎨길꧑"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 37, "獦鰡㗲", TmMap("ꄙ歼㥮▚桀繥ꂲ擼缪", "묷疥쐩繗먙鎗", "䂚Ḽ羬࠼㛨", "袼", 71334, 146127, 131837, 668764, "㞄⼬旻尳冧⾲㔹", "슡", "릢맭", "䐥ꞡ掠횺헚릈", "؆", "煰ͣୡ쀇兖尫䟟", 857901, "櫀믾", "ࡠﵥꂙ셚㧣", "蕜ᦃ蹆�笰熯ﶠ錹ྭ觟"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 38, "ﴅ젢㪳區酤鬦墬⍳", TmMap("큈惑憕ښ瘨䦭嵡ᩫ휸眂", "ꌞ됭䙷�", "窴㿹痕㫴ꆷ跸潨適웁�", "ं", 948504, 816023, 413169, 432347, "輮๫ꧣ记ᮟ唥閜", "ฒ섛쎻⭰贤Čޘ겻", "夀䴖奀鿸", "ꛆ寨뫔뷂፵", "卵♦Ằ鬽妰멉啣�ᣮ뱌", "卷ꞎ⯎里틨", 81184, "ន쎸譨潬쀇霾곜", "", "ઍ"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 39, "醟뇄�⽦", TmMap("縀쩶덤⬍鬖厳럐背媩ﬡ", "禶㕍늳茞휆㆗╧꾴됗Ლ", "Ѫ毋", "ꬷꙆ飺䡍澎", 140457, 687592, 983025, 39149, "隳", "ﾝ맪", "쵊", "䇺ᇻ⽱辏ᒡ", "�蚥古ꤒ", "", 226981, "焂䒹໑皈녮", "㏮︠⩇睏", "퀓⇸"));
    Test_ProxyFns_DictOfTmMap_WriteLog(testDict, 40, "ꇛ⎭儭䕞", TmMap("柂鑦", "㓓땃ﵨ想푼採㬚ࣖ", "ꉽ", "ᲈ옎漲알Ⱖ毂", 321331, 221054, 658194, 309983, "ﭪ㩲", "✀콚൰툔�룓⁼剋", "莰ȅ⿬乐Ⅵṋ䋿锲簏", "흯螀척ⰺ샯௴", "甥ᕐ嬣陵信돷맔钘䞺䄹", "�셚䜒", 344176, "ᩩ颪躰胏霵鲕慷䩫䭰", "�", "黚必ᐽ拚⩮ᒏ賛貜"));
    // del testDict; // todo: destroy obj but not data.
    auto kvs = testDict.GetItems();
    @testDict = DictOfTmMap_WriteLog(IO::FromDataFolder('Storage/codegenTest/test'), 'DictOfTmMap_WriteLog.txt');
    testDict.AwaitInitialized();
    assert(40 == testDict.GetSize(), 'Init size after reloading from disk, was: ' + testDict.GetSize() + ' from file ' + IO::FromDataFolder('Storage/codegenTest/test') + '/' + 'DictOfTmMap_WriteLog.txt');
    for (uint i = 0; i < kvs.Length; i++) {
      auto kv = kvs[i];
      assert(kv.val == testDict.Get(kv.key), 'Key ' + kv.key + ' did not match expected.');
    }
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfTmMap_WriteLog_DictBacking = runAsync(Tests_RegisterAll_DictOfTmMap_WriteLog_DictBacking);
}
#endif