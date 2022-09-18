#if UNIT_TEST
namespace Test_TextureUrlPair {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_TextureUrlPair_CommonTesting() {
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
  
  bool unitTestResults_TextureUrlPair_CommonTesting = runAsync(Tests_RegisterAll_TextureUrlPair_CommonTesting);
  
  /* Test // Mixin: ToFrom JSON Object */
  void Tests_RegisterAll_TextureUrlPair_ToFromJSONObject() {
    RegisterUnitTest('UnitTest_ToJsonFromJson_TextureUrlPair', UnitTest_ToJsonFromJson_TextureUrlPair);
  }
  
  bool Test_ToJsonFromJson_Check(const string &in filename, const string &in url) {
    TextureUrlPair@ tmp = TextureUrlPair(filename, url);
    assert(tmp == TextureUrlPair(tmp.ToJson()), 'ToJsonFromJson fail: ' + Json::Write(tmp.ToJson()));
    return true;
  }
  
  void UnitTest_ToJsonFromJson_TextureUrlPair() {
    Test_ToJsonFromJson_Check("", "ꠂ쮰");
    Test_ToJsonFromJson_Check("ᮔ﵇獣", "ᱶ谛䆳ꔼ躜ಙ㟊罐㳋뽄");
    Test_ToJsonFromJson_Check("䚏꼸䃧쁐", "澯�჌");
    Test_ToJsonFromJson_Check("�", "汯粌鉅");
    Test_ToJsonFromJson_Check("框雱燐꬝", "㟳䢕颒饣ퟶ");
    Test_ToJsonFromJson_Check("ꦻ땬黿救솳", "ᲊ̇॑");
    Test_ToJsonFromJson_Check("堉", "ｓ");
    Test_ToJsonFromJson_Check("摂ꖶ鍁紙", "遐鬱峝뻴");
    Test_ToJsonFromJson_Check("", "懇�客㒞᫯볠");
    Test_ToJsonFromJson_Check("朣뵧칒튪윷窋澵", "䞚㌴⦱扬");
    Test_ToJsonFromJson_Check("旰蓡柿ஷ", "봌彺য়ꬢ毝榆");
    Test_ToJsonFromJson_Check("▏᯿", "ﱻ狀ꆟ㾩炤䩦ᛥ婫");
    Test_ToJsonFromJson_Check("缧", "羘렷뵫皼䦋");
    Test_ToJsonFromJson_Check("텫ᤊ�常祈ᵒ", "ྈ佛");
    Test_ToJsonFromJson_Check("", "놪☼앇炄㐕畍鞙栥");
    Test_ToJsonFromJson_Check("ᒽ罆鹌ﲒ", "ᩁ㟅");
    Test_ToJsonFromJson_Check("⨗萃쎉뮏", "⻖蚇");
    Test_ToJsonFromJson_Check("䔜", "鿊坯켫ꗥ쟭");
    Test_ToJsonFromJson_Check("窐踎윉懜翊신꨻በ", "충왦굸褢鶳");
    Test_ToJsonFromJson_Check("퓹ꔴ㳇୭鹥灦", "Ηꨘ");
    Test_ToJsonFromJson_Check("�ꧾ큽ⷾ뮁d更", "鍡轔");
    Test_ToJsonFromJson_Check("搢趀絀죤箖质ᣙ욗恦", "뗃㷦⏓箝썷");
    Test_ToJsonFromJson_Check("㏬蠑坖澂ꉃ뒅Ὄ", "៯ꭍڑ쀈ⵗ");
    Test_ToJsonFromJson_Check("벛ﳾ啃둸瀀", "ᢻ샞饤浏䴾퍂蘇賻");
    Test_ToJsonFromJson_Check("符䭭澀⽹ᱶ爅螝⬣", "∝");
    Test_ToJsonFromJson_Check("ᖦﭭ见禁䡼淣럸튦蘥気", "੉Ⱬꖗ");
    Test_ToJsonFromJson_Check("쎧ᨘ퉁", "㖄瑁캳륣");
    Test_ToJsonFromJson_Check("┛輄虼裳엽뷗", "쐤얪㵁㢝蔹ｽ≨⢮");
    Test_ToJsonFromJson_Check("쒜≁隵ꄻ�ঽ㎒�郁❨", "ᘭ☖甩ῶ");
    Test_ToJsonFromJson_Check("ꨝꮄ轓᧦㗭再섚", "籕ￌ龎");
    Test_ToJsonFromJson_Check("ꗸ롼", "豣閑㏲ᔲ逥좣㉒");
    Test_ToJsonFromJson_Check("", "䮪");
    Test_ToJsonFromJson_Check("淐꺒Ｅ澮촎", "딙授↳웡");
    Test_ToJsonFromJson_Check("턜㧷わ銂⧼馣谱", "鈧䴨餶갯");
    Test_ToJsonFromJson_Check("ᯕᔺ痯겶", "颤짒傉");
    Test_ToJsonFromJson_Check("髷漻拹ⓨ淪", "ꢶ嗲聅䄳ㆳ尉ź恮");
    Test_ToJsonFromJson_Check("瑏求뺝숯䐪䈞䞞䜋歹☰", "몖괩");
    Test_ToJsonFromJson_Check("来", "");
    Test_ToJsonFromJson_Check("ŀཎ؏쀯㖩ꅽ딚圤쯼벮", "髍澇㤘▝ħ蔋팪絠촊");
    Test_ToJsonFromJson_Check("鿉穏뫤࡙攴쑋", "殠齒䡬뾋뿰");
    Test_ToJsonFromJson_Check("湾ᾬ 讈䗺⼎Ԍ臋", "霋枒৹聸");
    Test_ToJsonFromJson_Check("춤ᴼ馿ꞑ", "哻咷㟞曘靳");
  }
  
