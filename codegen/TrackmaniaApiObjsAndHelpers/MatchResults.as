shared class MatchResults {
  /* Properties // Mixin: Default Properties */
  private uint _roundPosition;
  private string _matchLiveId;
  private string _scoreUnit;
  private array<MatchResult@> _results;
  
  /* Methods // Mixin: Default Constructor */
  MatchResults(uint roundPosition, const string &in matchLiveId, const string &in scoreUnit, const MatchResult@[] &in results) {
    this._roundPosition = roundPosition;
    this._matchLiveId = matchLiveId;
    this._scoreUnit = scoreUnit;
    this._results = results;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  MatchResults(const Json::Value &in j) {
    try {
      this._roundPosition = j["roundPosition"];
      this._matchLiveId = j["matchLiveId"];
      this._scoreUnit = j["scoreUnit"];
      this._results = array<MatchResult@>(j["results"].Length);
      for (uint i = 0; i < j["results"].Length; i++) {
        @this._results[i] = MatchResult(j["results"][i]);
      }
    } catch {
      OnFromJsonError(j);
    }
  }
  
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    j["roundPosition"] = _roundPosition;
    j["matchLiveId"] = _matchLiveId;
    j["scoreUnit"] = _scoreUnit;
    Json::Value _tmp_results = Json::Array();
    for (uint i = 0; i < _results.Length; i++) {
      auto v = _results[i];
      _tmp_results.Add(v.ToJson());
    }
    j["results"] = _tmp_results;
    return j;
  }
  
  void OnFromJsonError(const Json::Value &in j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  uint get_roundPosition() const {
    return this._roundPosition;
  }
  
  const string get_matchLiveId() const {
    return this._matchLiveId;
  }
  
  const string get_scoreUnit() const {
    return this._scoreUnit;
  }
  
  const MatchResult@[]@ get_results() const {
    return this._results;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'MatchResults('
      + string::Join({'roundPosition=' + '' + roundPosition, 'matchLiveId=' + matchLiveId, 'scoreUnit=' + scoreUnit, 'results=' + TS_Array_MatchResult(results)}, ', ')
      + ')';
  }
  
  private const string TS_Array_MatchResult(const array<MatchResult@> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += arr[i].ToString();
    }
    return ret + '}';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const MatchResults@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    bool _tmp_arrEq_results = _results.Length == other.results.Length;
    for (uint i = 0; i < _results.Length; i++) {
      if (!_tmp_arrEq_results) {
        break;
      }
      _tmp_arrEq_results = _tmp_arrEq_results && (_results[i] == other.results[i]);
    }
    return true
      && _roundPosition == other.roundPosition
      && _matchLiveId == other.matchLiveId
      && _scoreUnit == other.scoreUnit
      && _tmp_arrEq_results
      ;
  }
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += '' + _roundPosition + ",";
    ret += TRS_WrapString(_matchLiveId) + ",";
    ret += TRS_WrapString(_scoreUnit) + ",";
    ret += TRS_WrapString(TRS_Array_MatchResult(_results)) + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
  
  private const string TRS_Array_MatchResult(const array<MatchResult@> &in arr) {
    string ret = '';
    for (uint i = 0; i < arr.Length; i++) {
      ret += TRS_WrapString(arr[i].ToRowString()) + ',';
    }
    return ret;
  }
}

namespace _MatchResults {
  /* Namespace // Mixin: Row Serialization */
  shared MatchResults@ FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    /* Parse field: roundPosition of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint roundPosition = Text::ParseInt(chunk);
    /* Parse field: matchLiveId of type: string */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string matchLiveId = chunk;
    /* Parse field: scoreUnit of type: string */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string scoreUnit = chunk;
    /* Parse field: results of type: array<MatchResult@> */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    array<MatchResult@> results = FRS_Array_MatchResult(chunk);
    return MatchResults(roundPosition, matchLiveId, scoreUnit, results);
  }
  
  shared const array<MatchResult@>@ FRS_Array_MatchResult(const string &in str) {
    array<MatchResult@> ret = array<MatchResult@>(0);
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    while (remainder.Length > 0) {
      FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
      tmp = remainder.SubStr(1).Split(':', 2);
      chunkLen = Text::ParseInt(tmp[0]);
      chunk = tmp[1].SubStr(0, chunkLen);
      FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
      remainder = tmp[1].SubStr(chunkLen + 2);
      ret.InsertLast(_MatchResult::FromRowString(chunk));
    }
    return ret;
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}