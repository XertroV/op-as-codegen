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
  CompRoundMatch(const Json::Value &in j) {
    try {
      this._id = j["id"];
      this._position = j["position"];
      this._isCompleted = j["isCompleted"];
      this._name = j["name"];
      this._clubMatchLiveId = j["clubMatchLiveId"];
    } catch {
      OnFromJsonError(j);
    }
  }
  
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    j["id"] = _id;
    j["position"] = _position;
    j["isCompleted"] = _isCompleted;
    j["name"] = _name;
    j["clubMatchLiveId"] = _clubMatchLiveId;
    return j;
  }
  
  void OnFromJsonError(const Json::Value &in j) const {
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
      + string::Join({'' + id, '' + position, '' + isCompleted, name, clubMatchLiveId}, ', ')
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
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += '' + _id + ",";
    ret += '' + _position + ",";
    ret += '' + _isCompleted + ",";
    ret += TRS_WrapString(_name) + ",";
    ret += TRS_WrapString(_clubMatchLiveId) + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
}

namespace _CompRoundMatch {
  /* Namespace // Mixin: Row Serialization */
  shared CompRoundMatch@ FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    /* Parse field: id of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint id = Text::ParseInt(chunk);
    /* Parse field: position of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint position = Text::ParseInt(chunk);
    /* Parse field: isCompleted of type: bool */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    bool isCompleted = ('true' == chunk.ToLower());
    /* Parse field: name of type: string */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string name = chunk;
    /* Parse field: clubMatchLiveId of type: string */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string clubMatchLiveId = chunk;
    return CompRoundMatch(id, position, isCompleted, name, clubMatchLiveId);
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}