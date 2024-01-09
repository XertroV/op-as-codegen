shared class CompRoundMatch {
  /* Properties // Mixin: Default Properties */
  private uint _id;
  private uint _position;
  private bool _isCompleted;
  private string _name;
  private string _clubMatchLiveId;
  
  /* Methods // Mixin: Default Constructor */
  CompRoundMatch(uint id, uint position, bool isCompleted, const string &in name, const string &in clubMatchLiveId) {
    this._id = id;
    this._position = position;
    this._isCompleted = isCompleted;
    this._name = name;
    this._clubMatchLiveId = clubMatchLiveId;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  CompRoundMatch(const Json::Value@ j) {
    this._id = uint(j["id"]);
    this._position = uint(j["position"]);
    this._isCompleted = bool(j["isCompleted"]);
    this._name = string(j["name"]);
    this._clubMatchLiveId = string(j["clubMatchLiveId"]);
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
    j["id"] = _id;
    j["position"] = _position;
    j["isCompleted"] = _isCompleted;
    j["name"] = _name;
    j["clubMatchLiveId"] = _clubMatchLiveId;
    return j;
  }
  
  void OnFromJsonError(const Json::Value@ j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  uint get_id() const {
    return this._id;
  }
  
  uint get_position() const {
    return this._position;
  }
  
  bool get_isCompleted() const {
    return this._isCompleted;
  }
  
  const string get_name() const {
    return this._name;
  }
  
  const string get_clubMatchLiveId() const {
    return this._clubMatchLiveId;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'CompRoundMatch('
      + string::Join({'id=' + tostring(id), 'position=' + tostring(position), 'isCompleted=' + tostring(isCompleted), 'name=' + name, 'clubMatchLiveId=' + clubMatchLiveId}, ', ')
      + ')';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const CompRoundMatch@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    return true
      && _id == other.id
      && _position == other.position
      && _isCompleted == other.isCompleted
      && _name == other.name
      && _clubMatchLiveId == other.clubMatchLiveId
      ;
  }
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(MemoryBuffer@ buf) {
    buf.Write(_id);
    buf.Write(_position);
    buf.Write(uint8(_isCompleted ? 1 : 0));
    WTB_LP_String(buf, _name);
    WTB_LP_String(buf, _clubMatchLiveId);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += 4;
    bytes += 4;
    bytes += 1;
    bytes += 4 + _name.Length;
    bytes += 4 + _clubMatchLiveId.Length;
    return bytes;
  }
  
  void WTB_LP_String(MemoryBuffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
}

namespace _CompRoundMatch {
  /* Namespace // Mixin: ToFromBuffer */
  shared CompRoundMatch@ ReadFromBuffer(MemoryBuffer@ buf) {
    /* Parse field: id of type: uint */
    uint id = buf.ReadUInt32();
    /* Parse field: position of type: uint */
    uint position = buf.ReadUInt32();
    /* Parse field: isCompleted of type: bool */
    bool isCompleted = buf.ReadUInt8() > 0;
    /* Parse field: name of type: string */
    string name = RFB_LP_String(buf);
    /* Parse field: clubMatchLiveId of type: string */
    string clubMatchLiveId = RFB_LP_String(buf);
    return CompRoundMatch(id, position, isCompleted, name, clubMatchLiveId);
  }
  
  shared const string RFB_LP_String(MemoryBuffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
}