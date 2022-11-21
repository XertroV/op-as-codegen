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
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(Buffer@ buf) {
    WTB_Array_Competition(buf, _comps);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += CBB_Array_Competition(_comps);
    return bytes;
  }
  
  void WTB_LP_String(Buffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
  
  void WTB_Array_Competition(Buffer@ buf, const array<Competition@> &in arr) {
    buf.Write(uint(arr.Length));
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      el.WriteToBuffer(buf);
    }
  }
  
  uint CBB_Array_Competition(const array<Competition@> &in arr) {
    uint bytes = 4;
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      bytes += el.CountBufBytes();
    }
    return bytes;
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
  /* Namespace // Mixin: ToFromBuffer */
  shared Competitions@ ReadFromBuffer(Buffer@ buf) {
    /* Parse field: comps of type: array<Competition@> */
    array<Competition@> comps = RFB_Array_Competition(buf);
    return Competitions(comps);
  }
  
  shared const string RFB_LP_String(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
  
  shared const array<Competition@>@ RFB_Array_Competition(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    array<Competition@> arr = array<Competition@>(len);
    for (uint i = 0; i < arr.Length; i++) {
      @arr[i] = _Competition::ReadFromBuffer(buf);
    }
    return arr;
  }
}