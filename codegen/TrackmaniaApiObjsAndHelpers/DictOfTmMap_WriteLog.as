shared class DictOfTmMap_WriteLog {
  /* Properties // Mixin: Default Properties */
  private dictionary@ _d;
  
  /* Properties // Mixin: Dict Backing */
  private string _logPath;
  private bool _initialized = false;
  
  /* Methods // Mixin: Dict Backing */
  DictOfTmMap_WriteLog(const string &in logDir, const string &in logFile) {
    @_d = dictionary();
    InitLog(logDir, logFile);
  }
  
  private const string K(const string &in key) const {
    return key;
  }
  
  TmMap@ Get(const string &in key) const {
    return cast<TmMap@>(_d[K(key)]);
  }
  
  const TmMap@[]@ GetMany(const string[] &in keys) const {
    array<TmMap@> ret = {};
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      ret.InsertLast(Get(key));
    }
    return ret;
  }
  
  
  void Set(const string &in key, TmMap@ value) {
    @_d[K(key)] = value;
    WriteOnSet(key, value);
  }
  
  bool Exists(const string &in key) {
    return _d.Exists(K(key));
  }
  
  uint CountExists(const string[] &in keys) {
    uint ret = 0;
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      if (Exists(key)) ret++;
    }
    return ret;
  }
  
  array<string>@ GetKeys() const {
    return _d.GetKeys();
  }
  
  _DictOfTmMap_WriteLog::KvPair@ GetItem(const string &in key) const {
    return _DictOfTmMap_WriteLog::KvPair(key, Get(key));
  }
  
  array<_DictOfTmMap_WriteLog::KvPair@>@ GetItems() const {
    array<_DictOfTmMap_WriteLog::KvPair@> ret = array<_DictOfTmMap_WriteLog::KvPair@>(GetSize());
    array<string> keys = GetKeys();
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      @ret[i] = GetItem(key);
    }
    return ret;
  }
  
  TmMap@ opIndex(const string &in key) {
    return Get(key);
  }
  
  uint GetSize() const {
    return _d.GetSize();
  }
  
  bool Delete(const string &in key) {
    return _d.Delete(K(key));
  }
  
  void DeleteAll() {
    WriteLogOnResetAll();
    _d.DeleteAll();
  }
  
  /* Dict Optional: Write Log = True */
  private void InitLog(const string &in logDir, const string &in logFile) {
    _logPath = logDir + '/' + logFile;
    trace('DictOfTmMap_WriteLog dir: ' + logDir + ' | logFile: ' + logFile);
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
      MemoryBuffer fb = f.Read(f.Size());
      f.Close();
      uint lineNum = 0;
      string line;
      while (!fb.AtEnd()) {
        uint len = Text::ParseUInt(fb.ReadString(8));
        line = fb.ReadString(len);
        lineNum++;
        fb.Seek(1, 1);
        try {
          auto kv = _DictOfTmMap_WriteLog::_KvPair::FromRowString(line);
          @_d[K(kv.key)] = kv.val;
        } catch {
          throw('Error parsing ' + _logPath + ' on line ' + lineNum + ' via saved entry: ' + line + '.\nException info: ' + getExceptionInfo());
        }
      }
      trace('\\$a4fDictOfTmMap_WriteLog\\$777 loaded \\$a4f' + GetSize() + '\\$777 entries from log file: \\$a4f' + _logPath + '\\$777 in \\$a4f' + (Time::Now - start) + ' ms\\$777.');
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
  
  private void WriteOnSet(const string &in key, TmMap@ value) {
    _DictOfTmMap_WriteLog::KvPair@ p = _DictOfTmMap_WriteLog::KvPair(key, value);
    string s = p.ToRowString();
    IO::File f(_logPath, IO::FileMode::Append);
    f.Write(Text::Format('%08d', s.Length));
    f.WriteLine(s);
    f.Close();
  }
  
  private void WriteLogOnResetAll() {
    IO::File f(_logPath, IO::FileMode::Write);
    f.Write('');
    f.Close();
  }
}

namespace _DictOfTmMap_WriteLog {
  /* Namespace // Mixin: Dict Backing */
  shared class KvPair {
    /* Properties // Mixin: Default Properties */
    private string _key;
    private TmMap@ _val;
    
    /* Methods // Mixin: Default Constructor */
    KvPair(const string &in key, TmMap@ val) {
      this._key = key;
      @this._val = val;
    }
    
    /* Methods // Mixin: Getters */
    const string get_key() const {
      return this._key;
    }
    
    TmMap@ get_val() const {
      return this._val;
    }
    
    /* Methods // Mixin: ToString */
    const string ToString() {
      return 'KvPair('
        + string::Join({'key=' + key, 'val=' + val.ToString()}, ', ')
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
      ret += TRS_WrapString(_key) + ",";
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
  }
  
  namespace _KvPair {
    /* Namespace // Mixin: Row Serialization */
    shared KvPair@ FromRowString(const string &in str) {
      string chunk = '', remainder = str;
      array<string> tmp = array<string>(2);
      uint chunkLen = 0;
      /* Parse field: key of type: string */
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
      string key = chunk;
      /* Parse field: val of type: TmMap@ */
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
      TmMap@ val = _TmMap::FromRowString(chunk);
      return KvPair(key, val);
    }
    
    shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
      if (sample != expected) {
        throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
      }
    }
  }
}