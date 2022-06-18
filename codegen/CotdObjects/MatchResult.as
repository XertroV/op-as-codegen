shared class MatchResult {
  /* Properties // Mixin: Default Properties */
  private MaybeOfUint@ _rank;
  private MaybeOfUint@ _score;
  private string _participant;
  
  /* Methods // Mixin: Default Constructor */
  MatchResult(MaybeOfUint@ rank, MaybeOfUint@ score, const string &in participant) {
    @this._rank = rank;
    @this._score = score;
    this._participant = participant;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  MatchResult(const Json::Value &in j) {
    @this._rank = MaybeOfUint(j["rank"]);
    @this._score = MaybeOfUint(j["score"]);
    this._participant = j["participant"];
  }
  
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    j["rank"] = _rank.ToJson();
    j["score"] = _score.ToJson();
    j["participant"] = _participant;
    return j;
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
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'MatchResult('
      + string::Join({rank.ToString(), score.ToString(), participant}, ', ')
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
      ;
  }
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += TRS_WrapString(_rank.ToRowString()) + ",";
    ret += TRS_WrapString(_score.ToRowString()) + ",";
    ret += TRS_WrapString(_participant) + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
}

namespace _MatchResult {
  /* Namespace // Mixin: Row Serialization */
  shared MatchResult FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    MaybeOfUint@ rank = _MaybeOfUint::FromRowString(chunk);
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    MaybeOfUint@ score = _MaybeOfUint::FromRowString(chunk);
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string participant = chunk;
    return MatchResult(rank, score, participant);
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}