class DictOfString {
  /* Properties // Mixin: Default Properties */
  private dictionary@ _d;
  
  /* Methods // Mixin: Dict Backing */
  DictOfString() {
    @_d = dictionary();
  }
  
  const string Get(const string &in key) const {
    return string(_d[key]);
  }
  
  void Set(const string &in key, const string &in value) {
    _d[key] = value;
  }
  
  bool Exists(const string &in key) {
    return _d.Exists(key);
  }
  
  array<string>@ GetKeys() const {
    return _d.GetKeys();
  }
  
  const string opIndex(const string &in key) {
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
