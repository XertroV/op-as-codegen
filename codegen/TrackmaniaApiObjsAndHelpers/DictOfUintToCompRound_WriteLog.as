shared class DictOfUintToCompRound_WriteLog {
  /* Properties // Mixin: Default Properties */
  private dictionary@ _d;
  
  /* Properties // Mixin: Dict Backing */
  private string _logPath;
  private bool _initialized = false;
  
  /* Methods // Mixin: Dict Backing */
  DictOfUintToCompRound_WriteLog(const string &in logDir, const string &in logFile) {
    @_d = dictionary();
    InitLog(logDir, logFile);
  }
  
  private const string K(uint key) const {
    return '' + key;
  }
  
  CompRound@ Get(uint key) const {
    return cast<CompRound@>(_d[K(key)]);
  }
  
  const CompRound@[]@ GetMany(const uint[] &in keys) const {
    array<CompRound@> ret = {};
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      ret.InsertLast(Get(key));
    }
    return ret;
  }
  
  
  void Set(uint key, CompRound@ value) {
    @_d[K(key)] = value;
    WriteOnSet(key, value);
  }
  
  bool Exists(uint key) {
    return _d.Exists(K(key));
  }
  
  uint CountExists(const uint[] &in keys) {
    uint ret = 0;
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      if (Exists(key)) ret++;
    }
    return ret;
  }
  
  const uint[]@ GetKeys() const {
    array<uint> ret = {};
    auto _keys = _d.GetKeys();
    for (uint i = 0; i < _keys.Length; i++) {
      auto _k = _keys[i];
      ret.InsertLast(Text::ParseInt(_k));
    }
    return ret;
  }
  
  _DictOfUintToCompRound_WriteLog::KvPair@ GetItem(uint key) const {
    return _DictOfUintToCompRound_WriteLog::KvPair(key, Get(key));
  }
  
  array<_DictOfUintToCompRound_WriteLog::KvPair@>@ GetItems() const {
    array<_DictOfUintToCompRound_WriteLog::KvPair@> ret = array<_DictOfUintToCompRound_WriteLog::KvPair@>(GetSize());
    array<uint> keys = GetKeys();
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      @ret[i] = GetItem(key);
    }
    return ret;
  }
  
  CompRound@ opIndex(uint key) {
    return Get(key);
  }
  
  uint GetSize() const {
    return _d.GetSize();
  }
  
  bool Delete(uint key) {
    return _d.Delete(K(key));
  }
  
  void DeleteAll() {
    WriteLogOnResetAll();
    _d.DeleteAll();
  }
  
  /* Dict Optional: Write Log = True */
  private void InitLog(const string &in logDir, const string &in logFile) {
    _logPath = logDir + '/' + logFile;
    trace('DictOfUintToCompRound_WriteLog dir: ' + logDir + ' | logFile: ' + logFile);
    if (logDir.Length == 0) {
      throw('Invalid path: ' + _logPath);
    }
    if (!IO::FolderExists(logDir)) {
      IO::CreateFolder(logDir, true);
    }
    LoadWriteLogFromDisk();
  }
  
  private void LoadWriteLogFromDisk() {
    if (IO::FileExists(_logPath)) {
      uint start = Time::Now;
      IO::File f(_logPath, IO::FileMode::Read);
      MemoryBuffer@ fb = MemoryBuffer(f.Read(f.Size()));
      f.Close();
      while (!fb.AtEnd()) {
        auto kv = _DictOfUintToCompRound_WriteLog::_KvPair::ReadFromBuffer(fb);
        @_d[K(kv.key)] = kv.val;
      }
      trace('\\$a4fDictOfUintToCompRound_WriteLog\\$777 loaded \\$a4f' + GetSize() + '\\$777 entries from: \\$a4f' + _logPath + '\\$777 in \\$a4f' + (Time::Now - start) + ' ms\\$777.');
      f.Close();
    } else {
      IO::File f(_logPath, IO::FileMode::Write);
      f.Close();
    }
    _initialized = true;
  }
  
  bool get_Initialized() {
    return _initialized;
  }
  
  void AwaitInitialized() {
    while (!_initialized) {
      yield();
    }
  }
  
  private void WriteOnSet(uint key, CompRound@ value) {
    _DictOfUintToCompRound_WriteLog::KvPair@ p = _DictOfUintToCompRound_WriteLog::KvPair(key, value);
    MemoryBuffer@ buf = MemoryBuffer();
    p.WriteToBuffer(buf);
    buf.Seek(0, 0);
    IO::File f(_logPath, IO::FileMode::Append);
    f.Write(buf);
    f.Close();
  }
  
  private void WriteLogOnResetAll() {
    IO::File f(_logPath, IO::FileMode::Write);
    f.Write('');
    f.Close();
  }
}

