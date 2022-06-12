#if UNIT_TEST
namespace Test_Challenge {
  /* Test // Mixin: Common Testing */
  void assert(const bool condition, const string &in msg) {
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
    print('\\$2f6Unit Test Success: UnitTest_Challenge_Getters');
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
    print('\\$2f6Unit Test Success: UnitTest_SzThenUnSz_Challenge');
    return true;
  }
  
  bool unitTestResults_Challenge_RowSerialization = true
    && UnitTest_SzThenUnSz_Challenge()
    ;
}
#endif