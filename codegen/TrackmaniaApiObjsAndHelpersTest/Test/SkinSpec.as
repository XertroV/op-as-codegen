#if UNIT_TEST
namespace Test_SkinSpec {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_SkinSpec_CommonTesting() {
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
  
  bool unitTestResults_SkinSpec_CommonTesting = runAsync(Tests_RegisterAll_SkinSpec_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_SkinSpec_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_SkinSpec', UnitTest_ToJsonFromJson_SkinSpec);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in baseModel, bool hasPlayerMesh, const TextureUrlPair@[] &in texturePairs) {
    SkinSpec@ tmp = SkinSpec(baseModel, hasPlayerMesh, texturePairs);
    assert(tmp == SkinSpec(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_SkinSpec() {
    Test_ToJsonFromJson_Check("", true, {TextureUrlPair("ꦻ땬黿救솳", "ᲊ̇॑"), TextureUrlPair("框雱燐꬝", "㟳䢕颒饣ퟶ"), TextureUrlPair("�ᲁ澯�჌江䚏", "汯粌鉅"), TextureUrlPair("㳋뽄旤ᮔ﵇獣ແ", "䃧쁐욘ᱶ谛䆳ꔼ躜ಙ㟊")});
    Test_ToJsonFromJson_Check("堉", true, {TextureUrlPair("旰蓡柿ஷ", "봌彺য়ꬢ毝榆"), TextureUrlPair("朣뵧칒튪윷窋澵", "䞚㌴⦱扬"), TextureUrlPair("", "懇�客㒞᫯볠"), TextureUrlPair("摂ꖶ鍁紙", "遐鬱峝뻴")});
    Test_ToJsonFromJson_Check("▏᯿", false, {TextureUrlPair("ͽ텫", "唃徭ྈ"), TextureUrlPair("ᵒ㪗羘렷뵫", "�常"), TextureUrlPair("狀ꆟ㾩炤䩦", "皼䦋쁗缧ⱊﱻ")});
    Test_ToJsonFromJson_Check("", false, {TextureUrlPair("⨗萃쎉뮏", "⻖蚇"), TextureUrlPair("炄", "ᩁ㟅ഽᒽ罆鹌ﲒ咧놪☼")});
    Test_ToJsonFromJson_Check("䔜", false, {TextureUrlPair("ⷾ뮁d", "恦鬋鍡轔援�ꧾ"), TextureUrlPair("ꔴ㳇", "든Ηꨘ躀"), TextureUrlPair("ᄶ窐踎", "鹥灦㣋충왦굸褢"), TextureUrlPair("坯켫", "懜翊신꨻በ↥鿊")});
    Test_ToJsonFromJson_Check("죤箖质ᣙ", true, {TextureUrlPair("벛ﳾ啃둸瀀", "ᢻ샞饤浏䴾퍂蘇賻"), TextureUrlPair("㏬蠑坖澂ꉃ뒅Ὄ", "៯ꭍڑ쀈ⵗ"), TextureUrlPair("", "뗃㷦⏓箝썷")});
    Test_ToJsonFromJson_Check("符䭭澀⽹ᱶ爅螝⬣", true, {TextureUrlPair("ᖦﭭ见禁䡼淣럸튦蘥気", "੉Ⱬꖗ")});
    Test_ToJsonFromJson_Check("쎧ᨘ퉁", true, {TextureUrlPair("㢝蔹", "�郁❨鲶쐤얪"), TextureUrlPair("뢑㖄瑁", "≨⢮舊┛輄虼裳엽")});
    Test_ToJsonFromJson_Check("ঽ", false, {TextureUrlPair("", "䮪"), TextureUrlPair("ꗸ롼", "豣閑㏲ᔲ逥좣㉒"), TextureUrlPair("ꨝꮄ轓᧦㗭再섚", "籕ￌ龎"), TextureUrlPair("쒜≁", "ᘭ☖甩ῶ")});
    Test_ToJsonFromJson_Check("淐꺒Ｅ澮촎", false, {TextureUrlPair("⧼馣谱蘄딙授", "຾鈧䴨餶갯䘞턜㧷わ")});
    Test_ToJsonFromJson_Check("", false, {TextureUrlPair("蜵来৷몖괩퉧瑏求뺝", "ཎ؏쀯㖩ꅽ딚圤쯼"), TextureUrlPair("☰�ꢶ嗲聅䄳ㆳ", "䐪䈞䞞䜋"), TextureUrlPair("ⓨ淪熷颤짒傉峩", "ź恮뺪髷漻")});
    Test_ToJsonFromJson_Check("絠촊枤", false, {TextureUrlPair("穏뫤࡙", "뾋뿰秮"), TextureUrlPair("㤘▝", "쑋㵗髍")});
    Test_ToJsonFromJson_Check(" 讈䗺⼎Ԍ臋뽦殠齒", false, {TextureUrlPair("䐁ߠɯ밥�", "꺗⯒"), TextureUrlPair("蜰晵", "姻韷"), TextureUrlPair("꨽ꩾ哻", "룅"), TextureUrlPair("ᴼ馿ꞑ漆霋枒৹聸ᒢ", "咷㟞曘靳ԝ")});
    Test_ToJsonFromJson_Check("靮垆规☉᡽햅𤋮柅", false, {TextureUrlPair("䁹呦㷽혭㞥ۚ轔", "⍗ꦘ疁"), TextureUrlPair("噧㉊㚨줫⧑㙵", "炙띤䮔췬鼋탐缜檜⛟")});
    Test_ToJsonFromJson_Check("ᖀ㨎乕紇答㺳萵ꊕᑑ", true, {TextureUrlPair("ԈǶ봒❖耾㾃庅鿹紣ㄷ", "ማ鰜㞡吂檞ꨁ딣⍣�"), TextureUrlPair("䥮䒸龅鑭嵿", "秇⋽吢ↈ種祶"), TextureUrlPair("䊼", "⅟᥌⇝䱓䎸帍곔遲"), TextureUrlPair("剈授䎫쉑ᢰ靡ﮃ嚄", "맆晝劬")});
    Test_ToJsonFromJson_Check("澃軬ꇈ퉿", true, {TextureUrlPair("儻쳷", "㈹�䕋⿬"), TextureUrlPair("㪏", ""), TextureUrlPair("鷬헡㕚别", "汄ガ䴤䦳�榺骽䭄궉")});
    Test_ToJsonFromJson_Check("댍〱둫", false, {TextureUrlPair("챆妙薐㨵", "淮듑箩厈䃐᲎暓煆")});
    Test_ToJsonFromJson_Check("ご䎽붏矓暴颙", false, {TextureUrlPair("媴白矷", "⊐檢䩬"), TextureUrlPair("", "뷌齟蜰ộ"), TextureUrlPair("爑䬼덃", "ꦼ�୹౺삯Ϩ죂")});
    Test_ToJsonFromJson_Check("闞ꩍ㨧㞆豽몗䎇㤴", false, {TextureUrlPair("㜆⏰‖馞褗", "阈熲")});
    Test_ToJsonFromJson_Check("뎝⺧䛙픮翽暈೵횽祋", false, {TextureUrlPair("Ŧ묓买嗒쫑鋋�狫ꙡ", "똛엫ᦡ"), TextureUrlPair("똼顯얮듖踉弹겸", "볶烓"), TextureUrlPair("浸酒袑橒", "婯맕赕磳섇邋�⬞"), TextureUrlPair("⬥襶喩ᓅ䍕ꆹ温", "͢떳窖鬦歾䙖ᲀ")});
    Test_ToJsonFromJson_Check("㽗ⷻ찄䛉笘ꚠ", false, {TextureUrlPair("〱긄⏽㈝㩵㈰㽇", "쩷ﾪ蛻紻ꕣ"), TextureUrlPair("黋▘녝裂ꦍꜚ", "珍㉡�"), TextureUrlPair("騀♖쥁", "⇹瓒")});
    Test_ToJsonFromJson_Check("盩鮕雮亦釪挨⎈汼", false, {TextureUrlPair("", ""), TextureUrlPair("柬઒궅抈⽊얳礞䛜꜠", "〶力෎"), TextureUrlPair("", "윊䰟爒ˣꌋ")});
    Test_ToJsonFromJson_Check("", false, {TextureUrlPair("尰", ""), TextureUrlPair("", "宕助鵒㼅ရ")});
    Test_ToJsonFromJson_Check("蚜詓䧒태ᢥ䔂旓", true, {TextureUrlPair("搵垑雛깵黌壀唑骿䋛", "埈㩜ﾴ连㻰쮛"), TextureUrlPair("陚＝ⶇ�", "頹㱭"), TextureUrlPair("妬눌鏩틽㼾켶⾤ᐺ", "ⱪ탵"), TextureUrlPair("ꮚ찌", "")});
    Test_ToJsonFromJson_Check("娐j⏣ꄺ暡欐걗", false, {TextureUrlPair("饚", "ᠮ裡͆⩒轖"), TextureUrlPair("Ҥ襤덌ῤ䐧ꮚ", "꽻뺿쭠贑麏揅שּ㰄"), TextureUrlPair("䦱�롴ퟌ", "")});
    Test_ToJsonFromJson_Check("㧱疦鹰냣", true, {TextureUrlPair("㰧໾趀㍟㤒居개⣪", "⺪恎"), TextureUrlPair("냢", "ﱛಃ"), TextureUrlPair("蛊ꠌ⋞ネ얽䦵೿緋빢", "곑凋�蔐鴁⅘굡늤")});
    Test_ToJsonFromJson_Check("ꄀ", false, {TextureUrlPair("瀨", "篦䙸䜋�셨鴈濙뾬䰦ⷅ"), TextureUrlPair("ﵳ琜䰶韧୊䥌", "끜"), TextureUrlPair("⤑ﻂ殩姒糒ꃆ", "죣")});
    Test_ToJsonFromJson_Check("尊䉸䅐⮱苸", true, {TextureUrlPair("腬킰", "⧚ᕱ㇦ᘄ躙"), TextureUrlPair("ؤ�㇨璧頒⹜遛", "伜㉜"), TextureUrlPair("㵷枸", "")});
    Test_ToJsonFromJson_Check("우梨杯ꤎ邡㤩顽䤎", false, {TextureUrlPair("墼", "୵㘱䢨̭"), TextureUrlPair("뱏熫鏵밃碻ᶁ", "䍅Ꝙ袘䯞髟"), TextureUrlPair("埈핹", "폺뮾眲餻Ჩ栬飒홟"), TextureUrlPair("훔�웖륞㍃솞थに٧", "励돠")});
    Test_ToJsonFromJson_Check("瀍ﱬ⠔軙壑", false, {TextureUrlPair("›䢬䟼", "⧔扦㿏Ⴇ⳵�"), TextureUrlPair("밄폒ꩼ", "᝹"), TextureUrlPair("⫼䇤屴콙诘䒂", "ᄯ")});
    Test_ToJsonFromJson_Check("騩ࡷ飵鍃Nခ툎", true, {TextureUrlPair("", "⠧뚇မͿ掗ν"), TextureUrlPair("邝פᜃ梑蠰鸀臐ᙙ", ""), TextureUrlPair("櫊䦚鶯짫帐뺿块砑", "栎纰乩궕껒꾤嬔䅒")});
    Test_ToJsonFromJson_Check("砐ᤌ�媓㊵覞잰聡", true, {TextureUrlPair("倭䗷辣⇹鞫ᛙ牗", "ើ銨〘ほ")});
    Test_ToJsonFromJson_Check("呻ꆠ䆖", false, {TextureUrlPair("ꪓ춒ⷸ䢎�殶", "聇㻇ຫ"), TextureUrlPair("臘톸ୠ앧茾⷗", "紶忿뾙乜ꩰ"), TextureUrlPair("馤", "뾯抃䱈೵谬"), TextureUrlPair("", "輂䥻扩唃쟚뒍")});
    Test_ToJsonFromJson_Check("葄㿮", false, {TextureUrlPair("틟ẚꙝῷ", "㫨὇ų᫝檃添쏯籰"), TextureUrlPair("瘏", "ฑ舩쿋��㥌쟍퐩"), TextureUrlPair("⹯줏气ቮꓛᦱ軽ꂜ춙", "逊퉈䨽턋ᄙ噕숲ॣ᧸")});
    Test_ToJsonFromJson_Check("�ﵺ", false, {TextureUrlPair("趰ꑘ嗀嬺", "쭗緞쐼ჲ쥟")});
    Test_ToJsonFromJson_Check("㿥ᢧ맦䎀", true, {TextureUrlPair("ⲱꢊ", "ꕠ�"), TextureUrlPair("㺢ḡ핝쯜䨶堂ú锖", "牢஬麋�縣䉁ꨆ㏪")});
    Test_ToJsonFromJson_Check("閠쯨목楥ᾥ", true, {TextureUrlPair("", "쏁ŵ㣈Ꞑ")});
    Test_ToJsonFromJson_Check("縏맄ḅ♁뚌ⶣޯﮦ컻㴃", true, {TextureUrlPair("숽쉳蔼蹥揪₃뒣筗", "祝ꠋ��"), TextureUrlPair("玓ꔊ줮㿮ᚶ", "豺埞赱�暜窋ᖪ࡝ἇ༽")});
    Test_ToJsonFromJson_Check("", true, {TextureUrlPair("蜷輶男", "颓ヂ"), TextureUrlPair("୑", "ᆰ뜬٬"), TextureUrlPair("漊쎽怴闛ꈘᵮ�", "溨콕ʔ镸〿ᭆ䅲砮˻ꇟ")});
    Test_ToJsonFromJson_Check("驸ﰹ珛㸤⇢㫢긩保", false, {TextureUrlPair("㧘ڎ⣑뿇쳚醤", "䈩휲쾹짨뵅"), TextureUrlPair("", "依⵶�伝猧")});
    Test_ToJsonFromJson_Check("ﳘ鯇剸錛⧡", false, {TextureUrlPair("", "䞌锑敦暒쇠覡邯"), TextureUrlPair("∹ꛌ", "缜圆䐰饄音"), TextureUrlPair("蛉鶋及", "䕔誮")});
    Test_ToJsonFromJson_Check("쫣娪颥驗䂨Ɱ✬맺�柚", true, {TextureUrlPair("鸚圲枴Іﰹ奡Ṵሗ", "놬׺ㅯ껶祓䲛虋"), TextureUrlPair("疂纑긶", "（쇱묜դ旱嗙鸙"), TextureUrlPair("滛窖ꀰ又ꉂ节瓞", "唾滯룮욏䩘꫕")});
  }
  
  bool unitTestResults_SkinSpec_ToFromJSONObject = runAsync(Tests_RegisterAll_SkinSpec_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_SkinSpec_Getters() {
    RegisterUnitTest('UnitTest_SkinSpec_Getters', UnitTest_SkinSpec_Getters);
  }
  
  bool Test_CheckProps_SkinSpec(const string &in baseModel, bool hasPlayerMesh, const TextureUrlPair@[] &in texturePairs) {
    SkinSpec@ tmp = SkinSpec(baseModel, hasPlayerMesh, texturePairs);
    assert(baseModel == tmp.baseModel, 'field baseModel with value `' + baseModel + '`');
    assert(hasPlayerMesh == tmp.hasPlayerMesh, 'field hasPlayerMesh with value `' + hasPlayerMesh + '`');
    assert(texturePairs == tmp.texturePairs, 'field texturePairs');
    return true;
  }
  
  void UnitTest_SkinSpec_Getters() {
    Test_CheckProps_SkinSpec("�￿躮䮠馩�", false, {TextureUrlPair("�╝㸌鐁㧖⢢羋⽪㎜", "콠旱疍鰉橿蜽")});
    Test_CheckProps_SkinSpec("�싺", true, {TextureUrlPair("�拺윰", "㞪㷗᤾虝䰒ஷ"), TextureUrlPair("۫芁≲彲", "콬"), TextureUrlPair("漽똮覧﶑䙢꺰ꦞᩘ", "먳�⿵枵ⴾ㬪●ꜛ귦"), TextureUrlPair("", "ꂆऒ涮�뗗텓酞")});
    Test_CheckProps_SkinSpec("듡鷰那춴庂ᄼ", false, {TextureUrlPair("ᒧឝ밇�拣䵱䌏�", "퇚箺᧸䤩䇢�뽥뤎祰"), TextureUrlPair("젮훇懓奲", "ᓭ褾㵹徲㼏嘿ꑙ尚豈")});
    Test_CheckProps_SkinSpec("儞祹㚏풓鏓윃", true, {TextureUrlPair("쿽騍큋", "뭷")});
    Test_CheckProps_SkinSpec("蹪鈤ꦀ㔭", true, {TextureUrlPair("阚⦈郶炼", "弊䮷⃷쨗蝢ᳳ쁼"), TextureUrlPair("珐瀮㍿웦쭜䢝䃙", "䵙"), TextureUrlPair("皌撏랭즫ᇁ﹀", "׭駭겯"), TextureUrlPair("�ᴶ๏㕭∸", "惍됞ᨴ㪂ꦽ㎀")});
    Test_CheckProps_SkinSpec("㶑ꔘₜ齬聎雄攩澴", false, {TextureUrlPair("의䉶杻�죝ᝫ᥾鼾㮦窘", "痒"), TextureUrlPair("痚ꄻ滇�ꒉ㳀", "쯳枦섍"), TextureUrlPair("옡뭱過ଚ㩕ၪ㩾", "뙱䕂륦홰떌䱇盰쩑")});
    Test_CheckProps_SkinSpec("웪墒≜蔗塚䌽ୣ", false, {TextureUrlPair("벷쨭욢璞�ᐡ", "䨗ও�휋"), TextureUrlPair("", "읝㆒刱❕騐헵�"), TextureUrlPair("Ꮍ⁭豹", "릈䨕＠߇₹紇秉ⵑ")});
    Test_CheckProps_SkinSpec("ꗸ鶧ㆌ痒㇌", true, {TextureUrlPair("沕К߄뽇㪢㸿ᓮₙ", "鄠짭㦟"), TextureUrlPair("", "森ⶍභࢆ⑧")});
    Test_CheckProps_SkinSpec("", true, {TextureUrlPair("쯺튯㱷ဥ院崢ꊵ", "쫉䶶꣰䃹"), TextureUrlPair("崤颦蚕蔟Ι龲ꇗ⡔", "ғ㒴퟽ᗦ㴟봨ￊￔ쥲")});
    Test_CheckProps_SkinSpec("耢鬗⁴炆ᔻ", false, {TextureUrlPair("쮞覑甃縎", ""), TextureUrlPair("뼊谥", "็۟弜쌘㙛핺﫽㑪"), TextureUrlPair("⁮ꕕ뉲�工턈鉚枛", "ಟ"), TextureUrlPair("༏큝㫓Ⴒ嶹堠", "ힼ㼓")});
    Test_CheckProps_SkinSpec("Ҹꃈ䮣ᬬ컵嶐", true, {TextureUrlPair("쪟怢瞱㻗﬽팊�슍郫", "뿎ວ扚듍꩐")});
    Test_CheckProps_SkinSpec("", false, {});
    Test_CheckProps_SkinSpec("狥Ü매", false, {TextureUrlPair("䚴鵁틖ꎀ�淲ﺆ跏", ""), TextureUrlPair("홅惗酁଱᮷㈾នﯸ", "샱镧畉弐狝פ뤫"), TextureUrlPair("⍪⧞픭蚏", "轁竁怒"), TextureUrlPair("䘢먔᫣읈聹匂仰䭬鹃", "䪞㧯䦴귏毥᥃嗯䵌")});
    Test_CheckProps_SkinSpec("妐檣袿칉谜訷໰胖", true, {TextureUrlPair("䨣뉐㕋퇪㷗", "㗟豺댜￰귥"), TextureUrlPair("", "䬹칭烈罽췜")});
    Test_CheckProps_SkinSpec("꥞琷᯵テ䪮䅎", true, {TextureUrlPair("绽ᅧ猣�嚖竝", "v鬕"), TextureUrlPair("ⵏ骗뱼扟킋泎ⲅ朓复", "훃덙⋵隸꫍痈쎣"), TextureUrlPair("嵐䓸瀓䳻Ჵ", "")});
    Test_CheckProps_SkinSpec("ធ", false, {TextureUrlPair("㲸肅瞇᭥⶗褰씌踵", "溪৥롰꬜䮖揉筢"), TextureUrlPair("鷂啕ኞ", "늋鯪섎఍䃿fྔ㐔"), TextureUrlPair("틑", "蛜犌郉鷪䈥⏀淓둬")});
    Test_CheckProps_SkinSpec("⦥๤즿ㄨ穂Hᡶ⛥杭", false, {TextureUrlPair("悄௶揸ꥒ叵﨑밍뇘Ꜽ", "贙殺뱆ᩖ彐쑥밃괦㮜䔐"), TextureUrlPair("꬈फ़Ը㌲", "㠇趣馸揉᪥溊"), TextureUrlPair("⥇Ш啞婓菨뻟௎餵", "⵪"), TextureUrlPair("俍埯퐥ঠ἗넾", "")});
    Test_CheckProps_SkinSpec("Ν曶됚", true, {TextureUrlPair("䟎他�", "抭␹鈖躇탩뿛ၲႪ㣕ದ"), TextureUrlPair("⊺�ࠫ⿳훿☸꤫睊�", "慺㗻壺旻슽铟Ꙓ鐻"), TextureUrlPair("쌩䖐ⱝ侘", "澎낭荸〈韴"), TextureUrlPair("", "")});
    Test_CheckProps_SkinSpec("Ⰶ�", false, {TextureUrlPair("뒱㵉ꙙꌗ枚", "龭컏�嚌솱挂ꁪ쥫�"), TextureUrlPair("絊앨⛳唏", "剭ﺏ柙㕤쩢姽ἆ奨啈"), TextureUrlPair("헽⇐춻嶻㐙㷀뵌慔", "⃙㾥괶"), TextureUrlPair("镉⣀跺阊额禱鍾齪床὏", "윳")});
    Test_CheckProps_SkinSpec("ᢦ폛⶯", false, {TextureUrlPair("灈￨℈⩝ꝶ擆", "")});
    Test_CheckProps_SkinSpec("ᑝ쨀飞륍虋", false, {TextureUrlPair("艍큋詁棐숢嗖", "ည쥙鎫"), TextureUrlPair("腺蛫龆뇘ậ莻", "᮳➄䛳碸䀠")});
    Test_CheckProps_SkinSpec("꾋葍﯐", false, {TextureUrlPair("个幚", ""), TextureUrlPair("ပ꙳㜢㠱뮄ᢿ砹", "뗔ゃ諪")});
    Test_CheckProps_SkinSpec("з", false, {TextureUrlPair("", "껲﹍"), TextureUrlPair("", "缰"), TextureUrlPair("�⥉嫾쀵ꑐ", "陨"), TextureUrlPair("젟󇸷쾨쯚迪", "ڄ课")});
    Test_CheckProps_SkinSpec("輖", false, {TextureUrlPair("览Ⱳ", "嘁�Ȩ㘅驹劣灤")});
    Test_CheckProps_SkinSpec("ᖦ涹㵲�젽ઌ", true, {TextureUrlPair("푍봴", "䪵"), TextureUrlPair("⼝줠딳落", "⿎譟䏭哧唨䌲㓂䗻"), TextureUrlPair("話亢൓⾽㖉ĕ�뎿", "擭硈勋⊲ǫ礳惴瘿"), TextureUrlPair("膐朳멫캿욀", "ྊ䐊罶㭹뱍᭲")});
    Test_CheckProps_SkinSpec("赯", true, {TextureUrlPair("꜔䤩", "▦⼛傟ꕅ"), TextureUrlPair("䋟嵎", "̐Ⲯ"), TextureUrlPair("핤촆᠅絵橱", "桅꣒뙤偌눘胪")});
    Test_CheckProps_SkinSpec("턴䅕ℶ࠿ㆸ", true, {TextureUrlPair("�䂁ㅽ遦ﾅ偂忺紘票彣", "剠ﺯ�")});
    Test_CheckProps_SkinSpec("ㇱ팜锏▽ꇲ䱐敫뒦숾", false, {TextureUrlPair("朓紸늹鷲尣", "墽욤츙촐"), TextureUrlPair("垇疫鳼歿捺퇵�", "떵�鷜™櫃"), TextureUrlPair("", "ڣ뢐಼떍魾Ꞃ"), TextureUrlPair("ꎥ띎", "穘覃᪯뺣幚쓼ሩ")});
    Test_CheckProps_SkinSpec("䟧", true, {TextureUrlPair("嫊冠愃躊ꁸᶝ腪", "愫팹룼崬銌꼾ǋ鯮"), TextureUrlPair("㋔伮묁폹╷䥾箉", "쓄퇗븇괘摄䃜")});
    Test_CheckProps_SkinSpec("濂笝췥뾴", false, {TextureUrlPair("擝ֈ胑苒ᒟ൒閪", "⠬⨚⢅"), TextureUrlPair("裹挬裀ǃ", "畹㘅놔筶ꑢ"), TextureUrlPair("Ꝙﺿю䗗ꕩ髽㱮", "꩓")});
    Test_CheckProps_SkinSpec("숅郸浃", false, {TextureUrlPair("뾆濾庰", "﵌雫忡閊뺌킮㴗퍶"), TextureUrlPair("㾕봠簜߲쫋", ""), TextureUrlPair("䈱렐ﴂ", "㾔"), TextureUrlPair("椃錂ᶨ쥒瓶➣빃鞿춪", "뭇⅖픻脍")});
    Test_CheckProps_SkinSpec("␁퀞�", false, {TextureUrlPair("鷞≦烛ྦ蠔嬙వ", "�쒿뱴墆�∗"), TextureUrlPair("뇆쟨", "挹"), TextureUrlPair("獘", ""), TextureUrlPair("᧫垃배⒔ퟭ焿◰熇髾", "⏉碼恷阀衴猱")});
    Test_CheckProps_SkinSpec("", false, {TextureUrlPair("虋㖈ᘈ缥躒�펀", "ᕉ豼೵㧑훷뢱⃹⑾⿚锔"), TextureUrlPair("瘤", "㙬ͳ邊迬"), TextureUrlPair("�獠罠㝎那끧", "窺◫Ī "), TextureUrlPair("䌒胐瘿냥�だ⾗", "")});
    Test_CheckProps_SkinSpec("", false, {TextureUrlPair("䂮뾟ᕫꕷ韭쿡塸��", ""), TextureUrlPair("䡖딇␮弢㒴캹차", "᤼蟋嵨㟠㕆蔎椑豫鰏"), TextureUrlPair("쯢脹⣞阳␫幣䤁瀱", "䥰�䳷쾞"), TextureUrlPair("몳덞帪㶩", "藅끴")});
    Test_CheckProps_SkinSpec("㯫", false, {TextureUrlPair("鈛ⰻப", ""), TextureUrlPair("쥎洺", "壂㖖䟴콠")});
    Test_CheckProps_SkinSpec("辞羡褡✸", false, {TextureUrlPair("睚혤", "㥳x䝦绅ⷊ"), TextureUrlPair("쁣", "薦䜾ຩῐ朿丯"), TextureUrlPair("樨", "귊ꮅ螯ꢁ콧퀫"), TextureUrlPair("䯻犖檣䗜띪鼖", "㶜⸉⁭䥉腪壋⣮坐")});
    Test_CheckProps_SkinSpec("੷삢ⱅᾠ唏", false, {TextureUrlPair("쀿", "�鏉쫿"), TextureUrlPair("弑쥶뙎䈢䞨泿쥄뒅蕾쪊", "輂ᅼ"), TextureUrlPair("醈�铙ឡ撨㱫㻃", "⶯铊氓貥喅")});
    Test_CheckProps_SkinSpec("葉崵崜뼺쪌頌", false, {TextureUrlPair("", "麖")});
    Test_CheckProps_SkinSpec("ꔛ覩䢕槓", true, {TextureUrlPair("椪", "끕蘆㉰춈ꪦﵥ⁥㦠ꣃ"), TextureUrlPair("캠雜胅챉ﾸ൫䄼㓝칰", "镆ᨷ"), TextureUrlPair("", "⮲﫩ᬀ으ꦒᢆ民"), TextureUrlPair("⸏䪉�㛐", "娠趯प沱")});
    Test_CheckProps_SkinSpec("ꏝ뙪", false, {TextureUrlPair("笍ᐠꟊ䱤㖹", "킱봣쩰"), TextureUrlPair("⅒蓉囻䇑홂᫐", "鐶鉥")});
    Test_CheckProps_SkinSpec("㡙噬�䄀ੱ", true, {TextureUrlPair("푖鑶㺽而텞줌", "쵑쌂�恜"), TextureUrlPair("솁᠃穊", "ϱ㊢콖�"), TextureUrlPair("", "ᮎ씮"), TextureUrlPair("翪", "ⶐ")});
    Test_CheckProps_SkinSpec("ㄛ嶂�", false, {TextureUrlPair("", "窘룛擤咛夢ണ")});
  }
  
  bool unitTestResults_SkinSpec_Getters = runAsync(Tests_RegisterAll_SkinSpec_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_SkinSpec_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_SkinSpec', UnitTest_OpEqSimple_SkinSpec);
  }
  
  SkinSpec@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in baseModel, bool hasPlayerMesh, const TextureUrlPair@[] &in texturePairs) {
    SkinSpec@ o1 = SkinSpec(baseModel, hasPlayerMesh, texturePairs);
    SkinSpec@ o2 = SkinSpec(baseModel, hasPlayerMesh, texturePairs);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_SkinSpec() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", false, {TextureUrlPair("霋흽묌铱蝔ᔁ䀓", "਀ꩣ釪�麑遬徨탏"), TextureUrlPair("ﷰ눵뭩㵷衟춗䵩", "쭶퍉첯㚥涬")});
    OpEqSimple_Check("壝玃勑뤋펍캒ᨶ", false, {TextureUrlPair("ﶇ䚱윲冥㶶밑幖", "ʊ冿�Ⓢꖠ⋳䝅攨鑽烆"), TextureUrlPair("峵כֿ鐄ℛݙᚬ쇳濶", "ᬤ쿊菆︐좙桭"), TextureUrlPair("璊诛퇟鯚", "獔"), TextureUrlPair("氫ᚘ킅�叴뢦⇩㵣", "壉샴廗")});
    OpEqSimple_Check("䝕뭀ꃲ썵㞫䫆ើ鹆", true, {TextureUrlPair("噚셑燵㪆汀ᆣ젙", "䁏ਮ虴簪䤀"), TextureUrlPair("ꨕẽ뮱", "ʱᯜ鱦ࠡ"), TextureUrlPair("␜῰蹎쟳횱宙홧㉜는ꒋ", "蚵⧝耏盧"), TextureUrlPair("", "摃䍎␷윸ຯ")});
    OpEqSimple_Check("䀐硩钗", true, {TextureUrlPair("�", "嚅⒝ࣾ"), TextureUrlPair("�㏊뻹媋痰", "糓岁ꮸ㏧㽤᪮壐"), TextureUrlPair("⣣뾈噦", "⻰쬟칁"), TextureUrlPair("鳐ꈉʜ䀿", "")});
    OpEqSimple_Check("⬲櫇ꟙ栥鏡螫", false, {TextureUrlPair("耽裮", "㤬꾷ټ໿ꍱ꟤��"), TextureUrlPair("こꅯ껳", "锲釹ឰ")});
    OpEqSimple_Check("즣傪꼻", true, {TextureUrlPair("뛰�둕", "秨玹桗喐"), TextureUrlPair("괗饖㪟믢汢ꏠ⮶䋧館", "汆講㓤통�ﭝ豲氹φ")});
    OpEqSimple_Check("퓂䉰ꋗ嗳ರꈾ", true, {TextureUrlPair("墨큽咪઼側똶뙈", "ꛬ苵䎥�쭲鄻콨�"), TextureUrlPair("ꃢ｡뫇묯릕⛲", "瓪ﲥ疬᳢䩶㩒"), TextureUrlPair("", "�⧙곢歒愪ᱧᫎ"), TextureUrlPair("צ츷⩮", "ⱬ褑ཧ捺슅엎筄䄗灰ᔃ")});
    OpEqSimple_Check("祒蛕䥓", true, {TextureUrlPair("粄⅝挝㠊", "共䳶넊ᙓࡀ컒")});
    OpEqSimple_Check("", true, {TextureUrlPair("鬻피䌱踀뤅芸", "娣ዯ﷤賚�챀曹䚨"), TextureUrlPair("ꂋ", "갽郭뱜")});
    OpEqSimple_Check("⟹驵盲", false, {TextureUrlPair("㌌⻄", "띟璦Ⴗ婑"), TextureUrlPair("ᚭࣳ�﨑ğ", "બ⚟鰉ᡖ梉"), TextureUrlPair("룎ⶳ洂賥硬⭷혀ⴿ㓶", "螥㗓꒭→")});
    OpEqSimple_Check("䨾㶜☭ෳ", true, {TextureUrlPair("᣾킯䠧◐", "멖�"), TextureUrlPair("", "庈")});
    OpEqSimple_Check("녮ง", false, {TextureUrlPair("罚", ""), TextureUrlPair("↟ڹ錠쟓쎭뗧䢼", "㝳䵉"), TextureUrlPair("", ""), TextureUrlPair("㚽댯", "㎭啷⨍揉뭮瞐奺ဂ䳇")});
    OpEqSimple_Check("䥿톤聿妒ᫍ�", false, {TextureUrlPair("輨浉ㆠ㌔Ú銼磃헮躁", "㹪쉰龊〢ᔖ̉"), TextureUrlPair("鼗", "鬐鿹愶彄"), TextureUrlPair("ᗱ閯ﺸ娂ᑠ쟀냖", "")});
    OpEqSimple_Check("�ꊈ껿譍扆䡖図罛⢲", true, {TextureUrlPair("䷗넱�㙫姦䟧ఊꪫ", "圦긡"), TextureUrlPair("쳮쬤﨣ኛ믒趰忳", "숬勯ﵜ"), TextureUrlPair("鬋龕ຽҷ䋰ꭔ䧂脑囲ﻯ", "랔")});
    OpEqSimple_Check("흌", true, {TextureUrlPair("일ٸ顚辑죹⪱濱놿宦", "膞坫窀훱Ⅺ킠�鸋"), TextureUrlPair("⡋늟", "豮ⴈ")});
    OpEqSimple_Check("씅煍尪읒쪭剈", false, {TextureUrlPair("䣇ᚇ梅翂㳕࢏", "縰㷇"), TextureUrlPair("㵟蝅迨︧兀ࢺ鱈䛳啨", "ᄈ믋왚ꯂ喿�"), TextureUrlPair("֩੿퉛꿪⹳ꈰ", ""), TextureUrlPair("ө㩣�轏", "")});
    OpEqSimple_Check("∁衽", false, {TextureUrlPair("䂃堮", "ṱ帮—뜔愄츿첣⦝脘"), TextureUrlPair("馺൹貈", "暮㟄䷫킹륦了挧ﳗ"), TextureUrlPair("咂ﱉ皾澐쇞㍐དྷ썦癓簡", "뀰过�蝄合౜녜뎙"), TextureUrlPair("韠፧迒䌡", "녑")});
    OpEqSimple_Check("㳞繶藩륍韚킉", true, {TextureUrlPair("텒綒搅聍Ꟑᨎﳌ祊", "ɯ䃟"), TextureUrlPair("", "❮뙡여䯥鍮幘滆"), TextureUrlPair("絟磶▧汶틤榸倢", "禾ﾫ䅖ꏊ軃頴")});
    OpEqSimple_Check("ꑧ⩱ꛏ�암䢢갎穯쎙竗", false, {TextureUrlPair("✜ྦྷ擊", "낤햳釽⛧옩炰၃鉝"), TextureUrlPair("禗뻧쌜", ""), TextureUrlPair("讌弴ᄔ䮕밤ᬣ뾩ᨶ␫", "뀁م륳⏏᧎䫁詵䯻꼊赖")});
    OpEqSimple_Check("ⷀ듅㡐沁祿", false, {TextureUrlPair("챵ꏹ", "ᛁ�"), TextureUrlPair("ⅶ엱ǫ揆쟶孛﷤", "姐䊂⤭�Ჺ"), TextureUrlPair("魍镠", "ꩀ옲"), TextureUrlPair("休ￏ", "렳墄䖢⊎�ꮏ")});
    OpEqSimple_Check("븥ꖙ∴簾뱟", true, {TextureUrlPair("ໞ탬鏩Ⓜ恇闥媰", "근邺㣿䟫랴ퟭ씤�房댬"), TextureUrlPair("ȃㅞἄ辰思", "⹄̥グ"), TextureUrlPair("", "䱪㪪䀷픿ᨏ衔ΰ"), TextureUrlPair("퇭ꥑ듴䎇꺥侚綽ケ摓릺", "엄闼嵞뿭燨ꍶ⨙獵鳙")});
    OpEqSimple_Check("", false, {TextureUrlPair("", "띴勇"), TextureUrlPair("㥑海", "俵㧠儂攑짱")});
    OpEqSimple_Check("캌涒誀叞㇘㌬", false, {TextureUrlPair("", "攅樘犝ⳡ늵꜀㏔绨")});
    OpEqSimple_Check("", false, {TextureUrlPair("䢿眭᫜侯억맖Ⴙ潊", ""), TextureUrlPair("Ư⥣䞘", "�")});
    OpEqSimple_Check("툇", true, {TextureUrlPair("쟓", "冥풭"), TextureUrlPair("ꎝ", "氢봃鿒碀㿷䆞룦")});
    OpEqSimple_Check("뇗嵢ⵜ㲰핋嶣䇙寇", true, {TextureUrlPair("䞼壄桀蜿쾖촱", "䘄")});
    OpEqSimple_Check("┉堼彠", false, {TextureUrlPair("Ꮪ⹅㫋�べ", "�躌續"), TextureUrlPair("ꗭ뙌鉨恁䄈", "辞妝㩁⸳≚輒"), TextureUrlPair("䄕᳂꛰판눮㛆຺", "ꭰ蘣㴧"), TextureUrlPair("�쓩�噊딠㶷蠃ᚙ", "씌ည")});
    OpEqSimple_Check("毰덷僀ᖊἦ", false, {TextureUrlPair("油蒨騵岌ഠ", "ㆎ棌�곔櫽ꐫ␓쌍")});
    OpEqSimple_Check("ڷ寀�", false, {TextureUrlPair("ꫀ缎", "ⵡ㽀ᴧ")});
    OpEqSimple_Check("旺沣￟㸄ໟ䄺ꐶ", false, {TextureUrlPair("ீ憨", "뇺扐葁霤黟ꮪ辝뙉"), TextureUrlPair("떶⨨ᘟ戣", "ቒ녈㰚ㇿ"), TextureUrlPair("톓췾", ""), TextureUrlPair("ꤢ䎲⠋젿", "⹉㊘၁᫄鍹䨢䵟")});
    OpEqSimple_Check("筙Ỵ莙", false, {TextureUrlPair("곞ᘾꃥ촄㍕札펂ឝ", "ᖃ䩷")});
    OpEqSimple_Check("⻋忡", true, {TextureUrlPair("핈䌶୷媉軪砦", "㫷ൈ�ぞᓺ"), TextureUrlPair("긺簼곽⺲", "㗲玬욢죚뫦号"), TextureUrlPair("剎䌅糣Ӄഷঢ㻀⼚", "麎靜ꖛⳤ餥ᇭ묽ᴂ")});
    OpEqSimple_Check("棓쿏ϑ᠟釿뾂䌑ᕊ", false, {TextureUrlPair("翌㾂閈", "鍜ꆟ")});
    OpEqSimple_Check("戙᤿䜦鈷兔呃율", true, {TextureUrlPair("昿ⅵ�졻ꏳ沗怛쯂", "珱"), TextureUrlPair("䄴ꓛ廉", "铨"), TextureUrlPair("�黾ᔏ셂몚첈㋨츌䞸", "ݿ厪ꎢң")});
    OpEqSimple_Check("㤾䝤㰯䕼", true, {TextureUrlPair("轘␼℡짉", "䨴쏸휞"), TextureUrlPair("멅⠟", "⣻ّḧ"), TextureUrlPair("㛠஑뚀�", "✷㈳﷥똭퓄﮵")});
    OpEqSimple_Check("즹␥㼳쬺義瘺", false, {TextureUrlPair("멕纍ⷒ艜᫮⪙", "怣")});
    OpEqSimple_Check("餗뼂�", false, {TextureUrlPair("昳占㵊㱲﹒푽", "ɓקּ"), TextureUrlPair("륑깾귵獦", ""), TextureUrlPair("⾁ᱡ䋢", "幺ਗ਼ᓊ鹿ݚ띤"), TextureUrlPair("", "ⴑ鋆㫊훝")});
    OpEqSimple_Check("嵞䄁緯壣媂ᆠ", false, {TextureUrlPair("烖ᩬ䎠", "좑콤삓ȴ劗ᄼ잷輠"), TextureUrlPair("쭖㟧", "ꑆ鷍뒦羊テ"), TextureUrlPair("䬰왊姭칲ﲤ荏嬸虶댓", "㢋ꮂ")});
    OpEqSimple_Check("㫬䠜ヸഫ傻䂓", true, {TextureUrlPair("聮怴䭝힢", "㉫"), TextureUrlPair("솫劊좂響ض쭂槶ﾽ꒿㣶", "㎾腒鸒닞鉤⡄꺁")});
    OpEqSimple_Check("什ꋃ鱚઄᷼嬺", true, {TextureUrlPair("", "㑯")});
    OpEqSimple_Check("崙浱�ﵿ쀡宰�橈", true, {TextureUrlPair("닯薾뼁곒윶", "䐙ꛎ葨皣懁夀㎛圚챞")});
    OpEqSimple_Check("齑간㴳鮙", true, {TextureUrlPair("绱㑝韼", "匇")});
  }
  
  bool unitTestResults_SkinSpec_OpEq = runAsync(Tests_RegisterAll_SkinSpec_OpEq);
}
#endif