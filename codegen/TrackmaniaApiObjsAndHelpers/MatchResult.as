shared class MatchResult {
  /* Properties // Mixin: Default Properties */
  private MaybeOfUint@ _rank;
  private MaybeOfUint@ _score;
  private string _participant;
  private string _zone;
  
  /* Methods // Mixin: Default Constructor */
  MatchResult(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant, const string &in zone) {
    @this._rank = rank;
    @this._score = score;
    this._participant = participant;
    this._zone = zone;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  MatchResult(const Json::Value@ j) {
    @this._rank = MaybeOfUint(j["rank"]);
    @this._score = MaybeOfUint(j["score"]);
    this._participant = string(j["participant"]);
    this._zone = string(j["zone"]);
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
    j["rank"] = _rank.ToJson();
    j["score"] = _score.ToJson();
    j["participant"] = _participant;
    j["zone"] = _zone;
    return j;
  }
  
  void OnFromJsonError(const Json::Value@ j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  MaybeOfUint@ get_rank() const {
    return this._rank;
  }
  
  MaybeOfUint@ get_score() const {
    return this._score;
  }
  
  const string get_participant() const {
    return this._participant;
  }
  
  const string get_zone() const {
    return this._zone;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'MatchResult('
      + string::Join({'rank=' + rank.ToString(), 'score=' + score.ToString(), 'participant=' + participant, 'zone=' + zone}, ', ')
      + ')';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const MatchResult@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    return true
      && _rank == other.rank
      && _score == other.score
      && _participant == other.participant
      && _zone == other.zone
      ;
  }
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(Buffer@ buf) {
    _rank.WriteToBuffer(buf);
    _score.WriteToBuffer(buf);
    WTB_LP_String(buf, _participant);
    WTB_LP_String(buf, _zone);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += _rank.CountBufBytes();
    bytes += _score.CountBufBytes();
    bytes += 4 + _participant.Length;
    bytes += 4 + _zone.Length;
    return bytes;
  }
  
  void WTB_LP_String(Buffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
}

namespace _MatchResult {
  /* Namespace // Mixin: ToFromBuffer */
  shared MatchResult@ ReadFromBuffer(Buffer@ buf) {
    /* Parse field: rank of type: MaybeOfUint@ */
    MaybeOfUint@ rank = _MaybeOfUint::ReadFromBuffer(buf);
    /* Parse field: score of type: MaybeOfUint@ */
    MaybeOfUint@ score = _MaybeOfUint::ReadFromBuffer(buf);
    /* Parse field: participant of type: string */
    string participant = RFB_LP_String(buf);
    /* Parse field: zone of type: string */
    string zone = RFB_LP_String(buf);
    return MatchResult(rank, score, participant, zone);
  }
  
  shared const string RFB_LP_String(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
}