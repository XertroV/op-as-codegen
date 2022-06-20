shared class Competitions {
  /* Properties // Mixin: Default Properties */
  private array<Competition@> _comps;
  
  /* Methods // Mixin: Default Constructor */
  Competitions(const Competition@[] &in comps) {
    this._comps = comps;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  Competitions(const Json::Value &in j) {
    try {
      this._comps = array<Competition@>(j.Length);
      for (uint i = 0; i < j.Length; i++) {
        @this._comps[i] = Competition(j[i]);
      }
    } catch {
      OnFromJsonError(j);
    }
  }
  
  Json::Value ToJson() {
    Json::Value _tmp_comps = Json::Array();
    for (uint i = 0; i < _comps.Length; i++) {
      auto v = _comps[i];
      _tmp_comps.Add(v.ToJson());
    }
    return _tmp_comps;
  }
  
  void OnFromJsonError(const Json::Value &in j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  const Competition@[]@ get_comps() const {
    return this._comps;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'Competitions('
      + string::Join({'comps=' + TS_Array_Competition(comps)}, ', ')
      + ')';
  }
  
  private const string TS_Array_Competition(const array<Competition@> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += arr[i].ToString();
    }
    return ret + '}';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const Competitions@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    bool _tmp_arrEq_comps = _comps.Length == other.comps.Length;
    for (uint i = 0; i < _comps.Length; i++) {
      if (!_tmp_arrEq_comps) {
        break;
      }
      _tmp_arrEq_comps = _tmp_arrEq_comps && (_comps[i] == other.comps[i]);
    }
    return true
      && _tmp_arrEq_comps
      ;
  }
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += TRS_WrapString(TRS_Array_Competition(_comps)) + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    string _s = s.Replace('\n', '\\n').Replace('\r', '\\r');
    return '(' + _s.Length + ':' + _s + ')';
  }
  
  private const string TRS_Array_Competition(const array<Competition@> &in arr) {
    string ret = '';
    for (uint i = 0; i < arr.Length; i++) {
      ret += TRS_WrapString(arr[i].ToRowString()) + ',';
    }
    return ret;
  }
  
  /* Methods // Mixin: ArrayProxy */
  Competition@ opIndex(uint ix) const {
    return _comps[ix];
  }
  
  uint get_Length() const {
    return _comps.Length;
  }
  
  bool IsEmpty() const {
    return _comps.IsEmpty();
  }
  
  void InsertLast(Competition@ v) {
    _comps.InsertLast(v);
  }
}

namespace _Competitions {
  /* Namespace // Mixin: Row Serialization */
  shared Competitions@ FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    /* Parse field: comps of type: array<Competition@> */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    array<Competition@> comps = FRS_Array_Competition(chunk);
    return Competitions(comps);
  }
  
  shared const array<Competition@>@ FRS_Array_Competition(const string &in str) {
    array<Competition@> ret = array<Competition@>(0);
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
      ret.InsertLast(_Competition::FromRowString(chunk));
    }
    return ret;
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}