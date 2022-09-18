#if UNIT_TEST
namespace Test_SkinIndex {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_SkinIndex_CommonTesting() {
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
  
  bool unitTestResults_SkinIndex_CommonTesting = runAsync(Tests_RegisterAll_SkinIndex_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_SkinIndex_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_SkinIndex', UnitTest_ToJsonFromJson_SkinIndex);
  }
  
  bool Test_ToJsonFromJson_Check(const SkinSpec@[] &in skins) {
    SkinIndex@ tmp = SkinIndex(skins);
    assert(tmp == SkinIndex(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_SkinIndex() {
    Test_ToJsonFromJson_Check({});
    Test_ToJsonFromJson_Check({SkinSpec("䚏꼸䃧쁐", false, {TextureUrlPair("堉⍴ᲊ̇॑䎞ꦻ땬", "ｓ"), TextureUrlPair("䢕颒饣", "救솳棈"), TextureUrlPair("ᲁ澯", "䳟框雱燐꬝,汯粌鉅᜘")}), SkinSpec("ແꠂ", true, {TextureUrlPair("ᮔ", "ᱶ谛䆳ꔼ躜ಙ㟊罐㳋뽄")})});
    Test_ToJsonFromJson_Check({SkinSpec("ꬨ", true, {TextureUrlPair("눪꽏뛧䁖ؐ杒୒", "븯剬鯫ﾪ঒ﵴ뙕")}), SkinSpec("ᮃ놜冺햵ᤫ簔�", false, {TextureUrlPair("兡", "畏⹬响憴பꋣ"), TextureUrlPair("䍕᫃ᔼꊛ", "딢셐鐨⛦屻㚡딽")})});
    Test_ToJsonFromJson_Check({SkinSpec("Ὄ㜣", false, {TextureUrlPair("蠑坖", "ڑ쀈ⵗ")}), SkinSpec("窐踎윉懜翊신꨻በ", true, {TextureUrlPair("", "㷦⏓箝썷ꧮ搢"), TextureUrlPair("恦鬋鍡轔援�ꧾ", "죤箖质ᣙ"), TextureUrlPair("든Ηꨘ躀", "ⷾ뮁d"), TextureUrlPair("鹥灦㣋충왦굸褢", "ꔴ㳇")}), SkinSpec("놪☼앇炄㐕畍鞙栥", false, {TextureUrlPair("䔜", "鿊坯켫ꗥ쟭"), TextureUrlPair("⨗萃쎉뮏", "⻖蚇"), TextureUrlPair("ᒽ罆", "ᩁ㟅")}), SkinSpec("ᵒ㪗羘렷뵫", false, {TextureUrlPair("ྈ佛ͽ텫ᤊ", "")})});
    Test_ToJsonFromJson_Check({SkinSpec("쭋胋젮Ⱑ", false, {TextureUrlPair("䊘睈宥목簡॰ഀ", "Ѯꤘ"), TextureUrlPair("鴧灩༕ﭕ", "㶴٨"), TextureUrlPair("", "롥峡"), TextureUrlPair("퐞也툃", "쟬ﱩ媡요쉒▹ﯖ號㪳")}), SkinSpec("", true, {TextureUrlPair("쬂뾟ૢ랶侥荽꜐", "ᷙ㧖齢鬰㖦ӵ"), TextureUrlPair("蓼﫤䄉ꆢ귐쩱柝", ""), TextureUrlPair("ᴝ삱鄎吐�Ͼ斐임", "招곢贕没")}), SkinSpec("ំ䏯ཞꑓ뷾�뤴焦", false, {TextureUrlPair("೻壎ⴍ�萋笩萐", "娎뉺ꢗ軤衜㝪삾"), TextureUrlPair("簈", "茻")})});
    Test_ToJsonFromJson_Check({SkinSpec("瑏求뺝숯䐪䈞䞞䜋歹☰", true, {TextureUrlPair("▝ħ蔋팪絠촊枤ŀ", "穏뫤࡙攴쑋㵗髍澇"), TextureUrlPair("㖩ꅽ딚圤쯼벮蜵来৷", "؏")}), SkinSpec("갯䘞턜㧷わ銂⧼", true, {TextureUrlPair("恮뺪髷漻拹", "ꢶ嗲聅䄳ㆳ尉"), TextureUrlPair("겶຾", "淪熷颤짒傉峩ᯕᔺ")})});
    Test_ToJsonFromJson_Check({SkinSpec("첕풠躹伲킬簱", true, {TextureUrlPair("璖姂淓", "馵ᆪ鱹"), TextureUrlPair("⨱", "ꐒ魋䭅Ⅸ佰"), TextureUrlPair("俷큥ꄓ", "ꪒ飗✧캵")}), SkinSpec("魣䐵뒠빖", false, {TextureUrlPair("믙㬢娵ⵌ⫿鰰⇹숄", "ᡰ"), TextureUrlPair("ꐊἸ᜸萿ᑈ㺋Ɏ", "ṧᬔ"), TextureUrlPair("馒扁⫦㿕롔蜡い驾", "矮冠"), TextureUrlPair("횊", "땓꟭뗏聲")})});
    Test_ToJsonFromJson_Check({SkinSpec("ʢᖀ㨎乕紇答㺳萵ꊕ", false, {TextureUrlPair("授䎫쉑ᢰ靡ﮃ", "")})});
    Test_ToJsonFromJson_Check({SkinSpec("㉹值ᶀ䍾㎦", true, {TextureUrlPair("䲈㌒皬毸圌蒵⢢", "圀詓鐋䎶뵆扈僿䞚")}), SkinSpec("", false, {TextureUrlPair("ỗᯁ蚧쯕胫鍼륭朰ᆿ", "銼௒"), TextureUrlPair("쪿淬ฏ垄塍嵓", "藃 ⏎늻텿錈솢�䰃䁓"), TextureUrlPair("濍γ", "ࣔ潛픔綽傍ᙏ")}), SkinSpec("胛๫", false, {TextureUrlPair("됶豦偮縼矢遲੿ᥫ虝", "䨕")})});
    Test_ToJsonFromJson_Check({SkinSpec("챆妙薐㨵", true, {TextureUrlPair("爑䬼덃", "ꦼ�୹౺삯Ϩ죂"), TextureUrlPair("잒淮듑箩厈䃐᲎", "耕굗ご䎽붏矓暴")})});
    Test_ToJsonFromJson_Check({SkinSpec("", true, {TextureUrlPair("", "䞿皆Ꮳ煭휶")}), SkinSpec("⯉肱箉礠덡蟞躎㊭亂", true, {TextureUrlPair("틼潨ⶌ", "꬯ᑯ鶠褒ó퓓驏陽")}), SkinSpec("至쐱ྟ찕崾흨", true, {TextureUrlPair("䈣ঈ", "䮖㔚䃪"), TextureUrlPair("", "믂⥖㈠୅샛Ꝩ騫㡪ῥ舙")}), SkinSpec("˶鵺ﯶᲑ篥ɿ읒럕࠘", false, {TextureUrlPair("䯊ךּ垊욊톲ޅ", "ᭊ初"), TextureUrlPair("誉穞煮㋬", ""), TextureUrlPair("᥵ۚ籲ݏ쁒⨮덢榚樤", "畧‚ᓒ潰Ⳉペ蛛")})});
    Test_ToJsonFromJson_Check({SkinSpec("㼅ရ練℆", true, {TextureUrlPair("", "詓"), TextureUrlPair("䔂旓彥㖹尰鵟", "")}), SkinSpec("얳礞䛜꜠㋆윊", true, {TextureUrlPair("", ""), TextureUrlPair("徺〶力෎턒柬઒", "")}), SkinSpec("▘녝裂ꦍꜚ䪗⇹瓒䬓", false, {TextureUrlPair("ꌋ뀀ᵧ塻", "爒"), TextureUrlPair("亦釪挨⎈汼듿쩷", "鮕"), TextureUrlPair("", "蛻紻ꕣ䞦〱긄⏽"), TextureUrlPair("㽇䙃珍㉡", "")})});
    Test_ToJsonFromJson_Check({SkinSpec("꺼乧홻", false, {TextureUrlPair("嚐ꇵ个豭῝ｕ룥끵", "⬫꽎铖†㥯吨鄣㇦")}), SkinSpec("怢팃쪶蒌惴礰", true, {TextureUrlPair("犄ⱷ蕴", ""), TextureUrlPair("ᠣᨲ瀔", "蛅䬈"), TextureUrlPair("ᾚ촑ꍏﾌ錁", "瘻嶰幃녽ꗴ⩕㑯虲")}), SkinSpec("䕲璷瘑ᩰ넑쨧ᆔ耵攰圾", true, {TextureUrlPair("藒ꕦ䝵龌ͨﯨ撦ꥯ얩", "탱ⶽន")}), SkinSpec("ⲷ窕ꄧ迴锃�ꚴ램", false, {TextureUrlPair("䫁ꆑ榻", "퀡ପ厐䗌"), TextureUrlPair("�㚳쯕獎ﱴ", "�ꁙ〇踃쐑")})});
    Test_ToJsonFromJson_Check({SkinSpec("웖륞㍃솞थに٧Ⅲꂐ", true, {TextureUrlPair("폺뮾眲餻Ჩ栬飒홟", "뱏熫鏵밃碻ᶁ"), TextureUrlPair("励돠", "埈핹")}), SkinSpec("篦䙸䜋�셨鴈濙뾬䰦ⷅ", true, {TextureUrlPair("⧚ᕱ㇦ᘄ躙", "우梨杯ꤎ邡㤩顽䤎"), TextureUrlPair("伜㉜ؤ�", "腬킰"), TextureUrlPair("첓嬅쭸尊䉸䅐", "璧頒⹜遛㔧ꡜ㵷")}), SkinSpec("塀䜷ꄀ罫⺪恎ȟ㰧", false, {TextureUrlPair("끜", "瀨"), TextureUrlPair("琜䰶", ""), TextureUrlPair("Ⱕ⤑ﻂ殩", "୊䥌")})});
    Test_ToJsonFromJson_Check({SkinSpec("荤佀ഇ礲", true, {TextureUrlPair("훟�ද퐅쾾䂆䇩馴", "쏭�ꢁ�榓"), TextureUrlPair("ྸ쁝ᴱ퐴跙�岚ㆋ⢳", "태�별Ἰ絽ㄆ"), TextureUrlPair("樐툕翂斜⭝", "")}), SkinSpec("ဠ☊", true, {TextureUrlPair("ᶜ㮉嵥ꨜ鹬", ""), TextureUrlPair("臠㾼ూ莚箌䄇䱱팝⑄", "叫�鍺ঽ瑧燽ຢ"), TextureUrlPair("鍀㇕蟃෵㥔̳姇", "ᔼ燤⟐䶢⍈놋勊︈"), TextureUrlPair("毆", "矨蒷⫥ꚨ")}), SkinSpec("㥄縄썗겼ႝ엃븸⦽擱", false, {TextureUrlPair("쀞઎썬ㄙ癱뎫횏", "䋘Ը"), TextureUrlPair("果", ""), TextureUrlPair("뺔툰氃Ꮸ㐐혆한", "̍뫯꪿䒼큝耷넲㴝"), TextureUrlPair("ꨞ﷨뺛穿濶蝆쌥㬺ᬥ", "೻偉㝙倎卌硚鮳裴")}), SkinSpec("⅍", true, {TextureUrlPair("푮멠≽⣙옔", "쮷몄껱詞磥벹靆"), TextureUrlPair("꜖ਤ翉ᑲ䧪", "茹庱釚왗")})});
    Test_ToJsonFromJson_Check({SkinSpec("", true, {TextureUrlPair("蜷輶男", "颓ヂ"), TextureUrlPair("୑", "ᆰ뜬٬"), TextureUrlPair("漊쎽怴闛ꈘᵮ�", "溨콕ʔ镸〿ᭆ䅲砮˻ꇟ")}), SkinSpec("ꕠ�", false, {TextureUrlPair("숽쉳蔼蹥揪₃뒣筗", "祝ꠋ��"), TextureUrlPair("玓ꔊ줮㿮ᚶ", "豺埞赱�暜窋ᖪ࡝ἇ༽"), TextureUrlPair("縏맄ḅ♁뚌ⶣޯﮦ컻㴃", "堩"), TextureUrlPair("䅦䒵춣閠쯨목楥", "쏁ŵ㣈Ꞑ")}), SkinSpec("ḡ핝쯜䨶堂", false, {TextureUrlPair("牢஬麋�縣䉁ꨆ", "ⲱꢊ")}), SkinSpec("쏯籰䫢틟ẚꙝῷ筅", true, {TextureUrlPair("㿥ᢧ맦䎀", "锖疊索"), TextureUrlPair("趰ꑘ嗀嬺", "쭗緞쐼ჲ쥟"), TextureUrlPair("᫝", "灙䒷�ﵺ䵴㫨὇")})});
    Test_ToJsonFromJson_Check({SkinSpec("ᘐ₞", false, {TextureUrlPair("콫Ⴗ鲧핀⬅ꞗ㭤諾", "瑢탫")}), SkinSpec("೼됗돎ꍞᆎ쨋", false, {TextureUrlPair("㸁橏퉒⑧", "㌒줃鼏၌戙"), TextureUrlPair("蕢ᆟ䭼䐘췱䬊礫", "휄")})});
    Test_ToJsonFromJson_Check({SkinSpec("鄴쑬뻞侔", false, {TextureUrlPair("趓ꃧ朊⼵ﶾ", "ꇽᶅ쟂"), TextureUrlPair("딙", "ᘘס겫햳㭇⽛ᶶ"), TextureUrlPair("섐裔힑Ӄ", "䓑�秊嚖愴讲댮"), TextureUrlPair("딟榗轾᥊鎓", "䩢")}), SkinSpec("", false, {TextureUrlPair("呃龡웞Ꜳ噅䪂ᄞ", "坺")}), SkinSpec("놬׺ㅯ껶祓䲛虋", true, {TextureUrlPair("뻾婣⦯撥鵁ﮁ迁溺", "ꪓ䲽ⰻ㒥ӝ�⁸�")}), SkinSpec("▱缜圆䐰", true, {TextureUrlPair("（쇱묜դ旱嗙鸙", "鸚圲枴Іﰹ奡Ṵሗ"), TextureUrlPair("唾滯룮욏䩘꫕", "疂纑긶"), TextureUrlPair("관쫣娪颥驗䂨Ɱ✬맺", "滛窖ꀰ又ꉂ节瓞맜"), TextureUrlPair("锑敦暒쇠", "柚촵")})});
    Test_ToJsonFromJson_Check({SkinSpec("뤃㠛꿭㒀Õ툙복䠄ᣊ", false, {TextureUrlPair("敃뾦᫳ꟍ᳣쐴ᵙ쩟", "")})});
    Test_ToJsonFromJson_Check({SkinSpec("", true, {TextureUrlPair("艸휹塭", "蕍鴨䒯䫙"), TextureUrlPair("⩜頿邬", "䰧욘")})});
    Test_ToJsonFromJson_Check({SkinSpec("⬀", false, {TextureUrlPair("�嘇ಝർ綾屇貉聯⥋숟", "਍罹᝟��즬雲硒")}), SkinSpec("`", true, {TextureUrlPair("⇀", "谍䋻")}), SkinSpec("砼밀", true, {TextureUrlPair("", "⡆"), TextureUrlPair("廬깺Ｌ䀞졡焎耥이ת垘", "¦")}), SkinSpec("썃�㢥搩릟", false, {TextureUrlPair("ᒐ仭络緄덯ꙛ骦", "䱇ﺘ徳䉰잱뒠菱"), TextureUrlPair("䪴�부羃࣯ࠨ龁氌", ""), TextureUrlPair("柘", "卣끒灛揩�譃嬨备ƨ"), TextureUrlPair("陆濲縈뭨琏⭁玎㟰", "觇ﵓ䋯섺㟷")})});
    Test_ToJsonFromJson_Check({SkinSpec("瘸鍶똿ʥ䦐㺇櫷", false, {TextureUrlPair("膺", "略铃롒匴"), TextureUrlPair("琎鱡튃ඌᘅǆ칁", "睯੄莄")})});
    Test_ToJsonFromJson_Check({SkinSpec("蜎", true, {})});
    Test_ToJsonFromJson_Check({SkinSpec("䑹뷢憵㱦궞粝쟏㮽", true, {TextureUrlPair("䌹，㬿뜪ն", ""), TextureUrlPair("緌", "맏뚢"), TextureUrlPair("蟖溚荠ݲ₶᰸鍠", "쨶翼")}), SkinSpec("뿱춟쨗퍑짏虲棖჻", true, {TextureUrlPair("埏⡓桾ޜᨥ췲ꢗ", "ᜋѥ")}), SkinSpec("腎罈퀮鐘㬸", true, {TextureUrlPair("뭷ݏ괎崵", "��")})});
    Test_ToJsonFromJson_Check({SkinSpec("顿", false, {TextureUrlPair("䇫浹玒㠜", "ؐ랓嚸繂�")}), SkinSpec("옴鬸蝸꺲ѱ", true, {TextureUrlPair("㒛漏좇뀠혦璊闛", "혘䂹"), TextureUrlPair("", "鮱ξ脏ࣾ怩뒇殸"), TextureUrlPair("䦞㲗贂셫䚿麎", "滉⊪壭㛁縜"), TextureUrlPair("︕譋햙", "")})});
    Test_ToJsonFromJson_Check({SkinSpec("焥爅覑慼萗냞", false, {TextureUrlPair("ꂔɦ჊៚곦", "䥹�ᗸ뮒綳忪豘虝"), TextureUrlPair("᲍冚刻鯀ᛷ䘉", ""), TextureUrlPair("ㆂ", "⊳巵"), TextureUrlPair("瀍䞳뎡擥ゲ貼輱껼㓨", "ᐤ")}), SkinSpec("䏿͑遒੆奯᥺", false, {TextureUrlPair("", "瘁펑")}), SkinSpec("콝䎶＠", false, {TextureUrlPair("䈴哿灥", "鯝铞"), TextureUrlPair("畂ꈼꡑᩭそ夊졐", "탯⦔嫮땹搿鿄鄮")})});
    Test_ToJsonFromJson_Check({SkinSpec("槵롤㎓荮൑邿峑", false, {TextureUrlPair("郡Ⲭꅻ念", "ᾝ퐻㪧�㼠布뷵")})});
    Test_ToJsonFromJson_Check({SkinSpec("�仗Ý罶ﮒࡨ", false, {TextureUrlPair("浦姰頙", "푐鲚륩⯴�觰"), TextureUrlPair("�", "뜴ꂀ刺Ὦ餚샘טּ�ጔ剼"), TextureUrlPair("ᄀᓍ雏댇ꭞ㇋갗畴삃", "ᩞ굵ߤ杖Ա䉘")}), SkinSpec("䐍", true, {TextureUrlPair("Ꮩ谝", "扁䨛"), TextureUrlPair("徐碹", "甉"), TextureUrlPair("�ᄌ詨俫럷ሇ穗", ""), TextureUrlPair("⠞䓪⊷傠䶏", "ᓴ")})});
    Test_ToJsonFromJson_Check({SkinSpec("፯駨ꃖ섷曙呸", false, {TextureUrlPair("寐徘ꡞ륡ﬔἏ濒㛖ꨚ", "ụ쳹牪轴㎅"), TextureUrlPair("띥탍餤䂒䥢㦕�룝紜攁", "뉧樂穢�㆝䗆"), TextureUrlPair("኱", "찋뉜齚岯ᵞ")}), SkinSpec("餳䀏싑", true, {TextureUrlPair("䦘", "敌"), TextureUrlPair("柟饤禅㒕⑅횿", "㠱ዌ몖馻뛉␶ᔎ䆼")}), SkinSpec("衕馢攈䑹፫", true, {TextureUrlPair("", "퇴鰝띔Ի屧"), TextureUrlPair("렃꿭뫸팟", "䦅Ｏ"), TextureUrlPair("ᧆ㾆", "쌃ꎍỖ"), TextureUrlPair("줾땱ꗞ⍭聓埝詬ꯦ䁓", "햫뽁㠶퀆곰㬿誝楖ﴇ燛")}), SkinSpec("徊멟褠豛ꡗȘ", true, {TextureUrlPair("ㆋ꾅", "픟ꯕ䍹葹ꗿ鶀")})});
    Test_ToJsonFromJson_Check({SkinSpec("ć", false, {TextureUrlPair("哢遱뀧쫵驂⢺씻", "⡽"), TextureUrlPair("趷썎賰ᣨ潉ᒋ瞈ﭤ", ""), TextureUrlPair("赙", "ᗢ葫㠵䯾䀲")}), SkinSpec("紈壖祮ΰ", false, {TextureUrlPair("矓颀闋啪℘⬊郅筹", "➔뭼")}), SkinSpec("因⯬﹍圕", false, {TextureUrlPair("꒳ၳ甘ꞻ잛촵㹾⩽", "恵✮ᵑꠅ䮇跇�刂ᠰ"), TextureUrlPair("", "鏇쾮�Ⴑ")})});
    Test_ToJsonFromJson_Check({SkinSpec("꿔卖ⱺ蚰", false, {TextureUrlPair("꽸ꠃ몘ꨤ漈⟽甎", "↼㣊ⲟ"), TextureUrlPair("䦡醮뢺㩀럟", "㲵")})});
    Test_ToJsonFromJson_Check({SkinSpec("", true, {TextureUrlPair("◗ન튘㕧෨櫕毭�", ""), TextureUrlPair("㗃춯様%౜", "寙臓ힳ蘏"), TextureUrlPair("佯瀇ఽ⃕紼", "夽쨸싩"), TextureUrlPair("娡㐵迉龰ໞ彈", "쒜")}), SkinSpec("彌ᆚ", false, {TextureUrlPair("俇", "搮푾ݐ鸣䤵粛⣩숤"), TextureUrlPair("첳磛Ⱙ虑绹瀶", ""), TextureUrlPair("冗⒀ㆹ뗌啰ᏻ", "呻"), TextureUrlPair("竱�䫪�̈́䑽ᴣ⣉茱", "阓尹斔穛")}), SkinSpec("∘Ꙙ獰ட韶怘�", true, {TextureUrlPair("₈⇕㢨蜯焢ꃺ艣钦匲", "ர橭쥘硻⌬"), TextureUrlPair("盀䫆櫊뜩", "䂽秃杗ゲ轄뚁餤ꟗ")})});
    Test_ToJsonFromJson_Check({SkinSpec("�솩？蠱�", false, {TextureUrlPair("뉩鐴㔁慱닍�鯵蹝贘긱", ""), TextureUrlPair("窌멣⣒", "䣄駜ȩ�꫓먪늏呓蟎")}), SkinSpec("困섢ṡ㚾繨飳那錮拭", false, {TextureUrlPair("稥ӣ䇖ꡜ聙", "Ꞌ韒€਎"), TextureUrlPair("VΕ殪", ""), TextureUrlPair("극뮧", "⚮첤眍쑗墏쪒")}), SkinSpec("펤", true, {TextureUrlPair("㬒顄ﬥ⥾㬘", "覫"), TextureUrlPair("ᄩ抐鬰㒪匒נּ鍟籌", "诗筁⺙⏼뻷殭智"), TextureUrlPair("빹ᩚ襨竣", ""), TextureUrlPair("꽴ఞ", "煯弡ꁨ�摒")})});
    Test_ToJsonFromJson_Check({SkinSpec("篤꓃穴潃熕", false, {TextureUrlPair("摚턙", ""), TextureUrlPair("弟ⓡꈾ⠂芰簚敯ꝣᵡ", "")})});
    Test_ToJsonFromJson_Check({SkinSpec("㉨☉鴉", false, {TextureUrlPair("䬖㊝⾑賲", "⾱䈂ၜ⚹몢街ぎ혧"), TextureUrlPair("瑿", "Ꭴⲽ혎崡芋ꃉ")}), SkinSpec("찐듗䟱彂皥㦉᠇扚", true, {TextureUrlPair("ႎ많㸈켴鼜", ""), TextureUrlPair("쎶錳롤㠷", "ጌ猅飪햘퓯Ἐ後")}), SkinSpec("઩㘚೮�泌偣씻⒴ᯕ࿜", true, {TextureUrlPair("玺紽集", "檦ⳳೖ횊㋓쿍ꌹ阝")})});
    Test_ToJsonFromJson_Check({SkinSpec("", true, {TextureUrlPair("䞈젫", "褆⊢旫㴥"), TextureUrlPair("䌢䳮톶蒋㟶䍁ᾏ", "ᖖ箿錴셝伔"), TextureUrlPair("졏茘搳㪊", ""), TextureUrlPair("ﺲ洸遛茹", "ǯ謃鲀䯣魒㐄⋡ﳴ")}), SkinSpec("焪죝⦑떯", false, {TextureUrlPair("຀귢", "艾晊㎨减灌葳"), TextureUrlPair("쏢컡梐", "ẓ₨䕮"), TextureUrlPair("ꖏँ꺣拉莿憟㏇ꐟ彶", "ꉎĸ"), TextureUrlPair("琣뼛閦魨㠉䛭", "溴좕�⡕䏑㔆Э嫨")}), SkinSpec("", false, {TextureUrlPair("", "礥马Ȇᵿ"), TextureUrlPair("˯韜ギㅪ팕萌䍯", "榑ᮍ䊒真吘햾⣟嬊䁄")}), SkinSpec("", true, {TextureUrlPair("", "灛纕䒑俠⌴噂䘥")})});
    Test_ToJsonFromJson_Check({SkinSpec("旅逹䒩̳␷", false, {TextureUrlPair("硠", "")}), SkinSpec("ꛓㄎ말꼆凶ꟗꜮ", false, {TextureUrlPair("郶⹀漱", "᬴㻮빞汚�䟿ᰭ죨䯄"), TextureUrlPair("礋蓟矮䉳掼利⃍찀", "Ⅳൕ倡᩻贈"), TextureUrlPair("홗", "ユ"), TextureUrlPair("雌Ꚓ沁괎", "")}), SkinSpec("炖篼慔⦓䱰呺ꅁ⥎", false, {TextureUrlPair("", "∫"), TextureUrlPair("욂ﶪ궥檤", "ꅼ࿌룞댂�鄲杬"), TextureUrlPair("뇡䎜뽃⍩묩恤�ᦥ", "ꖄ泯⸃ỪО楬躤뇲휲")}), SkinSpec("獚嗞ድ몰ｴ镓焾蜶", true, {TextureUrlPair("㥄쌗Ლ㌒�쟽鸅", ""), TextureUrlPair("䝆軳ᛨ", "⚾紗")})});
    Test_ToJsonFromJson_Check({SkinSpec("䔌↼ﵡ⓸", true, {TextureUrlPair("蹘罇컵곂醝", "‧䌪帧㤲㔲"), TextureUrlPair("퇈፝૎쥝ﷁ俢噶�", "뽫됈쉳넸ꀈ"), TextureUrlPair("攰笔Ꙛ镺⪌�俷쇋ꤪ", "죦"), TextureUrlPair("卲", "僮")}), SkinSpec("⽹ﲜ쀊", true, {TextureUrlPair("쭞", "ᧉ㛹鬜亂ꦦ䚚琥렌쭻䶓")}), SkinSpec("揰乘䬁͐⳽ጪ볇㦦䇒뙴", false, {TextureUrlPair("럋㳳ﰏ唠搅⠡癮΄飄", "觑⠐龭卟჊ꕞ")}), SkinSpec("䪵", true, {TextureUrlPair("ꚢⱡ䊝", "ꉀᝳ琒颿ဤ"), TextureUrlPair("澐궸ꀠ뛍䜿緼", "瑬팾뻄ϙ쟼"), TextureUrlPair("", "鎸䀾郮ॷ챓᫈琬Ə")})});
    Test_ToJsonFromJson_Check({SkinSpec("┙ݢ짪튚㓭ᩀ髡", true, {TextureUrlPair("", "﹮꤯榨ᐋ")})});
    Test_ToJsonFromJson_Check({SkinSpec("隉㟆歞", true, {TextureUrlPair("㼓ᑉ", "浦桼熊ﺄ"), TextureUrlPair("䩃֨ླྀ㾭Ӻ慺갆軔", "�๒儀"), TextureUrlPair("꽍", "捨馕䠗Ꝼ�ﴨ")}), SkinSpec("⿽齸刣㼦蒖", false, {TextureUrlPair("꧔蓖㊥萖ֆ", "ꈚ퓊"), TextureUrlPair("ᣱ豳륚隰ᴆꦜ过ⱜ", "콊妔ᱸ㵘轚⢅ު凰"), TextureUrlPair("年狩墠댬氮䛪點업", "❷ꉙ୑૩撣☖᷋ൺ璂鞧"), TextureUrlPair("ਓ㨿�퍀ࢽ", "㑣섀䉭੠퍟ࢮ")}), SkinSpec("", false, {TextureUrlPair("ͭｳ燷௛䱓롃⬛徰⡠", "甖Ａ즰妐皡"), TextureUrlPair("磫", "ᓒ�눐ถ⇅홨襶")})});
    Test_ToJsonFromJson_Check({SkinSpec("찷業젌䉦ﾁ�輟䋥孢", true, {TextureUrlPair("ጻ", "ᦚ"), TextureUrlPair("쩉懋ﺌ췽欌", "뀸⬨޲佒픠氍"), TextureUrlPair("ย냬ꡕ榀⍢鎈�ﳛ", "⥜㔆᪾柢館쁊ꖧ"), TextureUrlPair("", "ގ츯궁☌ﰪ᭕")}), SkinSpec("ᓸ矽뺳䋎淔ᾮ喍", true, {TextureUrlPair("ቝꩊ〼ᓃ祘", "⬩揄蓅쑍╰ￓ˓"), TextureUrlPair("籠禔湱杖걐", "ᝊ"), TextureUrlPair("ᅾ՞鄼聿Ⱃꩽ෱嘁", "판櫼ၪ飃剤띫"), TextureUrlPair("䄲", "࠶㫏祥㢿᷽뤿⿤㣕逳")}), SkinSpec("", true, {TextureUrlPair("┭윳墊㙀ᇸᐺ얮", "᫋뤁�ｺ偢캒碭"), TextureUrlPair("둡犌ⶅ", "�"), TextureUrlPair("꒕", "⣶࣪敺ᵯ쉿׵곰퀀抐")}), SkinSpec("∰쯟ൻ✚晱逓ꂈ뙗", true, {TextureUrlPair("皪", "쩷ẻ"), TextureUrlPair("釦G몳῵췪࠾䏀麼", "ڻᬂ"), TextureUrlPair("黢㢙轝Ⲳ⍒ꑣ뛓", "髦ᦶː沂㖭")})});
    Test_ToJsonFromJson_Check({SkinSpec("蓟俻ꄑ喡ᨑ츰煴", true, {TextureUrlPair("䂎", "턊⼎쩫枺ﰐ긃")}), SkinSpec("嗔䘝蒦螼擼艉", true, {TextureUrlPair("⭶꿯െ벣짭", "앋꾯�훔敝䛢"), TextureUrlPair("坙ᣖã", "巣䅢渼�盏ꛫ쾀型"), TextureUrlPair("뤼厡윖뭯", "")}), SkinSpec("突", false, {TextureUrlPair("硔毬縥팺", "싖扴⺅戄")})});
  }
  
  bool unitTestResults_SkinIndex_ToFromJSONObject = runAsync(Tests_RegisterAll_SkinIndex_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_SkinIndex_Getters() {
    RegisterUnitTest('UnitTest_SkinIndex_Getters', UnitTest_SkinIndex_Getters);
  }
  
  bool Test_CheckProps_SkinIndex(const SkinSpec@[] &in skins) {
    SkinIndex@ tmp = SkinIndex(skins);
    assert(skins == tmp.skins, 'field skins');
    return true;
  }
  
  void UnitTest_SkinIndex_Getters() {
    Test_CheckProps_SkinIndex({});
    Test_CheckProps_SkinIndex({});
    Test_CheckProps_SkinIndex({SkinSpec("쟭⦀椖�", false, {TextureUrlPair("꟪뢖棱꡺鼀ൃ橗", "쿵ᒄ暭쑁㚷"), TextureUrlPair("湩ᣖ迦", "寔옛�ᠱ")})});
    Test_CheckProps_SkinIndex({SkinSpec("尚豈젮훇懓奲쮄⸔", false, {TextureUrlPair("㵹徲㼏", "拣䵱䌏�㯂ᓭ")}), SkinSpec("涮�뗗텓", true, {TextureUrlPair("㞪㷗᤾虝䰒ஷ", "듡鷰那춴庂ᄼ"), TextureUrlPair("⨸۫芁≲彲⏈먳�", "�拺윰蘆"), TextureUrlPair("覧﶑䙢꺰ꦞᩘ鳔", "枵ⴾ㬪●ꜛ귦翮漽똮")})});
    Test_CheckProps_SkinIndex({SkinSpec("裺撇", true, {TextureUrlPair("ឞ楚㔊夷", "鞆㤨ॽ"), TextureUrlPair("챳䫑", "﫛僓揱৊ℐ"), TextureUrlPair("ﺷ蹳姈⑻㤏�撵ߨ䯂", "뇎≌膅๴޷Მᑨ")}), SkinSpec("⅄⊫햷", true, {TextureUrlPair("�㻡", "퐫帧�")})});
    Test_CheckProps_SkinIndex({SkinSpec("䨗ও�휋", false, {TextureUrlPair("㒴퟽ᗦ㴟봨ￊￔ쥲兆", "崢ꊵ쐭"), TextureUrlPair("龲ꇗ⡔辅", "颦蚕蔟"), TextureUrlPair("К߄뽇㪢㸿ᓮ", "ソ⿈鄠짭㦟茍"), TextureUrlPair("䩦뽼퍑ꗸ鶧ㆌ", "ₙ묇森ⶍභࢆ")}), SkinSpec("ୣ筃痒胊", true, {TextureUrlPair("읝㆒刱❕騐헵�", "벷쨭욢璞�ᐡ"), TextureUrlPair("＠߇₹", "⏋릈"), TextureUrlPair("理癙⤊웪墒≜", "秉ⵑ᠟Ꮍ⁭")}), SkinSpec("阚⦈郶炼", false, {TextureUrlPair("枦", "䉶杻�죝ᝫ᥾鼾㮦窘ᤲ"), TextureUrlPair("䕂륦홰떌䱇盰쩑虿", "鐷痚ꄻ滇�ꒉ㳀䈾"), TextureUrlPair("㶑ꔘₜ齬聎雄攩澴", "뭱過ଚ㩕ၪ㩾껫墰"), TextureUrlPair("蝢", "弊䮷⃷")}), SkinSpec("", false, {TextureUrlPair("珐瀮㍿웦쭜䢝䃙", "䵙")})});
    Test_CheckProps_SkinIndex({SkinSpec("⁏㸸㓌࡯", false, {TextureUrlPair("⑼驏᩽嬨默䚥�糣㊊", "胣颡攤訞"), TextureUrlPair("齶褱炋�Ժ蕧枪ⳳ", "℺꣺췽㇋嘘泅돖"), TextureUrlPair("", "姺㼙"), TextureUrlPair("튜좎㜶錏齜圓涾⚬", "♤")}), SkinSpec("쪄", false, {TextureUrlPair("䕃", ""), TextureUrlPair("", "叅㭐ᩳ삝뵶鳱")}), SkinSpec("偙߿嚱ᇊᙷ펁", true, {TextureUrlPair("熃ᐳፎ䮐", "Ⲃ叼"), TextureUrlPair("񜋑⊳汧載ﵩ", "鮴퇭と獍칂"), TextureUrlPair("띨體륯", "ꋐﰸ⩱刞爆쁘攇뽿퉾")}), SkinSpec("쌽", false, {TextureUrlPair("㝒⒄색Ї쑅閜䈀疶", "횄俁鏟灭ᶳ")})});
    Test_CheckProps_SkinIndex({SkinSpec("פ", false, {TextureUrlPair("ﺆ跏㜤샱镧", "胖�䞈䚴鵁틖ꎀ�")})});
    Test_CheckProps_SkinIndex({SkinSpec("⼿겎緱뒏鋦ឱ釂䕳ﲢ", false, {TextureUrlPair("늽趽ማ", "켍Ⰼᜤ朠㹒稃")}), SkinSpec("�쁰ꢚﲆ䉳诲뺔", false, {TextureUrlPair("ﮜ镕㠇篘㹡휁ꅮ", "࣓렎䰩⮵⧿堫竎绒ㅠﻬ"), TextureUrlPair("", "詮柃ㄼ鲶헞")}), SkinSpec("똝줶嵠雵", true, {TextureUrlPair("", "䢝୙"), TextureUrlPair("ﶊ响⮷�쒢ﻖ쾁᳓", "圙枩紂鯴떩ℭ")}), SkinSpec("蕠俠", false, {TextureUrlPair("坊₰", "劃쿆蕻"), TextureUrlPair("ꩵ", "䱎쪓崉懮�㙇")})});
    Test_CheckProps_SkinIndex({SkinSpec("䮖揉筢㲸肅", false, {TextureUrlPair("ᡶ⛥杭貴溪", "⦥๤즿ㄨ穂")})});
    Test_CheckProps_SkinIndex({SkinSpec("拓㐺䗎稦⡠式", true, {TextureUrlPair("씼旝吾", ""), TextureUrlPair("掠욿", "捣嶟廌"), TextureUrlPair("䤙礎㋳숙෥즇졧娒㜽", "᏾쟰囍")}), SkinSpec("촨ﶗ峹ﵭ", true, {TextureUrlPair("䣝泵럷", "됤蓼㰡㣄咊"), TextureUrlPair("셝凐", "䅴헜㘴䉌")})});
    Test_CheckProps_SkinIndex({SkinSpec("뒱㵉ꙙꌗ枚", false, {TextureUrlPair("숢嗖ᘖ᮳➄䛳碸䀠열", "﯐ည쥙鎫籄艍큋詁"), TextureUrlPair("胼ᑝ쨀飞륍虋陱濣灈", "蛫龆뇘ậ莻ጺ"), TextureUrlPair("ꝶ擆⷗륶땣", "℈"), TextureUrlPair("�嚌솱挂ꁪ", "ᢦ폛⶯弸龭")}), SkinSpec("抭␹", true, {TextureUrlPair("", "剭ﺏ柙㕤쩢姽ἆ奨啈"), TextureUrlPair("㾥괶됼헽⇐춻", "앨⛳唏"), TextureUrlPair("阊额禱鍾齪床὏勐", "㐙㷀뵌慔駐윳陑镉⣀")}), SkinSpec("쌩䖐ⱝ侘", true, {TextureUrlPair("鴆䟎他�慺㗻", "躇탩뿛ၲႪ㣕"), TextureUrlPair("훿☸꤫睊�澎낭荸", "旻슽铟Ꙓ鐻ų⊺�ࠫ")})});
    Test_CheckProps_SkinIndex({SkinSpec("蹘ŷ뇉ᝁ", true, {TextureUrlPair("ᐅ�", "糗鿾돵傗䘠桌ậ≲"), TextureUrlPair("鬅为", "嗭밅괢"), TextureUrlPair("䟪", "塀豽"), TextureUrlPair("窸䃿ﲩ�脰矫蛼䚼炈䑚", "꠸텤㦺؟잫긬")})});
    Test_CheckProps_SkinIndex({SkinSpec("Ⱳ斓쪺⾉輖쀠", false, {TextureUrlPair("⊲ǫ礳惴", ""), TextureUrlPair("ĕ�뎿�ྊ", "ݹ話亢൓⾽"), TextureUrlPair("멫캿욀쿏靆", "罶㭹뱍᭲긞膐"), TextureUrlPair("嘁�Ȩ㘅驹劣灤", "ᖦ涹㵲�젽ઌ")})});
    Test_CheckProps_SkinIndex({SkinSpec("餌僸쐯", true, {TextureUrlPair("洂겿躂노闗", ""), TextureUrlPair("퇷慉炷軫锸뺢鰸ꆕ⺕", "⬟⬆餽ﭝﬂ冺惼ᆵ춳")})});
    Test_CheckProps_SkinIndex({SkinSpec("▦⼛傟ꕅ", true, {TextureUrlPair("", "಼떍魾Ꞃ譮缫穘覃"), TextureUrlPair("띎�琳廒ㇱ", "幚쓼ሩꡂ"), TextureUrlPair("騆�䂁ㅽ遦ﾅ偂忺", "锏▽ꇲ䱐敫뒦숾䚙剠ﺯ"), TextureUrlPair("턴䅕ℶ࠿", "票彣饽")}), SkinSpec("桅", false, {TextureUrlPair("̐Ⲯ䈭", "꜔䤩")})});
    Test_CheckProps_SkinIndex({SkinSpec("づ뮔죯뱿锄�ꦸ슇훃�", false, {TextureUrlPair("裘쾕䮝�દ咾釫", "ఽ슆")}), SkinSpec("ፂ�꿘腷頀׭", false, {TextureUrlPair("罫䵮웤", "菽䡐膅⫳㸷앉뤸퉡"), TextureUrlPair("녪꒻⼧闂Ꭴ詓燥킅", "괘᪄")}), SkinSpec("谓", true, {TextureUrlPair("퀒᯺싵뚔챔", "䎺訮⧏跰䃟삢〨"), TextureUrlPair("蟅襎鿎⌯醞ᢂ蜱姿잚", "튡᷿㒶欳ꗵ䍷㥴岊"), TextureUrlPair("⺺Ҩ蓟㪽軔靹姏ꎕ珳", "ꥒﮉ⣞Բᱳ磡栧"), TextureUrlPair("Ṑ蝫Ꮞ", "螈蘰⩉呢")}), SkinSpec("�", true, {TextureUrlPair("←ꠣ", "�᩺"), TextureUrlPair("쳃骺", "欬ጪ쥒"), TextureUrlPair("", "銇"), TextureUrlPair("Ự篢㖦槔", "滔㘎ᔳ땳쎢")})});
    Test_CheckProps_SkinIndex({SkinSpec("킦", true, {TextureUrlPair("碼恷", "줪"), TextureUrlPair("◰熇髾粁弆≷", "衴猱妞᧫垃배⒔ퟭ")})});
    Test_CheckProps_SkinIndex({SkinSpec("恶�", true, {TextureUrlPair("冴푻", "ꄶ"), TextureUrlPair("衪", "㕿�슌욵ｪ餤１렏⢈"), TextureUrlPair("胙貃画砎끸쁂刻", "힄팁牛붔଴㏧")}), SkinSpec("わ힢啽ᕇ쬇쀞镸ﶩ掜", false, {TextureUrlPair("�庁㻐쐱ꥵ썳羨", "␱ᄴꨛ"), TextureUrlPair("頓", "쥦촠㲢޵㟂⤚"), TextureUrlPair("혺댋弩蒬쬒", "㝩Ꞿ☵旌愦︱㹆㦌ꯊ"), TextureUrlPair("툛蚀ᇥဖ륒ਭ", "്쟵㖥蚭㔃")})});
    Test_CheckProps_SkinIndex({SkinSpec("귿蚙辞羡褡✸饎㩚", true, {TextureUrlPair("ꮅ螯ꢁ콧퀫", "丯᤯쁣"), TextureUrlPair("⸉⁭䥉腪壋", "櫬"), TextureUrlPair("犖檣䗜", "坐풗")}), SkinSpec("䡖딇␮弢㒴캹차", true, {TextureUrlPair("壂", "ⰻபY"), TextureUrlPair("콠距쥎洺툯", ""), TextureUrlPair("塸", "㯫榲⒦䂮뾟ᕫꕷ韭"), TextureUrlPair("蟋嵨㟠㕆蔎椑", "�졪")})});
    Test_CheckProps_SkinIndex({SkinSpec("Ж꾟눗", false, {TextureUrlPair("柳", "곰炤릻쨧፳�红"), TextureUrlPair("滐隌셑�ᜯ䜲횧", "몲쨉�똣럴"), TextureUrlPair("嚚휜㬉溸ѳ㣄", "碵뻽"), TextureUrlPair("", "㷨䓜诽舁楍㔓襥")}), SkinSpec("焤", true, {}), SkinSpec("ꭸせ泴볹䰝Ḍ", true, {TextureUrlPair("靍㱦ᇉ揄", "⭽뉔汅ᡀ⑹箜芘뱷"), TextureUrlPair("훴쐐纼腈༉惺", "偿紥ᩎ"), TextureUrlPair("ᗓ騵ꦎ", "敚ꊔ")}), SkinSpec("ꄀ䇿ʇ⽕鯪", false, {TextureUrlPair("㐕ᶺ쥬ⳝ뮯", "碻堷")})});
    Test_CheckProps_SkinIndex({SkinSpec("홂᫐퓙쌄噇ꏝ뙪쁂끕", true, {TextureUrlPair("솁᠃", "ϱ㊢콖�"), TextureUrlPair("㡙噬�䄀ੱ", "皚ᮎ씮䡨瞠ⶐᮌ翪ৢ촩"), TextureUrlPair("㖹鐶鉥蟎⅒", "킱봣쩰ᾑ笍ᐠꟊ")})});
    Test_CheckProps_SkinIndex({SkinSpec("︧ꖀ䦕黟", true, {TextureUrlPair("惱㱚", "懵�偣鍝帽䟚")}), SkinSpec("뤧옠䝳﷠伭긆䭆떞", true, {TextureUrlPair("䦵ﯔ۱ᔍ䲥␈䉁﬷", "⭓")})});
    Test_CheckProps_SkinIndex({SkinSpec("", true, {TextureUrlPair("⤎首", "猸湍깿䇆尟ႄ鄠"), TextureUrlPair("譛諉ମ鉤铠䶚똭", "豩ફ筌")}), SkinSpec("ꝃ尛", true, {TextureUrlPair("榮阯魐節�믜耿ᨈ蒁", "ਏ�勀"), TextureUrlPair("㙢벾㄄엲┄杮", "㙖"), TextureUrlPair("耭䢒墻ߊ⭔", "")})});
    Test_CheckProps_SkinIndex({SkinSpec("鶨�䖉몖⮂♝젠핼嶝", false, {TextureUrlPair("玼", "㷀ꯝ抻"), TextureUrlPair("⠆띠Ҵ偨륷왟跢뀳祐", "넕ꕿ䗲"), TextureUrlPair("", "眏妀켛Ḕꯀ䘀䌿뽣錫")}), SkinSpec("ⵔ쁘旨䏍", true, {TextureUrlPair("☉惝溙", "貦윎䍕墒歰댨洶햏﫟"), TextureUrlPair("⚇뵚ㄲꞨ欸龲旆͍", "᭩⥼ᶈꗏ噹嫔ꫲ솬뮟袢")}), SkinSpec("췮玙ަᗱ⸡┎旺", false, {TextureUrlPair("별໅ᷚﬂ꼻㹐", "娟聣쵑弶촒"), TextureUrlPair("⏮锫뙀", "鏺봡塌鿌蕎農ⓛ"), TextureUrlPair("ᝨ뭈턡乤媾", "摃咹ｘ븠쎧㏆"), TextureUrlPair("", "ｭ᷅ꊟꁸ")})});
    Test_CheckProps_SkinIndex({SkinSpec("ꁴ벘", false, {TextureUrlPair("浢ᣙ", "皎ⱬ坓㻜Ϛ㑞㇙朾")}), SkinSpec("ↅ퀎⒂޽癖蜦▒虄汝", false, {TextureUrlPair("旐ί愾ᔡ", "")})});
    Test_CheckProps_SkinIndex({SkinSpec("嬋첪哻粬掋㒂", false, {TextureUrlPair("ꎂ쬝၁딆ሕ烚옷", "䟥䂤㶆�╞諄ꟷꊑ⠉"), TextureUrlPair("", "ꜻᯜﬠℎ蘸"), TextureUrlPair("•㇓䖙叀긻⧞뚳", "꾈켽�芵"), TextureUrlPair("챜", "蕵ꀦ嶁䀬蹛鬏젮遧玷")}), SkinSpec("觛᮵瓚뮒豉䱫太誻", false, {TextureUrlPair("㤽婑䈅쯇鶯逐蘆", "�밪䇎藢窱"), TextureUrlPair("玢㲳踮ꑃ웍錻ഝ", "ퟷ점型噑灊鶢씧"), TextureUrlPair("�퐁쩊鄞꣩條괰", "亖䎜滺涸ⲩ墚")}), SkinSpec("㏏러鎬鎶术頢䀺", false, {TextureUrlPair("빽", "㉂噼傗쬄ヨꎣと蝗롗"), TextureUrlPair("�氁貓﾿꓾ʉ䳝黧얍", "牝݄ᡓ"), TextureUrlPair("ￚ⤏둢饒籗鈊踜", "ሁ頻፥挿ؔᮥ䐍")}), SkinSpec("㉆⭺쌵䫲鈅滓�ħ", true, {TextureUrlPair("픊잷啁䐦�嬞᳈뮋乃", ""), TextureUrlPair("젬몥蛴朲礵縿干", "畑�咞繜")})});
    Test_CheckProps_SkinIndex({SkinSpec("쏾ΐ⃽铘ꠅ", false, {TextureUrlPair("龺搛κ훡楃ꤢ㟽灀", "棫"), TextureUrlPair("궥鹖��ᵤ薝焷燀", "ͮ㪆⾽梋ጰ隅搰ꡱ")}), SkinSpec("尺㝁ࡍḀ�", false, {TextureUrlPair("ꅨ撠똝祳싄䉬벴쟀", "멚쭔鲤닐↕屩芧卥㉥"), TextureUrlPair("ዿꙺሃ蹬≩", "咇斁榇싰䞵"), TextureUrlPair("", ""), TextureUrlPair("쓰蠸皁", "峡䎁ᴄ⒴")}), SkinSpec("⡬唠↍❠摀兦", true, {TextureUrlPair("硃Ј㷒Ƈ㛻駛", "荅릃⃶㨀幺"), TextureUrlPair("넓ꈱ�ꀊಷࡑઙ", "㬾㼱艻㋌⳹갨㠸"), TextureUrlPair("䰼ጱ", "�璕橅"), TextureUrlPair("゚轋蛱弰뀿屑", "牾")}), SkinSpec("瓤��耎珎霑้悶", false, {TextureUrlPair("⊌헥⤒娸곓͟", "ꭹꙅ轄绰㻠ꢍ"), TextureUrlPair("瓞㼆", "湖"), TextureUrlPair("寮稣", "骡ퟟਖ਼䞯ኡ趚謘뛟㰜"), TextureUrlPair("ӑ暼େﻍ芬ᠶ墆㖤", "郘�뗻ஹ誼䌵盅")})});
    Test_CheckProps_SkinIndex({SkinSpec("荙ԇ쁰㡩鉈㵹䱀⦼ᤗ", true, {TextureUrlPair("첄ṑ埞쿁", "岭᫘뗐荢茯泋"), TextureUrlPair("前軫敚ꌢȚ庅", "᠆虽ﾧ㤌�瞼")})});
    Test_CheckProps_SkinIndex({SkinSpec("龒ﰙ伂ﻳ", true, {TextureUrlPair("Ⴏ쿔黌蟽瀭줈", "寔퇥魗芻뻣䡚"), TextureUrlPair("灌", "ۙㅱ"), TextureUrlPair("䀾챹鄎", "톭")}), SkinSpec("犎", true, {TextureUrlPair("鶽�⟜顀崍邵耊", "")})});
    Test_CheckProps_SkinIndex({SkinSpec("뱚謊쎼ྊ䩭", true, {TextureUrlPair("㑩黓⃓᣺", "䌰䢮횋檭՜暷┉乞"), TextureUrlPair("⏑⯨ᰖ", "ﮣ"), TextureUrlPair("롽ꪐ毧⢤Ԑ⋅坓敘", "ꈘ꘣뀭蜼흚ꢫ∌剁�"), TextureUrlPair("㛨쁴툥퉠빾", "翜랛")}), SkinSpec("ᯫ뽱뢽", false, {TextureUrlPair("塪熯樝", "探꘍"), TextureUrlPair("诜", "陀簒眲彩틩鄌躠")}), SkinSpec("筰Ἷ", false, {TextureUrlPair("⠡떖峾", "ꑾ훾ྮ埒怢⌕봤"), TextureUrlPair("ζ", "伐")})});
    Test_CheckProps_SkinIndex({SkinSpec("ﷁ퇮", false, {TextureUrlPair("窬瀜屮盫鶴㫥艟睇֖", "批ꢇ♒햔ḝ枧숩")})});
    Test_CheckProps_SkinIndex({SkinSpec("꼭誟㵄荘ﵜ撠杜", true, {TextureUrlPair("㼧ｼꍞ媮쭻郘兾", ""), TextureUrlPair("岄ﮓ", "繾䰆㎿ꩡ闱∾돊罐")}), SkinSpec("ჼ䆱⤙夙䦛", false, {TextureUrlPair("ヅ핿塨䱤솷희퀘�", "޺鬳㹾㻳"), TextureUrlPair("톔�枎낀�溭〹韢ꏄ", "⻜㖃㿌葄燳▤Ⓚ୘⫞嗚")}), SkinSpec("闬", true, {TextureUrlPair("㺙", "훽๶塪曆⿠"), TextureUrlPair("佚옌埶㟿嗯髜鎴ꝵᜓ", "蛻㗲믐贶䭴횥弞〦ꭇ")})});
    Test_CheckProps_SkinIndex({SkinSpec("ໃ", true, {TextureUrlPair("䆌靍䑣", "໰�톸�"), TextureUrlPair("ﴼ䭣ﯜ둉", "⯩㸋輑릐岴衚쌚뜉"), TextureUrlPair("⢱툢덩�㏎餾౯ኽ긷", "褈欍ℳ쯍뇼嫰嘤")}), SkinSpec("₮İ", false, {TextureUrlPair("兀ꒆ�", "餖簵挚䂭꣕ㆨ")}), SkinSpec("迆䀰⿅꪿ዼ橌腅땊䙊", false, {TextureUrlPair("璑", "킷䕂ﾷᧇ엍噞"), TextureUrlPair("㡙ⷆ낂", "浧乛偗㡰Ꚇ࿦")})});
    Test_CheckProps_SkinIndex({SkinSpec("젰盐독ᬿ", false, {TextureUrlPair("亘鵦豑ᶒ꧊㣕꠲Ⳗ", ""), TextureUrlPair("�ｎ", "堼力ꣂῥᓤ"), TextureUrlPair("䰝ꆓ", "稅ˎ샱")}), SkinSpec("", true, {TextureUrlPair("񮐧벐", "⮶ᑬ⇳转‶慾壣᠄")}), SkinSpec("₄샦⃉梀崟", false, {TextureUrlPair("୐忢ᴐㄙ⥝廜", "郂⛮ⅺऑ쥐陷㈌㗎"), TextureUrlPair("歷", "嚗鉇"), TextureUrlPair("攬ࣵ", "䒷摪ꅧ␖暑"), TextureUrlPair("ၨ", "﷘૷赠ऱ䞨筤ռ")})});
    Test_CheckProps_SkinIndex({SkinSpec("읔琾ឺ䉲擾뢺鰧ᱱ", false, {TextureUrlPair("㘠⺷붚넏殺䗛摆軒헝", "㈢⡌�槗༗↥꓿ඈ槶胅"), TextureUrlPair("Ҭ缦豄篛�", "䖥"), TextureUrlPair("ꥷ吢ꑛ嵦쿊퉈ꦖ", "麨摹斈垃"), TextureUrlPair("榏᥈肷ᗤ貙⠽", "䫅ဨ")}), SkinSpec("油눲Ｅ㌟", true, {TextureUrlPair("", "㋳潸"), TextureUrlPair("돒냛얎乗彛툲鋪", "")}), SkinSpec("쫢졵欁늳䵋핂쨄Ꙕ㠌ꩆ", true, {TextureUrlPair("ⳑỺ藢ᨱ�띝齣쀝", "▕㣛"), TextureUrlPair("肼ꧦᶣ僬", "꿰輨ⴷʱ惆陕㺀⛹뀮䅨"), TextureUrlPair("גꚇ", "忻룠딌坰旗挌蟡")})});
    Test_CheckProps_SkinIndex({SkinSpec("荖䏖辪牤", false, {TextureUrlPair("썸઩뼟郘", "놏溿찕엛છ쫢Ĝ�쑝糸"), TextureUrlPair("䑞⫚輭扝稈╜ˋ㞸葸", "틐")}), SkinSpec("繞苹뵄ꎷꥏ㗛荶鱐ɖ", true, {TextureUrlPair("攦耧怑솟둸棳ꓮ�繄", "◁E�齦蝉렑쮝")}), SkinSpec("鄩È⦤", true, {TextureUrlPair("", "ࣿ뚈⁤"), TextureUrlPair("䒵鹼⿉巧", "侎"), TextureUrlPair("ᵘ뱆㵁哵븎챫춅蟜", "")})});
    Test_CheckProps_SkinIndex({SkinSpec("셋", false, {TextureUrlPair("맴ꏢይই肔的৶", "蚶䔫涄䓇鐒㻑ꀥᝅ")})});
    Test_CheckProps_SkinIndex({SkinSpec("꺉୕醅ꭿ⠼⿰", false, {TextureUrlPair("", "궝")}), SkinSpec("Ự⁚", true, {TextureUrlPair("ĭ竸憄쾰⪬瞘�", "픾鷡큀퍛ᖚ"), TextureUrlPair("=繪耝咱", "푚閹�订潍˼闦զ�皓")})});
    Test_CheckProps_SkinIndex({SkinSpec("淟붆䁯곕텘", true, {TextureUrlPair("￦᫅ᨥ涢︭᥌뺞帘⩚", "ᝧ憅긓쎱㩕�"), TextureUrlPair("骻穕੾깕ꕣ專", "訔韻꽩豱"), TextureUrlPair("ꔠ⟨ⶋ뼩檧冯銮", "잎ꎱ")})});
    Test_CheckProps_SkinIndex({SkinSpec("곔詢庿￻㚮", true, {TextureUrlPair("�뿿ꅆ亵�騐ţ", "璻ੵᛗ锾渝"), TextureUrlPair("찼孙犄鳋䍮", "১齪띏燼"), TextureUrlPair("霧벻䯱旵Â", "⼱띖묜黶㓶"), TextureUrlPair("㮼ﹸ摥ᥞ怷㤰ꗕ묂", "징䍼㖩봝")}), SkinSpec("ꄺ⧿䊤ጰ", true, {TextureUrlPair("紳꥝㯝置", "쌄ܖ톣"), TextureUrlPair("꼕癧鏔븬蘴찲", "퇉�ᔑ"), TextureUrlPair("͕핥ゔ", "爴셝낊"), TextureUrlPair("", "ݠ쎬철鳈᯿㠣ⲩ趲ϩ")}), SkinSpec("因렱ㆲ䠇�뻽ຉ", false, {TextureUrlPair("왁䐴仚", "⨇냭ᆱ纲縶飕"), TextureUrlPair("᣹滼", "蠡Ἔῳ"), TextureUrlPair("�䐫펽䨜맸ﾒ鱠∭컧", "�嚈娖䬛")}), SkinSpec("躊瓆諢⃴諐牔⑴皜", true, {TextureUrlPair("Ș꤅㇑杞廗굨辇", "粵ꇿ砒理麕ﺅ�盧龊")})});
    Test_CheckProps_SkinIndex({SkinSpec("킅㒏㲇កꠤ", true, {TextureUrlPair("熠쿝啩넨曮쭜끗", ""), TextureUrlPair("떡攍", "㝫䠗鸛裌⨫쥰⽡"), TextureUrlPair("뚠떢：䙅좍笑촖엟", "跱痎"), TextureUrlPair("攰吻သ쵚�", "ꠀ")})});
  }
  
  bool unitTestResults_SkinIndex_Getters = runAsync(Tests_RegisterAll_SkinIndex_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_SkinIndex_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_SkinIndex', UnitTest_OpEqSimple_SkinIndex);
  }
  
  SkinIndex@ lastChecked = null;
  
  bool OpEqSimple_Check(const SkinSpec@[] &in skins) {
    SkinIndex@ o1 = SkinIndex(skins);
    SkinIndex@ o2 = SkinIndex(skins);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_SkinIndex() {
    OpEqSimple_Check({});
    OpEqSimple_Check({SkinSpec("ᚬ쇳濶鵛獔楷", true, {TextureUrlPair("︐좙桭垛峵כֿ", "冥㶶밑幖許ᬤ쿊菆")}), SkinSpec("਀ꩣ釪�麑遬徨탏", true, {TextureUrlPair("핦壉샴廗ᦷ氫ᚘ킅", "诛퇟"), TextureUrlPair("壝玃勑뤋펍", "叴뢦⇩㵣䎵")}), SkinSpec("㞟ప欽᩻⫤䨣", true, {TextureUrlPair("", "霋흽묌铱蝔"), TextureUrlPair("㚥涬凙ﷰ눵뭩㵷衟", "⃩쭶퍉")})});
    OpEqSimple_Check({SkinSpec("", false, {TextureUrlPair("ꔬ", "﵀쨔븬ଏ늭豈"), TextureUrlPair("㾢笏㶆ʱ䄔鍚뵭", "")}), SkinSpec("䎕", true, {TextureUrlPair("岺쮟허盯볠", "ก撿怸፦⺑띌"), TextureUrlPair("", "后⡆鍙莕"), TextureUrlPair("Ἂ떋雄忙", "䔲뼟Ŧ⃡釄")})});
    OpEqSimple_Check({SkinSpec("⣣뾈噦", false, {TextureUrlPair("໿ꍱ꟤��뙑", "㤬꾷"), TextureUrlPair("ꅯ껳ሌ", "耽裮ዖ锲釹ឰ墐"), TextureUrlPair("嚅⒝ࣾ", "⬲櫇ꟙ栥鏡螫"), TextureUrlPair("㏊뻹媋痰碩⻰", "�嬅糓岁ꮸ㏧㽤᪮壐辡")}), SkinSpec("燵㪆汀ᆣ젙娣ʱᯜ", true, {TextureUrlPair("䀿虿砍", "픽鳐ꈉ"), TextureUrlPair("䁏ਮ虴簪䤀", "䀐硩钗")})});
    OpEqSimple_Check({SkinSpec("௝ミօ", true, {TextureUrlPair("竚ꂠꋽঞ꼥ᗁቲ", "扮깡㸵괬춣"), TextureUrlPair("", "")}), SkinSpec("", false, {TextureUrlPair("䑫ⵙස銰", "批钅ೢꨉ�툱ฃ")}), SkinSpec("侮ꀵٽ", false, {TextureUrlPair("᧡⬆ꁓ縬鉸", "㵅绰혏牒"), TextureUrlPair("�蛖ꬹ耐厙׊�", "鲖㝛侢"), TextureUrlPair("㽘웆覕䃄�ЊЫᯱ睟", "┕緰튅")}), SkinSpec("疡赬", false, {TextureUrlPair("ݤ謇든㣗짰ꌂ윝뺭눎", "䒠ბ썊䯲⏔銄"), TextureUrlPair("꾋ྣ驣Ⴥ烶ꦴ휇莖", "⮴柷ꥧ荣ᢕ縠靿ᩬ□ꮟ")})});
    OpEqSimple_Check({SkinSpec("瞐奺ဂ", false, {TextureUrlPair("鬐鿹愶彄", "輨浉ㆠ㌔Ú銼磃헮躁"), TextureUrlPair("", "鼗"), TextureUrlPair("쩪媭䥿톤聿妒ᫍ�⁔վ", "ᗱ閯ﺸ娂ᑠ쟀냖"), TextureUrlPair("쎭뗧䢼�䌐ೕ㎭啷", "罚宿㝳䵉貟↟ڹ錠")}), SkinSpec("", false, {TextureUrlPair("녮ง", "텩㚽댯맑힊"), TextureUrlPair("᣾킯䠧◐", "멖�"), TextureUrlPair("撍䈒", "庈"), TextureUrlPair("遚㌌⻄", "䨾㶜☭ෳ鈴띟璦Ⴗ")}), SkinSpec("﷤賚�", false, {TextureUrlPair("ᚭࣳ", "鰉ᡖ"), TextureUrlPair("꒭→⣦룎ⶳ", "﨑ğ螥"), TextureUrlPair("⟹驵盲", "賥硬⭷혀ⴿ㓶ࣛﬣ")}), SkinSpec("갽郭뱜", false, {TextureUrlPair("䚨篱鬻피䌱踀", "챀")})});
    OpEqSimple_Check({SkinSpec("义㗡뺅捻飰鵐", true, {TextureUrlPair("訲꼟榜Ô聈厳눟", "좢統佩"), TextureUrlPair("", "⺊�")})});
    OpEqSimple_Check({SkinSpec("랔", false, {TextureUrlPair("ꪫ㪛숬", "ꄽ圦긡㴽䷗넱�㙫姦䟧"), TextureUrlPair("", "ﵜ쳮쬤﨣ኛ")})});
    OpEqSimple_Check({SkinSpec("ꂘび�瘣댮杣ඟ姡", true, {TextureUrlPair("䗦悛燓뢅䃐ೃ", ""), TextureUrlPair("窩遜媿", "")}), SkinSpec("㐈狀䌤譢䳷饡៰ള甂", true, {TextureUrlPair("ꤻ�鳛䊀덒턗屷硷ﵜ", "럴咨ᮭ岾")})});
    OpEqSimple_Check({SkinSpec("癓簡枌녑埖韠", false, {TextureUrlPair("쇞", "౜녜뎙㾣咂ﱉ皾")}), SkinSpec("", true, {TextureUrlPair("", "迒䌡ഘ�∁衽"), TextureUrlPair("翂㳕࢏ᶩ", "ힾ䣇ᚇ梅"), TextureUrlPair("ᒭ㵟蝅迨︧兀ࢺ鱈", "믋왚ꯂ喿")})});
    OpEqSimple_Check({SkinSpec("픪຿゠礊튵రȴ", true, {TextureUrlPair("淨�薮쮮磫呃温뗝쥨뽙", "歓퐍⟳庶✨"), TextureUrlPair("릇v⍱隊Ⳃ丮먓꠹", "ㅾ돂㻢뜵㺸䞭촁챑ᩓ龜")})});
    OpEqSimple_Check({SkinSpec("絟", false, {TextureUrlPair("ꑧ⩱ꛏ�암䢢갎穯쎙竗", "뾩ᨶ␫祡扁"), TextureUrlPair("텒綒搅聍Ꟑᨎﳌ祊", "ɯ䃟"), TextureUrlPair("", "❮뙡여䯥鍮幘滆"), TextureUrlPair("䅖ꏊ", "禾")})});
    OpEqSimple_Check({SkinSpec("碫", true, {TextureUrlPair("ࡍ埔캫뼄쳌食ꆔ뾘�", "䉕ꐡ딞눼诠ﱐ윍"), TextureUrlPair("鈩⥁", "珩댶㍙"), TextureUrlPair("㌼瑨ᘂㄺƫ㪙뇞轓", "뗭蜢穽ᓪ辜"), TextureUrlPair("鷝䆀䫸貓햽", "")}), SkinSpec("༙", false, {TextureUrlPair("", "寮侬䐾ʌ蛆"), TextureUrlPair("썇揧�ᜯ㧳西뙶", "斍⏀쌛Ⓛ薚懙룙㎐")})});
    OpEqSimple_Check({SkinSpec("", true, {TextureUrlPair("촱痛窆섀", "蘁䞼壄桀蜿")}), SkinSpec("Ư⥣䞘", true, {TextureUrlPair("풭樮쟓銀氢", "㲰핋嶣䇙寇鼹"), TextureUrlPair("㿷䆞룦ύꎝ�霃", "鿒"), TextureUrlPair("", "툇"), TextureUrlPair("맖Ⴙ潊峼", "챞䢿眭᫜侯")}), SkinSpec("�房댬㾑ໞ탬鏩Ⓜ", true, {TextureUrlPair("ⳡ늵꜀㏔绨ᵬﴗ", "獽ᗒ攅樘"), TextureUrlPair("勇啸俵㧠儂", "๋캌涒誀叞㇘㌬酉"), TextureUrlPair("Ⴗ״૾근邺㣿䟫", "짱㥑")}), SkinSpec("릺칻啗븥", false, {TextureUrlPair("ㅞἄ辰思莽䱪㪪䀷픿", "闥媰⹄̥グ㘁"), TextureUrlPair("燨ꍶ⨙獵", "衔ΰ탡뒤엄闼嵞"), TextureUrlPair("듴䎇꺥侚", "막퇭")})});
    OpEqSimple_Check({SkinSpec("", true, {TextureUrlPair("仫힒", "ਾ"), TextureUrlPair("붺︈გ萩➽縴邾滁﫿", "褃�檖ﰠ"), TextureUrlPair("⹰럠靫ѫﶝ鍏톴", "ꉼ嵠")}), SkinSpec("ൣｴ川瓜ᬥ镹ꕰ喭﬚", false, {TextureUrlPair("�", "㉲")}), SkinSpec("", true, {TextureUrlPair("岁岮賛㚡�", "﹢멊┰ಂℳా演읎떩煤"), TextureUrlPair("倢豊ǌ皁꺼㲇߇", "㼅﬎梡깺⨎㢂")})});
    OpEqSimple_Check({SkinSpec("", true, {TextureUrlPair("ீ憨ቒ녈㰚", "뇺扐葁霤黟ꮪ辝뙉"), TextureUrlPair("热⹉㊘၁᫄鍹䨢䵟ۄ", "떶⨨ᘟ戣⦻䭋톓"), TextureUrlPair("⠋젿糖앻嶚旺沣", ""), TextureUrlPair("ꐶ⯀ⵡ㽀", "㸄ໟ")})});
    OpEqSimple_Check({SkinSpec("�鍴뢬垑", false, {TextureUrlPair("틕଀蒍⸜፡␯", "ꗞ룝烀ꡕ휊魔吓ꈾ"), TextureUrlPair("", "ᴥ䂽ᧁ⬤믍ﭶ쭸吹꒝"), TextureUrlPair("მꇮ�꣖ⱍ䆎", "膥␲浧뭧"), TextureUrlPair("瑫�긇", "돉㘖惢")}), SkinSpec("訆脲溷䱨换ᵘ蒭", true, {TextureUrlPair("음垮�", "㊖"), TextureUrlPair("衈ܔ肽粪噷鼚㏊뙓ⴀ", "㏙伥╙灌띎噋ꌲ皒퉰鞗"), TextureUrlPair("㞝苫�眊뭬甓", "䒭�똀")}), SkinSpec("䞕푅集ꦫ詓", false, {TextureUrlPair("䞒㴭䔥岿隆鰖蚞ꨑ", "䳖"), TextureUrlPair("堹朲", "絵舸ͽ畺"), TextureUrlPair("ዒ", "")}), SkinSpec("穥ⷨ䓓潶꜓⵬㊇ᖕ", true, {TextureUrlPair("圡", "ᆐ첧첽賂"), TextureUrlPair("", "ȯ딝륷䲛ꌲ쫣"), TextureUrlPair("疱↢", "爙⋥Ⓠ�憝蕘"), TextureUrlPair("趸Ꙝ拳沈��憕€", "컪")})});
    OpEqSimple_Check({SkinSpec("烖ᩬ䎠", false, {TextureUrlPair("什ꋃ鱚઄᷼嬺꼨", "⌇쩆ঢ়"), TextureUrlPair("힢✷㎾腒鸒닞鉤⡄", "࠵聮怴"), TextureUrlPair("좂響ض쭂槶ﾽ꒿", "佪솫"), TextureUrlPair("䂓㯄좑콤삓ȴ劗ᄼ", "喒⅒瓮㫬䠜ヸഫ")}), SkinSpec("ꮂퟄ䬰왊", false, {TextureUrlPair("쭖", "ꑆ鷍뒦羊テ")}), SkinSpec("ฅⴑ鋆㫊훝", true, {TextureUrlPair("댓໵噫", "칲ﲤ荏嬸虶"), TextureUrlPair("ɓקּ", "嵞䄁緯壣媂ᆠ"), TextureUrlPair("듷륑깾", "昳占㵊㱲﹒푽"), TextureUrlPair("ᓊ鹿ݚ띤⻧", "귵獦㣋幺ਗ਼")})});
    OpEqSimple_Check({SkinSpec("鿸큿", false, {TextureUrlPair("晇巒쮭龥俩嬬≵疯", "ᦦ�"), TextureUrlPair("༙㭮嗷㠽", "㻴驓ࣳ㣣咽玮"), TextureUrlPair("୽얌꼐", ""), TextureUrlPair("ᕀ", "衐⾕쩿ी狲篌")})});
    OpEqSimple_Check({SkinSpec("ﰵ鹖氫�᧬쓔烈䞃俯ꅧ", false, {TextureUrlPair("䤄嫿�扚彡㉆䥅푒謏믷", "塾ᨑ垢ڡꇹ귬")}), SkinSpec("ﵢ띣莹⫖㺄", true, {TextureUrlPair("픢㻯蕛⑰", "랇㲑�㹘"), TextureUrlPair("翝", "헑仺䐟ᘇ枙쌀궶"), TextureUrlPair("䫌咃ࠄ裞ꥭ峘갤噴", "⮖铢뢇懅⧈碴熭彰")}), SkinSpec("葎푔ﻖ䋘痡뗏�ᓀ䉾", true, {TextureUrlPair("⽷먍汃", "캊偛ᖧ⠀㲰ڣ")})});
    OpEqSimple_Check({SkinSpec("褟修쩶ꏒ莰䍇औ", false, {TextureUrlPair("塉䂎閩쒉能䜶꽭儿", "弖껃Ú웪"), TextureUrlPair("", ""), TextureUrlPair("", "뽱៱ᙌ"), TextureUrlPair("镦䠉붪｡蟕", "䅟ި㬹麻椭㓢�줠")}), SkinSpec("⍒싊딯䷔틍냿ꬎஎ⃳੫", false, {TextureUrlPair("舆곗啧嗊ዕ", "㿾揚낆")}), SkinSpec("燌௏ㅷ꽹䕵ᙃ퐄廚㉧", true, {TextureUrlPair("费", "軁测ᠾ塨跤鼝흠쑛")})});
    OpEqSimple_Check({SkinSpec("᯷람⃧旝", true, {TextureUrlPair("闔화᪢⁕虉", "汧䖬鮇䏹㉟苶"), TextureUrlPair("䫡", "謾䖰⚈쨳皓咆덞⯏뉺")}), SkinSpec("耝뼮鑟➙虒擖", false, {TextureUrlPair("뾬℟맏ি䋫鬿鯪哠", "곱砽ਞ"), TextureUrlPair("", "氧﬷")})});
    OpEqSimple_Check({SkinSpec("⽖쿦眔䇚魧뇗霁", true, {TextureUrlPair("ꇵ", "ᗉ즒奇进됭"), TextureUrlPair("⊣繽゠笂鍙櫇잋䔚", "턇핦炀ㅪ偣"), TextureUrlPair("굇垐냕슏谣꡻", "")}), SkinSpec("닙", true, {TextureUrlPair("篲屦셎㖉뭣粒", "퐢℣努"), TextureUrlPair("矧炋싑뾃볆ⶋ啿", "䠖ꢜ鸑ᬙ韊ଯ⣾⠨℈")}), SkinSpec("휚﷐슽䥹⍎", false, {TextureUrlPair("庍怆嫃캓磆", "罛搷衏홌")}), SkinSpec("", false, {TextureUrlPair("媃溼楌⟏鶰鑮㍴", "席醡裉䷪䶑輌ףּ")})});
    OpEqSimple_Check({SkinSpec("➤⛄", false, {TextureUrlPair("�๰挎࣬裯", "癣못餌礵"), TextureUrlPair("阸报", "ݭ䣞�劔"), TextureUrlPair("餠펜銆꼡ѣ把䰱籄䭡", "ש⴨֥嬼슷䮈柎")})});
    OpEqSimple_Check({SkinSpec("鷊좑袆뷢斩ᶷ锦䤻鉊", false, {TextureUrlPair("", "寳쨯革ҡ")}), SkinSpec("䐘♠넌抧홁貽⛅", true, {TextureUrlPair("綎씃めᢑ娮", "﷜ᬁ狿昫�罺쿔")}), SkinSpec("䑩˨忩膃㿲鸌脜⧯", false, {TextureUrlPair("ꪔ䋑๨똜넳景�", "駛㯰㛫"), TextureUrlPair("఺", "翦㡏錅蠉l豠")})});
    OpEqSimple_Check({SkinSpec("ￏ뚽㾰", true, {TextureUrlPair("Ĩ섓", "尽⪬ꇱ椳轣脐⬒埐糋"), TextureUrlPair("ᅸ뛦", "櫢潃뮚己唙淐挩㯂죷")})});
    OpEqSimple_Check({SkinSpec("㜬쇅轓봫᲍咴㹺歝", false, {TextureUrlPair("햂ࢃ㑡큘䉙", "˂ૂ▴퀷ሱ줝"), TextureUrlPair("̬䟥", "泄쓣刍"), TextureUrlPair("䒺", "邳"), TextureUrlPair("쏽㩍刱땹ʀꮢ", "�챱䋸�駿鹲")}), SkinSpec("坑⹉ວ", false, {TextureUrlPair("ਲ਼", "�罍༰Ｂ"), TextureUrlPair("�鿟嘪愪ˠͅ摁ሏ좞", "춼忈딾쬆؎覸쩡䖓")}), SkinSpec("롹舆၆ᮚ⥅", false, {TextureUrlPair("咍뇎䆎癐ᖀ㪥ⶶ龪", "聁큽꣔ᙑ鋃姸")}), SkinSpec("ㄱ⃵왰ˊ쟓ኹဍ蹲", true, {TextureUrlPair("濫戝", "ᙥ줊ꄻ뉒例鰘덆"), TextureUrlPair("跚㴺뉩启", "蛵竖췸ܫከꔙ漖"), TextureUrlPair("햲贌誺燛頄", "龇ᕞ웸ꣴ動")})});
    OpEqSimple_Check({SkinSpec("ꁶ騼", false, {TextureUrlPair("亊ᄷ섴쵦", "㽿쩩碢掘䬜")}), SkinSpec("黻徟⏥뚢ൻ됈", false, {TextureUrlPair("㠆ℬ顉㥘ᐔ䕝ᴈ", "䅕苻໷踠ㅞ삺蔳羽珌�"), TextureUrlPair("⎚箶쭀쫵漸歇鯏", "汔瞉騰ᝐ蛇饉苍Д"), TextureUrlPair("矾ꕢ", "")}), SkinSpec("绸坈య榒㐄", false, {TextureUrlPair("䉯䗮笠닦햿", "纵鰮"), TextureUrlPair("�๠䬮颼贩羊鰫鹰䊦", "퍸枎ॣᗆ�㷹톝뙤麶"), TextureUrlPair("醨쵗", "ૹᎌ〭六꙱븀⹀휤ꪅ")}), SkinSpec("庖겅撫䙑簤䱛↠�湱", true, {TextureUrlPair("뉒뛰䦄㢼㩒껸", "ৎ疭"), TextureUrlPair("僡�쫫", "醋鈻⭖㏺"), TextureUrlPair("胗჎롢㋎瀅섔�ٖ疵", "糐꽀")})});
    OpEqSimple_Check({SkinSpec("롅黎䛑禙矮齢棰ｷ쾷舷", false, {TextureUrlPair("䂓곮", "䎁⏂᠖⟞먦驋춺慴")}), SkinSpec("䍝悓彚聻긜셎蛊₈", false, {TextureUrlPair("ﱰ㢣੖脆쁐�곬陵", "ࠡ")})});
    OpEqSimple_Check({SkinSpec("ᛀ", false, {TextureUrlPair("䈖达鮻㺄گ틄㉌忹枎졎", "꽤㩤쿉䩘氌믎纷⢋"), TextureUrlPair("", "碢⁌᏿上둆")})});
    OpEqSimple_Check({SkinSpec("崣鳳⭊ܒ", true, {TextureUrlPair("闤", "繺ڈ崓け"), TextureUrlPair("❊�", "氆䍱⥃ḧ壽⿯䉂")}), SkinSpec("ﲱﱤꁯ寇", false, {TextureUrlPair("ףর", "㖽㈕澏㲟샋ᆨ弱"), TextureUrlPair("᫑≬෶㌼ᔯೲ韺쉟", ""), TextureUrlPair("曃왑듓᠁䯞Ꝑ䅠ḗ", "忌�埕峗,滻")}), SkinSpec("੒혗", false, {TextureUrlPair("覮๬녻舗賥䙳㱤㶺", "辅"), TextureUrlPair("눳惢ꪜ脺䷲⭷", "퓕仸"), TextureUrlPair("펚譑쪸旍덝軶粼ꈞ", ""), TextureUrlPair("", "毬稂퇄ꋇ")})});
    OpEqSimple_Check({SkinSpec("뮂", true, {TextureUrlPair("䔤奄�慞踢擼릏堻", "〿턉䵏䭛㼪ᚯ⮍瀔"), TextureUrlPair("猰滻ꓱแ", "ꕳ볌꺣ꗕゑ")}), SkinSpec("묏", true, {TextureUrlPair("柃걔䫄ꀬ紦", "ﮭꭢ⍕컅Ổ̬鰘"), TextureUrlPair("෢ￛꙛ곥耴៚", "毄✂ꈨ")}), SkinSpec("ꏀ䦌�막ⴃ炣ㆬ珦洂", true, {TextureUrlPair("谽丝�窖眄冷⼈", "⦨푶饲")})});
    OpEqSimple_Check({SkinSpec("훶㻮", false, {TextureUrlPair("쪖뤴璏뀬羿쭷퟿࿼", "挌㼉㘁믌ᑳ䔢∽ഔ")}), SkinSpec("", true, {TextureUrlPair("㤽犋麀ﰀἚꇟ⯛㟕", "Y畒뒄懒쳥ģ"), TextureUrlPair("⎋즤潪", "ﭻ꥕Ⱐ⋝筐夋")})});
    OpEqSimple_Check({SkinSpec("雧걱莁এ瓁散", false, {TextureUrlPair("▆㋁", "᫩⊭�變쏺팙❷홭")})});
    OpEqSimple_Check({SkinSpec("诽፴딷ﾑ趓컰", false, {TextureUrlPair("꬗ẕ妙⪄䅼⧨", "菋꩎�뇀ꕣ橝樥빬냎")}), SkinSpec("", true, {TextureUrlPair("埠䜲崓慬", "")}), SkinSpec("콢ᡂ甿誕껰捉", false, {TextureUrlPair("錀束梲䢒➒脚伅ェꔱ폔", "뽘"), TextureUrlPair("", "牢飛ࣲ")}), SkinSpec("", false, {TextureUrlPair("ﱏ喱鑐ꇮ陱ᨻ쯅ᙖퟫ", "틴죥裪Ⳛ䧅뿊"), TextureUrlPair("鞚Ⓞ", "冐ཾĎ贿뙆縶쯰")})});
    OpEqSimple_Check({SkinSpec("읇", false, {TextureUrlPair("˱麎㔅醧", "胠볰")}), SkinSpec("", false, {TextureUrlPair("ᝲ벝죃", "伓訫")})});
    OpEqSimple_Check({SkinSpec("ᱺ", false, {TextureUrlPair("", "ሲ䈹ꥻ盾᥯K牿")}), SkinSpec("䃳", true, {TextureUrlPair("㡯烥", "ꁽ蘕ᧉ쁮ܰ萀昒匭"), TextureUrlPair("静", "울伝炦鴃")}), SkinSpec("㙽瞹䠟꣭砀�Ｐ杛", true, {TextureUrlPair("⍦絖஋ߺ㩃苚", "〉軈霁䑐뽽⠋樂鷜"), TextureUrlPair("㣧睲Ӻ麰틼弙龣붟", "쫟ኖşᄅ饒长諈媁"), TextureUrlPair("࠙", "曤蒖曾"), TextureUrlPair("椶压ᙠྉ牠츱", "⋻�歩ӝ੦䛄삮")}), SkinSpec("�玅벍퇍凛晚ﴫ", true, {TextureUrlPair("", ""), TextureUrlPair("陗", "鏆續")})});
    OpEqSimple_Check({SkinSpec("蘆穯翤჎䡬ഝ佘", false, {TextureUrlPair("�彶瘓菼蠼", "䁊쯙ꕩ塣셄镮罛"), TextureUrlPair("ጄ蓮犸鶦㻛쁰䪆콟", "ヲㇶ")}), SkinSpec("", true, {TextureUrlPair("Ṁ", "ꡕ隚氯毤")}), SkinSpec("㻒겂ꍩ㱭Ჵ⟸䎀", true, {TextureUrlPair("驶�", "匞㹾"), TextureUrlPair("כ됁嬆꘤舣怠", "�辮矌카"), TextureUrlPair("ㅘ艶⃸ﺏ", "訬ﻀ샍뜣䦒鮥昝"), TextureUrlPair("濏煚ᚉ暾ꃫ", "")})});
    OpEqSimple_Check({SkinSpec("⨶", true, {TextureUrlPair("Λ", "嶬雡먁綄├븝"), TextureUrlPair("", "꒿몵蚾◢鯻쟻퐏ࣉ"), TextureUrlPair("ធ끠鵾䑸", "クꌔ"), TextureUrlPair("ࣆќ㨳䌡", "ሆལ鄦䘈欶ᑄ끟")})});
    OpEqSimple_Check({SkinSpec("꿌過僵", true, {TextureUrlPair("赧踳豃柅屒ꇙ浹쀎醤", "뢎谸恧휚"), TextureUrlPair("瓓휗♠", "挏"), TextureUrlPair("Īϊ䔊䏈⍸覆հ祑ꙝ", "愶헓⡸")})});
    OpEqSimple_Check({SkinSpec("栆됹鸖㞧䊬綫怛", false, {TextureUrlPair("둧迌湕꟥⿕䇒", "彶ᚐ৶앴䔰ঢ"), TextureUrlPair("툒Ꝣ垳ຘ�瞈䵱ꠖ", "漀鈳熜ᗇ췥㌼爟ࠇ툃"), TextureUrlPair("㟡闟₡蚒亘勂첨", "ꗪ嚅㕵主Ⲕ"), TextureUrlPair("錄", "捽く�릛举⦗᠇")}), SkinSpec("冣헕쉚", false, {TextureUrlPair("折ꡄ", "筕Ꙫ陿䋓뼾廊狨혲"), TextureUrlPair("", "㰻걽")})});
    OpEqSimple_Check({SkinSpec("秇䤊�ᚂ탥ᜓቶ摍", true, {TextureUrlPair("뢩㻂䳶阀ᢋ�춄袴", "敚䓊념䆱먕ᅨ"), TextureUrlPair("", "垩駀"), TextureUrlPair("鳖ਔᠲ슉煔ࣀ", "邜耵깠")}), SkinSpec("˕﮾湴", true, {TextureUrlPair("䫵ꬋ疄찠暋ꋮ粋", ""), TextureUrlPair("읺", "䑷�㞕肾"), TextureUrlPair("㤉", "轀蟀쀾⬻鈏�ꦻ")}), SkinSpec("왂㿽彩鎄瑺ﰹ㷚", true, {TextureUrlPair("晏�궼䄞", "哪Ꮯ氶躠ὐ")})});
  }
  
  bool unitTestResults_SkinIndex_OpEq = runAsync(Tests_RegisterAll_SkinIndex_OpEq);
}
#endif