  bool unitTestResults_TextureUrlPair_ToFromJSONObject = runAsync(Tests_RegisterAll_TextureUrlPair_ToFromJSONObject);
  
  /* Test // Mixin: Getters */
  void Tests_RegisterAll_TextureUrlPair_Getters() {
    RegisterUnitTest('UnitTest_TextureUrlPair_Getters', UnitTest_TextureUrlPair_Getters);
  }
  
  bool Test_CheckProps_TextureUrlPair(const string &in filename, const string &in url) {
    TextureUrlPair@ tmp = TextureUrlPair(filename, url);
    assert(filename == tmp.filename, 'field filename with value `' + filename + '`');
    assert(url == tmp.url, 'field url with value `' + url + '`');
    return true;
  }
  
  void UnitTest_TextureUrlPair_Getters() {
    Test_CheckProps_TextureUrlPair("�￿躮䮠馩�", "㧖⢢羋⽪㎜৏렊");
    Test_CheckProps_TextureUrlPair("鰉橿蜽韋�╝㸌", "疍");
    Test_CheckProps_TextureUrlPair("콠", "酞韫㘇힞�");
    Test_CheckProps_TextureUrlPair("鳔ꂆऒ涮�뗗", "﶑䙢꺰ꦞ");
    Test_CheckProps_TextureUrlPair("㬪●ꜛ귦翮漽똮", "먳�⿵枵");
    Test_CheckProps_TextureUrlPair("۫芁≲彲", "콬");
    Test_CheckProps_TextureUrlPair("�拺윰", "㞪㷗᤾虝䰒ஷ");
    Test_CheckProps_TextureUrlPair("듡鷰那춴庂ᄼ", "尚豈젮훇懓奲쮄⸔");
    Test_CheckProps_TextureUrlPair("ꑙ", "㵹徲㼏");
    Test_CheckProps_TextureUrlPair("拣䵱䌏�㯂ᓭ", "뽥뤎祰ᇡᒧឝ밇");
    Test_CheckProps_TextureUrlPair("䇢", "윃ᆟ퇚箺᧸䤩");
    Test_CheckProps_TextureUrlPair("揘䢊儞祹㚏풓", "쿽騍큋");
    Test_CheckProps_TextureUrlPair("뭷", "蹪鈤ꦀ㔭");
    Test_CheckProps_TextureUrlPair("㎀꿈�ᴶ๏㕭∸缲䁏", "㪂");
    Test_CheckProps_TextureUrlPair("ᇁ﹀賊惍됞", "撏랭");
    Test_CheckProps_TextureUrlPair("�׭駭겯ƴ", "쭜䢝");
    Test_CheckProps_TextureUrlPair("䵙嗍珐瀮㍿", "阚⦈郶炼");
    Test_CheckProps_TextureUrlPair("弊䮷⃷쨗蝢ᳳ쁼", "㶑ꔘₜ齬聎雄攩澴");
    Test_CheckProps_TextureUrlPair("뭱過ଚ㩕ၪ㩾껫墰", "䕂륦홰떌䱇盰쩑虿");
    Test_CheckProps_TextureUrlPair("鐷痚ꄻ滇�ꒉ㳀䈾", "枦");
    Test_CheckProps_TextureUrlPair("䉶杻�죝ᝫ᥾鼾㮦窘ᤲ", "ୣ筃痒胊");
    Test_CheckProps_TextureUrlPair("墒≜蔗塚", "᠟Ꮍ⁭豹理癙⤊웪");
    Test_CheckProps_TextureUrlPair("⏋릈䨕＠߇₹紇秉", "읝㆒刱❕騐헵�");
    Test_CheckProps_TextureUrlPair("벷쨭욢璞�ᐡ", "䨗ও�휋");
    Test_CheckProps_TextureUrlPair("ꗸ鶧ㆌ痒㇌", "퍑");
    Test_CheckProps_TextureUrlPair("", "森ⶍභࢆ⑧");
    Test_CheckProps_TextureUrlPair("沕К߄뽇㪢㸿ᓮₙ", "鄠짭㦟");
    Test_CheckProps_TextureUrlPair("", "蔟Ι龲ꇗ⡔辅⭉");
    Test_CheckProps_TextureUrlPair("ￔ쥲兆崤颦", "쐭ғ㒴퟽ᗦ㴟봨");
    Test_CheckProps_TextureUrlPair("", "㱷ဥ院");
    Test_CheckProps_TextureUrlPair("䃹눭쯺", "쫉䶶");
    Test_CheckProps_TextureUrlPair("鷦耢鬗⁴炆ᔻἚ", "༏큝㫓Ⴒ嶹堠");
    Test_CheckProps_TextureUrlPair("ힼ㼓", "⁮ꕕ뉲�工턈鉚枛");
    Test_CheckProps_TextureUrlPair("ಟ", "뼊谥");
    Test_CheckProps_TextureUrlPair("็۟弜쌘㙛핺﫽㑪", "쮞覑甃縎");
    Test_CheckProps_TextureUrlPair("", "Ҹꃈ䮣ᬬ컵嶐");
    Test_CheckProps_TextureUrlPair("㻗﬽팊�슍郫홟㕤", "䝛튟뿎ວ扚듍꩐瘁쪟怢");
    Test_CheckProps_TextureUrlPair("狥Ü매", "聹匂仰䭬鹃ȟ薲");
    Test_CheckProps_TextureUrlPair("䵌‱䘢먔᫣", "귏毥᥃");
    Test_CheckProps_TextureUrlPair("픭蚏ࣼ䪞㧯", "នﯸ滣轁竁怒ৈ⍪");
    Test_CheckProps_TextureUrlPair("惗酁଱᮷", "畉弐狝פ뤫硥");
    Test_CheckProps_TextureUrlPair("�淲ﺆ跏㜤샱", "틖ꎀ");
  }
  
