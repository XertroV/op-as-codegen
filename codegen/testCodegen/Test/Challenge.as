#if UNIT_TEST
namespace Test_Challenge {
  /* Test // Mixin: Common Testing */
  void assert(bool condition, const string &in msg) {
    if (!condition) {
      throw('Assert failed: ' + msg);
    }
  }
  
  void debug_trace(const string &in msg) {
    trace(msg);
  }
  
  bool UnitTest_Common_Nop() {
    return true;
  }
  
  bool unitTestResults_Challenge_CommonTesting = true
    && UnitTest_Common_Nop()
    ;
  
  /* Test // Mixin: Getters */
  bool Test_CheckProps_Challenge(uint id, const string &in uid, const string &in name, uint startDate, uint endDate, uint leaderboardId) {
    Challenge@ tmp = Challenge(id, uid, name, startDate, endDate, leaderboardId);
    assert(id == tmp.id, 'field id with value `' + id + '`');
    assert(uid == tmp.uid, 'field uid with value `' + uid + '`');
    assert(name == tmp.name, 'field name with value `' + name + '`');
    assert(startDate == tmp.startDate, 'field startDate with value `' + startDate + '`');
    assert(endDate == tmp.endDate, 'field endDate with value `' + endDate + '`');
    assert(leaderboardId == tmp.leaderboardId, 'field leaderboardId with value `' + leaderboardId + '`');
    return true;
  }
  
  bool UnitTest_Challenge_Getters() {
    Test_CheckProps_Challenge(394184, "馩", "躮", 980813, 825164, 378662);
    Test_CheckProps_Challenge(252919, "蜽韋�╝", "鰉", 14178, 409104, 402441);
    Test_CheckProps_Challenge(464786, "鳔ꂆऒ涮�뗗", "﶑䙢꺰ꦞ", 504000, 654758, 678612);
    Test_CheckProps_Challenge(605730, "�⿵枵ⴾ㬪●ꜛ", "彲⏈", 265299, 476140, 324910);
    Test_CheckProps_Challenge(49504, "握", "㷗᤾虝䰒ஷ", 149817, 853156, 438676);
    Test_CheckProps_Challenge(425498, "", "豈", 224303, 788874, 44714);
    Test_CheckProps_Challenge(425650, "拣䵱䌏�㯂ᓭ", "뽥뤎祰ᇡᒧឝ밇", 999977, 502172, 837902);
    Test_CheckProps_Challenge(183274, "鏓", "㈣揘䢊儞祹㚏", 290417, 254860, 984066);
    Test_CheckProps_Challenge(544625, "鈤ꦀ", "㎀꿈�ᴶ๏㕭∸缲䁏뤥", 985736, 972616, 680656);
    Test_CheckProps_Challenge(509010, "撏랭", "�׭駭겯ƴ", 926979, 620839, 892156);
    Test_CheckProps_Challenge(363342, "", "䵙", 264138, 345680, 37504);
    Test_CheckProps_Challenge(847011, "弊䮷⃷쨗蝢ᳳ", "㶑ꔘₜ齬聎雄攩澴", 135571, 428782, 785817);
    Test_CheckProps_Challenge(966274, "옡뭱過ଚ㩕", "뙱䕂륦홰떌䱇盰쩑", 428390, 96314, 704214);
    Test_CheckProps_Challenge(611458, "᥾鼾㮦窘ᤲ쯳枦섍鐷痚", "ୣ筃痒胊의䉶杻�죝", 392980, 565032, 395859);
    Test_CheckProps_Challenge(848880, "ⵑ᠟Ꮍ⁭豹理癙", "＠߇₹紇", 920965, 982620, 978653);
    Test_CheckProps_Challenge(334968, "⋛䨗ও�휋℃벷쨭욢", "鶧ㆌ痒", 181358, 266408, 312816);
    Test_CheckProps_Challenge(315253, "森ⶍභࢆ⑧", "沕К߄뽇㪢㸿ᓮₙ", 22089, 401867, 691035);
    Test_CheckProps_Challenge(773592, "", "蔟Ι龲ꇗ⡔辅⭉", 454352, 78530, 529329);
    Test_CheckProps_Challenge(83328, "쐭ғ㒴퟽ᗦ㴟봨ￊ", "", 518141, 153623, 2628);
    Test_CheckProps_Challenge(772861, "", "ᔻἚ", 833723, 27085, 506361);
    Test_CheckProps_Challenge(903157, "༏큝㫓", "ힼ㼓", 808460, 108758, 772472);
    Test_CheckProps_Challenge(107812, "谥缃ಟ킐⁮ꕕ뉲�工", "۟弜쌘㙛핺﫽㑪㿊", 694416, 783971, 913764);
    Test_CheckProps_Challenge(883796, "Ҹꃈ䮣ᬬ", "㻗﬽팊�슍郫홟㕤", 497196, 724861, 452001);
    Test_CheckProps_Challenge(447526, "狥Ü매剟䝛튟뿎ວ", "聹匂仰䭬鹃ȟ薲", 885581, 948170, 333021);
    Test_CheckProps_Challenge(731067, "⧞픭蚏ࣼ䪞㧯䦴귏", "㈾នﯸ滣轁竁怒ৈ", 623470, 438389, 805260);
    Test_CheckProps_Challenge(752226, "פ", "�淲ﺆ跏㜤샱镧畉弐", 901310, 771561, 357901);
    Test_CheckProps_Challenge(952652, "妐檣袿칉谜訷໰胖", "뚪䬹칭烈罽췜歵ȧㄚ", 582898, 482768, 925363);
    Test_CheckProps_Challenge(355531, "ጢ", "豺댜￰", 407047, 990522, 133511);
    Test_CheckProps_Challenge(930210, "嵐䓸瀓䳻Ჵ﨑", "", 147555, 303027, 462299);
    Test_CheckProps_Challenge(965014, "㼘ⵏ骗", "⋵隸꫍痈", 666968, 969195, 468413);
    Test_CheckProps_Challenge(455407, "ꭢធ沈", "ꏛ", 575293, 650559, 361945);
    Test_CheckProps_Challenge(900907, "啕ኞ衍蛜", "䃿fྔ㐔ᡄ鷂", 409258, 487252, 847881);
    Test_CheckProps_Challenge(974829, "揉筢㲸", "穂Hᡶ⛥杭貴溪৥롰꬜", 717791, 449432, 307209);
    Test_CheckProps_Challenge(349405, "啞婓菨뻟௎餵긽榈", "溊䷡꬈फ़Ը㌲狊⵪诨⥇", 684845, 571451, 914746);
    Test_CheckProps_Challenge(375598, "밃괦㮜䔐炒悄௶揸ꥒ叵", "贙殺뱆ᩖ彐", 490417, 744440, 498609);
    Test_CheckProps_Challenge(237947, "", "⿳훿☸꤫睊", 605257, 915086, 489560);
    Test_CheckProps_Challenge(284881, "㗻壺旻", "ದ鴆䟎他�", 412232, 772864, 760754);
    Test_CheckProps_Challenge(963563, "�䅴", "阊额禱鍾齪床὏勐", 437881, 957451, 439545);
    Test_CheckProps_Challenge(819074, "헽⇐춻嶻㐙㷀뵌慔", "⃙㾥괶", 516520, 961253, 905806);
    Test_CheckProps_Challenge(387647, "쩢姽ἆ奨", "ꌗ枚逳剭ﺏ柙", 282186, 400614, 951189);
    Test_CheckProps_Challenge(894450, "컏�嚌", "⶯弸", 751600, 82673, 881873);
    Test_CheckProps_Challenge(44403, "륍虋陱濣灈￨℈⩝ꝶ", "莻ጺ䭉胼ᑝ쨀", 873724, 994918, 343715);
    print('\\$2f6Unit Test Success: UnitTest_Challenge_Getters (42 tests)');
    return true;
  }
  
