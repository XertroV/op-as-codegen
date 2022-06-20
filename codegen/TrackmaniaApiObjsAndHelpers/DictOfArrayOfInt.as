shared class DictOfArrayOfInt {
  /* Properties // Mixin: Default Properties */
  private dictionary@ _d;
  
  /* Properties // Mixin: Dict Backing */
  
  /* Methods // Mixin: Dict Backing */
  DictOfArrayOfInt() {
    @_d = dictionary();
  }
  
  private const string K(int key) const {
    return '' + key;
  }
  
  const int[]@ Get(int key) const {
    return cast<array<int>>(_d[K(key)]);
  }
  
  const int[]@ GetOrDefault(int key) {
    if (!Exists(key)) {
      Set(key, {});
    }
    return Get(key);
  }
  
  void Set(int key, const int[] &in value) {
    _d[K(key)] = value;
  }
  
  bool Exists(int key) {
    return _d.Exists(K(key));
  }
  
  const int[]@ GetKeys() const {
    array<int> ret = {};
    auto _keys = _d.GetKeys();
    for (uint i = 0; i < _keys.Length; i++) {
      auto _k = _keys[i];
      ret.InsertLast(Text::ParseInt(_k));
    }
    return ret;
  }
  
  _DictOfArrayOfInt::KvPair@ GetItem(int key) const {
    return _DictOfArrayOfInt::KvPair(key, Get(key));
  }
  
  array<_DictOfArrayOfInt::KvPair@>@ GetItems() const {
    array<_DictOfArrayOfInt::KvPair@> ret = array<_DictOfArrayOfInt::KvPair@>(GetSize());
    array<int> keys = GetKeys();
    for (uint i = 0; i < keys.Length; i++) {
      auto key = keys[i];
      @ret[i] = GetItem(key);
    }
    return ret;
  }
  
  const int[]@ opIndex(int key) {
    return Get(key);
  }
  
  uint GetSize() const {
    return _d.GetSize();
  }
  
  bool Delete(int key) {
    return _d.Delete(K(key));
  }
  
  void DeleteAll() {
    _d.DeleteAll();
  }
}

namespace _DictOfArrayOfInt {
  /* Namespace // Mixin: Dict Backing */
  shared class KvPair {
    /* Properties // Mixin: Default Properties */
    private int _key;
    private array<int> _val;
    
    /* Methods // Mixin: Default Constructor */
    KvPair(int key, const int[] &in val) {
      this._key = key;
      this._val = val;
    }
    
    /* Methods // Mixin: Getters */
    int get_key() const {
      return this._key;
    }
    
    const int[]@ get_val() const {
      return this._val;
    }
    
    /* Methods // Mixin: ToString */
    const string ToString() {
      return 'KvPair('
        + string::Join({'key=' + '' + key, 'val=' + TS_Array_int(val)}, ', ')
        + ')';
    }
    
    private const string TS_Array_int(const array<int> &in arr) {
      string ret = '{';
      for (uint i = 0; i < arr.Length; i++) {
        if (i > 0) ret += ', ';
        ret += '' + arr[i];
      }
      return ret + '}';
    }
    
    /* Methods // Mixin: Op Eq */
    bool opEquals(const KvPair@ &in other) {
      if (other is null) {
        return false; // this obj can never be null.
      }
      bool _tmp_arrEq_val = _val.Length == other.val.Length;
      for (uint i = 0; i < _val.Length; i++) {
        if (!_tmp_arrEq_val) {
          break;
        }
        _tmp_arrEq_val = _tmp_arrEq_val && (_val[i] == other.val[i]);
      }
      return true
        && _key == other.key
        && _tmp_arrEq_val
        ;
    }
    
    /* Methods // Mixin: Row Serialization */
    const string ToRowString() {
      string ret = "";
      ret += '' + _key + ",";
      ret += TRS_WrapString(TRS_Array_int(_val)) + ",";
      return ret;
    }
    
    private const string TRS_WrapString(const string &in s) {
      string _s = s.Replace('\n', '\\n').Replace('\r', '\\r');
      return '(' + _s.Length + ':' + _s + ')';
    }
    
    private const string TRS_Array_int(const array<int> &in arr) {
      string ret = '';
      for (uint i = 0; i < arr.Length; i++) {
        ret += '' + arr[i] + ',';
      }
      return ret;
    }
  }
  
  namespace _KvPair {
    /* Namespace // Mixin: Row Serialization */
    shared KvPair@ FromRowString(const string &in str) {
      string chunk = '', remainder = str;
      array<string> tmp = array<string>(2);
      uint chunkLen;
      /* Parse field: key of type: int */
      tmp = remainder.Split(',', 2);
      chunk = tmp[0]; remainder = tmp[1];
      int key = Text::ParseInt(chunk);
      /* Parse field: val of type: array<int> */
      FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
      tmp = remainder.SubStr(1).Split(':', 2);
      chunkLen = Text::ParseInt(tmp[0]);
      chunk = tmp[1].SubStr(0, chunkLen);
      FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
      remainder = tmp[1].SubStr(chunkLen + 2);
      array<int> val = FRS_Array_int(chunk);
      return KvPair(key, val);
    }
    
    shared const array<int>@ FRS_Array_int(const string &in str) {
      array<int> ret = array<int>(0);
      string chunk = '', remainder = str;
      array<string> tmp = array<string>(2);
      uint chunkLen;
      while (remainder.Length > 0) {
        tmp = remainder.Split(',', 2);
        chunk = tmp[0]; remainder = tmp[1];
        ret.InsertLast(Text::ParseInt(chunk));
      }
      return ret;
    }
    
    shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
      if (sample != expected) {
        throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
      }
    }
  }
}