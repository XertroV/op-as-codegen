shared class Challenges {
  /* Properties // Mixin: Default Properties */
  private array<Challenge@> _challenges;
  
  /* Methods // Mixin: Default Constructor */
  Challenges(const Challenge@[] &in challenges) {
    this._challenges = challenges;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  Challenges(const Json::Value@ j) {
    this._challenges = array<Challenge@>(j.Length);
    for (uint i = 0; i < j.Length; i++) {
      @this._challenges[i] = Challenge(j[i]);
    }
  }
  
  Json::Value@ ToJson() {
    Json::Value@ _tmp_challenges = Json::Array();
    for (uint i = 0; i < _challenges.Length; i++) {
      auto v = _challenges[i];
      _tmp_challenges.Add(v.ToJson());
    }
    return _tmp_challenges;
  }
  
  void OnFromJsonError(const Json::Value@ j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  const Challenge@[]@ get_challenges() const {
    return this._challenges;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'Challenges('
      + string::Join({'challenges=' + TS_Array_Challenge(challenges)}, ', ')
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
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(Buffer@ buf) {
    WTB_Array_Challenge(buf, _challenges);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += CBB_Array_Challenge(_challenges);
    return bytes;
  }
  
  void WTB_LP_String(Buffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
  
  void WTB_Array_Challenge(Buffer@ buf, const array<Challenge@> &in arr) {
    buf.Write(uint(arr.Length));
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      el.WriteToBuffer(buf);
    }
  }
  
  uint CBB_Array_Challenge(const array<Challenge@> &in arr) {
    uint bytes = 4;
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      bytes += el.CountBufBytes();
    }
    return bytes;
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
  /* Namespace // Mixin: ToFromBuffer */
  shared Challenges@ ReadFromBuffer(Buffer@ buf) {
    /* Parse field: challenges of type: array<Challenge@> */
    array<Challenge@> challenges = RFB_Array_Challenge(buf);
    return Challenges(challenges);
  }
  
  shared const string RFB_LP_String(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
  
  shared const array<Challenge@>@ RFB_Array_Challenge(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    array<Challenge@> arr = array<Challenge@>(len);
    for (uint i = 0; i < arr.Length; i++) {
      @arr[i] = _Challenge::ReadFromBuffer(buf);
    }
    return arr;
  }
}