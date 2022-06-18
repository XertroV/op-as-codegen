class MaybeOfUint {
  /* Properties // Mixin: Default Properties */
  private uint _val;
  private bool _hasVal;
  
  /* Methods // Mixin: JMaybes */
  MaybeOfUint(uint val) {
    _hasVal = true;
    _val = val;
  }
  
  MaybeOfUint() {
    _hasVal = false;
  }
  
  MaybeOfUint(const Json::Value &in j) {
    if (j.GetType() % Json::Type::Null == 0) {
      _hasVal = false;
    } else {
      _hasVal = true;
      _val = uint(j);
    }
  }
  
  bool opEquals(const MaybeOfUint@ &in other) {
    if (IsJust()) {
      return other.IsJust() && (_val == other.val);
    }
    return other.IsNothing();
  }
  
  const string ToRowString() {
    if (!_hasVal) {
      return 'null,';
    }
    return '' + _val + ',';
  }
  
  Json::Value ToJson() {
    if (IsNothing()) {
      return Json::Value(); // json null
    }
    return Json::Value(_val);
  }
  
  uint get_val() const {
    if (!_hasVal) {
      throw('Attempted to access .val of a Nothing');
    }
    return _val;
  }
  
  uint GetOr(uint _default) {
    return _hasVal ? _val : _default;
  }
  
  bool IsJust() const {
    return _hasVal;
  }
  
  bool IsSome() const {
    return IsJust();
  }
  
  bool IsNothing() const {
    return !_hasVal;
  }
  
  bool IsNone() const {
    return IsNothing();
  }
}

namespace MaybeOfUint {
  /* Namespace // Mixin: JMaybes */
  MaybeOfUint FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    tmp = remainder.Split(',', 2);
    chunk = tmp[0];
    remainder = tmp[1]; // should always be ''
    if (chunk == 'null') {
      return MaybeOfUint();
    }
    return MaybeOfUint(Text::ParseInt(chunk));
  }
}