namespace _DictOfUintToCompRound_WriteLog {
  /* Namespace // Mixin: Dict Backing */
  shared class KvPair {
    /* Properties // Mixin: Default Properties */
    private uint _key;
    private CompRound@ _val;
    
    /* Methods // Mixin: Default Constructor */
    KvPair(uint key, CompRound@ val) {
      this._key = key;
      @this._val = val;
    }
    
    /* Methods // Mixin: Getters */
    uint get_key() const {
      return this._key;
    }
    
    CompRound@ get_val() const {
      return this._val;
    }
    
    /* Methods // Mixin: ToString */
    const string ToString() {
      return 'KvPair('
        + string::Join({'key=' + tostring(key), 'val=' + val.ToString()}, ', ')
        + ')';
    }
    
    /* Methods // Mixin: Op Eq */
    bool opEquals(const KvPair@ &in other) {
      if (other is null) {
        return false; // this obj can never be null.
      }
      return true
        && _key == other.key
        && _val == other.val
        ;
    }
    
    /* Methods // Mixin: Row Serialization */
    const string ToRowString() {
      string ret = "";
      ret += '' + _key + ",";
      ret += TRS_WrapString(_val.ToRowString()) + ",";
      return ret;
    }
    
    private const string TRS_WrapString(const string &in s) {
      string _s = s.Replace('\n', '\\n').Replace('\r', '\\r');
      string ret = '(' + _s.Length + ':' + _s + ')';
      if (ret.Length != (3 + _s.Length + ('' + _s.Length).Length)) {
        throw('bad string length encoding. expected: ' + (3 + _s.Length + ('' + _s.Length).Length) + '; but got ' + ret.Length);
      }
      return ret;
    }
    
    /* Methods // Mixin: ToFromBuffer */
    void WriteToBuffer(MemoryBuffer@ buf) {
      buf.Write(_key);
      _val.WriteToBuffer(buf);
    }
    
    uint CountBufBytes() {
      uint bytes = 0;
      bytes += 4;
      bytes += _val.CountBufBytes();
      return bytes;
    }
    
    void WTB_LP_String(MemoryBuffer@ buf, const string &in s) {
      buf.Write(uint(s.Length));
      buf.Write(s);
    }
  }
  
  namespace _KvPair {
    /* Namespace // Mixin: Row Serialization */
    shared KvPair@ FromRowString(const string &in str) {
      string chunk = '', remainder = str;
      array<string> tmp = array<string>(2);
      uint chunkLen = 0;
      /* Parse field: key of type: uint */
      try {
        tmp = remainder.Split(',', 2);
        chunk = tmp[0]; remainder = tmp[1];
      } catch {
        warn('Error getting chunk/remainder: chunkLen / chunk.Length / remainder =' + string::Join({'' + chunkLen, '' + chunk.Length, remainder}, ' / ') +  '\nException info: ' + getExceptionInfo());
        throw(getExceptionInfo());
      }
      uint key = Text::ParseInt(chunk);
      /* Parse field: val of type: CompRound@ */
      try {
        FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
        tmp = remainder.SubStr(1).Split(':', 2);
        chunkLen = Text::ParseInt(tmp[0]);
        chunk = tmp[1].SubStr(0, chunkLen);
        remainder = tmp[1].SubStr(chunkLen + 2);
        FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
      } catch {
        warn('Error getting chunk/remainder: chunkLen / chunk.Length / remainder =' + string::Join({'' + chunkLen, '' + chunk.Length, remainder}, ' / ') +  '\nException info: ' + getExceptionInfo());
        throw(getExceptionInfo());
      }
      CompRound@ val = _CompRound::FromRowString(chunk);
      return KvPair(key, val);
    }
    
    shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
      if (sample != expected) {
        throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
      }
    }
    
    /* Namespace // Mixin: ToFromBuffer */
    shared KvPair@ ReadFromBuffer(MemoryBuffer@ buf) {
      /* Parse field: key of type: uint */
      uint key = buf.ReadUInt32();
      /* Parse field: val of type: CompRound@ */
      CompRound@ val = _CompRound::ReadFromBuffer(buf);
      return KvPair(key, val);
    }
    
    shared const string RFB_LP_String(MemoryBuffer@ buf) {
      uint len = buf.ReadUInt32();
      return buf.ReadString(len);
    }
  }
}