shared class PlayerSplitsInfo {
  /* Properties // Mixin: Default Properties */
  private string _Name;
  private string _MapName;
  private array<uint> _PBTimes;
  private array<uint> _PBSplits;
  private array<uint> _BestSplits;
  private uint _SumOfBest;
  private array<uint> _NextBestTimes1;
  private array<uint> _NextBestTimes2;
  private array<uint> _NextBestTimes3;
  private array<uint> _NextBestTimes4;
  
  /* Methods // Mixin: Default Constructor */
  PlayerSplitsInfo(const string &in Name, const string &in MapName, const uint[] &in PBTimes, const uint[] &in PBSplits, const uint[] &in BestSplits, uint SumOfBest, const uint[] &in NextBestTimes1, const uint[] &in NextBestTimes2, const uint[] &in NextBestTimes3, const uint[] &in NextBestTimes4) {
    this._Name = Name;
    this._MapName = MapName;
    this._PBTimes = PBTimes;
    this._PBSplits = PBSplits;
    this._BestSplits = BestSplits;
    this._SumOfBest = SumOfBest;
    this._NextBestTimes1 = NextBestTimes1;
    this._NextBestTimes2 = NextBestTimes2;
    this._NextBestTimes3 = NextBestTimes3;
    this._NextBestTimes4 = NextBestTimes4;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  PlayerSplitsInfo(const Json::Value@ j) {
    try {
      this._Name = string(j["Name"]);
      this._MapName = string(j["MapName"]);
      this._PBTimes = array<uint>(j["PBTimes"].Length);
      for (uint i = 0; i < j["PBTimes"].Length; i++) {
        this._PBTimes[i] = uint(j["PBTimes"][i]);
      }
      this._PBSplits = array<uint>(j["PBSplits"].Length);
      for (uint i = 0; i < j["PBSplits"].Length; i++) {
        this._PBSplits[i] = uint(j["PBSplits"][i]);
      }
      this._BestSplits = array<uint>(j["BestSplits"].Length);
      for (uint i = 0; i < j["BestSplits"].Length; i++) {
        this._BestSplits[i] = uint(j["BestSplits"][i]);
      }
      this._SumOfBest = uint(j["SumOfBest"]);
      this._NextBestTimes1 = array<uint>(j["NextBestTimes1"].Length);
      for (uint i = 0; i < j["NextBestTimes1"].Length; i++) {
        this._NextBestTimes1[i] = uint(j["NextBestTimes1"][i]);
      }
      this._NextBestTimes2 = array<uint>(j["NextBestTimes2"].Length);
      for (uint i = 0; i < j["NextBestTimes2"].Length; i++) {
        this._NextBestTimes2[i] = uint(j["NextBestTimes2"][i]);
      }
      this._NextBestTimes3 = array<uint>(j["NextBestTimes3"].Length);
      for (uint i = 0; i < j["NextBestTimes3"].Length; i++) {
        this._NextBestTimes3[i] = uint(j["NextBestTimes3"][i]);
      }
      this._NextBestTimes4 = array<uint>(j["NextBestTimes4"].Length);
      for (uint i = 0; i < j["NextBestTimes4"].Length; i++) {
        this._NextBestTimes4[i] = uint(j["NextBestTimes4"][i]);
      }
    } catch {
      OnFromJsonError(j);
    }
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
    j["Name"] = _Name;
    j["MapName"] = _MapName;
    Json::Value@ _tmp_PBTimes = Json::Array();
    for (uint i = 0; i < _PBTimes.Length; i++) {
      auto v = _PBTimes[i];
      _tmp_PBTimes.Add(Json::Value(v));
    }
    j["PBTimes"] = _tmp_PBTimes;
    Json::Value@ _tmp_PBSplits = Json::Array();
    for (uint i = 0; i < _PBSplits.Length; i++) {
      auto v = _PBSplits[i];
      _tmp_PBSplits.Add(Json::Value(v));
    }
    j["PBSplits"] = _tmp_PBSplits;
    Json::Value@ _tmp_BestSplits = Json::Array();
    for (uint i = 0; i < _BestSplits.Length; i++) {
      auto v = _BestSplits[i];
      _tmp_BestSplits.Add(Json::Value(v));
    }
    j["BestSplits"] = _tmp_BestSplits;
    j["SumOfBest"] = _SumOfBest;
    Json::Value@ _tmp_NextBestTimes1 = Json::Array();
    for (uint i = 0; i < _NextBestTimes1.Length; i++) {
      auto v = _NextBestTimes1[i];
      _tmp_NextBestTimes1.Add(Json::Value(v));
    }
    j["NextBestTimes1"] = _tmp_NextBestTimes1;
    Json::Value@ _tmp_NextBestTimes2 = Json::Array();
    for (uint i = 0; i < _NextBestTimes2.Length; i++) {
      auto v = _NextBestTimes2[i];
      _tmp_NextBestTimes2.Add(Json::Value(v));
    }
    j["NextBestTimes2"] = _tmp_NextBestTimes2;
    Json::Value@ _tmp_NextBestTimes3 = Json::Array();
    for (uint i = 0; i < _NextBestTimes3.Length; i++) {
      auto v = _NextBestTimes3[i];
      _tmp_NextBestTimes3.Add(Json::Value(v));
    }
    j["NextBestTimes3"] = _tmp_NextBestTimes3;
    Json::Value@ _tmp_NextBestTimes4 = Json::Array();
    for (uint i = 0; i < _NextBestTimes4.Length; i++) {
      auto v = _NextBestTimes4[i];
      _tmp_NextBestTimes4.Add(Json::Value(v));
    }
    j["NextBestTimes4"] = _tmp_NextBestTimes4;
    return j;
  }
  
  void OnFromJsonError(const Json::Value@ j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  const string get_Name() const {
    return this._Name;
  }
  
  const string get_MapName() const {
    return this._MapName;
  }
  
  const uint[]@ get_PBTimes() const {
    return this._PBTimes;
  }
  
  const uint[]@ get_PBSplits() const {
    return this._PBSplits;
  }
  
  const uint[]@ get_BestSplits() const {
    return this._BestSplits;
  }
  
  uint get_SumOfBest() const {
    return this._SumOfBest;
  }
  
  const uint[]@ get_NextBestTimes1() const {
    return this._NextBestTimes1;
  }
  
  const uint[]@ get_NextBestTimes2() const {
    return this._NextBestTimes2;
  }
  
  const uint[]@ get_NextBestTimes3() const {
    return this._NextBestTimes3;
  }
  
  const uint[]@ get_NextBestTimes4() const {
    return this._NextBestTimes4;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'PlayerSplitsInfo('
      + string::Join({'Name=' + Name, 'MapName=' + MapName, 'PBTimes=' + TS_Array_uint(PBTimes), 'PBSplits=' + TS_Array_uint(PBSplits), 'BestSplits=' + TS_Array_uint(BestSplits), 'SumOfBest=' + '' + SumOfBest, 'NextBestTimes1=' + TS_Array_uint(NextBestTimes1), 'NextBestTimes2=' + TS_Array_uint(NextBestTimes2), 'NextBestTimes3=' + TS_Array_uint(NextBestTimes3), 'NextBestTimes4=' + TS_Array_uint(NextBestTimes4)}, ', ')
      + ')';
  }
  
  private const string TS_Array_uint(const array<uint> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += '' + arr[i];
    }
    return ret + '}';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const PlayerSplitsInfo@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    bool _tmp_arrEq_PBTimes = _PBTimes.Length == other.PBTimes.Length;
    for (uint i = 0; i < _PBTimes.Length; i++) {
      if (!_tmp_arrEq_PBTimes) {
        break;
      }
      _tmp_arrEq_PBTimes = _tmp_arrEq_PBTimes && (_PBTimes[i] == other.PBTimes[i]);
    }
    bool _tmp_arrEq_PBSplits = _PBSplits.Length == other.PBSplits.Length;
    for (uint i = 0; i < _PBSplits.Length; i++) {
      if (!_tmp_arrEq_PBSplits) {
        break;
      }
      _tmp_arrEq_PBSplits = _tmp_arrEq_PBSplits && (_PBSplits[i] == other.PBSplits[i]);
    }
    bool _tmp_arrEq_BestSplits = _BestSplits.Length == other.BestSplits.Length;
    for (uint i = 0; i < _BestSplits.Length; i++) {
      if (!_tmp_arrEq_BestSplits) {
        break;
      }
      _tmp_arrEq_BestSplits = _tmp_arrEq_BestSplits && (_BestSplits[i] == other.BestSplits[i]);
    }
    bool _tmp_arrEq_NextBestTimes1 = _NextBestTimes1.Length == other.NextBestTimes1.Length;
    for (uint i = 0; i < _NextBestTimes1.Length; i++) {
      if (!_tmp_arrEq_NextBestTimes1) {
        break;
      }
      _tmp_arrEq_NextBestTimes1 = _tmp_arrEq_NextBestTimes1 && (_NextBestTimes1[i] == other.NextBestTimes1[i]);
    }
    bool _tmp_arrEq_NextBestTimes2 = _NextBestTimes2.Length == other.NextBestTimes2.Length;
    for (uint i = 0; i < _NextBestTimes2.Length; i++) {
      if (!_tmp_arrEq_NextBestTimes2) {
        break;
      }
      _tmp_arrEq_NextBestTimes2 = _tmp_arrEq_NextBestTimes2 && (_NextBestTimes2[i] == other.NextBestTimes2[i]);
    }
    bool _tmp_arrEq_NextBestTimes3 = _NextBestTimes3.Length == other.NextBestTimes3.Length;
    for (uint i = 0; i < _NextBestTimes3.Length; i++) {
      if (!_tmp_arrEq_NextBestTimes3) {
        break;
      }
      _tmp_arrEq_NextBestTimes3 = _tmp_arrEq_NextBestTimes3 && (_NextBestTimes3[i] == other.NextBestTimes3[i]);
    }
    bool _tmp_arrEq_NextBestTimes4 = _NextBestTimes4.Length == other.NextBestTimes4.Length;
    for (uint i = 0; i < _NextBestTimes4.Length; i++) {
      if (!_tmp_arrEq_NextBestTimes4) {
        break;
      }
      _tmp_arrEq_NextBestTimes4 = _tmp_arrEq_NextBestTimes4 && (_NextBestTimes4[i] == other.NextBestTimes4[i]);
    }
    return true
      && _Name == other.Name
      && _MapName == other.MapName
      && _tmp_arrEq_PBTimes
      && _tmp_arrEq_PBSplits
      && _tmp_arrEq_BestSplits
      && _SumOfBest == other.SumOfBest
      && _tmp_arrEq_NextBestTimes1
      && _tmp_arrEq_NextBestTimes2
      && _tmp_arrEq_NextBestTimes3
      && _tmp_arrEq_NextBestTimes4
      ;
  }
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(Buffer@ buf) {
    WTB_LP_String(buf, _Name);
    WTB_LP_String(buf, _MapName);
    WTB_Array_Uint(buf, _PBTimes);
    WTB_Array_Uint(buf, _PBSplits);
    WTB_Array_Uint(buf, _BestSplits);
    buf.Write(_SumOfBest);
    WTB_Array_Uint(buf, _NextBestTimes1);
    WTB_Array_Uint(buf, _NextBestTimes2);
    WTB_Array_Uint(buf, _NextBestTimes3);
    WTB_Array_Uint(buf, _NextBestTimes4);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += 4 + _Name.Length;
    bytes += 4 + _MapName.Length;
    bytes += CBB_Array_Uint(_PBTimes);
    bytes += CBB_Array_Uint(_PBSplits);
    bytes += CBB_Array_Uint(_BestSplits);
    bytes += 4;
    bytes += CBB_Array_Uint(_NextBestTimes1);
    bytes += CBB_Array_Uint(_NextBestTimes2);
    bytes += CBB_Array_Uint(_NextBestTimes3);
    bytes += CBB_Array_Uint(_NextBestTimes4);
    return bytes;
  }
  
  void WTB_LP_String(Buffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
  
  void WTB_Array_Uint(Buffer@ buf, const array<uint> &in arr) {
    buf.Write(uint(arr.Length));
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      buf.Write(el);
    }
  }
  
  uint CBB_Array_Uint(const array<uint> &in arr) {
    uint bytes = 4;
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      bytes += 4;
    }
    return bytes;
  }
}

