shared class Challenge {
  /* Properties // Mixin: Default Properties */
  private uint _id;
  private string _uid;
  private string _name;
  private uint _startDate;
  private uint _endDate;
  private uint _leaderboardId;
  
  /* Methods // Mixin: Default Constructor */
  Challenge(uint id, const string &in uid, const string &in name, uint startDate, uint endDate, uint leaderboardId) {
    this._id = id;
    this._uid = uid;
    this._name = name;
    this._startDate = startDate;
    this._endDate = endDate;
    this._leaderboardId = leaderboardId;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  Challenge(const Json::Value@ j) {
    this._id = uint(j["id"]);
    this._uid = string(j["uid"]);
    this._name = string(j["name"]);
    this._startDate = uint(j["startDate"]);
    this._endDate = uint(j["endDate"]);
    this._leaderboardId = uint(j["leaderboardId"]);
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
    j["id"] = _id;
    j["uid"] = _uid;
    j["name"] = _name;
    j["startDate"] = _startDate;
    j["endDate"] = _endDate;
    j["leaderboardId"] = _leaderboardId;
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
  
  const string get_uid() const {
    return this._uid;
  }
  
  const string get_name() const {
    return this._name;
  }
  
  uint get_startDate() const {
    return this._startDate;
  }
  
  uint get_endDate() const {
    return this._endDate;
  }
  
  uint get_leaderboardId() const {
    return this._leaderboardId;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'Challenge('
      + string::Join({'id=' + tostring(id), 'uid=' + uid, 'name=' + name, 'startDate=' + tostring(startDate), 'endDate=' + tostring(endDate), 'leaderboardId=' + tostring(leaderboardId)}, ', ')
      + ')';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const Challenge@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    return true
      && _id == other.id
      && _uid == other.uid
      && _name == other.name
      && _startDate == other.startDate
      && _endDate == other.endDate
      && _leaderboardId == other.leaderboardId
      ;
  }
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(Buffer@ buf) {
    buf.Write(_id);
    WTB_LP_String(buf, _uid);
    WTB_LP_String(buf, _name);
    buf.Write(_startDate);
    buf.Write(_endDate);
    buf.Write(_leaderboardId);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += 4;
    bytes += 4 + _uid.Length;
    bytes += 4 + _name.Length;
    bytes += 4;
    bytes += 4;
    bytes += 4;
    return bytes;
  }
  
  void WTB_LP_String(Buffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
}

namespace _Challenge {
  /* Namespace // Mixin: ToFromBuffer */
  shared Challenge@ ReadFromBuffer(Buffer@ buf) {
    /* Parse field: id of type: uint */
    uint id = buf.ReadUInt32();
    /* Parse field: uid of type: string */
    string uid = RFB_LP_String(buf);
    /* Parse field: name of type: string */
    string name = RFB_LP_String(buf);
    /* Parse field: startDate of type: uint */
    uint startDate = buf.ReadUInt32();
    /* Parse field: endDate of type: uint */
    uint endDate = buf.ReadUInt32();
    /* Parse field: leaderboardId of type: uint */
    uint leaderboardId = buf.ReadUInt32();
    return Challenge(id, uid, name, startDate, endDate, leaderboardId);
  }
  
  shared const string RFB_LP_String(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
}