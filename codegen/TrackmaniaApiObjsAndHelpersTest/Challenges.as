shared class Challenges {
  /* Properties // Mixin: Default Properties */
  private array<Challenge@> _challenges;
  
  /* Methods // Mixin: Default Constructor */
  Challenges(const Challenge@[] &in challenges) {
    this._challenges = challenges;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  Challenges(const Json::Value &in j) {
    this._challenges = array<Challenge@>(j.Length);
    for (uint i = 0; i < j.Length; i++) {
      @this._challenges[i] = Challenge(j[i]);
    }
  }
  
  Json::Value ToJson() {
    Json::Value _tmp_challenges = Json::Array();
    for (uint i = 0; i < _challenges.Length; i++) {
      auto v = _challenges[i];
      _tmp_challenges.Add(v.ToJson());
    }
    return _tmp_challenges;
  }
  
  /* Methods // Mixin: Getters */
  const Challenge@[]@ get_challenges() const {
    return this._challenges;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'Challenges('
      + string::Join({TS_Array_Challenge(challenges)}, ', ')
      + ')';
  }
  
  private const string TS_Array_Challenge(const array<Challenge@> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += arr[i].ToString();
    }
    return ret + '}';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const Challenges@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    bool _tmp_arrEq_challenges = _challenges.Length == other.challenges.Length;
    for (uint i = 0; i < _challenges.Length; i++) {
      if (!_tmp_arrEq_challenges) {
        break;
      }
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
  
  /* Methods // Mixin: ArrayProxy */
  Challenge@ opIndex(uint ix) const {
    return _challenges[ix];
  }
  
  uint get_Length() const {
    return _challenges.Length;
  }
  
  bool IsEmpty() const {
    return _challenges.IsEmpty();
  }
  
  void InsertLast(Challenge@ v) {
    _challenges.InsertLast(v);
  }
}

namespace _Challenges {
  /* Namespace // Mixin: Row Serialization */
  shared Challenges FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    array<Challenge@> challenges = FRS_Array_Challenge(chunk);
    return Challenges(challenges);
  }
  
  shared const array<Challenge@>@ FRS_Array_Challenge(const string &in str) {
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
      ret.InsertLast(_Challenge::FromRowString(chunk));
    }
    return ret;
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}