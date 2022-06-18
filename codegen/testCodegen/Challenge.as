class Challenge {
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
  Challenge(const Json::Value &in j) {
    this._id = j["id"];
    this._uid = j["uid"];
    this._name = j["name"];
    this._startDate = j["startDate"];
    this._endDate = j["endDate"];
    this._leaderboardId = j["leaderboardId"];
  }
  
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    j["id"] = _id;
    j["uid"] = _uid;
    j["name"] = _name;
    j["startDate"] = _startDate;
    j["endDate"] = _endDate;
    j["leaderboardId"] = _leaderboardId;
    return j;
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
      + string :: Join({'' + id, uid, name, '' + startDate, '' + endDate, '' + leaderboardId}, ', ')
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
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += '' + _id + ",";
    ret += TRS_WrapString(_uid) + ",";
    ret += TRS_WrapString(_name) + ",";
    ret += '' + _startDate + ",";
    ret += '' + _endDate + ",";
    ret += '' + _leaderboardId + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
}

namespace Challenge {
  /* Namespace // Mixin: Row Serialization */
  Challenge FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint id = Text::ParseInt(chunk);
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string uid = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string name = chunk;
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint startDate = Text::ParseInt(chunk);
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint endDate = Text::ParseInt(chunk);
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint leaderboardId = Text::ParseInt(chunk);
    return Challenge(id, uid, name, startDate, endDate, leaderboardId);
  }
  
  void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}