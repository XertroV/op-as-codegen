class DictOfChallenge {
  /* Properties // Mixin: Default Properties */
  private dictionary@ _d;
  
  /* Methods // Mixin: Dict Backing */
  DictOfChallenge() {
    @_d = dictionary();
  }
  
  Challenge@ Get(const string &in key) const {
    return cast<Challenge@>(_d[key]);
  }
  
  void Set(const string &in key, Challenge@ value) {
    @_d[key] = value;
  }
  
  bool Exists(const string &in key) {
    return _d.Exists(key);
  }
  
  array<string>@ GetKeys() const {
    return _d.GetKeys();
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
    _d.DeleteAll();
  }
}
