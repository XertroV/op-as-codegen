shared class DictOfBool {
  /* Properties // Mixin: Default Properties */
  private dictionary@ _d;
  
  /* Properties // Mixin: Dict Backing */
  
  /* Methods // Mixin: Dict Backing */
  DictOfBool() {
    @_d = dictionary();
  }
  
  private const string K(const string &in key) const {
    return key;
  }
  
  bool Get(const string &in key) const {
    return bool(_d[K(key)]);
  }
  
  const bool[]@ GetMany(const string[] &in keys) const {
    array<bool> ret = {};
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      ret.InsertLast(Get(key));
    }
    return ret;
  }
  
  
  void Set(const string &in key, bool value) {
    _d[K(key)] = value;
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
  
  _DictOfBool::KvPair@ GetItem(const string &in key) const {
    return _DictOfBool::KvPair(key, Get(key));
  }
  
  array<_DictOfBool::KvPair@>@ GetItems() const {
    array<_DictOfBool::KvPair@> ret = array<_DictOfBool::KvPair@>(GetSize());
    array<string> keys = GetKeys();
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      @ret[i] = GetItem(key);
    }
    return ret;
  }
  
  bool opIndex(const string &in key) {
    return Get(key);
  }
  
  uint GetSize() const {
    return _d.GetSize();
  }
  
  bool Delete(const string &in key) {
    return _d.Delete(K(key));
  }
  
  void DeleteAll() {
    _d.DeleteAll();
  }
}

namespace _DictOfBool {
  /* Namespace // Mixin: Dict Backing */
  shared class KvPair {
    /* Properties // Mixin: Default Properties */
    private string _key;
    private bool _val;
    
    /* Methods // Mixin: Default Constructor */
    KvPair(const string &in key, bool val) {
      this._key = key;
      this._val = val;
    }
    
    /* Methods // Mixin: Getters */
    const string get_key() const {
      return this._key;
    }
    
    bool get_val() const {
      return this._val;
    }
    
    /* Methods // Mixin: ToString */
    const string ToString() {
      return 'KvPair('
        + string::Join({'key=' + key, 'val=' + tostring(val)}, ', ')
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
      ret += '' + _val + ",";
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
      WTB_LP_String(buf, _key);
      buf.Write(uint8(_val ? 1 : 0));
    }
    
    uint CountBufBytes() {
      uint bytes = 0;
      bytes += 4 + _key.Length;
      bytes += 1;
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
      /* Parse field: val of type: bool */
      try {
        tmp = remainder.Split(',', 2);
        chunk = tmp[0]; remainder = tmp[1];
      } catch {
        warn('Error getting chunk/remainder: chunkLen / chunk.Length / remainder =' + string::Join({'' + chunkLen, '' + chunk.Length, remainder}, ' / ') +  '\nException info: ' + getExceptionInfo());
        throw(getExceptionInfo());
      }
      bool val = ('true' == chunk.ToLower());
      return KvPair(key, val);
    }
    
    shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
      if (sample != expected) {
        throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
      }
    }
    
    /* Namespace // Mixin: ToFromBuffer */
    shared KvPair@ ReadFromBuffer(MemoryBuffer@ buf) {
      /* Parse field: key of type: string */
      string key = RFB_LP_String(buf);
      /* Parse field: val of type: bool */
      bool val = buf.ReadUInt8() > 0;
      return KvPair(key, val);
    }
    
    shared const string RFB_LP_String(MemoryBuffer@ buf) {
      uint len = buf.ReadUInt32();
      return buf.ReadString(len);
    }
  }
}