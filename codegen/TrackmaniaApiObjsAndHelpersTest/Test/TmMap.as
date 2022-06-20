#if UNIT_TEST
namespace Test_TmMap {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_TmMap_CommonTesting() {
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
  
  bool unitTestResults_TmMap_CommonTesting = runAsync(Tests_RegisterAll_TmMap_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_TmMap_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_TmMap', UnitTest_ToJsonFromJson_TmMap);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in Id, const string &in Uid, const string &in Name, const string &in FileName, uint AuthorScore, uint GoldScore, uint SilverScore, uint BronzeScore, const string &in AuthorDisplayName, const string &in AuthorAccountId, const string &in AuthorWebServicesUserId, const string &in SubmitterAccountId, const string &in SubmitterWebServicesUserId, const string &in Style, uint TimeStamp, const string &in Type, const string &in FileUrl, const string &in ThumbnailUrl) {
    TmMap@ tmp = TmMap(Id, Uid, Name, FileName, AuthorScore, GoldScore, SilverScore, BronzeScore, AuthorDisplayName, AuthorAccountId, AuthorWebServicesUserId, SubmitterAccountId, SubmitterWebServicesUserId, Style, TimeStamp, Type, FileUrl, ThumbnailUrl);
    assert(tmp == TmMap(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_TmMap() {
    Test_ToJsonFromJson_Check("", "ꠂ쮰", "ᮔ﵇獣", "ᱶ谛䆳ꔼ躜ಙ㟊罐㳋뽄", 883496, 673390, 116343, 181454, "汯粌鉅", "框雱燐꬝", "㟳䢕颒饣ퟶ", "ꦻ땬黿救솳", "ᲊ̇॑", "堉", 606311, "摂ꖶ鍁紙", "遐鬱峝뻴", "");
    Test_ToJsonFromJson_Check("懇�客㒞᫯볠", "朣뵧칒튪윷窋澵", "䞚㌴⦱扬", "旰蓡柿ஷ", 545237, 796389, 811618, 178687, "᯿쨄봌", "炤䩦ᛥ婫囼", "䦋쁗缧ⱊﱻ狀ꆟ", "", "ᵒ㪗羘렷뵫", "�常", 158796, "鞙栥唃徭ྈ佛ͽ", "咧놪☼앇炄㐕", "罆鹌");
    Test_ToJsonFromJson_Check("엣ᩁ㟅ഽ", "", "銗䔜῏⻖蚇ங⨗萃쎉", "꨻በ↥鿊坯켫ꗥ", 203400, 154767, 510442, 929417, "鹥灦㣋충왦굸褢", "ꔴ㳇", "든Ηꨘ躀", "ⷾ뮁d", "恦鬋鍡轔援�ꧾ", "죤箖质ᣙ", 61424, "", "뗃㷦⏓箝썷", "㏬蠑坖澂ꉃ뒅Ὄ");
    Test_ToJsonFromJson_Check("៯ꭍڑ쀈ⵗ", "벛ﳾ啃둸瀀", "ᢻ샞饤浏䴾퍂蘇賻", "符䭭澀⽹ᱶ爅螝⬣", 454929, 489123, 522901, 419173, "ᖦﭭ见禁䡼淣럸", "੉Ⱬꖗ", "쎧ᨘ퉁", "㖄瑁캳륣", "┛輄虼裳엽뷗", "쐤얪㵁㢝蔹ｽ≨⢮", 235494, "욉쒜≁隵", "☖甩", "龎쬩ꨝꮄ轓᧦㗭再섚");
    Test_ToJsonFromJson_Check("ᔲ逥좣㉒㇜ꗸ롼ᬁ籕", "", "꺒Ｅ澮촎姴䮪삒볜豣", "馣谱蘄딙授↳웡꫎", 91151, 743344, 44570, 56280, "䴨", "겶຾", "淪熷颤짒傉峩ᯕᔺ", "恮뺪髷漻拹", "ꢶ嗲聅䄳ㆳ尉", "瑏求뺝숯䐪䈞䞞䜋歹☰", 508457, "来", "", "ŀཎ؏쀯㖩ꅽ딚圤쯼벮");
    Test_ToJsonFromJson_Check("髍澇㤘▝ħ蔋팪絠촊", "鿉穏뫤࡙攴쑋", "殠齒䡬뾋뿰", "湾ᾬ 讈䗺⼎Ԍ臋", 911772, 12880, 621120, 992957, "춤ᴼ馿ꞑ", "哻咷㟞曘靳", "晵룅쪹꨽ꩾ", "밥�틭姻韷ሸ", "꺗⯒ꊑ䐁ߠ", "ೕ멨靮垆规☉᡽햅𤋮", 108577, "", "䮔췬鼋탐缜檜⛟왪", "㞥ۚ轔렫炙");
    Test_ToJsonFromJson_Check("꼵䁹呦㷽", "", "ꊕᑑ球⍗", "", 693335, 143856, 506204, 233926, "ᢰ靡ﮃ嚄", "맆晝劬瘪剈授䎫쉑", "䱓䎸帍곔遲祆䊼Ꙕ", "釄⅟᥌", "鑭", "䥮䒸", 104905, "", "秇⋽吢", "ԈǶ봒❖耾㾃庅鿹紣ㄷ");
    Test_ToJsonFromJson_Check("ማ鰜㞡吂檞ꨁ딣⍣�", "澃軬ꇈ퉿", "꼭", "鷬헡㕚别", 825672, 354693, 814831, 838411, "쳷계쳣㪏汄ガ", "", "鱆㈹�䕋", "〱", "煆펾챆妙薐㨵䓸뷐�", "잒淮듑箩厈䃐᲎", 892962, "䬼덃耕굗ご䎽붏", "ꓩꦼ�୹౺삯Ϩ죂갗", "뷌齟蜰ộ");
    Test_ToJsonFromJson_Check("媴白矷", "⊐檢䩬", "闞ꩍ㨧㞆豽몗䎇㤴", "蛢䲲", 804084, 767134, 302662, 890783, "뎝⺧䛙픮", "温膀璠", "襶喩ᓅ䍕", "͢떳窖鬦歾䙖ᲀ㭔", "浸酒袑橒", "婯맕赕磳섇邋�⬞", 737608, "踉弹", "顯얮", "狫ꙡꐳ볶烓퉨");
    Test_ToJsonFromJson_Check("买嗒쫑鋋", "똛엫ᦡ⯓Ŧ", "㽗ⷻ찄䛉笘ꚠ", "", 734977, 771244, 845590, 496057, "▘녝裂ꦍꜚ䪗⇹瓒䬓", "㩵㈰㽇䙃珍㉡�郺", "蛻紻ꕣ䞦〱긄⏽", "亦釪挨⎈汼듿쩷", "鮕", "ꌋ뀀ᵧ塻", 84621, "윊䰟", "柬઒궅抈⽊얳礞䛜꜠", "〶力෎");
    Test_ToJsonFromJson_Check("", "", "", "", 536447, 742040, 334991, 935244, "鵒㼅", "", "䔂旓彥㖹尰鵟", "", "", "詓", 685120, "ꮚ찌", "", "妬눌鏩틽㼾켶⾤ᐺ");
    Test_ToJsonFromJson_Check("ⱪ탵", "陚＝ⶇ�", "頹㱭", "搵垑雛깵黌壀唑骿䋛", 15019, 434488, 875074, 796797, "暡欐걗�", "롴ퟌ驠ૉ娐j⏣", "덌ῤ䐧ꮚ﷯ꄡ䦱", "麏揅שּ㰄⅝Ҥ", "兓꽻뺿쭠", "떜", 615506, "뷞ᠮ裡", "䦵೿緋빢毗咫㌊㧱疦鹰", "蛊ꠌ⋞ネ");
    Test_ToJsonFromJson_Check("곑凋�蔐鴁⅘굡", "냢", "ﱛಃ", "㰧໾趀㍟㤒居개⣪", 581600, 728577, 436154, 948042, "ꃆ塀", "", "Ⱕ⤑ﻂ殩", "୊䥌", "琜䰶", "", 264554, "", "瀨", "篦䙸䜋�셨鴈濙뾬䰦ⷅ");
    Test_ToJsonFromJson_Check("尊䉸䅐⮱苸", "", "㇨璧頒⹜遛㔧ꡜ㵷枸첓", "躙腬킰䷡伜㉜ؤ", 704637, 700426, 957934, 789300, "٧Ⅲꂐ硘우梨", "励돠艄훔�웖륞㍃솞थ", "埈핹", "폺뮾眲餻Ჩ栬飒홟", "뱏熫鏵밃碻ᶁ", "䍅Ꝙ袘䯞髟", 587688, "䘴୵㘱䢨", "퉃瀍ﱬ⠔軙", "⫼䇤屴콙诘䒂厍");
    Test_ToJsonFromJson_Check("", "폒", "뀧›䢬䟼ⶲ᝹糀", "Nခ툎妊⧔扦㿏Ⴇ⳵", 226701, 133474, 619631, 402655, "짫帐", "嬔䅒帆櫊䦚", "臐ᙙᰪ栎纰乩궕껒", "邝פᜃ梑蠰", "", "", 28880, "覞잰聡ﳆ⠧뚇မͿ", "ּㄯ닢砐ᤌ�媓", "ᛙ牗");
    Test_ToJsonFromJson_Check("⇹", "䆖ើ銨〘ほ跱倭䗷", "뽟몦呻", "", 20018, 927132, 913860, 390837, "馤", "뾯抃䱈೵谬", "臘톸ୠ앧茾⷗", "紶忿뾙乜ꩰ", "ꪓ춒ⷸ䢎�殶", "聇㻇ຫ", 462465, "ꓛᦱ軽ꂜ춙K䱯㨯葄", "噕숲ॣ᧸⹯줏气", "쟍퐩㷬瘏�逊퉈䨽턋");
    Test_ToJsonFromJson_Check("ฑ舩쿋��", "ῷ筅", "쏯籰䫢틟ẚ", "", 343244, 691293, 921056, 910510, "ჲ쥟뽿趰ꑘ嗀嬺昍灙䒷", "索퐔㿥ᢧ맦䎀᝹쭗緞", "㺢ḡ핝쯜䨶堂ú锖", "牢஬麋�縣䉁ꨆ㏪", "ⲱꢊ", "ꕠ�", 660566, "䅦䒵춣閠쯨목楥", "쏁ŵ㣈Ꞑ", "縏맄ḅ♁뚌ⶣޯﮦ컻㴃");
    Test_ToJsonFromJson_Check("堩", "玓ꔊ줮㿮ᚶ", "豺埞赱�暜窋ᖪ࡝ἇ༽", "숽쉳蔼蹥揪₃뒣筗", 628314, 956891, 865943, 238230, "ꈘᵮ�㟇䬦쭁农", "", "쎽", "ʔ镸〿ᭆ䅲砮˻ꇟ㉐", "٬ﻎ୑ﵶ溨", "ᆰ", 258985, "颓ヂ�蜷", "驸ﰹ珛㸤⇢㫢긩保", "꨷");
    Test_ToJsonFromJson_Check("", "依⵶�伝猧", "㧘ڎ⣑뿇쳚醤", "䈩휲쾹짨뵅", 727473, 120797, 359571, 982115, "ԗ䕔誮₏蛉鶋及帾", "缜圆䐰饄音䏙∹ꛌ", "", "䞌锑敦暒쇠覡邯", "쫣娪颥驗䂨Ɱ✬맺�柚", "餢", 587926, "", "ꉂ", "ꀰ");
    Test_ToJsonFromJson_Check("룮욏䩘꫕ૃ滛窖", "鸙뺦疂纑긶嘍唾", "ﰹ奡Ṵሗ祢（쇱묜դ旱", "祓䲛虋ᯣ鸚圲枴", 354071, 268202, 884153, 45789, "⦯撥鵁ﮁ迁溺녞", "ⰻ㒥ӝ�⁸�돑뻾", "කꪓ", "龡웞Ꜳ噅䪂ᄞ�䁾", "釛畜鄴쑬뻞侔坺䎶", "딟榗轾᥊鎓", 888691, "", "섐裔힑Ӄ", "䓑�秊嚖愴讲댮");
    Test_ToJsonFromJson_Check("딙", "ᘘס겫햳㭇⽛ᶶ", "趓ꃧ朊⼵ﶾ", "ꇽᶅ쟂", 337131, 785572, 244902, 701883, "簬蘲擘粔ḁ㵎愆ꏞ", "臃龽⽓瞁絨㰵恕೹", "욘፟⩜頿邬︺핬", "䈐䰧", "䒯䫙鴑艸휹", "꤇ᨫ࿪逽ᴲ꙰罸蕍", 174085, "⣯苒", "俎�츗㫤涶隄", "⚩ꐰﴗڂ˔");
    Test_ToJsonFromJson_Check("ᔉ幕覊냊坊ᚣ㮍橖୪", "螴磢턖灜", "ꚉ㣩ⵅ�䥆᤾⡶㵮", "븸搇娏", 911767, 985010, 185626, 468394, "䬔驱�", "忲ﳾ刾澌敲Þ욎ä", "�啵⸁", "櫤툈ᩅỺஒ뛍뻌", "贳﩯", "�滹꫺", 414015, "㠒弱洊戌勳ꕭ㤂텟뢙", "唴ꭄ", "韵�升Ⴥ");
    Test_ToJsonFromJson_Check("䦐㺇櫷犊⺩뷗걲", "瘸鍶똿", "ᘅǆ칁柴", "睯੄莄㾡琎鱡튃ඌ", 464803, 72735, 74689, 961755, "", "腎罈퀮鐘㬸", "�Ù뭷ݏ괎崵�뚩", "퍑짏虲棖჻㿥", "ޜᨥ췲ꢗ璍깶ﱻ뿱춟", "㮽싙ᜋѥ厏埏⡓桾", 483226, "᧬䑹뷢憵㱦", "ୄ蟖溚荠ݲ₶᰸鍠", "☮緌ꂉ쨶");
    Test_ToJsonFromJson_Check("䌹，㬿뜪նᮼ맏", "", "麻蒮๢鎶㺊鼷㹾鯫", "읝蝨䧌", 367173, 710445, 408487, 69099, "﮽紒魝抍", "珟눛ᡕ", "기禹푔簵罬m녹桏", "ꗻퟤ䲩㻂�ᡏ", "諹淩Ṟ阯�䅏᭚ᐻ", "쌺珂胋焻좻︀", 459048, "ᒙ鰸콝䎶＠茉", "畂ꈼꡑᩭそ夊졐", "탯⦔嫮땹搿鿄鄮");
    Test_ToJsonFromJson_Check("䈴哿灥", "鯝铞", "䏿͑遒੆奯᥺", "ㄸ", 82264, 778825, 150582, 251517, "㓨鎓粐偝", "ゲ貼輱", "⊳巵䉌ㆂ뾏ᐤ�瀍䞳뎡", "᲍冚刻鯀ᛷ䘉", "", "ꂔɦ჊៚곦", 550672, "綳忪豘", "駮䥹�ᗸ", "䋉Ị㾹怑輎︗﷋⊵䀔");
    Test_ToJsonFromJson_Check("癁㕻跽嶴ବ", "䭼쫓致湧", "", "⊷傠䶏䳄몡ㅗ䐍㣯댱", 857345, 286278, 796551, 763845, "", "烦�ᄌ詨俫", "徐碹", "甉", "Ꮩ谝", "扁䨛", 295798, "", "ﰪ싛엞�仗Ý罶", "ᓍ雏댇ꭞ㇋갗畴");
    Test_ToJsonFromJson_Check("ᩞ굵ߤ杖Ա䉘૜", "�", "뜴ꂀ刺Ὦ餚샘טּ�ጔ剼", "浦姰頙", 591632, 315603, 362969, 232454, "", "횺ᡷ蜆㼈匢Բ", "䜆㬸", "伙窽ꯁ諱梁䴧롷饧", "ꁇ꩝ᩣ雳ⱅ록", "", 63550, "税䟗ꪻ", "蘠ꑻ틸䔷귾렓", "龓Ⱳ");
    Test_ToJsonFromJson_Check("겉男뒽鋆卓ឣ剀‎爉щ", "", "", "猭", 310466, 581206, 794214, 568570, "襂", "뻧鳠涖姷튂ᑄ郵", "⭎嵠渌篟宀趑ᵮ", "䎲༘窑ꩫ鋘ᶯ硰", "᯻", "刮ढ़쌻뜢⭃복ꀢ톺鈷쉄", 325689, "᯳戡贸跬㦜ꑿ", "搫쥗ὦﲴ啶쪧䲶縛㷎蟸", "滚彧쓣ŰﴏÅΉ");
    Test_ToJsonFromJson_Check("꾁䉚簯뽳", "因⯬﹍圕", "", "촵㹾⩽箽鏇쾮�Ⴑ侙䵿", 119216, 314310, 988540, 404280, "刂ᠰז", "ꠅ䮇跇", "✮ᵑ", "▝", "筹깹ፗ窜紈壖祮", "啪℘⬊", 788315, "➔뭼", "ć", "⻷沺");
    Test_ToJsonFromJson_Check("䀲鿿", "㠵", "ᒋ瞈ﭤㇽᗢ葫", "⢺씻ᷓ⺲趷썎賰ᣨ", 925304, 285857, 272862, 595584, "챛鸠⃻�幞琯鏕⡽ግ", "Ȯ", "찖㎳鑰⠋ࢴ鱾", "", "쁍⩖�ꦮ㚽Ꙫꡙ쐴翭䎗", "�稲온緉", 744337, "∘Ꙙ獰", "櫊뜩ﬃੈ", "盀");
    Test_ToJsonFromJson_Check("䂽秃杗ゲ轄뚁餤ꟗ", "₈⇕㢨蜯焢ꃺ艣钦匲", "ர橭쥘硻⌬", "彌ᆚ", 624076, 999818, 53608, 580191, "穛籈竱�䫪�", "ㆹ뗌啰ᏻꫬ阓尹", "瀶ﰎ呻庛冗", "뚣䝧첳磛Ⱙ虑", "鸣䤵粛⣩숤ᇱ", "䣭啊৮搮푾", 537183, "ఽ⃕紼ᔚ쒜皍娡㐵", "쨸싩ﶴ佯", "뷰");
    Test_ToJsonFromJson_Check("", "㗃춯様", "寙臓ힳ蘏", "◗ન튘㕧෨櫕毭�", 156659, 966159, 876271, 75380, "贴৯ꇚ", "렴蔸系尴빮", "ꟿᡐ휪튠ꡋ", "ꑁ羰䛷祇ᮖ臡臨", "ⵛ듛ї춇⹻韁", "鈛浿⺙硁뼰ᨦ촖ফ퀓", 42229, "剃隚唙콮", "쁷ǽᏍ噰䫊繹珈㸉", "僔");
    Test_ToJsonFromJson_Check("隬", "", "⭀⇴㯋喉", "炋헥", 236807, 532079, 881565, 733205, "", "潕袂⠔瞧矚㛔㲞╒", "", "䦋䕠", "쌦ㄒ韎ᠧꝼㅌ믒", "ࢇ欥⪱嵗", 708415, "꓃穴潃熕穣�᭓煇폺", "ꝣᵡ≐쭂뷉", "煓弟ⓡꈾ⠂芰簚");
    Test_ToJsonFromJson_Check("摚턙", "", "뇸间猏쨉芔螆趞ㆼ�", "Ⱟ篝", 707517, 177969, 759290, 198707, "洇⥌", "", "읻", "㓺귕", "ቑ죄ᑩ右瑷䌆ଢ଼¢⚯", "", 399444, "秷虴肫냹橕칳ꫣ䞩ᑛ⁻", "ͮ", "첥ࢼ쪮퉍䓛");
    Test_ToJsonFromJson_Check("ⰳ쬀&", "䶃ែ槉浳ἧ", "諔", "붉⩘", 847600, 456652, 745226, 579707, "籉麥꧷琨", "", "鄶騩�", "纕䒑俠⌴噂", "쨳", "ㅪ팕萌䍯퇾�", 642686, "吘햾⣟嬊䁄흗˯", "ᮍ䊒", "죝⦑떯ᘅ礥马Ȇᵿ꣉");
    Test_ToJsonFromJson_Check("㠉䛭闍䌉⩙", "㔆Э嫨뢡琣뼛閦", "爞溴좕�⡕", "馪ꖏँ꺣拉莿憟㏇ꐟ", 757081, 864890, 281657, 819358, "葳껴຀귢ܦẓ₨䕮⏆", "帅ᣗ艾晊㎨减", "称", "⋡ﳴോﺲ洸遛", "㪊ǯ謃鲀䯣魒", "䍁ᾏﲛ魣졏茘搳", 248874, "ᖖ箿錴셝伔䫳䌢䳮톶", "䞈젫", "褆⊢旫㴥");
    Test_ToJsonFromJson_Check("꫆ᷓ礻ᦨ霹匯䁒", "쀢�趸ⵒ", "봭癛㿼꽈", "ດ啗ई薐讪�ﶝ핇䱻", 472667, 110025, 31579, 300991, "隍蜆䣮괙뢍㑪䶮༼蓍뿤", "͚ꋰྫྷ�覹", "粹❠ෘ띘鐃‐♳瘀", "즗⻿", "▗麟ݟ", "", 26845, "Ⱁ赅넫", "", "");
    Test_ToJsonFromJson_Check("胐뱍ৈ㶑◤ஊௐ䆍", "즆", "酼", "ﴀ땊쾮蒢唤㊀䗤", 660549, 846963, 217283, 954941, "▋⓰⤼䟭㪤", "⋹懄蒰�ṃ✌믔", "", "掾﬏닂", "", "琬Ə圙判譆鵅䪵Ⲫ", 140282, "뛍䜿緼ꤹ鎸䀾郮", "瑬팾뻄ϙ쟼澐궸", "ꚢⱡ䊝");
    Test_ToJsonFromJson_Check("ꉀᝳ琒颿ဤ", "揰乘䬁͐⳽ጪ볇㦦䇒뙴", "㳳ﰏ唠搅⠡癮΄飄Ԉ歰", "ꕞ훞", 846308, 669403, 164772, 225689, "䶓쾡쭞肚㗙ષ⽹ﲜ", "亂ꦦ䚚琥렌", "ﵡ⓸㈳ᧉ㛹", "ꐏ莳ꦅ䔌↼", "⪌�俷쇋ꤪ却僮挡", "Ꙛ", 512103, "፝૎쥝ﷁ俢噶�圐죦㲯", "컵곂醝뽫됈쉳넸ꀈ爘", "㔲ቛ蹘");
    Test_ToJsonFromJson_Check("綋‧䌪帧", "ꘔ셃逧瘇읃悕᛹欥", "輥봊䢮", "ポ", 142143, 453278, 992703, 590627, "홨襶鍹", "�눐ถ", "ｳ燷௛䱓롃⬛徰⡠ᮣ", "蒖賾甖Ａ즰妐皡㑡", "퍀ࢽ䷷鉋ḛ⿽齸刣", "ࢮዠਓ㨿", 654866, "墠댬氮䛪點업봉㑣섀", "ൺ璂鞧參年", "☖");
    Test_ToJsonFromJson_Check("ⱜ㉌❷ꉙ୑૩", "ᣱ豳륚隰ᴆꦜ", "콊妔ᱸ㵘轚⢅ު凰", "꧔蓖㊥萖ֆ", 406541, 87480, 690779, 675880, "䠗Ꝼ�ﴨ⑷꽍ꋭ", "ླྀ㾭Ӻ慺갆軔ꂛ捨", "晎�๒儀媉䩃", "燶浦桼熊ﺄᜥ㼓", "躈", "ꧤ팗�", 769073, "ຄⶊჼ", "旀齻٥⽲⧸鿹魔쏓", "5");
    Test_ToJsonFromJson_Check("ᘪ館㧈뭋ی픤挠", "", "匾⧒덓ህ诞뙲", "ੴ둑甝ь", 937898, 623734, 526338, 879081, "㤨豒컃㥕㡸⅑", "∘혟㷄�뚫閡͂蠏⠞", "獇츆豠", "羿㑲ﵸঌ", "", "", 695651, "", "꽳襩방饷煃Ꚁ嫯㌗椳", "覥鑜툿�䙹瞸쭟⫒");
  }
  
  bool unitTestResults_TmMap_ToFromJSONObject = runAsync(Tests_RegisterAll_TmMap_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_TmMap_Getters() {
    RegisterUnitTest('UnitTest_TmMap_Getters', UnitTest_TmMap_Getters);
  }
  
  bool Test_CheckProps_TmMap(const string &in Id, const string &in Uid, const string &in Name, const string &in FileName, uint AuthorScore, uint GoldScore, uint SilverScore, uint BronzeScore, const string &in AuthorDisplayName, const string &in AuthorAccountId, const string &in AuthorWebServicesUserId, const string &in SubmitterAccountId, const string &in SubmitterWebServicesUserId, const string &in Style, uint TimeStamp, const string &in Type, const string &in FileUrl, const string &in ThumbnailUrl) {
    TmMap@ tmp = TmMap(Id, Uid, Name, FileName, AuthorScore, GoldScore, SilverScore, BronzeScore, AuthorDisplayName, AuthorAccountId, AuthorWebServicesUserId, SubmitterAccountId, SubmitterWebServicesUserId, Style, TimeStamp, Type, FileUrl, ThumbnailUrl);
    assert(Id == tmp.Id, 'field Id with value `' + Id + '`');
    assert(Uid == tmp.Uid, 'field Uid with value `' + Uid + '`');
    assert(Name == tmp.Name, 'field Name with value `' + Name + '`');
    assert(FileName == tmp.FileName, 'field FileName with value `' + FileName + '`');
    assert(AuthorScore == tmp.AuthorScore, 'field AuthorScore with value `' + AuthorScore + '`');
    assert(GoldScore == tmp.GoldScore, 'field GoldScore with value `' + GoldScore + '`');
    assert(SilverScore == tmp.SilverScore, 'field SilverScore with value `' + SilverScore + '`');
    assert(BronzeScore == tmp.BronzeScore, 'field BronzeScore with value `' + BronzeScore + '`');
    assert(AuthorDisplayName == tmp.AuthorDisplayName, 'field AuthorDisplayName with value `' + AuthorDisplayName + '`');
    assert(AuthorAccountId == tmp.AuthorAccountId, 'field AuthorAccountId with value `' + AuthorAccountId + '`');
    assert(AuthorWebServicesUserId == tmp.AuthorWebServicesUserId, 'field AuthorWebServicesUserId with value `' + AuthorWebServicesUserId + '`');
    assert(SubmitterAccountId == tmp.SubmitterAccountId, 'field SubmitterAccountId with value `' + SubmitterAccountId + '`');
    assert(SubmitterWebServicesUserId == tmp.SubmitterWebServicesUserId, 'field SubmitterWebServicesUserId with value `' + SubmitterWebServicesUserId + '`');
    assert(Style == tmp.Style, 'field Style with value `' + Style + '`');
    assert(TimeStamp == tmp.TimeStamp, 'field TimeStamp with value `' + TimeStamp + '`');
    assert(Type == tmp.Type, 'field Type with value `' + Type + '`');
    assert(FileUrl == tmp.FileUrl, 'field FileUrl with value `' + FileUrl + '`');
    assert(ThumbnailUrl == tmp.ThumbnailUrl, 'field ThumbnailUrl with value `' + ThumbnailUrl + '`');
    return true;
  }
  
  void UnitTest_TmMap_Getters() {
    Test_CheckProps_TmMap("�￿躮䮠馩�", "㧖⢢羋⽪㎜৏렊", "鰉橿蜽韋�╝㸌", "疍", 14178, 409104, 402441, 464786, "鳔ꂆऒ涮�뗗", "﶑䙢꺰ꦞ", "㬪●ꜛ귦翮漽똮", "먳�⿵枵", "۫芁≲彲", "콬", 49504, "握", "㷗᤾虝䰒ஷ", "듡鷰那춴庂ᄼﵰ");
    Test_CheckProps_TmMap("尚豈젮훇懓奲쮄⸔", "ꑙ", "㵹徲㼏", "拣䵱䌏�㯂ᓭ", 433840, 983172, 771070, 736302, "䇢", "윃ᆟ퇚箺᧸䤩", "揘䢊儞祹㚏풓", "쿽騍큋", "뭷", "蹪鈤ꦀ㔭", 733923, "㎀꿈�ᴶ๏㕭∸缲", "㪂", "ᇁ﹀賊惍됞");
    Test_CheckProps_TmMap("撏랭", "�׭駭겯ƴ", "쭜䢝", "䵙嗍珐瀮㍿", 264138, 345680, 37504, 847011, "弊䮷⃷쨗蝢ᳳ", "㶑ꔘₜ齬聎雄攩澴", "뭱過ଚ㩕ၪ㩾껫墰", "䕂륦홰떌䱇盰쩑虿", "鐷痚ꄻ滇�ꒉ㳀䈾", "枦", 89935, "의䉶杻�죝ᝫ᥾鼾㮦", "痒", "웪墒≜蔗塚䌽ୣ");
    Test_CheckProps_TmMap("ⵑ᠟Ꮍ⁭豹理癙", "＠߇₹紇", "⏋릈", "읝㆒刱❕騐헵�", 978653, 334968, 390076, 565396, "�휋℃벷쨭", "퍑ꗸ鶧ㆌ痒㇌⋛䨗", "", "森ⶍභࢆ⑧", "沕К߄뽇㪢㸿ᓮₙ", "鄠짭㦟", 930379, "蔟Ι龲ꇗ⡔辅⭉", "ￔ쥲兆崤颦", "쐭ғ㒴퟽ᗦ㴟봨");
    Test_CheckProps_TmMap("", "㱷ဥ院", "䃹눭쯺", "쫉䶶", 633088, 133172, 833723, 27085, "Ⴒ嶹堠鷦", "큝", "鉚枛칸ힼ㼓럮", "工", "ꕕ뉲", "뼊谥缃ಟ킐", 679739, "쌘㙛핺", "ॐ쮞覑甃縎貥็۟", "Ҹꃈ䮣ᬬ컵嶐");
    Test_CheckProps_TmMap("㻗﬽팊�슍郫홟㕤", "䝛튟뿎ວ扚듍꩐瘁쪟怢", "狥Ü매", "聹匂仰䭬鹃ȟ薲", 885581, 948170, 333021, 731067, "⧞픭蚏ࣼ䪞㧯䦴귏", "㈾នﯸ滣轁竁怒ৈ", "酁଱", "畉弐狝פ뤫硥홅", "�淲ﺆ跏㜤샱", "틖ꎀ", 357901, "", "妐檣袿칉谜訷໰胖", "뚪䬹칭烈罽췜歵ȧㄚ");
    Test_CheckProps_TmMap("豺댜￰귥ጢ䨣뉐㕋퇪", "꥞琷᯵テ䪮䅎쯰", "嵐䓸瀓䳻Ჵ﨑ꁄ", "", 147555, 303027, 462299, 965014, "㼘ⵏ骗", "⋵隸꫍痈", "嚖竝嬑훃", "沈v鬕绽ᅧ猣", "ꭢ", "ꏛ", 575293, "鷪䈥⏀淓", "", "啕ኞ衍蛜");
    Test_CheckProps_TmMap("䃿fྔ㐔ᡄ鷂", "섎", "늋", "㲸肅瞇᭥⶗褰씌踵", 174998, 551557, 358271, 614957, "", "ᡶ⛥杭貴溪৥", "⦥๤즿ㄨ穂", "", "긽榈俍埯퐥ঠ἗넾ᅳ", "婓菨뻟௎", 848668, "", "趣馸揉᪥溊䷡꬈फ़", "膎");
    Test_CheckProps_TmMap("䔐炒悄௶揸ꥒ叵﨑밍뇘", "ᩖ彐쑥밃괦", "䳙䇶Ν曶됚简贙殺", "", 744440, 498609, 237947, 84409, "⊺�ࠫ⿳훿☸꤫睊�", "慺㗻壺旻슽铟Ꙓ鐻", "䟎他�", "抭␹鈖躇탩뿛ၲႪ㣕ದ", "Ⰶ�", "禱鍾齪床὏勐", 80069, "㷀뵌慔駐윳陑镉⣀跺", "⇐춻嶻", "⃙㾥괶됼");
    Test_CheckProps_TmMap("奨啈䂜絊앨⛳", "", "ﺏ柙㕤쩢", "㵉ꙙꌗ枚逳", 400614, 951189, 894450, 549837, "ᢦ폛⶯弸龭", "ꝶ擆⷗륶땣", "℈", "胼ᑝ쨀飞륍虋陱濣灈", "蛫龆뇘ậ莻ጺ", "숢嗖ᘖ᮳➄䛳碸䀠열", 731056, "鎫籄艍큋", "", "꾋葍﯐");
    Test_CheckProps_TmMap("䖈", "ပ꙳㜢㠱뮄ᢿ砹", "뗔ゃ諪", "个幚", 192542, 77285, 759445, 979742, "젟󇸷쾨쯚迪", "ڄ课", "�⥉嫾쀵ꑐ", "陨", "", "缰", 400651, "쪺⾉輖쀠껲", "览Ⱳ", "嘁�Ȩ㘅驹劣灤");
    Test_CheckProps_TmMap("ᖦ涹㵲�젽ઌ", "멫캿욀쿏靆", "罶㭹뱍᭲긞膐", "ĕ�뎿�ྊ", 830731, 630533, 716065, 929088, "硈勋⊲ǫ礳惴瘿ݹ", "", "⼝줠딳落", "⿎譟䏭哧唨䌲㓂䗻", "푍봴", "䪵", 996815, "胪⌊핤촆᠅絵橱꧵", "䈭䋟嵎桅꣒뙤偌", "▦⼛傟ꕅ⊥꜔䤩卑̐");
    Test_CheckProps_TmMap("턴䅕ℶ࠿ㆸ", "票彣饽", "騆�䂁ㅽ遦ﾅ偂忺", "锏▽ꇲ䱐敫뒦숾䚙剠ﺯ", 604882, 335366, 77868, 431019, "뺣幚쓼ሩꡂꎥ", "಼떍魾Ꞃ譮缫穘覃", "鳼歿捺퇵�렡ڣ", "떵�鷜™櫃諄垇", "朓紸늹鷲尣", "墽욤츙촐", 388226, "묁폹╷䥾箉穘ꇠ䫧", "䃜鬲㋔", "腪쓟쓄퇗븇괘");
    Test_CheckProps_TmMap("ǋ鯮镘嫊冠愃躊ꁸ", "췥뾴ⴾ愫팹룼崬銌", "郐濂", "꩓ꓛꝘﺿю䗗ꕩ髽㱮䂗", 192100, 791278, 12574, 194759, "놔筶", "閪眧畹", "擝ֈ胑苒ᒟ൒", "⠬⨚⢅", "숅郸浃", "�", 295707, "錂ᶨ쥒瓶➣빃", "픻脍䣢", "");
    Test_CheckProps_TmMap("䈱렐ﴂ凘뭇", "㾔", "㾕봠簜߲쫋", "", 482451, 369053, 27000, 981241, "閊뺌", "킦﵌雫", "≷␁퀞", "⒔ퟭ焿◰熇髾粁", "垃배", "줪⏉碼恷阀衴猱妞", 583514, "", "뇆쟨", "挹");
    Test_CheckProps_TmMap("鷞≦烛ྦ蠔嬙వ", "�쒿뱴墆�∗", "", "믅", 163447, 420662, 483076, 416819, "�獠", "窺◫Ī ", "瘤", "㙬ͳ邊迬", "虋㖈ᘈ缥躒�펀", "ᕉ豼೵㧑훷뢱⃹⑾⿚锔", 38538, "몳덞帪㶩ꦿ㺕", "藅끴", "쯢脹⣞阳␫幣䤁瀱");
    Test_CheckProps_TmMap("䥰�䳷쾞", "䡖딇␮弢㒴캹차", "᤼蟋嵨㟠㕆蔎椑豫鰏", "䂮뾟ᕫꕷ韭쿡塸��", 343050, 19941, 895765, 549076, "距쥎", "壂㖖䟴", "ⰻபY", "귿蚙辞羡褡✸饎㩚", "䯻犖檣䗜띪鼖", "㶜⸉⁭䥉腪壋⣮坐", 200762, "귊ꮅ螯ꢁ콧퀫", "쁣", "薦䜾ຩῐ朿丯");
    Test_CheckProps_TmMap("睚혤", "㥳x䝦绅ⷊ", "੷삢ⱅᾠ唏", "", 327365, 971136, 271418, 630210, "览醈", "", "氓", "䈢䞨泿쥄뒅蕾쪊솱⶯", "┞弑쥶", "鏉쫿뙡쀿蚺輂", 200159, "葉崵崜뼺쪌", "器裪", "麖");
    Test_CheckProps_TmMap("ꔛ覩䢕槓", "盿農", "ߵ⸏䪉�", "㶏娠趯प", 372917, 112138, 611139, 324463, "", "ᨷ鞏", "椪ƫ", "ꣃ뛉", "끕蘆㉰춈ꪦﵥ⁥", "ꏝ뙪", 126556, "䇑홂᫐퓙", "㖹鐶鉥蟎⅒蓉", "킱봣쩰ᾑ笍ᐠꟊ");
    Test_CheckProps_TmMap("㡙噬�䄀ੱ", "皚ᮎ씮䡨瞠ⶐᮌ翪ৢ촩", "솁᠃", "ϱ㊢콖�", 956196, 729010, 87168, 50554, "浼쵑쌂�", "�拼ᤩㄛ嶂", "窘룛擤咛夢ണ", "�ꪮ㲸ⓤݜ撌", "ꝃ尛ᬜ큀鬏⾍塰祛壏", "耭䢒墻ߊ⭔䘷ⲧ", 885074, "", "㙢벾㄄엲┄杮", "㙖");
    Test_CheckProps_TmMap("榮阯魐節�믜耿ᨈ蒁", "ਏ�勀", "", "铠䶚똭丢", 619737, 842090, 920564, 903837, "豩ફ筌", "⤎首", "猸湍깿䇆尟ႄ鄠", "鯋፮곫퉥", "䲝ﳦ枊귎", "邩䘸", 784379, "ੲ쟗퀵㙙頻宬畭㒈祀", "鈚횳襹젡", "�䗴陑제");
    Test_CheckProps_TmMap("⺩強蚗뭘뗫�ᎆ䉫ᶉ", "헪㳀哭鎉", "�ꖫ蘨ᐾዸꏔጴ燷缿", "䮅扌訧鍬⻜", 564555, 122443, 731185, 745927, "േ歿", "᤹", "鱑矖钽뿲", "ࣀ⒔舒勴⽭䭢", "갔쾟疦욋䳾ⵙ", "좿僤", 409061, "㨮ᩲ茴锨", "೚�卄", "ଁ騊㷘鰹癏빇");
    Test_CheckProps_TmMap("럘㊔਎╅迤稘蠌ܡ", "匚䅆炝", "슆꟫謉㐤照愄", "箿䦭", 780606, 371633, 547009, 935503, "蕁ᡵ", "蜦▒虄汝往﮳�⦩䐃", "퀎⒂޽", "�㓎఻", "陏帄ꁴ벘ᗔ괛旐ί愾", "㇙朾萑浢", 76440, "皎ⱬ", "臨厮槤", "䇊Ᏽ⼐㫎ⵋ絷礫");
    Test_CheckProps_TmMap("훣嶄䫢%淘螩ꆢ", "榠བ౑啖З띜", "해쁯㔩裏", "悜", 585295, 639190, 405481, 324832, "䑰〵", "", "�閫ጒ쿟�蠝⍸⭫愡", "", "瓐醘쥓㷹簝执쀰", "", 775944, "ᢩ龎꽃魝愯兝⢛", "握", "閔");
    Test_CheckProps_TmMap("ᡙ随₡쵱﫮౛", "ꗉ놱", "푘낫դ묢苶픲", "龼㰪", 641966, 644681, 845394, 909211, "ㅪ迈㻼唈ۼ螐썜", "", "", "", "", "፻⑉ᆐㅑ個⅒", 32850, "", "凛", "");
    Test_CheckProps_TmMap("㠆ꧻ튎", "뭇ᴙꔴ䡚詴協᧴ꬁﻫ", "㊀Ꞅ鵓蛜귮ꭉ贁", "枮褐㜊虄偧", 433054, 845908, 447187, 456430, "蹛㪵⭍ȃ䞋ቭ괟헽", "赟ꫤ揩価柅㥴抽�犏潯", "酕䚪ﺶ솊姿", "樥쨧싮옐皈", "�瓤��耎珎霑้", "墆㖤᠌", 382032, "䌵", "뗻ஹ誼", "稣㴺郘");
    Test_CheckProps_TmMap("ਖ਼䞯ኡ趚謘뛟㰜뤏", "㼆빐骡", "娸곓͟湖", "ꙅ轄绰㻠ꢍ彝⊌헥", 644394, 886014, 412603, 511498, "蛱弰뀿屑뿏闻✩", "窃牾塳゚", "䰼", "�璕橅", "넓ꈱ�ꀊಷࡑઙ", "㬾㼱艻㋌⳹갨㠸", 104943, "릃⃶㨀幺՜硃Ј㷒", "Ḁ�孕", "皁ꙻ쑴≻尺㝁");
    Test_CheckProps_TmMap("劳쓰", "峡䎁ᴄ", "", "", 262868, 18887, 132753, 773745, "䉬벴쟀ឯ咇斁榇", "똝祳싄", "鲤닐↕屩芧卥㉥ꛠꅨ", "멚", "쏾ΐ⃽铘ꠅ", "궥鹖��ᵤ薝焷燀川蠪", 432224, "灀῟ͮ㪆⾽梋ጰ隅搰", "훡楃ꤢ", "睌棫楺龺搛");
    Test_CheckProps_TmMap("藃⿅㿕롴", "", "3왧痀儊걟곽晁", "ꛠ�喬羊寓칪ꝏ", 136423, 729901, 986881, 71514, "紙", "ᦳ玨둷㼚�", "", "犎", "㐄鶽�⟜顀崍邵耊搯ᡔ", "龒ﰙ伂ﻳ", 629178, "䀾챹鄎汧", "瀭줈쩪ۙㅱ䥀灌穇", "퇥魗芻뻣䡚QႯ쿔黌");
    Test_CheckProps_TmMap("苾ﾅ恬캧覔", "☃", "膳肴⻜੬ⷶ", "ᫎ쌂謵씂䉃⤣杒", 516796, 384092, 261130, 552701, "붲䓂赀쏽꿨", "索㤓늗쥠롈㦾", "姉彧�", "ᮠꔱ쓗툆㰛ą", "섘꼼찗쳻Ꮊ핀⡖뀮ෛ", "劢鰇ꅏ䨽唱�욟묙", 139690, "ُྞᰉ쿰�鮨‘", "㨪촍�靬㊯轈ﲄ", "ۇ㘻�龈ĕ怋");
    Test_CheckProps_TmMap("꟥쉟宮⡱쨨짼", "睇֖蕫卮ﷁ퇮瘌", "鶴㫥", "숩̔窬瀜屮", 20259, 935622, 40920, 777622, "葝楕ਵ赔", "⑧", "੠", "澑땲䁫璎ំ", "즾", "禙눥芳ⷢ㗩郝瓇퀏⊢�", 900116, "耆㝮囹ཫ斃彸蕗䡀왠", "�Է舨♼刴", "儡琡﷊牘쩗뎌");
    Test_CheckProps_TmMap("⩗", "兪겄旜㵮홇", "䉡�垘", "톄鱆쥞↚믧퀲茕", 492956, 595820, 993529, 80021, "汗", "", "", "퀯썵ᡉᑓ檁롰홸ȑₐ", "⟶啷", "辦�늺", 919624, "꪿ዼ橌腅땊䙊肌", "", "࿦㡙ⷆ낂㝬割迆");
    Test_CheckProps_TmMap("㡰", "", "ᧇ엍噞嘈璑넒浧", "䕂", 15650, 619302, 74834, 695027, "簵挚䂭꣕ㆨꓺ兀ꒆ", "౯ኽ긷⬕ꌸໃ�", "ﳟ⢱툢덩�㏎", "뇼嫰", "褈欍ℳ", "ﴼ䭣ﯜ둉", 427121, "䑣ꠢ⯩㸋輑릐", "䆌", "໰�톸�");
    Test_CheckProps_TmMap("ഺ䆹屛ꏹ湻愇䘐", "摷綤ᑏ⑹貆羦磣縗閔", "ᨰ윕没㿊팏佭", "듫灀⼮漖ꫧ阑왗", 192420, 269645, 489043, 857303, "榿谘ꖗ熪◬ࣧ鴛", "鲐ὖ⧧ᒔ藼嗕徸㖎銎", "힫鷺崫湮戀목顉", "࡙奐欘♭崶ᴧ", "晏嵌Ꙭ", "⊺볟Ꞌ└蓐Н濙", 478141, "補虜�", "", "㨽渐ꢹ㍅䙀");
    Test_CheckProps_TmMap("쫢졵欁늳䵋핂쨄Ꙕ㠌ꩆ", "呰", "גꚇ", "忻룠딌坰旗挌蟡", 257795, 291400, 381273, 405898, "㺀⛹뀮", "ʱ惆", "藢ᨱ�띝齣쀝᾿꿰輨", "珎▕㣛煂ⳑ", "鋪岲栭榶油눲Ｅ", "柯돒냛얎乗彛", 157618, "뢺鰧ᱱ벛㋳潸", "貙⠽冨灂ᡟ읔琾ឺ䉲", "榏᥈肷");
    Test_CheckProps_TmMap("䫅ဨ", "ꥷ吢ꑛ嵦쿊퉈ꦖ", "麨摹斈垃", "Ҭ缦豄篛�", 618634, 391181, 46514, 304927, "槗༗↥꓿ඈ槶胅㘠", "Ⱜϑԓ㈢⡌", "襵쪙떼ꔲ렉ᕬᐄⶑ첗", "伌乪馦袾栒뇄順", "䛱鏦㸊⸼ࡕ㭥", "㥋", 500494, "痢⟪盆⻜崥좜루⚷", "", "�茔㊲⒑輀례");
    Test_CheckProps_TmMap("끺ᢩ勎︟", "詼塹⼿�琘萖鍨", "峥韩㟕", "鎞㾪㗪녠⠻좺", 946042, 401388, 397262, 349904, "ﶜ확醑䧽", "혪셋앿ꄤ쌽ຨ", "ﻎ", "㻑ꀥᝅ翉맴ꏢይই肔的", "䮸坆訳蚶䔫涄䓇鐒", "․덥ꕾꇾ㜓", 113591, "甥鮻ꫛ鈳裘콹", "郒℁ᴉ賱婽ఈ", "寸⧶觢뗻ୠ蕶恪怰");
    Test_CheckProps_TmMap("ꊍ籛챱", "텘갻ﰡᰮ隄镳숷ȼ踠茏", "銮鏤㇠痜淟붆䁯", "ꎱ�ꔠ⟨ⶋ뼩檧", 198511, 296450, 319843, 346311, "穕", "", "訔韻꽩豱", "￦᫅ᨥ涢︭᥌뺞帘⩚", "ᝧ憅긓쎱㩕�", "㤯ᐡ茿뿴", 614210, "ⱇ鳟퍬�ㅮ", "媰", "ޤꣀ姰ᐋ뙄˔ﻋ梠ᶔ");
    Test_CheckProps_TmMap("͑�綝䑷㺄␂蒊", "ﯯ볉㰱⪾넨", "騸ॏ⾠〆䫠߽샴⭟殳", "利̀⦭", 549369, 151181, 180667, 184457, "跺㨮莊ꄥ㎁䳵鿤餰쯼", "욕盥�鱿텥㟡래", "蟨儑쑝榀襢㬛就䁙慞", "钠튜詮�", "攞௬劻볏㢘ा矉嶬", "验⽴˛퐾㟱禲휉ꙺ⤙", 866785, "", "ꘊ覥ⵍ㥏䙅嗁", "");
    Test_CheckProps_TmMap("淘쭁馉뒿↽̨", "Ꙓ瀽솳俴䑋", "읖տ⾆㻑⊖䙎", "馽⾯宧揈ဣ", 271268, 471845, 650536, 99176, "㦪짉ꋞ쁢雳", "餷瓦䈺構", "荔", "᳓ᄿ", "Œ", "", 606629, "❨겞།㞨", "ዉ", "킅㒏㲇កꠤ");
    Test_CheckProps_TmMap("", "⳰ꠀ줌攰吻သ쵚��", "痎걑뚠떢：䙅좍笑촖", "�", 967217, 620336, 924821, 759692, "熠쿝啩넨曮쭜끗", "", "䶝⤧疫ᬟ剚ꙗ", "", "", "ᡈௌힶ猧ꈈ䷟浣䊈", 279380, "◘鮣謵䔌˪崷跘ꃛ輪Ჺ", "猵읋Ẁ", "勣₂敵");
    Test_CheckProps_TmMap("콯郵㞢㟃誇", "⬃�", "徑됦", "⩖", 759041, 96000, 568077, 498886, "抄뼊됺旞鯉砡", "璭筡̛", "ꋎ縊꽔頪秽", "", "竐ꕻ굏묒", "", 571457, "", "䙂鴺滭殍쏊ﶆ�䏓嵡", "愺ယ");
  }
  
  bool unitTestResults_TmMap_Getters = runAsync(Tests_RegisterAll_TmMap_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_TmMap_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_TmMap', UnitTest_OpEqSimple_TmMap);
  }
  
  TmMap@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in Id, const string &in Uid, const string &in Name, const string &in FileName, uint AuthorScore, uint GoldScore, uint SilverScore, uint BronzeScore, const string &in AuthorDisplayName, const string &in AuthorAccountId, const string &in AuthorWebServicesUserId, const string &in SubmitterAccountId, const string &in SubmitterWebServicesUserId, const string &in Style, uint TimeStamp, const string &in Type, const string &in FileUrl, const string &in ThumbnailUrl) {
    TmMap@ o1 = TmMap(Id, Uid, Name, FileName, AuthorScore, GoldScore, SilverScore, BronzeScore, AuthorDisplayName, AuthorAccountId, AuthorWebServicesUserId, SubmitterAccountId, SubmitterWebServicesUserId, Style, TimeStamp, Type, FileUrl, ThumbnailUrl);
    TmMap@ o2 = TmMap(Id, Uid, Name, FileName, AuthorScore, GoldScore, SilverScore, BronzeScore, AuthorDisplayName, AuthorAccountId, AuthorWebServicesUserId, SubmitterAccountId, SubmitterWebServicesUserId, Style, TimeStamp, Type, FileUrl, ThumbnailUrl);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_TmMap() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", "춗䵩첏㞟", "㚥涬凙ﷰ눵뭩㵷", "⃩쭶퍉", 746965, 295268, 535487, 148099, "麑遬徨", "ꩣ釪", "勑뤋펍캒ᨶ롆", "⇩㵣䎵甄壝", "", "", 591080, "璊诛퇟鯚핦壉", "獔", "峵כֿ鐄ℛݙᚬ쇳濶");
    OpEqSimple_Check("ᬤ쿊菆︐좙桭", "ﶇ䚱윲冥㶶밑幖", "ʊ冿�Ⓢꖠ⋳䝅攨鑽烆", "䝕뭀ꃲ썵㞫䫆ើ鹆", 288195, 531474, 7923, 471876, "␜῰蹎쟳횱宙홧㉜는", "蚵⧝耏盧", "ꨕẽ뮱", "ʱᯜ鱦ࠡ", "噚셑燵㪆汀ᆣ젙", "䁏ਮ虴簪䤀", 610006, "䀐硩", "䀿虿砍", "픽鳐ꈉ");
    OpEqSimple_Check("⣣뾈噦", "⻰쬟칁", "�㏊뻹媋痰", "糓岁ꮸ㏧㽤᪮壐", 4203, 147695, 766369, 453007, "", "⬲櫇ꟙ栥鏡螫", "ꅯ껳ሌ", "耽裮ዖ锲釹ឰ墐", "໿ꍱ꟤��뙑", "㤬꾷", 694261, "館胄ા즣", "汢ꏠ⮶", "괗饖㪟");
    OpEqSimple_Check("汆講㓤통�ﭝ豲氹φ", "뛰�둕", "秨玹桗喐", "퓂䉰ꋗ嗳ರꈾ", 680607, 279276, 747775, 333922, "ᫎ솠轼ⱬ褑ཧ捺슅엎筄", "곢歒愪", "�⧙", "ꃢ｡뫇묯릕⛲", "瓪ﲥ疬᳢䩶㩒", "墨큽咪઼側똶뙈", 601038, "䥓佴ꛬ苵䎥�쭲鄻", "�丮祒", "粄⅝挝㠊");
    OpEqSimple_Check("共䳶넊ᙓࡀ컒", "", "", "뱜悶ꂋ鰲", 433068, 667191, 144576, 754367, "篱鬻", "娣ዯ﷤賚�챀曹", "⟹驵盲", "賥硬⭷혀ⴿ㓶ࣛﬣ", "꒭→⣦룎ⶳ", "﨑ğ螥", 48706, "㕹બ⚟鰉ᡖ梉ᚭ", "遚㌌⻄", "䨾㶜☭ෳ鈴띟璦Ⴗ");
    OpEqSimple_Check("撍䈒", "庈", "᣾킯䠧◐", "멖�", 343909, 463281, 327759, 609845, "텩㚽댯맑", "瞐奺ဂ", "㎭啷⨍揉", "", "", "↟ڹ錠쟓쎭뗧䢼", 308928, "�⁔վ罚宿㝳", "럢쩪媭䥿톤聿妒", "娂ᑠ쟀");
    OpEqSimple_Check("䘚秱ᗱ閯", "潿鬐鿹愶彄纇", "̉韺輨浉ㆠ㌔Ú銼磃헮", "図罛⢲Ȃ㹪쉰龊〢", 493150, 371477, 170942, 386377, "䋰ꭔ䧂脑囲ﻯ機稻", "ຽ", "랔ꖒ鬋", "쳮쬤﨣ኛ믒趰忳", "숬勯ﵜ", "䷗넱�㙫姦䟧ఊꪫ", 707858, "", "흌ꄽ", "䣵䮆");
    OpEqSimple_Check("宦奋豮ⴈ֑⡋늟", "顚辑죹⪱濱", "훱Ⅺ킠�鸋₫일", "", 128962, 901043, 641360, 925617, "尪읒", "轏씅", "੿퉛꿪⹳ꈰ뗵丷ө㩣", "艌", "㵟蝅迨︧兀ࢺ鱈䛳啨", "ᄈ믋왚ꯂ喿�", 897341, "", "ힾ䣇ᚇ梅翂", "");
    OpEqSimple_Check("迒䌡ഘ�∁衽", "癓簡枌녑埖韠", "皾澐쇞㍐དྷ", "녜뎙㾣咂", 111470, 573616, 37300, 800704, "൹貈垸", "挧ﳗ졝", "暮㟄䷫킹륦了", "䂃堮", "ṱ帮—뜔愄츿첣⦝脘", "㳞繶藩륍韚킉", 623898, "絟磶▧汶틤榸倢", "禾ﾫ䅖ꏊ軃頴", "");
    OpEqSimple_Check("❮뙡여䯥鍮幘滆", "텒綒搅聍Ꟑᨎﳌ祊", "ɯ䃟", "ꑧ⩱ꛏ�암䢢갎穯쎙竗", 443493, 24041, 47111, 957356, "م륳⏏᧎䫁詵䯻꼊", "쌜⺢", "㣙㾯禗", "✜ྦྷ", "낤햳釽⛧옩炰၃鉝", "ⷀ듅㡐沁祿", 274962, "休ￏ", "렳墄䖢⊎�ꮏ", "魍镠");
    OpEqSimple_Check("ꩀ옲", "ⅶ엱ǫ揆쟶孛﷤", "姐䊂⤭�Ჺ", "챵ꏹ", 262430, 839490, 488918, 72292, "븥ꖙ∴", "綽ケ摓릺칻啗", "꺥", "ꥑ듴", "鳙막", "탡뒤엄闼嵞뿭燨ꍶ⨙", 951824, "ἄ辰思莽䱪㪪䀷픿ᨏ", "⹄̥グ㘁ȃ", "㾑ໞ탬鏩Ⓜ恇闥媰");
    OpEqSimple_Check("근邺㣿䟫랴ퟭ씤�房", "海Ⴗ״", "띴勇啸俵㧠儂攑짱", "캌涒誀叞㇘㌬", 96163, 83341, 728813, 537856, "늵꜀", "Ư⥣䞘询獽ᗒ攅樘犝", "�", "䢿眭᫜侯억맖Ⴙ潊", "", "툇", 56696, "ꎝ�", "氢봃鿒碀㿷䆞룦", "쟓");
    OpEqSimple_Check("冥풭", "뇗嵢ⵜ㲰핋嶣䇙寇", "窆", "䞼壄桀蜿쾖촱", 550126, 747140, 491136, 128982, "딠㶷蠃ᚙ鋩ඎ둪┉堼", "쓩�", "햍", "눮㛆຺拇씌", "튂䄕᳂꛰", "恁䄈♈ꭰ蘣", 41300, "辞妝㩁⸳≚輒", "Ꮪ⹅㫋�べ", "�躌續");
    OpEqSimple_Check("毰덷僀ᖊἦ", "␓쌍油蒨騵岌ഠ㞞炈", "ㆎ棌�곔櫽", "ڷ寀�", 294580, 411439, 825471, 178160, "旺沣￟㸄ໟ䄺ꐶ⯀", "䎲⠋젿糖앻嶚", "၁᫄鍹䨢䵟ۄꤢ", "⨨ᘟ戣⦻䭋톓췾热⹉", "녈㰚ㇿ", "", 115423, "뇺扐葁霤黟ꮪ辝뙉", "筙Ỵ莙", "ᘾꃥ촄㍕札펂ឝ뙽");
    OpEqSimple_Check("䩷悑", "况脪㢒⻋忡過", "", "묽ᴂ㰶剎䌅糣Ӄഷঢ", 975752, 937115, 584989, 886773, "긺簼곽⺲", "㗲玬욢죚뫦号", "핈䌶୷媉軪砦", "㫷ൈ�ぞᓺ", "棓쿏ϑ᠟釿뾂䌑ᕊ", "翌㾂閈䨝", 223849, "呃율ᤞ", "䞸鄈鲤戙᤿䜦鈷", "몚첈㋨");
    OpEqSimple_Check("ң�黾ᔏ", "Ӑ铨䄴ꓛ廉ཝݿ厪", "珱鲅昿ⅵ�졻ꏳ沗怛", "㤾䝤㰯䕼", 192506, 968112, 262452, 458117, "፤✷㈳﷥똭퓄", "짉⣻ّḧ魯멅", "쏸휞⬔轘␼", "㼳쬺義瘺픲", "ﶼ즹␥", "멕纍ⷒ艜᫮⪙", 671591, "ᱝꕮ餗", "", "ⴑ鋆㫊훝");
    OpEqSimple_Check("⾁ᱡ䋢", "幺ਗ਼ᓊ鹿ݚ띤", "륑깾귵獦", "", 674568, 941312, 710424, 134924, "媂ᆠɓקּ", "噫歪嵞䄁緯", "䬰왊姭칲ﲤ荏嬸虶댓", "㢋ꮂ", "쭖㟧", "ꑆ鷍뒦羊テ", 504590, "ȴ劗ᄼ잷輠烖ᩬ", "ヸഫ傻䂓㯄좑콤", "㣶喒⅒瓮㫬");
    OpEqSimple_Check("劊좂響ض쭂槶ﾽ", "鉤⡄꺁佪", "✷㎾腒鸒", "鱚઄᷼嬺꼨㉫࠵聮怴䭝", 246592, 37392, 730857, 639596, "崙浱�ﵿ쀡宰�橈", "곒윶￪", "薾", "懁夀㎛圚챞㌅", "齑간㴳鮙쒽䐙ꛎ葨", "�", 357258, "崁尉ꊹ娷匇绱㑝", "", "䉾ॄ");
    OpEqSimple_Check("痡뗏�", "", "汃Q䵈戨葎푔", "ڪ⽷", 188794, 59487, 31576, 129914, "띣", "", "咃ࠄ裞ꥭ峘갤噴崤腎", "镵⮖铢뢇懅⧈碴熭彰滬", "譪", "⑰ㆤ헑仺䐟ᘇ枙쌀", 409991, "랇㲑�㹘捲픢㻯", "ﰵ鹖氫�᧬쓔烈䞃俯ꅧ", "彡㉆䥅푒謏믷γѦ");
    OpEqSimple_Check("ꇹ귬ﶝ䤄嫿�", "࿍塾ᨑ垢", "", "뼧ￎ", 180939, 805078, 245452, 87934, "馚㤀䧅餍", "ྋ嚋䠬", "☷", "⿄䅓ﷇ⾂啷熖뤶底⼖", "ど谙퉑跛﷾䍍㥻䴚꒦", "Ꝟ冷硃⶘⁌뙦鰠", 524957, "䱹頶ꂨ걜㨧⯾淂꒟", "", "㰩貧䔨㌅");
    OpEqSimple_Check("츀М符푰", "頦眞Ἂ丟", "뵷鉌䳷", "퐌쮧㏡륳덏꽠枕", 290517, 641927, 733623, 227787, "擖ꖜ鹷춂﹋�掌", "끭嚵陲�耝뼮鑟➙", "鬿鯪哠햐氧", "ਞ杻뾬℟맏ি", "疀곱", "Ҍܱ症᯷람⃧", 981241, "䖰⚈쨳皓咆덞", "苶闔화᪢⁕虉੪", "ㅚ汧䖬鮇䏹");
    OpEqSimple_Check("妯扚냘锇㙙࠭힄", "♺摵ဢ珤㖫듣", "倏叉檩浐瞹◌욡", "�ﲾ⾻㍷㚭ﲌ楪窏", 1174, 77271, 322016, 981507, "〪散қșചᅉ寬뭛ɩ翚", "袯⯇ﶤ끗각", "ㄿ峜ﮀ꽛눛動䚘陇듦ꪫ", "鍓큚槲뷖悗롁", "挳뢭痔䬰鐾㌉앷", "훪롾㐱ం⮌ዂ䯘", 346122, "ꁦɹ�䴦㚝氅巃", "曰ꖦꪞ⹥돝鹁ྈ杫", "➤⛄䇼�ෳ");
    OpEqSimple_Check("̡䅝", "䰱籄", "柎縋餠펜銆꼡ѣ", "嬼슷", 668152, 344855, 322917, 935893, "믦ݭ䣞�劔錵", "࣬裯", "礵쭁�๰", "㚈ꊼ瘙ꎜ䁃癣못餌", "㦍", "䰆", 520049, "卵哖ﺇ梬㭊ᐠ픲", "ưᢘ墇᎒햐⦀", "郼ꈝ쒜타");
    OpEqSimple_Check("퍢騾듼߭礴㸠䅛澿ς", "", "卧�", "俢㹶惊氹", 532390, 190927, 955452, 687742, "뀸�", "㯛챃疵챃", "๑ꇔ饭⠀径", "�᤺ᔅ휢䝨", "㾰䎫帄", "쯢ᅸ뛦躌륕ￏ", 280360, "뼜櫢潃뮚己唙淐挩㯂", "⬒埐糋ᙴĨ", "욌尽⪬ꇱ椳轣");
    OpEqSimple_Check("篏ꃸ㗛擱", "䛨鹭", "⅘솅俳蓋", "ძ놈⸨㼼蕑髌訳", 965323, 997605, 386817, 767476, "汏ꡁ៞낏", "�ᆉߐ循ꍿ䳵", "ښԸ", "졬凎욦ᅎ钐╆哫", "ඕ럥鸂ᬓ鵨꾀ほ돝", "㋥烢癦䪌㷳缣紉ࢼ", 445771, "홆綷謀㾜쟶췾", "", "໱");
    OpEqSimple_Check("駐쟅橊", "�", "⢵佫예ꓜ饿嫟剾܃", "໊뛵溭ᲊﰙ", 322674, 999075, 975896, 675843, "", "픏ᡱ篢", "쓺ᾡၠ䱑", "甬塗™ૢྪ찘", "", "", 5641, "砒綠ꫛⓙ朴硜홨ꁾ齬", "蚶荕縰ᤡ⅍", "ᯍई︜�㫃");
    OpEqSimple_Check("�⒰", "㺲�䉙", "庖겅撫䙑簤䱛↠�湱", "疵샯뙤", 532942, 704976, 274688, 614552, "꽀ႈ胗჎롢㋎", "�쫫퇊", "껸琗醋鈻⭖㏺욊", "疭⨔뉒뛰䦄㢼", "坈య榒㐄杭", "쵗诱嘡ꋉ", 508464, "ૹᎌ〭六꙱븀⹀휤ꪅ", "�๠䬮颼贩羊鰫鹰䊦", "퍸枎ॣᗆ�㷹톝뙤麶");
    OpEqSimple_Check("䉯䗮笠닦햿", "纵鰮", "黻徟⏥뚢ൻ됈", "矾ꕢꉼ讫", 680960, 217832, 812698, 761015, "Д㒱⎚", "䐻汔瞉騰ᝐ蛇饉", "顉㥘ᐔ䕝", "ㅞ삺蔳羽珌�귧㠆", "औꁶ騼푯䅕苻໷", "䬜롁亊ᄷ섴", 234815, "π呖㨈뒡", "ﭚᕦ⩳짌澸奩꩏", "⥇䦴疵⍘녵뀪");
    OpEqSimple_Check("㲨袽‣軎껬ヰ∨켈놳", "춫�", "妩", "ꖗ漣鐯", 80331, 503273, 550778, 885431, "듓", "䏰䵼", "", "碢⁌᏿上둆᳣ᔍ", "䈖达鮻㺄گ틄㉌忹枎졎", "꽤㩤쿉䩘氌믎纷⢋", 460501, "봺搕裏翯", "ፊ䙈", "䡐ꦦ䡗捧⢳");
    OpEqSimple_Check("뷬ꋵ厯꽦哈퍶", "ᢇ憖䯞愒ㄟ⯧", "씻翿ღ熦ᆃ뒁炜ꅽ", "瘼죨◰癞ꩶᓥ悀㥉", 743265, 153376, 127002, 259150, "䣔⋽ビ왊櫒徼倱⍌", "", "荆᫟ꉛ", "颓ᙃ씕獪", "⮨ꆵ٪", "넩쨀", 188204, "", "ᮻ®䝆䛩", "渌쓘⏑␔ູᲴ䮻颱");
    OpEqSimple_Check("곖", "㚐", "", "2⧖㩉폗䂬", 729010, 863755, 804749, 451269, "�", "窖眄冷⼈ꊺꗾ窼ꏀ", "谽丝", "⦨푶饲", "묏", "ꙛ곥耴៚⺧㆏", 769774, "毄✂ꈨ⬭", "柃걔䫄ꀬ紦", "ﮭꭢ⍕컅Ổ̬鰘");
    OpEqSimple_Check("뮂", "猰滻ꓱแ溉綦", "ꕳ볌꺣ꗕゑ", "䔤奄�慞踢擼릏堻", 931547, 676615, 96064, 86594, "珯︍ु歫仦î긆�इ", "애痸芥둹랃䋍࿽", "訌헕春ꄬ隫ఌ뾪", "淀⤉㳻ꨮ龓", "", "靑⟭츭徹燓䛡ꑑ쁃", 29404, "뎢ꚽध骸鿬聹", "炦ꠕ쨞龎ႁ", "⥖");
    OpEqSimple_Check("瘄䰚", "莁এ瓁", "雧", "㋁㲮", 462398, 73684, 811497, 104494, "蒷᫣惡᫩", "뻑�㙻", "䭀໭⋩쫲䲞訨", "", "鵠㖯꼥웤惺߆ꖫ禐挳", "�⭴풼㯊㑭⑚", 414346, "ః༓閂⺞㱐ꋹꃚ", "㼐⢙ࣛ", "಴Ɥ뒮袤␎⬄ቾ聨誴");
    OpEqSimple_Check("昌", "獌꡺", "퓫峏煔삢䍾뗘", "챝ᾩ츫眻煯쓷᣻", 269655, 546139, 662503, 388239, "헗褩ᴥ翭ꊕਫᾗ", "", "", "ᝲ벝죃", "伓訫", "읇", 999743, "麎㔅醧䪙", "下推☪ഛ胠볰㥪", "魙槷✔袡");
    OpEqSimple_Check("竧㠍侮꽙༬", "媙", "쾷�萝", "ግ甆", 912365, 217888, 54730, 909175, "⑨覰⫈ᕛඪᎄ", "᪉�ᡵㄓ㽘㷉综䄤", "柧쟄칂ᘁ캜鏕ഐរ", "광ꢲ濰俬", "ʛ隸", "ꛠൖၬ돹궕쀵薧", 274751, "Ჽ瀺䐹夔軁逃", "", "쪭ཱྀ쮘䶆貴柆祊዇");
    OpEqSimple_Check("瀨祲", "웍盁풵", "ꏐ㬁뚈鍉ᜑᜢ̒觼阜", "ꄡ㊽珥왪댓헄", 282700, 684872, 741010, 688250, "煚ᚉ暾ꃫ䪎ଓ㻒", "ﺏ꾢䤓", "㶣ㅘ艶", "뜣䦒鮥", "嬆꘤舣怠亩訬ﻀ", "辮矌카➊כ", 544353, "ㅢṀ틨詐뷿᧴匞", "ꡕ隚氯", "蘆穯翤჎䡬ഝ佘");
    OpEqSimple_Check("䪆콟䝟嬧", "䊄ጄ蓮犸鶦㻛", "镮罛汱�彶瘓菼蠼ℬヲ", "半쪆Ⴄ红䁊쯙ꕩ塣", 719610, 585824, 300222, 507977, "ෆ⩗昤囟籿⭔遂餑", "쎧䉎挀쭷鄓꤫鳿샔讉", "驻Ὰ瀖恸꜄", "쨺�흹丁", "꿌過僵", "ꙝ봴", 579944, "䏈⍸覆", "", "ϊ");
    OpEqSimple_Check("", "愶헓⡸", "瓓휗♠", "挏", 984708, 848112, 940563, 831374, "욮୩鱢⺶ⶃ戢3뢎谸恧", "ᰜ粘幵", "呐麵曷혬Υ৹㓼믺", "韼Ǉ끒ﶫ䪝Ȱꊔ餻", "穨", "茭䛩䀏쿽ﺪދ퉘", 46369, "쳒", "쓉 ", "�");
    OpEqSimple_Check("", "➂앨ȋ⩕", "볷䜲�뫽戆㽟", "瘀憹⍅ⱑ멘ʊ轢푬䌉", 152185, 729661, 880971, 29654, "ᜠ孚鹐㈜ᐽპ꨼석㾸뵙", "풕涍㿭鬻", "鎄瑺ﰹ㷚㗯", "㐜샊飰왂㿽", "ὐ晏�궼", "﮾湴ꦾ哪Ꮯ氶", 790829, "鈏�ꦻ캿㤉ニ♠", "轀蟀쀾", "읺");
    OpEqSimple_Check("䑷�㞕肾", "䫵ꬋ疄찠暋ꋮ粋", "", "秇䤊�ᚂ탥ᜓቶ摍", 500463, 316153, 55531, 436165, "", "垩駀", "뢩㻂䳶阀ᢋ�춄袴", "敚䓊념䆱먕ᅨ", "뜽ㅱ㡁喲ῒ꩝", "鷀စ郚", 476578, "�", "搑ዄ崷꘺쑨ᱰ蕤墜䟘", "ﲞ횕툩㰜℡檐₠");
    OpEqSimple_Check("ꆆ❶櫺纍ꁎ쩲ߧ䉒", "䣒ࡍ海", "", "負寷篝퓎䤥", 162437, 105966, 24732, 541310, "腆梲⎸ᓮ", "៝죟裈쉽釉纋", "狤", "댾湪䫓�▐", "飡썽뒡卋︠昁긨", "渧䎓鿫Ī", 306731, "⛋", "瑘寎", "傇䬖ﰙ燚晐怆");
    OpEqSimple_Check("厄", "य़烃霢", "蘢녆՜䮢삖ᰜ얅�", "䳚ಜ໅慛͕ꈆ禿䝇嘧", 166714, 588968, 547647, 176967, "ꨞⳛ純汻햅↖", "㡜", "觗멋뮻", "⿄㬶幣", "�", "︯䴰탺�义ﴐ൪钾", 412812, "뗆騋䌟羈䞌靫솥৴捦", "", "텰돩�쎨췝ﲣ");
  }
  
  bool unitTestResults_TmMap_OpEq = runAsync(Tests_RegisterAll_TmMap_OpEq);
  
  /* Test // Mixin: Row Serialization */
  void Tests_RegisterAll_TmMap_RowSerialization() {
    RegisterUnitTest('UnitTest_SzThenUnSz_TmMap', UnitTest_SzThenUnSz_TmMap);
  }
  
  bool Test_SzThenUnSz_Check(const string &in Id, const string &in Uid, const string &in Name, const string &in FileName, uint AuthorScore, uint GoldScore, uint SilverScore, uint BronzeScore, const string &in AuthorDisplayName, const string &in AuthorAccountId, const string &in AuthorWebServicesUserId, const string &in SubmitterAccountId, const string &in SubmitterWebServicesUserId, const string &in Style, uint TimeStamp, const string &in Type, const string &in FileUrl, const string &in ThumbnailUrl) {
    TmMap@ tmp = TmMap(Id, Uid, Name, FileName, AuthorScore, GoldScore, SilverScore, BronzeScore, AuthorDisplayName, AuthorAccountId, AuthorWebServicesUserId, SubmitterAccountId, SubmitterWebServicesUserId, Style, TimeStamp, Type, FileUrl, ThumbnailUrl);
    assert(tmp == _TmMap::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  void UnitTest_SzThenUnSz_TmMap() {
    Test_SzThenUnSz_Check("㍒㋪", "翾鵜", "朹鎟ﳙ", "编", 325863, 922558, 661263, 436830, "쯣欚", "⿕氎꼻㤚藴킅", "섌ሥ�밄ꊦ", "", "賄�匼뒱", "瀹ፎ", 906038, "佪�䮞", "㻥잒묑", "蔃");
    Test_SzThenUnSz_Check("Ộ푲", "넲䗵蹟", "", "竟潔箯㉽貺ᠤᝯ", 547338, 697340, 334487, 93517, "쎦㋥霈�ౝ㯠쬙", "竲㽥︠걿좳樁㠵ᢐၛ", "", "瞄", "⏂ꥏ꼼砍띑䗇髣蘟", "鉓켯τ㪔ﻊ爛", 4343, "ꈽ洞⤦➦踆⌾ꎳ", "", "䩸Ὼ㐚ꂖ摇");
    Test_SzThenUnSz_Check("", "᳔䬳⑇勿掝", "最徐㭾멭Პ䑰繤", "퍻", 592141, 288796, 42061, 924208, "诜돚兽奞ͩ줞", "ᄺ膲", "剼᪲ꮚ෌", "ⰳ팑ꇬ䋶慸", "鐮軅㧦胷", "㸕靮", 151896, "巖ㅡ螘笣䨯䄸㻘궈", "⃔煡", "盡ₜ阵");
    Test_SzThenUnSz_Check("곟ᢏ淡钡೾", "줒女ѽ泡誄狋", "佌Țꡮ殴䉵庨嶏", "⻖㋽빽睍뉥", 344084, 240382, 126840, 269534, "", "虻雈", "ී쨳ㄤ䒹ਮ", "沲", "鐪﹀ྏ䅳税�〿Ꝼ샛", "③享㐟ꯩ㹎ӑ䞖", 558576, "ꡃ", "⸕숈祭鑚ൃ䶀椼", "䯯桾뭎挘殤掙얷ᐮጧ");
    Test_SzThenUnSz_Check("ﻸꚡ", "", "", "�䄳凜嬚魯ᄍ", 824789, 700839, 759025, 99463, "", "傩Ἂ嚓", "䫚蜳㽤", "ꊌ멉녍ഩ", "앪衚ध⿺⯌憎祖羔ﾧ", "៳╝⁋컱ⳃ", 830203, "꩸㸵", "疧ꅦ뭲끀䗶찀믌聅똯샩", "");
    Test_SzThenUnSz_Check("∐⒳伷鳯⽸︧濜ḟ", "᤾℟仅䃜쪪㌲㯊", "ﾖ︔ᡊ", "븹䤭ذ沶ꫴ", 796856, 120221, 587261, 379807, "䷗鷪묡", "손靇", "ԙꇖⲽ櫉疷冤", "ꘓ", "풠氂ᔾ쁄綯", "ຶꔽﾜᵏ䒴", 360995, "⯟骙䁣豅琧뗇躏òꘄᷡ", "펽꩙负釺锼珟፩�埊쎆", "巇麃犿鎒");
    Test_SzThenUnSz_Check("띰摼푔", "㸠斻ை牖Ⲋ䆮⊂农", "벼寥ﴋᮝ臢⫎춂", "믅༐൨㪁▫", 455286, 886316, 383122, 880579, "댢㌠", "箯浔陳᳚乹ﻺ鮷囫я", "䮋", "ᣳ翠�Ꙇ鑇撠", "ᕝ芜쎡韠", "�桮럫", 400742, "륫삈", "觰�", "�並㈛贆�⬧");
    Test_SzThenUnSz_Check("№", "여군햛蝅縰�㔭", "ﷺ⋏晆뗭⴬똣궆", "狤í똫", 635672, 394180, 207205, 354093, "낊㮄瓲ꔽ႙趹", "䚦럕ț頛臾ÍἩ", "託鱫댫", "�욜푭沈ĉ漎㛊�", "霭䞓", "肑レ䷋仚饩�Ꮚ", 312859, "ꋨ䳘쏡卋鳊鍽", "䅰ꡉፀ븯", "屹팑龚");
    Test_SzThenUnSz_Check("ࡑ⪽뒧蟐ﶾ鞞", "�鯃嘐ኽੱ晤斔�韑", "砚乸̛瀎ᭆ㍰䞓", "婌ਠ愤섉韭쟰튤⟫", 69951, 157313, 385300, 285037, "뻗８ᦲ菬蜻췭栴省", "왓꿨᳁ْଠ墻ἰ", "챲퉗溕㹅灜桩弜", "蕹尷ꦾ첥⡵苨앶㴗ၖ忧", "놲싵뇵", "ꇑﾷꃦꅕ熪饍㨋8辝쵌", 808501, "앛䡳", "䕯橄�㰿", "Ⱄㄺ꛼㻔㴕뺠");
    Test_SzThenUnSz_Check("窗䊨㎠๥Ⲣ⪒冁", "婬桸꯺쎡魶㭷栳", "泒擵䆲", "铃켴돺븍닑ꪐ脹窕ૐ취", 175854, 277912, 599225, 318654, "㒾ⴙ荡옄샔ዕ", "", "悝ㅍ➵孞扎㹰", "悑翐䈐풼仫즍�狫", "蝶ꙵ隓臹⢺鏿ㆻಖⳡ", "�诨苵跗뼍掰圷", 605519, "ₖᒁ토ф⮭갭띨켊෦", "䪩引࢙憖ꀖ銱❕", "謐");
    Test_SzThenUnSz_Check("죫ㅿ傴灲", "灣", "殨䡍愆ᗓ‫䳦", "�䢌᱕벵", 518889, 231231, 608287, 118864, "逽떾뱮", "贉韽", "곐캼뎻튓뗽j좠", "", "�鸬?�ﲙ྇﹠⧫", "쎴妓�鎐壤䬦", 731946, "Ⰲ룟晶葑", "", "错");
    Test_SzThenUnSz_Check("﫦㊷", "ഀ옉龞꺌ꭎ", "茠칧瓖ᵽ", "碚�뛥", 432129, 995984, 361102, 172416, "帻鈿橦衺㉹䧚炐▖䕥ϖ", "榄诶", "", "", "镫웤ꢚ穧륚�ᚽ蟛", "", 987676, "꫈ᨋ》竫퓣䲊폫⤫", "臕", "峵傊톥泈ₙ");
    Test_SzThenUnSz_Check("츨ቓ瑪ؠ欸�њֿ", "邀捱ꇊ쭎�ℾ쪋", "닺쿿ꉧʪ", "ă拻⃋＊₅뿴僧狑뻇", 493852, 12310, 373757, 277317, "", "甄☸", "⑓킄읋溛", "", "뛼켄雝繗環錆㕟﵇", "⏪㚳േ᥹", 385683, "쉅亠햇ᖇ⼏歖", "㡆햽㸞", "≮ㅻ赈ᰲᨠ礇並並");
    Test_SzThenUnSz_Check("ዼ眒沸쏀闎", "鹜瘁⟱", "斨", "", 595611, 243548, 167998, 288457, "ꪱ㖔⍁숇鴕샰㬺", "멘┗�莘", "঍ꆡ�鯉罨婽搅䉗", "쫒뗺磝", "풦䦵亰絽࢜", "봒ᇲ왙醀莇", 941798, "櫳挧盬", "骦灭⭔", "퐵儋䳆䦺謑膢֣");
    Test_SzThenUnSz_Check("뭃⧊萉ꇱ灶�⚷", "銣콇ﲇ꽾᭔", "匑⩶妗�Ț釄툆☄", "ὪＩᬶѣ瀠宅⎰皎", 777534, 710652, 661933, 633415, "焄－噈", "稯", "紘⅛", "브쓯䠃ꀼ렠⅌滛ⷖ뿂", "줪꿙找쯡뗽", "㏖⼇", 716784, "가郩", "ᐱ鉓䞓", "妛࿏");
    Test_SzThenUnSz_Check("㮼쓎憷Ὄဨ㘳顫踠䙲", "", "㗫", "弮�옚䬟뮳ॾ�", 212480, 361747, 876177, 635778, "艖佺䀒䍊빇", "ꄕῗ੉諡畵䯖", "﹊鴥묏⛿랥泘섆", "嘍쾽ಕ", "徵ꨩ穕", "᧪귮煢쇳", 602381, "ﴬᄉ", "ஊ惧吁略䑹뱕ﭔ", "졗볆丕鈂");
    Test_SzThenUnSz_Check("톽", "봫᧮Ἳ촷韄", "䃳䡝㹅楨鵱ᡐ蜑ዡ", "ਜ툣飗㠝茼", 265019, 10421, 230479, 134830, "䫮⿙鿁냱㛹듴", "䥌Ŝ柫缾", "矖", "愛쫿迩Ềᮺኛ�ꑞ沗", "", "圵", 264347, "�贲Ἴｃ鉃买㊜ꐶ塶", "䑐㸬", "苔놗퇝⺠꤭韶啇");
    Test_SzThenUnSz_Check("Ỏꁖ푆푑嗘יּ尒䃚", "斫�휋ཞ", "溵ⱇ墙ୋ蹽鵔㾡칿ᱟ㉞", "㽀ꨟ逪胲軍ﶋ�", 573477, 227792, 494551, 828117, "᥉⬋鎑ꌐ㭯⦱⽂", "ኈ椉ૻᔔ͡孞ꦔ", "ዬ沛葄ད", "춙끬➒ᗽ}൳鸄ꋺ䨼", "㩪㨹﹵锗�", "釕쒮", 541904, "�淿ὤ糢쨶波ፑ鄪厦ﴑ", "魟䡏鉕�迬�ᔓ㶔", "");
    Test_SzThenUnSz_Check("楟旒", "춶堢", "痒똁蹷팤", "쎘", 736962, 532685, 235603, 636089, "", "", "퉕͖ꪍ�둰꼞", "獀톆잗涒", "ᬏ핍竉", "䞹悩", 805392, "ⷷ莣겄㖡⦲", "辜슦�", "铠㼢瘚ꡁ쾕ᣉ噆ꡭ");
    Test_SzThenUnSz_Check("酀Ⅱ渚", "�뜙翕鏅ᩒ딢ⳙ뫊ȁ", "", "뜞ੜ", 958194, 668516, 366996, 364181, "蘄㐌䂹꒷ꢫ⣬ﵻ耘ꊻመ", "ᩇ찉㍜䗹뉔户묄먢嫸", "", "祰䧈躺줘웎由짉ꤶ", "쮜먏", "�メ犷", 640815, "쉾캆", " 漓Zᄥ녷ྕ嚨豯", "戈诣䨉仜");
    Test_SzThenUnSz_Check("됑ं콠葉泅梔灲", "▁쳋卝ⱞ㚠璬㊅聾", "琔ᐞ", "섋陝Ⓡ꧀鬴᱅", 359953, 910079, 346588, 109982, "ꉁ툞댬啇ᣒ", "岚峽Ό렾", "宜䷷랖ꛝ�Ⓣ", "豱숛᤻溜", "띘椐犀᝙뷟훇쾌", "沲", 994180, "ⵦ鋲遂襥", "늕诩겣逸", "왬㨐✌蓗㬒");
    Test_SzThenUnSz_Check("쿥⯓禁⧛꜓௓�빯മ", "䭖౏꡽◱䞧Ꙫ揮", "ᜋ䒘鑏ꛙ嶹⍔", "", 750209, 279739, 979796, 972247, "撱賥뉳㻛骐图秈", "䯯㢢⥺", "�", "", "향醁줪", "Ἶ贖᧽", 730736, "䤯죰Ⓘᅾ", "㏶⚉諍㓥٧", "됔﮲롲沞粍徹");
    Test_SzThenUnSz_Check("", "ဘ蹄", "攨ᐝ쪋Ὲ", "䈈춃☴ʍ︠", 153177, 992714, 214595, 113491, "퍓ࠇ鸳誃냫๑뭜䳜͉", "掤줆轻์䬤ಈ�뼁睦", "䉼⩂㽌顸쌋", "⮨�쮡", "䃨", "Ⲟ밈", 993846, "䟋", "�꺧ﶺ螵", "�端牖콬菑ꝝ평洝");
    Test_SzThenUnSz_Check("㬈闄K宱轒썅莕쵪꟫", "࠮틇溷Ԡ", "", "橒醟몾毭區Ậ", 239260, 101504, 884609, 795806, "唒鎣", "龾㪒်䛱훗쉂㊥砾裡", "", "믲떦ꭖ", "�쓏`", "ꊺ儷򱩻⌓ꌰእ", 170614, "⬨꼤䟂ڢ", "䮒换쬚コⴞ䅂᫢痜颷", "㽷硔洬ꢯ諉癃׬⩤");
    Test_SzThenUnSz_Check("ẓߖ鎱ᱹ뾹", "凭", "ﷹꨑ෸輠蚸쯖⊵䀰Ⱈ邋", "", 426864, 94343, 938054, 43556, "ꌢ", "ᜆ鞾嫻⛶", "ꎶ׭甴", "ꚨ㏨嘁﷕貾瀍叶┛", "邉젝皎먳쩩邵", "눅伇㪥ම�횒", 282021, "貈", "灢胴籃콜鈠渔敓䁬", "茗");
    Test_SzThenUnSz_Check("萇༖ⓚ塋娽꯹⼣狼", "", "侊䕺뢨攟廞墈Ჵ", "�ꊪൔ絬茓㏿᪽嗈䟓", 645330, 227230, 577856, 943658, "枝⸡Გ", "ぬㄍ歉뀙伜㙏槉㵭", "䵹隐ﶚ", "⨈", "", "靳镹츩", 877620, "㟜瑇穴↰", "阰涾爞", "땂⾾钳ཞ╃");
    Test_SzThenUnSz_Check("縍", "뺺씚ꯊ別둱妥ھ岬줏", "䲉Ẉ緡緀톕", "仁좀ꋍ䦔", 156490, 324307, 127763, 670203, "顸ꙣ甇냦愴麗", "Ⴃ锳嬶わ咊", "國姲�灱줓䑢낵䀔", "箤̏混뎶삄葺繣蓶", "", "ႛ㰁똣㚪蚊猆쇮㳴誹", 879210, "觟遱洃쳷", "购껎맂蜂㨉䥨", "匎藟轫⭏◿쳵ꐇ᳗쓓");
    Test_SzThenUnSz_Check("䈞Ә泌ྀ⽟ꤏ", "쥀氹狦홉", "쌬㣓蕏⛊䷀", "߻蜢䇻⦰퀊ꂝ隧晅", 515832, 925308, 795563, 816158, "臯�벬㬑", "彻턗ꙡⴉ䡡", "۝", "쁎䕸젶ݵⷁ劇剃悀", "勵", "怫讇律羫烧隈", 713596, "", "圇䴛䶿㽂⭘４㞦", "듹");
    Test_SzThenUnSz_Check("棭縴밍ᇃ稲�錢댇曹ﭒ", "エ鹨敳攝횛ၶ덨材", "Ⅹ", "낁", 162862, 320880, 249735, 798551, "∜壎᩹둖", "⍚䡷聽", "恛鈐铓足ኁ", "緅Ⴔ£⅟龧붙", "�", "䁍藽）䃙ᵍጧ램ꏊ", 441080, "硗ͦŨ嶸ᓘ寬�", "桸떝؃掸ᙩ訃҇퉇", "ﭥ覅᩿߹�埐섙");
    Test_SzThenUnSz_Check("", "爦኿娐", "覭ꐌ砷舋楖뎒뻎롐㑳", "", 721834, 411038, 293189, 98679, "ꩢ㱻", "ὐ⼶풙忮╄렎슞", "㣡ಞἼ㠒῟゗㝏", "騚닍⻗敞Ẑ", "ඎ汶㓃뼑Ȫ䀖滉䩺栭", "戊鏸", 394525, "⏛氙삲쿊蒽띝", "⛜", "怸룜淗䪅痊蒿謮丝");
    Test_SzThenUnSz_Check("꬧밼콎葒蘪", "匳ᑪ骨侹浨꩛댷쓲儎", "胖椝꾍Ḵ铁讫죐ﯞࢹ", "악뎷諡悖፻竛弣", 403395, 979369, 760456, 607929, "મ", "滜ỗ쬇", "", "⑩", "䧏㘎밇姳詰я", "롇ꉂ톤䇇箔ᒮ", 984078, "湠ꋕ备", "뢄", "䌴⁤蘫");
    Test_SzThenUnSz_Check("ꌇ뢍", "䯴庛", "둶�䟽첮䲹ǵ", "", 728608, 784840, 808103, 675474, "括쿭⫮㯷", "ʉ檔�ಔė칊䡡齌", "칊滘ⓤ龌聠�핿ꗺ", "", "῍좺", "", 552859, "桜Ⱀ嫏", "誅抍嘺置㎎讚", "掬㼡셞ɡ緮");
    Test_SzThenUnSz_Check("冩捑짵⊁嗩줌㶓", "뗴눭硫옴巋", "�뉼飠ꕻ屭혬䙯", "㧟", 962217, 662079, 264145, 564036, "罊穷集삩ሏ嘛", "륩Ⴔس", "㠻덾̘꺚裇偄埓段簗鸣", "鷢볡", "쟳�䈏姆谠", "簯⬨핁驵荳", 727915, "ớ䣮筈ꢟ죳ᤌ", "羔", "㑠踩�潻");
    Test_SzThenUnSz_Check("Ⱒ貭", "�席", "釽톸胻槖", "", 188465, 266885, 44768, 818833, "ꮪ㽰欝├挵卾頱쬯捔", "を诩㤟㺬폐ꤪ", "⽕믵㩗�猠", "憅㩭㩏", "�쑡䲞㪘䳗邳㊡혱", "앵樂伕䨩ট", 68311, "畍屄帪醸貹", "濪尠兲", "鐈䲧");
    Test_SzThenUnSz_Check("䴎蝋⣠؄闄郩혂敦骗", "樘⻠쮯옘迂⣜", "뿷", "뜤腸폍㭆ꇙ", 851679, 780677, 498089, 12403, "﹉쬫熶抄�濛㷵௄", "퍭奲", "④嶆ꗔ㥤", "ଛ鲮", "䲳虜䤅�厱쵺䊇", "냀躧桽⽵蓤짼㡎", 757258, "늑ŭ⯈ᤱ", "䢵뫌龔꒐匬吇閊ꁑଢ଼", "㵐䣲䬐⼆㸠勮");
    Test_SzThenUnSz_Check("譋໿ख़﹍ᢈ뙔", "膊쑙汁�笳戝坴讷좌ᶣ", "뻌厯ḯ䍋䧾ᬑ", "", 722202, 217703, 731732, 603712, "⫙ꠉ嬢", "퀤掇「뫠ዩᔲ䩣", "鳔덍", "零ퟟ鸘", "�邬", "燐䵮요位跢⟌", 613072, "毄俕涌", "", "想녔ꖜﰽ䐣댞蘩䤣鸁");
    Test_SzThenUnSz_Check("㭇蠬䏐⛐", "ヲ濨", "", "俽㧋꿒澪", 524246, 519012, 477030, 309819, "秵�Ꜽｕ师", "놵", "", "ٺ庹鵑൝笷Ⲫꌢᏻ", "Ĩ鏮ﶛ䜤ⱔ芕૽", "꺋羒珧䟄◚", 828534, "詖嬉規⠣吃", "쫼䏼с靰⺍ᑥ僦", "理훑師䁉");
    Test_SzThenUnSz_Check("橋띶햷ꑧᆰ黱", "駣㓻頑", "샔䁡ᛶ↣汳숄", "鴬런폮Ꮓᛀ쮔", 407789, 727837, 579573, 203240, "⫦葮葺鱁", "Þ�⊰塶롞", "Ꟊ�笋", "읢㛂쩀俑嬗﹒問ꍟ", "㠑ﮠ", "璪ᓽ岪", 166677, "廒", "㰰풵႑鐩", "ￌ㖊㑋�䐩籚늚");
    Test_SzThenUnSz_Check("ݢ䝅璫땵", "虾瀑翧楰⻏쌋", "˝", "㦽⛗뇕拜焯㹬", 689874, 119954, 149221, 751270, "䠅褕齡ཉ冀㏠", "㳌כּ抆裯", "坦ㅧ禒핾扐ꬷ", "銟彁ᗁ迻臧", "飴㊡覅䌊ꑒ䔡蚂博먚", "㿇뉠៸뉐ﶷ腫疭뺓", 682721, "浬᯳蜕", "³슼ꂮപ봅룿⋊", "㉿崱࿏ꈢࢹ팀鋄");
    Test_SzThenUnSz_Check("៙ꕶ禞焰鉾뭙蠸ꥁ┷", "툳헆", "濢긑", "", 862756, 263550, 290189, 577628, "䍻虑ᅶᕳ찔ፉ媛䣅犞ಋ", "荦Ῠ袗䧱�ᚁ朝㌑", "弍ﶣ씮ಜ倹첥", "啒秦㍺彞㝏兑작⁆鲇ຫ", "귦Ᾱ彉ࡆ챞맄", "⑛㉮Ѵ펗厫圲獕鎑䖻", 680720, "㗾릨ꊀ", "ḛ潐卉⪙⪬㠬", "仐");
    Test_SzThenUnSz_Check("▓", "㽯䨿ꄊ椟羅꼁偈", "ሗ쩠⡷ꀽ᪴", "騬讽�", 380234, 953047, 462559, 156913, "ᯢ", "卄쨛", "�", "", "댌滗ီ㰶醘", "�⫓䷜ᚷ悮", 655271, "歖㘾꒴첯傳嚜", "�ԑꡳ곈ी鬻", "㥴萙䌣ゐម⽫晎쐑");
    Test_SzThenUnSz_Check("記ו멯鮰䆶", "㮧쮱㝆", "◆䄅䫪晪ຖ", "潅ᔎ膼", 902739, 892890, 536797, 858139, "䎻㼣", "뇵풮", "玛迺뤕눉﩮ࣛ", "蘷쫷씉縔桳䮽랒", "簔�こ�珺ᐯ", "", 461282, "쫷泏�", "㈩螧㫂ް孾樟꣋", "‴Ǳ಄㩴巛휚ޓ");
  }
  
  bool unitTestResults_TmMap_RowSerialization = runAsync(Tests_RegisterAll_TmMap_RowSerialization);
}
#endif