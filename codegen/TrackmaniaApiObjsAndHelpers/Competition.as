shared class Competition {
  /* Properties // Mixin: Default Properties */
  private uint _id;
  private uint _startDate;
  private uint _endDate;
  private MaybeOfUint@ _matchesGenerationDate;
  private uint _nbPlayers;
  private uint _leaderboardId;
  private string _name;
  private string _liveId;
  private string _creator;
  private MaybeOfString@ _region;
  private MaybeOfString@ _description;
  private MaybeOfUint@ _registrationStart;
  
  /* Methods // Mixin: Default Constructor */
  Competition(uint id, uint startDate, uint endDate, MaybeOfUint@ matchesGenerationDate, uint nbPlayers, uint leaderboardId, const string &in name, const string &in liveId, const string &in creator, MaybeOfString@ region, MaybeOfString@ description, MaybeOfUint@ registrationStart) {
    this._id = id;
    this._startDate = startDate;
    this._endDate = endDate;
    @this._matchesGenerationDate = matchesGenerationDate;
    this._nbPlayers = nbPlayers;
    this._leaderboardId = leaderboardId;
    this._name = name;
    this._liveId = liveId;
    this._creator = creator;
    @this._region = region;
    @this._description = description;
    @this._registrationStart = registrationStart;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  Competition(const Json::Value@ j) {
    this._id = uint(j["id"]);
    this._startDate = uint(j["startDate"]);
    this._endDate = uint(j["endDate"]);
    @this._matchesGenerationDate = MaybeOfUint(j["matchesGenerationDate"]);
    this._nbPlayers = uint(j["nbPlayers"]);
    this._leaderboardId = uint(j["leaderboardId"]);
    this._name = string(j["name"]);
    this._liveId = string(j["liveId"]);
    this._creator = string(j["creator"]);
    @this._region = MaybeOfString(j["region"]);
    @this._description = MaybeOfString(j["description"]);
    @this._registrationStart = MaybeOfUint(j["registrationStart"]);
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
    j["id"] = _id;
    j["startDate"] = _startDate;
    j["endDate"] = _endDate;
    j["matchesGenerationDate"] = _matchesGenerationDate.ToJson();
    j["nbPlayers"] = _nbPlayers;
    j["leaderboardId"] = _leaderboardId;
    j["name"] = _name;
    j["liveId"] = _liveId;
    j["creator"] = _creator;
    j["region"] = _region.ToJson();
    j["description"] = _description.ToJson();
    j["registrationStart"] = _registrationStart.ToJson();
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
  
  uint get_startDate() const {
    return this._startDate;
  }
  
  uint get_endDate() const {
    return this._endDate;
  }
  
  MaybeOfUint@ get_matchesGenerationDate() const {
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
  
  MaybeOfString@ get_region() const {
    return this._region;
  }
  
  MaybeOfString@ get_description() const {
    return this._description;
  }
  
  MaybeOfUint@ get_registrationStart() const {
    return this._registrationStart;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'Competition('
      + string::Join({'id=' + tostring(id), 'startDate=' + tostring(startDate), 'endDate=' + tostring(endDate), 'matchesGenerationDate=' + matchesGenerationDate.ToString(), 'nbPlayers=' + tostring(nbPlayers), 'leaderboardId=' + tostring(leaderboardId), 'name=' + name, 'liveId=' + liveId, 'creator=' + creator, 'region=' + region.ToString(), 'description=' + description.ToString(), 'registrationStart=' + registrationStart.ToString()}, ', ')
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
      && _description == other.description
      && _registrationStart == other.registrationStart
      ;
  }
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(MemoryBuffer@ buf) {
    buf.Write(_id);
    buf.Write(_startDate);
    buf.Write(_endDate);
    _matchesGenerationDate.WriteToBuffer(buf);
    buf.Write(_nbPlayers);
    buf.Write(_leaderboardId);
    WTB_LP_String(buf, _name);
    WTB_LP_String(buf, _liveId);
    WTB_LP_String(buf, _creator);
    _region.WriteToBuffer(buf);
    _description.WriteToBuffer(buf);
    _registrationStart.WriteToBuffer(buf);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += 4;
    bytes += 4;
    bytes += 4;
    bytes += _matchesGenerationDate.CountBufBytes();
    bytes += 4;
    bytes += 4;
    bytes += 4 + _name.Length;
    bytes += 4 + _liveId.Length;
    bytes += 4 + _creator.Length;
    bytes += _region.CountBufBytes();
    bytes += _description.CountBufBytes();
    bytes += _registrationStart.CountBufBytes();
    return bytes;
  }
  
  void WTB_LP_String(MemoryBuffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
}

namespace _Competition {
  /* Namespace // Mixin: ToFromBuffer */
  shared Competition@ ReadFromBuffer(MemoryBuffer@ buf) {
    /* Parse field: id of type: uint */
    uint id = buf.ReadUInt32();
    /* Parse field: startDate of type: uint */
    uint startDate = buf.ReadUInt32();
    /* Parse field: endDate of type: uint */
    uint endDate = buf.ReadUInt32();
    /* Parse field: matchesGenerationDate of type: MaybeOfUint@ */
    MaybeOfUint@ matchesGenerationDate = _MaybeOfUint::ReadFromBuffer(buf);
    /* Parse field: nbPlayers of type: uint */
    uint nbPlayers = buf.ReadUInt32();
    /* Parse field: leaderboardId of type: uint */
    uint leaderboardId = buf.ReadUInt32();
    /* Parse field: name of type: string */
    string name = RFB_LP_String(buf);
    /* Parse field: liveId of type: string */
    string liveId = RFB_LP_String(buf);
    /* Parse field: creator of type: string */
    string creator = RFB_LP_String(buf);
    /* Parse field: region of type: MaybeOfString@ */
    MaybeOfString@ region = _MaybeOfString::ReadFromBuffer(buf);
    /* Parse field: description of type: MaybeOfString@ */
    MaybeOfString@ description = _MaybeOfString::ReadFromBuffer(buf);
    /* Parse field: registrationStart of type: MaybeOfUint@ */
    MaybeOfUint@ registrationStart = _MaybeOfUint::ReadFromBuffer(buf);
    return Competition(id, startDate, endDate, matchesGenerationDate, nbPlayers, leaderboardId, name, liveId, creator, region, description, registrationStart);
  }
  
  shared const string RFB_LP_String(MemoryBuffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
}