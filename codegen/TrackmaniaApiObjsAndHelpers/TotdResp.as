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
  TotdResp(const Json::Value &in j) {
    try {
      this._monthList = array<TotdMonth@>(j["monthList"].Length);
      for (uint i = 0; i < j["monthList"].Length; i++) {
        @this._monthList[i] = TotdMonth(j["monthList"][i]);
      }
      this._itemCount = j["itemCount"];
      this._nextRequestTimestamp = j["nextRequestTimestamp"];
    } catch {
      OnFromJsonError(j);
    }
  }
  
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    Json::Value _tmp_monthList = Json::Array();
    for (uint i = 0; i < _monthList.Length; i++) {
      auto v = _monthList[i];
      _tmp_monthList.Add(v.ToJson());
    }
    j["monthList"] = _tmp_monthList;
    j["itemCount"] = _itemCount;
    j["nextRequestTimestamp"] = _nextRequestTimestamp;
    return j;
  }
  
  void OnFromJsonError(const Json::Value &in j) const {
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
      + string::Join({'monthList=' + TS_Array_TotdMonth(monthList), 'itemCount=' + '' + itemCount, 'nextRequestTimestamp=' + '' + nextRequestTimestamp}, ', ')
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
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += TRS_WrapString(TRS_Array_TotdMonth(_monthList)) + ",";
    ret += '' + _itemCount + ",";
    ret += '' + _nextRequestTimestamp + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
  
  private const string TRS_Array_TotdMonth(const array<TotdMonth@> &in arr) {
    string ret = '';
    for (uint i = 0; i < arr.Length; i++) {
      ret += TRS_WrapString(arr[i].ToRowString()) + ',';
    }
    return ret;
  }
}

namespace _TotdResp {
  /* Namespace // Mixin: Row Serialization */
  shared TotdResp@ FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    /* Parse field: monthList of type: array<TotdMonth@> */
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    array<TotdMonth@> monthList = FRS_Array_TotdMonth(chunk);
    /* Parse field: itemCount of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint itemCount = Text::ParseInt(chunk);
    /* Parse field: nextRequestTimestamp of type: uint */
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint nextRequestTimestamp = Text::ParseInt(chunk);
    return TotdResp(monthList, itemCount, nextRequestTimestamp);
  }
  
  shared const array<TotdMonth@>@ FRS_Array_TotdMonth(const string &in str) {
    array<TotdMonth@> ret = array<TotdMonth@>(0);
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    while (remainder.Length > 0) {
      FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
      tmp = remainder.SubStr(1).Split(':', 2);
      chunkLen = Text::ParseInt(tmp[0]);
      chunk = tmp[1].SubStr(0, chunkLen);
      FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
      remainder = tmp[1].SubStr(chunkLen + 2);
      ret.InsertLast(_TotdMonth::FromRowString(chunk));
    }
    return ret;
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}