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
  TotdMonth(const Json::Value@ j) {
    this._year = uint(j["year"]);
    this._month = uint(j["month"]);
    this._lastDay = uint(j["lastDay"]);
    this._days = array<TrackOfTheDayEntry@>(j["days"].Length);
    for (uint i = 0; i < j["days"].Length; i++) {
      @this._days[i] = TrackOfTheDayEntry(j["days"][i]);
    }
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
    j["year"] = _year;
    j["month"] = _month;
    j["lastDay"] = _lastDay;
    Json::Value@ _tmp_days = Json::Array();
    for (uint i = 0; i < _days.Length; i++) {
      auto v = _days[i];
      _tmp_days.Add(v.ToJson());
    }
    j["days"] = _tmp_days;
    return j;
  }
  
  void OnFromJsonError(const Json::Value@ j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
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
      + string::Join({'year=' + tostring(year), 'month=' + tostring(month), 'lastDay=' + tostring(lastDay), 'days=' + TS_Array_TrackOfTheDayEntry(days)}, ', ')
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
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(Buffer@ buf) {
    buf.Write(_year);
    buf.Write(_month);
    buf.Write(_lastDay);
    WTB_Array_TrackOfTheDayEntry(buf, _days);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += 4;
    bytes += 4;
    bytes += 4;
    bytes += CBB_Array_TrackOfTheDayEntry(_days);
    return bytes;
  }
  
  void WTB_LP_String(Buffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
  
  void WTB_Array_TrackOfTheDayEntry(Buffer@ buf, const array<TrackOfTheDayEntry@> &in arr) {
    buf.Write(uint(arr.Length));
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      el.WriteToBuffer(buf);
    }
  }
  
  uint CBB_Array_TrackOfTheDayEntry(const array<TrackOfTheDayEntry@> &in arr) {
    uint bytes = 4;
    for (uint ix = 0; ix < arr.Length; ix++) {
      auto el = arr[ix];
      bytes += el.CountBufBytes();
    }
    return bytes;
  }
}

namespace _TotdMonth {
  /* Namespace // Mixin: ToFromBuffer */
  shared TotdMonth@ ReadFromBuffer(Buffer@ buf) {
    /* Parse field: year of type: uint */
    uint year = buf.ReadUInt32();
    /* Parse field: month of type: uint */
    uint month = buf.ReadUInt32();
    /* Parse field: lastDay of type: uint */
    uint lastDay = buf.ReadUInt32();
    /* Parse field: days of type: array<TrackOfTheDayEntry@> */
    array<TrackOfTheDayEntry@> days = RFB_Array_TrackOfTheDayEntry(buf);
    return TotdMonth(year, month, lastDay, days);
  }
  
  shared const string RFB_LP_String(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
  
  shared const array<TrackOfTheDayEntry@>@ RFB_Array_TrackOfTheDayEntry(Buffer@ buf) {
    uint len = buf.ReadUInt32();
    array<TrackOfTheDayEntry@> arr = array<TrackOfTheDayEntry@>(len);
    for (uint i = 0; i < arr.Length; i++) {
      @arr[i] = _TrackOfTheDayEntry::ReadFromBuffer(buf);
    }
    return arr;
  }
}