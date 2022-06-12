#if UNIT_TEST
namespace Test_Challenge {
  /* Test // Mixin: Common Testing */
  void assert(const bool condition, const string &in msg) {
    if (!condition) {
      throw('Assert failed: ' + msg);
    }
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
  
  bool UnitTest_Main_Challenge() {
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
    print('\\$2f6Unit Test Success: UnitTest_Main_Challenge');
    return true;
  }
  
  bool unitTestResults_Challenge_Getters = true
    && UnitTest_Main_Challenge()
    ;
  
  /* Test // Mixin: Row Serialization */
  bool Test_SzThenUnSz_Check(uint id, const string &in uid, const string &in name, uint startDate, uint endDate, uint leaderboardId) {
    Challenge@ tmp = Challenge(id, uid, name, startDate, endDate, leaderboardId);
    assert(tmp == Challenge::FromRowString(tmp.ToRowString()), 'SzThenUnSz fail: ' + tmp.ToRowString());
    return true;
  }
  
  bool UnitTest_SzThenUnSz_Challenge() {
    Test_SzThenUnSz_Check(394184, "馩", "躮", 980813, 825164, 378662);
    Test_SzThenUnSz_Check(252919, "蜽韋�╝", "鰉", 14178, 409104, 402441);
    Test_SzThenUnSz_Check(464786, "鳔ꂆऒ涮�뗗", "﶑䙢꺰ꦞ", 504000, 654758, 678612);
    Test_SzThenUnSz_Check(605730, "�⿵枵ⴾ㬪●ꜛ", "彲⏈", 265299, 476140, 324910);
    Test_SzThenUnSz_Check(49504, "握", "㷗᤾虝䰒ஷ", 149817, 853156, 438676);
    Test_SzThenUnSz_Check(425498, "", "豈", 224303, 788874, 44714);
    Test_SzThenUnSz_Check(425650, "拣䵱䌏�㯂ᓭ", "뽥뤎祰ᇡᒧឝ밇", 999977, 502172, 837902);
    Test_SzThenUnSz_Check(183274, "鏓", "㈣揘䢊儞祹㚏", 290417, 254860, 984066);
    Test_SzThenUnSz_Check(544625, "鈤ꦀ", "㎀꿈�ᴶ๏㕭∸缲䁏뤥", 985736, 972616, 680656);
    Test_SzThenUnSz_Check(509010, "撏랭", "�׭駭겯ƴ", 926979, 620839, 892156);
    Test_SzThenUnSz_Check(363342, "", "䵙", 264138, 345680, 37504);
    Test_SzThenUnSz_Check(847011, "弊䮷⃷쨗蝢ᳳ", "㶑ꔘₜ齬聎雄攩澴", 135571, 428782, 785817);
    Test_SzThenUnSz_Check(966274, "옡뭱過ଚ㩕", "뙱䕂륦홰떌䱇盰쩑", 428390, 96314, 704214);
    Test_SzThenUnSz_Check(611458, "᥾鼾㮦窘ᤲ쯳枦섍鐷痚", "ୣ筃痒胊의䉶杻�죝", 392980, 565032, 395859);
    Test_SzThenUnSz_Check(848880, "ⵑ᠟Ꮍ⁭豹理癙", "＠߇₹紇", 920965, 982620, 978653);
    Test_SzThenUnSz_Check(334968, "⋛䨗ও�휋℃벷쨭욢", "鶧ㆌ痒", 181358, 266408, 312816);
    Test_SzThenUnSz_Check(315253, "森ⶍභࢆ⑧", "沕К߄뽇㪢㸿ᓮₙ", 22089, 401867, 691035);
    Test_SzThenUnSz_Check(773592, "", "蔟Ι龲ꇗ⡔辅⭉", 454352, 78530, 529329);
    Test_SzThenUnSz_Check(83328, "쐭ғ㒴퟽ᗦ㴟봨ￊ", "", 518141, 153623, 2628);
    Test_SzThenUnSz_Check(772861, "", "ᔻἚ", 833723, 27085, 506361);
    return true;
  }
  
  bool unitTestResults_Challenge_RowSerialization = true
    && UnitTest_SzThenUnSz_Challenge()
    ;
}
#endif