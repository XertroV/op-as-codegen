shared class TotdResp {
  /* Properties // Mixin: Default Properties */
  private array<TotdMonth@> _monthList;
  private uint _itemCount;
  private uint _nextRequestTimestamp;
  
  /* Methods // Mixin: Default Constructor */
  TotdResp(const TotdMonth@[] &in monthList, uint itemCount, uint nextRequestTimestamp) {
    this._monthList = monthList;
    this._itemCount = itemCount;
    this._nextRequestTimestamp = nextRequestTimestamp;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  TotdResp(const Json::Value@ j) {
    this._monthList = array<TotdMonth@>(j["monthList"].Length);
    for (uint i = 0; i < j["monthList"].Length; i++) {
      @this._monthList[i] = TotdMonth(j["monthList"][i]);
    }
    this._itemCount = uint(j["itemCount"]);
    this._nextRequestTimestamp = uint(j["nextRequestTimestamp"]);
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
    Json::Value@ _tmp_monthList = Json::Array();
    for (uint i = 0; i < _monthList.Length; i++) {
      auto v = _monthList[i];
      _tmp_monthList.Add(v.ToJson());
    }
    j["monthList"] = _tmp_monthList;
    j["itemCount"] = _itemCount;
    j["nextRequestTimestamp"] = _nextRequestTimestamp;
    return j;
  }
  
  void OnFromJsonError(const Json::Value@ j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  const TotdMonth@[]@ get_monthList() const {
    return this._monthList;
  }
  
  uint get_itemCount() const {
    return this._itemCount;
  }
  
  uint get_nextRequestTimestamp() const {
    return this._nextRequestTimestamp;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'TotdResp('
      + string::Join({'monthList=' + TS_Array_TotdMonth(monthList), 'itemCount=' + tostring(itemCount), 'nextRequestTimestamp=' + tostring(nextRequestTimestamp)}, ', ')
      + ')';
  }
  
  private const string TS_Array_TotdMonth(const array<TotdMonth@> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += arr[i].ToString();
    }
    return ret + '}';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const TotdResp@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    bool _tmp_arrEq_monthList = _monthList.Length == other.monthList.Length;
    for (uint i = 0; i < _monthList.Length; i++) {
      if (!_tmp_arrEq_monthList) {
        break;
      }
      _tmp_arrEq_monthList = _tmp_arrEq_monthList && (_monthList[i] == other.monthList[i]);
    }
    return true
      && _tmp_arrEq_monthList
      && _itemCount == other.itemCount
      && _nextRequestTimestamp == other.nextRequestTimestamp
      ;
  }
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(MemoryBuffer@ buf) {
    WTB_Array_TotdMonth(buf, _monthList);
    buf.Write(_itemCount);
    buf.Write(_nextRequestTimestamp);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += CBB_Array_TotdMonth(_monthList);
    bytes += 4;
    bytes += 4;
    return bytes;
  }
  
  void WTB_LP_String(MemoryBuffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
  
  void WTB_Array_TotdMonth(MemoryBuffer@ buf, const array<TotdMonth@> &in arr) {
    buf.Write(uint(arr.Length));
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      el.WriteToBuffer(buf);
    }
  }
  
  uint CBB_Array_TotdMonth(const array<TotdMonth@> &in arr) {
    uint bytes = 4;
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      bytes += el.CountBufBytes();
    }
    return bytes;
  }
}

namespace _TotdResp {
  /* Namespace // Mixin: ToFromBuffer */
  shared TotdResp@ ReadFromBuffer(MemoryBuffer@ buf) {
    /* Parse field: monthList of type: array<TotdMonth@> */
    array<TotdMonth@> monthList = RFB_Array_TotdMonth(buf);
    /* Parse field: itemCount of type: uint */
    uint itemCount = buf.ReadUInt32();
    /* Parse field: nextRequestTimestamp of type: uint */
    uint nextRequestTimestamp = buf.ReadUInt32();
    return TotdResp(monthList, itemCount, nextRequestTimestamp);
  }
  
  shared const string RFB_LP_String(MemoryBuffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
  
  shared const array<TotdMonth@>@ RFB_Array_TotdMonth(MemoryBuffer@ buf) {
    uint len = buf.ReadUInt32();
    array<TotdMonth@> arr = array<TotdMonth@>(len);
    for (uint i = 0; i < arr.Length; i++) {
      @arr[i] = _TotdMonth::ReadFromBuffer(buf);
    }
    return arr;
  }
}