namespace _PlayerSplitsInfo {
  /* Namespace // Mixin: ToFromBuffer */
  shared PlayerSplitsInfo@ ReadFromBuffer(Buffer@ buf) {
    /* Parse field: Name of type: string */
    string Name = RFB_LP_String(buf);
    /* Parse field: MapName of type: string */
    string MapName = RFB_LP_String(buf);
    /* Parse field: PBTimes of type: array<uint> */
    array<uint> PBTimes = RFB_Array_Uint(buf);
    /* Parse field: PBSplits of type: array<uint> */
    array<uint> PBSplits = RFB_Array_Uint(buf);
    /* Parse field: BestSplits of type: array<uint> */
    array<uint> BestSplits = RFB_Array_Uint(buf);
    /* Parse field: SumOfBest of type: uint */
    uint SumOfBest = buf.ReadUInt32();
    /* Parse field: NextBestTimes1 of type: array<uint> */
    array<uint> NextBestTimes1 = RFB_Array_Uint(buf);
    /* Parse field: NextBestTimes2 of type: array<uint> */
    array<uint> NextBestTimes2 = RFB_Array_Uint(buf);
    /* Parse field: NextBestTimes3 of type: array<uint> */
    array<uint> NextBestTimes3 = RFB_Array_Uint(buf);
    /* Parse field: NextBestTimes4 of type: array<uint> */
    array<uint> NextBestTimes4 = RFB_Array_Uint(buf);
    return PlayerSplitsInfo(Name, MapName, PBTimes, PBSplits, BestSplits, SumOfBest, NextBestTimes1, NextBestTimes2, NextBestTimes3, NextBestTimes4);
  }
  
  shared const string RFB_LP_String(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
  
  shared const array<uint>@ RFB_Array_Uint(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    array<uint> arr = array<uint>(len);
    for (uint i = 0; i < arr.Length; i++) {
      arr[i] = buf.ReadUInt32();
    }
    return arr;
  }
}