shared class CompRoundMatches {
  /* Properties // Mixin: Default Properties */
  private array<CompRoundMatch@> _matches;
  
  /* Methods // Mixin: Default Constructor */
  CompRoundMatches(const CompRoundMatch@[] &in matches) {
    this._matches = matches;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  CompRoundMatches(const Json::Value@ j) {
    this._matches = array<CompRoundMatch@>(j.Length);
    for (uint i = 0; i < j.Length; i++) {
      @this._matches[i] = CompRoundMatch(j[i]);
    }
  }
  
  Json::Value@ ToJson() {
    Json::Value@ _tmp_matches = Json::Array();
    for (uint i = 0; i < _matches.Length; i++) {
      auto v = _matches[i];
      _tmp_matches.Add(v.ToJson());
    }
    return _tmp_matches;
  }
  
  void OnFromJsonError(const Json::Value@ j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  const CompRoundMatch@[]@ get_matches() const {
    return this._matches;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'CompRoundMatches('
      + string::Join({'matches=' + TS_Array_CompRoundMatch(matches)}, ', ')
      + ')';
  }
  
  private const string TS_Array_CompRoundMatch(const array<CompRoundMatch@> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += arr[i].ToString();
    }
    return ret + '}';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const CompRoundMatches@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    bool _tmp_arrEq_matches = _matches.Length == other.matches.Length;
    for (uint i = 0; i < _matches.Length; i++) {
      if (!_tmp_arrEq_matches) {
        break;
      }
      _tmp_arrEq_matches = _tmp_arrEq_matches && (_matches[i] == other.matches[i]);
    }
    return true
      && _tmp_arrEq_matches
      ;
  }
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(Buffer@ buf) {
    WTB_Array_CompRoundMatch(buf, _matches);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += CBB_Array_CompRoundMatch(_matches);
    return bytes;
  }
  
  void WTB_LP_String(Buffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
  
  void WTB_Array_CompRoundMatch(Buffer@ buf, const array<CompRoundMatch@> &in arr) {
    buf.Write(uint(arr.Length));
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      el.WriteToBuffer(buf);
    }
  }
  
  uint CBB_Array_CompRoundMatch(const array<CompRoundMatch@> &in arr) {
    uint bytes = 4;
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      bytes += el.CountBufBytes();
    }
    return bytes;
  }
  
  /* Methods // Mixin: ArrayProxy */
  CompRoundMatch@ opIndex(uint ix) const {
    return _matches[ix];
  }
  
  uint get_Length() const {
    return _matches.Length;
  }
  
  bool IsEmpty() const {
    return _matches.IsEmpty();
  }
  
  void InsertLast(CompRoundMatch@ v) {
    _matches.InsertLast(v);
  }
}

namespace _CompRoundMatches {
  /* Namespace // Mixin: ToFromBuffer */
  shared CompRoundMatches@ ReadFromBuffer(Buffer@ buf) {
    /* Parse field: matches of type: array<CompRoundMatch@> */
    array<CompRoundMatch@> matches = RFB_Array_CompRoundMatch(buf);
    return CompRoundMatches(matches);
  }
  
  shared const string RFB_LP_String(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
  
  shared const array<CompRoundMatch@>@ RFB_Array_CompRoundMatch(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    array<CompRoundMatch@> arr = array<CompRoundMatch@>(len);
    for (uint i = 0; i < arr.Length; i++) {
      @arr[i] = _CompRoundMatch::ReadFromBuffer(buf);
    }
    return arr;
  }
}