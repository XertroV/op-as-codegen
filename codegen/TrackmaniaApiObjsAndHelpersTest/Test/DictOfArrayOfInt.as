#if UNIT_TEST
namespace Test_DictOfArrayOfInt {
  /* Test // Mixin: Common Testing */
  void Tests_RegisterAll_DictOfArrayOfInt_CommonTesting() {
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
  
  bool unitTestResults_DictOfArrayOfInt_CommonTesting = runAsync(Tests_RegisterAll_DictOfArrayOfInt_CommonTesting);
  
  /* Test // Mixin: Dict Backing */
  void Tests_RegisterAll_DictOfArrayOfInt_DictBacking() {
    RegisterUnitTest('UnitTest_DictBacking_DictOfArrayOfInt', UnitTest_DictBacking_DictOfArrayOfInt);
  }
  
  bool Test_ProxyFns_DictOfArrayOfInt(DictOfArrayOfInt@ testDict, uint n, int key, const int[] &in value) {
    testDict.Set(key, value);
    _DictOfArrayOfInt::KvPair@ tmpKV = _DictOfArrayOfInt::KvPair(key, value);
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
  
  void UnitTest_DictBacking_DictOfArrayOfInt() {
    DictOfArrayOfInt@ testDict = DictOfArrayOfInt();
    if (testDict.GetSize() > 0) {
      testDict.DeleteAll();
    }
    Test_ProxyFns_DictOfArrayOfInt(testDict, 1, -988970, {-9178, 322174, -512573});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 2, -468383, {-424411, -252818, 791498, -694041});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 3, 806449, {-625323, -32390, 516828});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 4, 511693, {-701837});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 5, -442300, {335094, -352262, 213504});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 6, -444971, {-944304, 257855, 8624});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 7, 444245, {102363, -924284});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 8, -754457, {});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 9, 19370, {942730, 862508, 697387, 305178});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 10, 968587, {-397165});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 11, -172486, {-403551});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 12, -486476, {-250929, -925675});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 13, -97111, {76421, -126565, -131268, -963415});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 14, -229132, {395324});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 15, 390663, {669650});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 16, 117704, {-701525});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 17, -72868, {100345, 925781, 743508});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 18, 946522, {183742, 729753, -681338, 949667});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 19, 679591, {234673, 162630, -538621});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 20, 657388, {922877});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 21, -772731, {990084, -4628, 804467});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 22, 641945, {-667517, -720539, -62311});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 23, 627618, {289608});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 24, -829016, {723107, 188916, 461061});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 25, -645197, {-62590, -397445, -321399, -427496});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 26, 867702, {95984, -954745, -843565});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 27, -926882, {422364, -949657, -572985, -547678});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 28, -816765, {827732, -362015, -17202});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 29, -135072, {137108, 3983});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 30, -874716, {135747, 839412});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 31, -846056, {339239, -770567, -695068, 930280});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 32, -346773, {-903195, 751539, -779186});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 33, -32788, {-686464, 208517});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 34, -279437, {-259304, 327322});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 35, -430944, {-933892});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 36, 59198, {734568, 131593, 853283});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 37, -484606, {811409, -871881});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 38, -367248, {900978, 320871, 997590, 793004});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 39, -969013, {-557824, 258378});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 40, -694148, {-336690, 528516, 304899, -268162});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 41, -488050, {-953345});
    Test_ProxyFns_DictOfArrayOfInt(testDict, 42, 927485, {425713, 809863, 95873});
    testDict.DeleteAll();
    assert(0 == testDict.GetSize(), '.DeleteAll');
  }
  
  bool unitTestResults_DictOfArrayOfInt_DictBacking = runAsync(Tests_RegisterAll_DictOfArrayOfInt_DictBacking);
}
#endif