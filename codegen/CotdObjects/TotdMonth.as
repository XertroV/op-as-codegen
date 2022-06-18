shared class TotdMonth {
  /* Properties // Mixin: Default Properties */
  private uint _year;
  private uint _month;
  private uint _lastDay;
  private array<TrackOfTheDayEntry@> _days;
  
  /* Methods // Mixin: Default Constructor */
  TotdMonth(uint year, uint month, uint lastDay, const TrackOfTheDayEntry@[] &in days) {
    this._year = year;
    this._month = month;
    this._lastDay = lastDay;
    this._days = days;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  TotdMonth(const Json::Value &in j) {
    this._year = j["year"];
    this._month = j["month"];
    this._lastDay = j["lastDay"];
    this._days = array<TrackOfTheDayEntry@>(j["days"].Length);
    for (uint i = 0; i < j["days"].Length; i++) {
      @this._days[i] = TrackOfTheDayEntry(j["days"][i]);
    }
  }
  
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    j["year"] = _year;
    j["month"] = _month;
    j["lastDay"] = _lastDay;
    Json::Value _tmp_days = Json::Array();
    for (uint i = 0; i < _days.Length; i++) {
      auto v = _days[i];
      _tmp_days.Add(v.ToJson());
    }
    j["days"] = _tmp_days;
    return j;
  }
  
  /* Methods // Mixin: Getters */
  uint get_year() const {
    return this._year;
  }
  
  uint get_month() const {
    return this._month;
  }
  
  uint get_lastDay() const {
    return this._lastDay;
  }
  
  const TrackOfTheDayEntry@[]@ get_days() const {
    return this._days;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'TotdMonth('
      + string::Join({'' + year, '' + month, '' + lastDay, TS_Array_TrackOfTheDayEntry(days)}, ', ')
      + ')';
  }
  
  private const string TS_Array_TrackOfTheDayEntry(const array<TrackOfTheDayEntry@> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += arr[i].ToString();
    }
    return ret + '}';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const TotdMonth@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    bool _tmp_arrEq_days = _days.Length == other.days.Length;
    for (uint i = 0; i < _days.Length; i++) {
      if (!_tmp_arrEq_days) {
        break;
      }
      _tmp_arrEq_days = _tmp_arrEq_days && (_days[i] == other.days[i]);
    }
    return true
      && _year == other.year
      && _month == other.month
      && _lastDay == other.lastDay
      && _tmp_arrEq_days
      ;
  }
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += '' + _year + ",";
    ret += '' + _month + ",";
    ret += '' + _lastDay + ",";
    ret += TRS_WrapString(TRS_Array_TrackOfTheDayEntry(_days)) + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
  
  private const string TRS_Array_TrackOfTheDayEntry(const array<TrackOfTheDayEntry@> &in arr) {
    string ret = '';
    for (uint i = 0; i < arr.Length; i++) {
      ret += TRS_WrapString(arr[i].ToRowString()) + ',';
    }
    return ret;
  }
}

namespace _TotdMonth {
  /* Namespace // Mixin: Row Serialization */
  shared TotdMonth FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint year = Text::ParseInt(chunk);
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint month = Text::ParseInt(chunk);
    tmp = remainder.Split(',', 2);
    chunk = tmp[0]; remainder = tmp[1];
    uint lastDay = Text::ParseInt(chunk);
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    array<TrackOfTheDayEntry@> days = FRS_Array_TrackOfTheDayEntry(chunk);
    return TotdMonth(year, month, lastDay, days);
  }
  
  shared const array<TrackOfTheDayEntry@>@ FRS_Array_TrackOfTheDayEntry(const string &in str) {
    array<TrackOfTheDayEntry@> ret = array<TrackOfTheDayEntry@>(0);
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
      ret.InsertLast(_TrackOfTheDayEntry::FromRowString(chunk));
    }
    return ret;
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}