class ChallengeDB {
  /* Properties // Mixin: Default Properties */
  private array<Challenge@> _challenges;
  
  /* Methods // Mixin: Default Constructor */
  ChallengeDB(const Challenge@[] &in challenges) {
    this._challenges = challenges;
  }
  
  /* Methods // Mixin: From JSON Object */
  ChallengeDB(Json::Value j) {
    Json::Value _tmp_challenges = j["challenges"];
    this._challenges = array<Challenge@>(_tmp_challenges.Length);
    j["challenges"];
  }
  
  /* Methods // Mixin: To JSON Object */
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    return j;
  }
  
  /* Methods // Mixin: Getters */
  const Challenge@[]@ get_challenges() const {
    return this._challenges;
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const ChallengeDB@ &in other) {
    bool _tmp_arrEq_challenges = true;
    for (uint i = 0; i < _challenges.Length; i++) {
      _tmp_arrEq_challenges = _tmp_arrEq_challenges && (_challenges[i] == other.challenges[i]);
    }
    return true
      && _tmp_arrEq_challenges
      ;
  }
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += TRS_WrapString(TRS_Array_Challenge(_challenges)) + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
  
  private const string TRS_Array_Challenge(const array<Challenge@> &in arr) {
    string ret = '';
    for (uint i = 0; i < arr.Length; i++) {
      ret += TRS_WrapString(arr[i].ToRowString()) + ',';
    }
    return ret;
  }
}

/* Namespace // Mixin: Row Serialization */
namespace ChallengeDB {
  ChallengeDB FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    trace('FRS input: "' + str + '"');
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    array<Challenge@> challenges = FRS_Array_Challenge(chunk);
    return ChallengeDB(challenges);
  }
  
  const array<Challenge@>@ FRS_Array_Challenge(const string &in str) {
    array<Challenge@> ret = array<Challenge@>(0);
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    while (remainder.Length > 0) {
      FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
      tmp = remainder.SubStr(1).Split(':', 2);
      chunkLen = Text::ParseInt(tmp[0]);
      chunk = tmp[1].SubStr(0, chunkLen);
      FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
      remainder = tmp[1].SubStr(chunkLen + 2);
      ret.InsertLast(Challenge::FromRowString(chunk));
    }
    return ret;
  }
  
  void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}