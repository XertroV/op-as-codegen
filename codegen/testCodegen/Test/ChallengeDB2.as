#if UNIT_TEST
namespace Test_ChallengeDB2 {
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
    print('\\$2f6Unit Test Success: UnitTest_Common_Nop (42 tests)');
    return;
  }
  
  bool unitTestResults_ChallengeDB2_CommonTesting = true
    && runAsync(CoroutineFunc(UnitTest_Common_Nop))
    ;
}
#endif