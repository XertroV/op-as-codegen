shared class Competition {
  /* Properties // Mixin: Default Properties */
  private uint _id;
  private uint _startDate;
  private uint _endDate;
  private uint _matchesGenerationDate;
  private uint _nbPlayers;
  private uint _leaderboardId;
  private string _name;
  private string _liveId;
  private string _creator;
  private string _region;
  
  /* Methods // Mixin: Default Constructor */
  Competition(uint id, uint startDate, uint endDate, uint matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, const string &in region) {
    this._id = id;
    this._startDate = startDate;
    this._endDate = endDate;
    this._matchesGenerationDate = matchesGenerationDate;
    this._nbPlayers = nbPlayers;
    this._leaderboardId = leaderboardId;
    this._name = name;
    this._liveId = liveId;
    this._creator = creator;
    this._region = region;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  Competition(const Json::Value &in j) {
    try {
      this._id = j["id"];
      this._startDate = j["startDate"];
      this._endDate = j["endDate"];
      this._matchesGenerationDate = j["matchesGenerationDate"];
      this._nbPlayers = j["nbPlayers"];
      this._leaderboardId = j["leaderboardId"];
      this._name = j["name"];
      this._liveId = j["liveId"];
      this._creator = j["creator"];
      this._region = j["region"];
    } catch {
      OnFromJsonError(j);
    }
  }
  
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    j["id"] = _id;
    j["startDate"] = _startDate;
    j["endDate"] = _endDate;
    j["matchesGenerationDate"] = _matchesGenerationDate;
    j["nbPlayers"] = _nbPlayers;
    j["leaderboardId"] = _leaderboardId;
    j["name"] = _name;
    j["liveId"] = _liveId;
    j["creator"] = _creator;
    j["region"] = _region;
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
  
  uint get_startDate() const {
    return this._startDate;
  }
  
  uint get_endDate() const {
    return this._endDate;
  }
  
  uint get_matchesGenerationDate() const {
    return this._matchesGenerationDate;
  }
  
  uint get_nbPlayers() const {
    return this._nbPlayers;
  }
  
  uint get_leaderboardId() const {
    return this._leaderboardId;
  }
  
  const string get_name() const {
    return this._name;
  }
  
  const string get_liveId() const {
    return this._liveId;
  }
  
  const string get_creator() const {
    return this._creator;
  }
  
  const string get_region() const {
    return this._region;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'Competition('
      + string::Join({'' + id, '' + startDate, '' + endDate, '' + matchesGenerationDate, '' + nbPlayers, '' + leaderboardId, name, liveId, creator, region}, ', ')
      + ')';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const Competition@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    return true
      && _id == other.id
      && _startDate == other.startDate
      && _endDate == other.endDate
      && _matchesGenerationDate == other.matchesGenerationDate
      && _nbPlayers == other.nbPlayers
      && _leaderboardId == other.leaderboardId
      && _name == other.name
      && _liveId == other.liveId
      && _creator == other.creator
      && _region == other.region
      ;
  }
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += '' + _id + ",";
    ret += '' + _startDate + ",";
    ret += '' + _endDate + ",";
    ret += '' + _matchesGenerationDate + ",";
    ret += '' + _nbPlayers + ",";
    ret += '' + _leaderboardId + ",";
    ret += TRS_WrapString(_name) + ",";
    ret += TRS_WrapString(_liveId) + ",";
    ret += TRS_WrapString(_creator) + ",";
    ret += TRS_WrapString(_region) + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
}

namespace _Competition {
  /* Namespace // Mixin: Row Serialization */
  shared Competition@ FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    /* Parse field: id of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint id = Text::ParseInt(chunk);
    /* Parse field: startDate of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint startDate = Text::ParseInt(chunk);
    /* Parse field: endDate of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint endDate = Text::ParseInt(chunk);
    /* Parse field: matchesGenerationDate of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint matchesGenerationDate = Text::ParseInt(chunk);
    /* Parse field: nbPlayers of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint nbPlayers = Text::ParseInt(chunk);
    /* Parse field: leaderboardId of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint leaderboardId = Text::ParseInt(chunk);
    /* Parse field: name of type: string */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string name = chunk;
    /* Parse field: liveId of type: string */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string liveId = chunk;
    /* Parse field: creator of type: string */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string creator = chunk;
    /* Parse field: region of type: string */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string region = chunk;
    return Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region);
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}