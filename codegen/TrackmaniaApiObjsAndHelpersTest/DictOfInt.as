shared class DictOfInt {
  /* Properties // Mixin: Default Properties */
  private dictionary@ _d;
  
  /* Properties // Mixin: Dict Backing */
  
  /* Methods // Mixin: Dict Backing */
  DictOfInt() {
    @_d = dictionary();
  }
  
  int Get(const string &in key) const {
    return int(_d[key]);
  }
  
  void Set(const string &in key, int value) {
    _d[key] = value;
  }
  
  bool Exists(const string &in key) {
    return _d.Exists(key);
  }
  
  array<string>@ GetKeys() const {
    return _d.GetKeys();
  }
  
  _DictOfInt::KvPair@ GetItem(const string &in key) const {
    return _DictOfInt::KvPair(key, Get(key));
  }
  
  array<_DictOfInt::KvPair@>@ GetItems() const {
    array<_DictOfInt::KvPair@> ret = array<_DictOfInt::KvPair@>(GetSize());
    array<string> keys = GetKeys();
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      @ret[i] = GetItem(key);
    }
    return ret;
  }
  
  int opIndex(const string &in key) {
    return Get(key);
  }
  
  uint GetSize() const {
    return _d.GetSize();
  }
  
  bool Delete(const string &in key) {
    return _d.Delete(key);
  }
  
  void DeleteAll() {
    _d.DeleteAll();
  }
}

namespace _DictOfInt {
  /* Namespace // Mixin: Dict Backing */
  shared class KvPair {
    /* Properties // Mixin: Default Properties */
    private string _key;
    private int _val;
    
    /* Methods // Mixin: Default Constructor */
    KvPair(const string &in key, int val) {
      this._key = key;
      this._val = val;
    }
    
    /* Methods // Mixin: Getters */
    const string get_key() const {
      return this._key;
    }
    
    int get_val() const {
      return this._val;
    }
    
    /* Methods // Mixin: ToString */
    const string ToString() {
      return 'KvPair('
        + string::Join({key, '' + val}, ', ')
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
      ret += '' + _val + ",";
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
      tmp = remainder.Split(',', 2);
      chunk = tmp[0]; remainder = tmp[1];
      int val = Text::ParseInt(chunk);
      return KvPair(key, val);
    }
    
    shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
      if (sample != expected) {
        throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
      }
    }
  }
}