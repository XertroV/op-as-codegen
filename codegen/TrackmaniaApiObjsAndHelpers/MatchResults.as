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
  MatchResults(const Json::Value@ j) {
    this._roundPosition = uint(j["roundPosition"]);
    this._matchLiveId = string(j["matchLiveId"]);
    this._scoreUnit = string(j["scoreUnit"]);
    this._results = array<MatchResult@>(j["results"].Length);
    for (uint i = 0; i < j["results"].Length; i++) {
      @this._results[i] = MatchResult(j["results"][i]);
    }
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
    j["roundPosition"] = _roundPosition;
    j["matchLiveId"] = _matchLiveId;
    j["scoreUnit"] = _scoreUnit;
    Json::Value@ _tmp_results = Json::Array();
    for (uint i = 0; i < _results.Length; i++) {
      auto v = _results[i];
      _tmp_results.Add(v.ToJson());
    }
    j["results"] = _tmp_results;
    return j;
  }
  
  void OnFromJsonError(const Json::Value@ j) const {
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
      + string::Join({'roundPosition=' + tostring(roundPosition), 'matchLiveId=' + matchLiveId, 'scoreUnit=' + scoreUnit, 'results=' + TS_Array_MatchResult(results)}, ', ')
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
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(MemoryBuffer@ buf) {
    buf.Write(_roundPosition);
    WTB_LP_String(buf, _matchLiveId);
    WTB_LP_String(buf, _scoreUnit);
    WTB_Array_MatchResult(buf, _results);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += 4;
    bytes += 4 + _matchLiveId.Length;
    bytes += 4 + _scoreUnit.Length;
    bytes += CBB_Array_MatchResult(_results);
    return bytes;
  }
  
  void WTB_LP_String(MemoryBuffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
  
  void WTB_Array_MatchResult(MemoryBuffer@ buf, const array<MatchResult@> &in arr) {
    buf.Write(uint(arr.Length));
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      el.WriteToBuffer(buf);
    }
  }
  
  uint CBB_Array_MatchResult(const array<MatchResult@> &in arr) {
    uint bytes = 4;
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      bytes += el.CountBufBytes();
    }
    return bytes;
  }
}

namespace _MatchResults {
  /* Namespace // Mixin: ToFromBuffer */
  shared MatchResults@ ReadFromBuffer(MemoryBuffer@ buf) {
    /* Parse field: roundPosition of type: uint */
    uint roundPosition = buf.ReadUInt32();
    /* Parse field: matchLiveId of type: string */
    string matchLiveId = RFB_LP_String(buf);
    /* Parse field: scoreUnit of type: string */
    string scoreUnit = RFB_LP_String(buf);
    /* Parse field: results of type: array<MatchResult@> */
    array<MatchResult@> results = RFB_Array_MatchResult(buf);
    return MatchResults(roundPosition, matchLiveId, scoreUnit, results);
  }
  
  shared const string RFB_LP_String(MemoryBuffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
  
  shared const array<MatchResult@>@ RFB_Array_MatchResult(MemoryBuffer@ buf) {
    uint len = buf.ReadUInt32();
    array<MatchResult@> arr = array<MatchResult@>(len);
    for (uint i = 0; i < arr.Length; i++) {
      @arr[i] = _MatchResult::ReadFromBuffer(buf);
    }
    return arr;
  }
  
  /* Namespace // Mixin: DirOf */
  shared class DirOf {
    /* Properties // Mixin: Default Properties */
    private dictionary@ _objs;
    
    /* Properties // Mixin: DirOfMatchResults */
    private string _dir;
    private bool _initialized = false;
    
    /* Methods // Mixin: DirOfMatchResults */
    DirOf(const string &in dir) {
      @_objs = dictionary();
      _dir = dir;
      if (!IO::FolderExists(_dir)) {
        IO::CreateFolder(_dir, true);
      }
      RunInit();
    }
    
    bool get_Initialized() {
      return _initialized;
    }
    
    void AwaitInitialized() {
      while (!_initialized) {
        yield();
      }
    }
    
    private void RunInit() {
      auto keys = IO::IndexFolder(_dir, false);
      for (uint i = 0; i < keys.Length; i++) {
        auto key = keys[i];
        if (key.EndsWith('.bin')) {
          Get(UnK(key.SubStr(0, key.Length - 4)));
        }
      }
      _initialized = true;
    }
    
    private dictionary@ get_objs() {
      return _objs;
    }
    
    const string K(uint key) {
      return '' + key;
    }
    
    uint UnK(const string &in keyStr) {
      return Text::ParseInt(keyStr);
    }
    
    const string GetFileName(uint key) {
      return K(key) + '.bin';
    }
    
    const string GetFilePath(uint key) {
      return _dir + '/' + GetFileName(key);
    }
    
    MatchResults@ ReadFileToObj(const string &in path) {
      IO::File f(path, IO::FileMode::Read);
      MemoryBuffer@ buf = MemoryBuffer(f.Read(f.Size()));
      f.Close();
      return ReadFromBuffer(buf);
    }
    
    bool Exists(uint key) {
      return objs.Exists(K(key)) || IO::FileExists(GetFilePath(key));
    }
    
    MatchResults@ Get(uint key) {
      if (objs.Exists(K(key))) {
        return cast<MatchResults@>(objs[K(key)]);
      }
      MatchResults@ obj;
      if (IO::FileExists(GetFilePath(key))) {
        @obj = ReadFileToObj(GetFilePath(key));
        @objs[K(key)] = obj;
      }
      return obj;
    }
    
    void Set(uint key, MatchResults@ val) {
      IO::File f(GetFilePath(key), IO::FileMode::Write);
      MemoryBuffer@ buf = MemoryBuffer();
      val.WriteToBuffer(buf);
      buf.Seek(0);
      f.Write(buf);
      f.Close();
    }
  }
  
}