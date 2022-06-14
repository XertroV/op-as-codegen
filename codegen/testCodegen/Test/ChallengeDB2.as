#if UNIT_TEST
namespace Test_ChallengeDB2 {
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
  
  bool unitTestResults_ChallengeDB2_CommonTesting = true
    && UnitTest_Common_Nop()
    ;
}
#endif