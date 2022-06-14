class DictOfInt {
  /* Properties // Mixin: Default Properties */
  private dictionary@ _d;
  
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
