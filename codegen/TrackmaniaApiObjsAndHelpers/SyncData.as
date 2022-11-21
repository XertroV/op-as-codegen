shared class SyncData {
  /* Properties // Mixin: Default Properties */
  private uint _lastUpdated;
  private string _status;
  
  /* Properties // Mixin: Persistent */
  private string _path;
  private bool _doPersist = false;
  bool quiet = false;
  
  /* Methods // Mixin: Default Constructor */
  SyncData(uint lastUpdated, const string &in status) {
    this._lastUpdated = lastUpdated;
    this._status = status;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  SyncData(const Json::Value &in j) {
    try {
      this._lastUpdated = uint(j["lastUpdated"]);
      this._status = string(j["status"]);
    } catch {
      OnFromJsonError(j);
    }
  }
  
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    j["lastUpdated"] = _lastUpdated;
    j["status"] = _status;
    return j;
  }
  
  void OnFromJsonError(const Json::Value &in j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  uint get_lastUpdated() const {
    return this._lastUpdated;
  }
  
  const string get_status() const {
    return this._status;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'SyncData('
      + string::Join({'lastUpdated=' + '' + lastUpdated, 'status=' + status}, ', ')
      + ')';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const SyncData@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    return true
      && _lastUpdated == other.lastUpdated
      && _status == other.status
      ;
  }
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(Buffer@ buf) {
    buf.Write(_lastUpdated);
    WTB_LP_String(buf, _status);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += 4;
    bytes += 4 + _status.Length;
    return bytes;
  }
  
  void WTB_LP_String(Buffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
  
  /* Methods // Mixin: Empty Constructor With Defaults */
  SyncData() {
    _lastUpdated = 0;
    _status = '';
  }
  
  /* Methods // Mixin: Persistent */
  SyncData(StorageLocation@ storageLoc) {
    uint start = Time::Now;
    InitPersist(storageLoc);
    ReloadFromDisk();
  }
  
  void InitPersist(StorageLocation@ storageLoc) {
    if (_doPersist) throw('Persistence already initialized.');
    storageLoc.EnsureDirExists();
    _path = storageLoc.Path;
    _doPersist = true;
  }
  
  void Persist(bool _quiet = false) {
    auto start = Time::Now;
    Buffer@ buf = Buffer();
    WriteToBuffer(buf);
    buf.Seek(0);
    IO::File f(_path, IO::FileMode::Write);
    f.Write(buf._buf);
    f.Close();
    if (!(quiet || _quiet)) {
      trace('\\$a4fSyncData\\$777 saved \\$a4f' + 1 + '\\$777 entries from: \\$a4f' + _path + '\\$777 in \\$a4f' + (Time::Now - start) + ' ms\\$777.');
    }
  }
  
  void ReloadFromDisk() {
    IO::File f(_path, IO::FileMode::Read);
    Buffer@ buf = Buffer(f.Read(f.Size()));
    f.Close();
    /* Parse field: _lastUpdated of type: uint */
    _lastUpdated = buf.ReadUInt32();
    /* Parse field: _status of type: string */
    _status = RFB_LP_String(buf);
  }
  
  const string RFB_LP_String(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
  
  void set_lastUpdated(uint lastUpdated) {
    _lastUpdated = lastUpdated;
    if (_doPersist) Persist();
  }
  
  void set_status(const string &in status) {
    _status = status;
    if (_doPersist) Persist();
  }
}

namespace _SyncData {
  /* Namespace // Mixin: ToFromBuffer */
  shared SyncData@ ReadFromBuffer(Buffer@ buf) {
    /* Parse field: lastUpdated of type: uint */
    uint lastUpdated = buf.ReadUInt32();
    /* Parse field: status of type: string */
    string status = RFB_LP_String(buf);
    return SyncData(lastUpdated, status);
  }
  
  shared const string RFB_LP_String(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
  
  /* Namespace // Mixin: Persistent */
}