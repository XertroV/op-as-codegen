shared class DictOfChallenge_WriteLog {
  /* Properties // Mixin: Default Properties */
  private dictionary@ _d;
  
  /* Properties // Mixin: Dict Backing */
  private string _logPath;
  
  /* Methods // Mixin: Dict Backing */
  DictOfChallenge_WriteLog(const string &in logDir, const string &in logFile) {
    @_d = dictionary();
    InitLog(logDir, logFile);
  }
  
  Challenge@ Get(const string &in key) const {
    return cast<Challenge@>(_d[key]);
  }
  
  void Set(const string &in key, Challenge@ value) {
    @_d[key] = value;
    WriteOnSet(key, value);
  }
  
  bool Exists(const string &in key) {
    return _d.Exists(key);
  }
  
  array<string>@ GetKeys() const {
    return _d.GetKeys();
  }
  
  _DictOfChallenge_WriteLog::KvPair@ GetItem(const string &in key) const {
    return _DictOfChallenge_WriteLog::KvPair(key, Get(key));
  }
  
  array<_DictOfChallenge_WriteLog::KvPair@>@ GetItems() const {
    array<_DictOfChallenge_WriteLog::KvPair@> ret = array<_DictOfChallenge_WriteLog::KvPair@>(GetSize());
    array<string> keys = GetKeys();
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      @ret[i] = GetItem(key);
    }
    return ret;
  }
  
  Challenge@ opIndex(const string &in key) {
    return Get(key);
  }
  
  uint GetSize() const {
    return _d.GetSize();
  }
  
  bool Delete(const string &in key) {
    return _d.Delete(key);
  }
  
  void DeleteAll() {
    WriteLogOnResetAll();
    _d.DeleteAll();
  }
  
  /* Dict Optional: Write Log = True */
  private void InitLog(const string &in logDir, const string &in logFile) {
    _logPath = logDir + '/' + logFile;
    trace('DictOfChallenge_WriteLog dir: ' + logDir + ' | logFile: ' + logFile);
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
      string line;
      IO::File f(_logPath, IO::FileMode::Read);
      while (!f.EOF()) {
        line = f.ReadLine();
        if (line.Length > 0) {
          auto kv = _DictOfChallenge_WriteLog::_KvPair::FromRowString(line);
          @_d[kv.key] = kv.val;
        }
      }
      f.Close();
      trace('\\$a4fDictOfChallenge_WriteLog\\$777 loaded \\$a4f' + GetSize() + '\\$777 entries from log file: \\$a4f' + _logPath + '\\$777 in \\$a4f' + (Time::Now - start) + ' ms\\$777.');
    } else {
      IO::File f(_logPath, IO::FileMode::Write);
      f.Close();
    }
  }
  
  private void WriteOnSet(const string &in key, Challenge@ value) {
    _DictOfChallenge_WriteLog::KvPair@ p = _DictOfChallenge_WriteLog::KvPair(key, value);
    IO::File f(_logPath, IO::FileMode::Append);
    f.WriteLine(p.ToRowString());
    f.Close();
  }
  
  private void WriteLogOnResetAll() {
    IO::File f(_logPath, IO::FileMode::Write);
    f.Write('');
    f.Close();
  }
}

namespace _DictOfChallenge_WriteLog {
  /* Namespace // Mixin: Dict Backing */
  shared class KvPair {
    /* Properties // Mixin: Default Properties */
    private string _key;
    private Challenge@ _val;
    
    /* Methods // Mixin: Default Constructor */
    KvPair(const string &in key, Challenge@ val) {
      this._key = key;
      @this._val = val;
    }
    
    /* Methods // Mixin: Getters */
    const string get_key() const {
      return this._key;
    }
    
    Challenge@ get_val() const {
      return this._val;
    }
    
    /* Methods // Mixin: ToString */
    const string ToString() {
      return 'KvPair('
        + string::Join({key, val.ToString()}, ', ')
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
    
    /* Methods // Mixin: Op Ord */
    int opOrd(const KvPair@ &in other) {
      return key < other.key ? -1 : key == other.key ? 0 : 1;
    }
    
    /* Methods // Mixin: Row Serialization */
    const string ToRowString() {
      string ret = "";
      ret += TRS_WrapString(_key) + ",";
      ret += TRS_WrapString(_val.ToRowString()) + ",";
      return ret;
    }
    
    private const string TRS_WrapString(const string &in s) {
      return '(' + s.Length + ':' + s + ')';
    }
  }
  
  namespace _KvPair {
    /* Namespace // Mixin: Row Serialization */
    shared KvPair FromRowString(const string &in str) {
      string chunk = '', remainder = str;
      array<string> tmp = array<string>(2);
      uint chunkLen;
      FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
      tmp = remainder.SubStr(1).Split(':', 2);
      chunkLen = Text::ParseInt(tmp[0]);
      chunk = tmp[1].SubStr(0, chunkLen);
      FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
      remainder = tmp[1].SubStr(chunkLen + 2);
      string key = chunk;
      FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
      tmp = remainder.SubStr(1).Split(':', 2);
      chunkLen = Text::ParseInt(tmp[0]);
      chunk = tmp[1].SubStr(0, chunkLen);
      FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
      remainder = tmp[1].SubStr(chunkLen + 2);
      Challenge@ val = _Challenge::FromRowString(chunk);
      return KvPair(key, val);
    }
    
    shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
      if (sample != expected) {
        throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
      }
    }
  }
}