  bool unitTestResults_Challenge_Getters = true
    && UnitTest_Challenge_Getters()
    ;
  
  /* Test // Mixin: Row Serialization */
  bool Test_SzThenUnSz_Check(uint id, const string &in uid, const string &in name, uint startDate, uint endDate, uint leaderboardId) {
    Challenge@ tmp = Challenge(id, uid, name, startDate, endDate, leaderboardId);
    assert(tmp == Challenge::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  bool UnitTest_SzThenUnSz_Challenge() {
    Test_SzThenUnSz_Check(823221, "�朹鎟ﳙ㻲翾鵜靀㍒", "ﰙ⠁玭텆", 325863, 922558, 661263);
    Test_SzThenUnSz_Check(436830, "쯣欚", "⿕氎꼻㤚藴킅", 964425, 605220, 262638);
    Test_SzThenUnSz_Check(498192, "", "賄�匼뒱", 826942, 906038, 616400);
    Test_SzThenUnSz_Check(263354, "푲෗蔃䓥㻥", "䟃넲䗵蹟牪", 322150, 614406, 417104);
    Test_SzThenUnSz_Check(547338, "쬙ꅇ᭧봅≹", "�ౝ", 629002, 832887, 693999);
    Test_SzThenUnSz_Check(4946, "︠걿좳樁㠵", "髣蘟먝瞄⧛鉼竲", 392550, 83184, 876484);
    Test_SzThenUnSz_Check(70271, "㏰鉓켯τ㪔ﻊ爛", "ꈽ洞⤦➦踆⌾", 4920, 122428, 837623);
    Test_SzThenUnSz_Check(615687, "䩸Ὼ", "", 964248, 970574, 467845);
    Test_SzThenUnSz_Check(956732, "퍻䳥最徐㭾멭Პ䑰", "䟥ፕ⎃ﲀᦓ솛格둪", 234787, 700902, 853957);
    Test_SzThenUnSz_Check(759104, "剼᪲ꮚ෌", "ⰳ팑ꇬ䋶慸", 405127, 314974, 151896);
    Test_SzThenUnSz_Check(129142, "ㅡ螘笣䨯䄸", "璫⃔煡욣", 908297, 233268, 471390);
    Test_SzThenUnSz_Check(341399, "淡", "뙸줒女ѽ泡誄狋撧곟", 356559, 161330, 809993);
    Test_SzThenUnSz_Check(973135, "⻖㋽", "雈皇殤膕躯蓬㥊", 820813, 647490, 647392);
    Test_SzThenUnSz_Check(868449, "�〿Ꝼ샛ᣱ", "ӑ䞖猏鐪﹀ྏ䅳税", 729161, 92, 558576);
    Test_SzThenUnSz_Check(297578, "⸕숈祭鑚ൃ", "䯯桾뭎挘殤掙얷ᐮጧ", 147932, 493491, 300346);
    Test_SzThenUnSz_Check(447767, "樦纍ﲀ⧝�䄳凜", "Ꮪ猾ؙ太蠵", 99463, 860757, 909951);
    Test_SzThenUnSz_Check(951620, "鋣ꊌ멉녍ഩ਽䫚蜳㽤쎮", "⿺⯌憎祖羔", 209790, 723283, 128346);
    Test_SzThenUnSz_Check(859526, "᭬퇠至៳", "샩愍꩸㸵刪", 606450, 478495, 271620);
    Test_SzThenUnSz_Check(651952, "疧ꅦ", "", 116699, 616919, 769796);
    Test_SzThenUnSz_Check(544943, "䂁", "ᡊ︆᤾℟仅䃜쪪㌲", 876904, 384560, 271358);
    Test_SzThenUnSz_Check(595771, "䶂簜饋᲏඿", "䷗鷪묡拠銢᜼錢", 450685, 913447, 380426);
    Test_SzThenUnSz_Check(542068, "ꇖⲽ", "", 884816, 252573, 449721);
    Test_SzThenUnSz_Check(421428, "ຶꔽﾜᵏ䒴", "譥횓ƹ", 360995, 43735, 133754);
    Test_SzThenUnSz_Check(771161, "琧", "쎆㊆⯟骙䁣", 983651, 768217, 477588);
    Test_SzThenUnSz_Check(555890, "麃犿", "陣띰摼푔⼧", 487546, 504451, 808646);
    Test_SzThenUnSz_Check(898762, "ﴋᮝ", "▫윁벼", 233228, 57986, 455286);
    Test_SzThenUnSz_Check(886316, "댢㌠商ᅾ", "箯浔陳᳚乹ﻺ鮷囫я", 482962, 745915, 315247);
    Test_SzThenUnSz_Check(912496, "�桮럫憍ᕝ芜쎡韠", "", 577624, 959424, 779544);
    Test_SzThenUnSz_Check(141403, "", "쒿№妝�並㈛贆", 930027, 532104, 633576);
    Test_SzThenUnSz_Check(854263, "똣궆暱여군햛", "ﷺ⋏晆뗭", 27512, 645217, 635672);
    Test_SzThenUnSz_Check(394180, "႙趹攘ꆓ믔ы", "낊㮄瓲", 680346, 153507, 335942);
    Test_SzThenUnSz_Check(779011, "鱫댫", "鉠", 491930, 695761, 478307);
    Test_SzThenUnSz_Check(405974, "仚饩�Ꮚ혹霭䞓盅", "鳊鍽扐肑レ", 896003, 238891, 267100);
    Test_SzThenUnSz_Check(216236, "ﶾ鞞㉪屹팑", "뒧", 416887, 193882, 131058);
    Test_SzThenUnSz_Check(392530, "�", "䞓㕋", 829491, 742412, 433578);
    Test_SzThenUnSz_Check(786049, "婌ਠ愤섉韭쟰튤⟫", "췭栴省ᨱ흴뒭㺡࣊", 159725, 498260, 41159);
    Test_SzThenUnSz_Check(178803, "蛱왓꿨᳁ْଠ墻", "忧ⷾ챲퉗溕㹅灜桩弜", 727940, 382451, 621003);
    Test_SzThenUnSz_Check(307142, "尷", "놲싵뇵쯷", 581686, 977267, 266241);
    Test_SzThenUnSz_Check(93150, "ꇑﾷꃦ", "␬", 953518, 283816, 334966);
    Test_SzThenUnSz_Check(17733, "Ⱄㄺ꛼㻔㴕", "窗䊨㎠๥Ⲣ⪒冁", 896342, 154401, 373048);
    Test_SzThenUnSz_Check(125776, "ꨟ泒擵䆲罋婬", "ૐ", 363891, 810147, 786060);
    Test_SzThenUnSz_Check(403152, "옮伴ꁧⓚ紝쾲铃켴돺", "ᚡ窓", 576027, 20949, 788899);
    print('\\$2f6Unit Test Success: UnitTest_SzThenUnSz_Challenge (42 tests)');
    return true;
  }
  
  bool unitTestResults_Challenge_RowSerialization = true
    && UnitTest_SzThenUnSz_Challenge()
    ;
}
#endif