  bool unitTestResults_TextureUrlPair_Getters = runAsync(Tests_RegisterAll_TextureUrlPair_Getters);
  
  /* Test // Mixin: Op Eq */
  void Tests_RegisterAll_TextureUrlPair_OpEq() {
    RegisterUnitTest('UnitTest_OpEqSimple_TextureUrlPair', UnitTest_OpEqSimple_TextureUrlPair);
  }
  
  TextureUrlPair@ lastChecked = null;
  
  bool OpEqSimple_Check(const string &in filename, const string &in url) {
    TextureUrlPair@ o1 = TextureUrlPair(filename, url);
    TextureUrlPair@ o2 = TextureUrlPair(filename, url);
    assert(o1 == o2, 'OpEqSimple_Check fail for obj: ' + o1.ToString());
    assert(o1 != lastChecked, 'OpEqSimple_Check failed comparing to last obj');
    @lastChecked = o1;
    return true;
  }
  
  void UnitTest_OpEqSimple_TextureUrlPair() {
    OpEqSimple_Check("欽᩻⫤䨣叒䝇", "춗䵩첏㞟");
    OpEqSimple_Check("㚥涬凙ﷰ눵뭩㵷", "⃩쭶퍉");
    OpEqSimple_Check("", "霋흽묌铱蝔");
    OpEqSimple_Check("਀ꩣ釪�麑遬徨탏", "壝玃勑뤋펍캒ᨶ");
    OpEqSimple_Check("叴뢦⇩㵣䎵", "핦壉샴廗ᦷ氫ᚘ킅");
    OpEqSimple_Check("诛퇟", "ᚬ쇳濶鵛獔楷");
    OpEqSimple_Check("︐좙桭垛峵כֿ鐄ℛ", "冥㶶밑幖許ᬤ쿊菆");
    OpEqSimple_Check("䝅攨鑽烆ঙﶇ䚱", "ʊ冿�Ⓢꖠ");
    OpEqSimple_Check("䝕뭀ꃲ썵㞫䫆ើ鹆", "鎤쎣");
    OpEqSimple_Check("摃䍎␷윸ຯ", "␜῰蹎쟳횱宙홧㉜는ꒋ");
    OpEqSimple_Check("蚵⧝耏盧", "ꨕẽ뮱");
    OpEqSimple_Check("ʱᯜ鱦ࠡ", "噚셑燵㪆汀ᆣ젙");
    OpEqSimple_Check("䁏ਮ虴簪䤀", "䀐硩钗");
    OpEqSimple_Check("䀿虿砍", "픽鳐ꈉ");
    OpEqSimple_Check("⣣뾈噦", "⻰쬟칁");
    OpEqSimple_Check("�㏊뻹媋痰", "糓岁ꮸ㏧㽤᪮壐");
    OpEqSimple_Check("�", "嚅⒝ࣾ");
    OpEqSimple_Check("⬲櫇ꟙ栥鏡螫", "ꅯ껳ሌ");
    OpEqSimple_Check("耽裮ዖ锲釹ឰ墐", "໿ꍱ꟤��뙑");
    OpEqSimple_Check("㤬꾷", "즣傪꼻");
    OpEqSimple_Check("汢ꏠ⮶䋧館胄", "괗饖㪟");
    OpEqSimple_Check("汆講㓤통�ﭝ豲氹φ", "뛰�둕");
    OpEqSimple_Check("秨玹桗喐", "퓂䉰ꋗ嗳ರꈾ");
    OpEqSimple_Check("ώ", "צ츷⩮");
    OpEqSimple_Check("ⱬ褑ཧ捺슅엎筄䄗灰ᔃ", "");
    OpEqSimple_Check("�⧙곢歒愪ᱧᫎ", "ꃢ｡뫇묯릕⛲");
    OpEqSimple_Check("瓪ﲥ疬᳢䩶㩒", "墨큽咪઼側똶뙈");
    OpEqSimple_Check("ꛬ苵䎥�쭲鄻콨�", "祒蛕䥓");
    OpEqSimple_Check("�", "粄⅝挝㠊");
    OpEqSimple_Check("共䳶넊ᙓࡀ컒", "");
    OpEqSimple_Check("", "뱜悶ꂋ鰲");
    OpEqSimple_Check("", "踀뤅芸덍");
    OpEqSimple_Check("䌱", "篱鬻");
    OpEqSimple_Check("娣ዯ﷤賚�챀曹", "⟹驵盲");
    OpEqSimple_Check("賥硬⭷혀ⴿ㓶ࣛﬣ", "꒭→⣦룎ⶳ");
    OpEqSimple_Check("﨑ğ螥", "ᚭࣳ");
    OpEqSimple_Check("鰉ᡖ", "");
    OpEqSimple_Check("띟璦Ⴗ婑遚㌌⻄㕹", "䨾㶜☭ෳ");
    OpEqSimple_Check("撍䈒", "庈");
    OpEqSimple_Check("᣾킯䠧◐", "멖�");
    OpEqSimple_Check("녮ง", "텩㚽댯맑힊");
    OpEqSimple_Check("瞐奺ဂ", "㎭啷⨍揉");
  }
  
  bool unitTestResults_TextureUrlPair_OpEq = runAsync(Tests_RegisterAll_TextureUrlPair_OpEq);
}
#endif