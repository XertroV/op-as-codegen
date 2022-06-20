shared class CompRounds {
  /* Properties // Mixin: Default Properties */
  private array<CompRound@> _rounds;
  
  /* Methods // Mixin: Default Constructor */
  CompRounds(const CompRound@[] &in rounds) {
    this._rounds = rounds;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  CompRounds(const Json::Value &in j) {
    try {
      this._rounds = array<CompRound@>(j.Length);
      for (uint i = 0; i < j.Length; i++) {
        @this._rounds[i] = CompRound(j[i]);
      }
    } catch {
      OnFromJsonError(j);
    }
  }
  
  Json::Value ToJson() {
    Json::Value _tmp_rounds = Json::Array();
    for (uint i = 0; i < _rounds.Length; i++) {
      auto v = _rounds[i];
      _tmp_rounds.Add(v.ToJson());
    }
    return _tmp_rounds;
  }
  
  void OnFromJsonError(const Json::Value &in j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  const CompRound@[]@ get_rounds() const {
    return this._rounds;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'CompRounds('
      + string::Join({TS_Array_CompRound(rounds)}, ', ')
      + ')';
  }
  
  private const string TS_Array_CompRound(const array<CompRound@> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += arr[i].ToString();
    }
    return ret + '}';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const CompRounds@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    bool _tmp_arrEq_rounds = _rounds.Length == other.rounds.Length;
    for (uint i = 0; i < _rounds.Length; i++) {
      if (!_tmp_arrEq_rounds) {
        break;
      }
      _tmp_arrEq_rounds = _tmp_arrEq_rounds && (_rounds[i] == other.rounds[i]);
    }
    return true
      && _tmp_arrEq_rounds
      ;
  }
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += TRS_WrapString(TRS_Array_CompRound(_rounds)) + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
  
  private const string TRS_Array_CompRound(const array<CompRound@> &in arr) {
    string ret = '';
    for (uint i = 0; i < arr.Length; i++) {
      ret += TRS_WrapString(arr[i].ToRowString()) + ',';
    }
    return ret;
  }
  
  /* Methods // Mixin: ArrayProxy */
  CompRound@ opIndex(uint ix) const {
    return _rounds[ix];
  }
  
  uint get_Length() const {
    return _rounds.Length;
  }
  
  bool IsEmpty() const {
    return _rounds.IsEmpty();
  }
  
  void InsertLast(CompRound@ v) {
    _rounds.InsertLast(v);
  }
}

namespace _CompRounds {
  /* Namespace // Mixin: Row Serialization */
  shared CompRounds@ FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    /* Parse field: rounds of type: array<CompRound@> */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    array<CompRound@> rounds = FRS_Array_CompRound(chunk);
    return CompRounds(rounds);
  }
  
  shared const array<CompRound@>@ FRS_Array_CompRound(const string &in str) {
    array<CompRound@> ret = array<CompRound@>(0);
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
      ret.InsertLast(_CompRound::FromRowString(chunk));
    }
    return ret;
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}