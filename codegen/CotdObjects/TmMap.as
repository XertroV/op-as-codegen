shared class TmMap {
  /* Properties // Mixin: Default Properties */
  private string _Id;
  private string _Uid;
  private string _Name;
  private string _FileName;
  private string _AuthorScore;
  private string _GoldScore;
  private string _SilverScore;
  private string _BronzeScore;
  private string _AuthorDisplayName;
  private string _AuthorAccountId;
  private string _AuthorWebServicesUserId;
  private string _SubmitterAccountId;
  private string _SubmitterWebServicesUserId;
  private string _Style;
  private string _TimeStamp;
  private string _Type;
  private string _FileUrl;
  private string _ThumbnailUrl;
  
  /* Methods // Mixin: Default Constructor */
  TmMap(const string &in Id, const string &in Uid, const string &in Name, const string &in FileName, const string &in AuthorScore, const string &in GoldScore, const string &in SilverScore, const string &in BronzeScore, const string &in AuthorDisplayName, const string &in AuthorAccountId, const string &in AuthorWebServicesUserId, const string &in SubmitterAccountId, const string &in SubmitterWebServicesUserId, const string &in Style, const string &in TimeStamp, const string &in Type, const string &in FileUrl, const string &in ThumbnailUrl) {
    this._Id = Id;
    this._Uid = Uid;
    this._Name = Name;
    this._FileName = FileName;
    this._AuthorScore = AuthorScore;
    this._GoldScore = GoldScore;
    this._SilverScore = SilverScore;
    this._BronzeScore = BronzeScore;
    this._AuthorDisplayName = AuthorDisplayName;
    this._AuthorAccountId = AuthorAccountId;
    this._AuthorWebServicesUserId = AuthorWebServicesUserId;
    this._SubmitterAccountId = SubmitterAccountId;
    this._SubmitterWebServicesUserId = SubmitterWebServicesUserId;
    this._Style = Style;
    this._TimeStamp = TimeStamp;
    this._Type = Type;
    this._FileUrl = FileUrl;
    this._ThumbnailUrl = ThumbnailUrl;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  TmMap(const Json::Value &in j) {
    this._Id = j["Id"];
    this._Uid = j["Uid"];
    this._Name = j["Name"];
    this._FileName = j["FileName"];
    this._AuthorScore = j["AuthorScore"];
    this._GoldScore = j["GoldScore"];
    this._SilverScore = j["SilverScore"];
    this._BronzeScore = j["BronzeScore"];
    this._AuthorDisplayName = j["AuthorDisplayName"];
    this._AuthorAccountId = j["AuthorAccountId"];
    this._AuthorWebServicesUserId = j["AuthorWebServicesUserId"];
    this._SubmitterAccountId = j["SubmitterAccountId"];
    this._SubmitterWebServicesUserId = j["SubmitterWebServicesUserId"];
    this._Style = j["Style"];
    this._TimeStamp = j["TimeStamp"];
    this._Type = j["Type"];
    this._FileUrl = j["FileUrl"];
    this._ThumbnailUrl = j["ThumbnailUrl"];
  }
  
  Json::Value ToJson() {
    Json::Value j = Json::Object();
    j["Id"] = _Id;
    j["Uid"] = _Uid;
    j["Name"] = _Name;
    j["FileName"] = _FileName;
    j["AuthorScore"] = _AuthorScore;
    j["GoldScore"] = _GoldScore;
    j["SilverScore"] = _SilverScore;
    j["BronzeScore"] = _BronzeScore;
    j["AuthorDisplayName"] = _AuthorDisplayName;
    j["AuthorAccountId"] = _AuthorAccountId;
    j["AuthorWebServicesUserId"] = _AuthorWebServicesUserId;
    j["SubmitterAccountId"] = _SubmitterAccountId;
    j["SubmitterWebServicesUserId"] = _SubmitterWebServicesUserId;
    j["Style"] = _Style;
    j["TimeStamp"] = _TimeStamp;
    j["Type"] = _Type;
    j["FileUrl"] = _FileUrl;
    j["ThumbnailUrl"] = _ThumbnailUrl;
    return j;
  }
  
  /* Methods // Mixin: Getters */
  const string get_Id() const {
    return this._Id;
  }
  
  const string get_Uid() const {
    return this._Uid;
  }
  
  const string get_Name() const {
    return this._Name;
  }
  
  const string get_FileName() const {
    return this._FileName;
  }
  
  const string get_AuthorScore() const {
    return this._AuthorScore;
  }
  
  const string get_GoldScore() const {
    return this._GoldScore;
  }
  
  const string get_SilverScore() const {
    return this._SilverScore;
  }
  
  const string get_BronzeScore() const {
    return this._BronzeScore;
  }
  
  const string get_AuthorDisplayName() const {
    return this._AuthorDisplayName;
  }
  
  const string get_AuthorAccountId() const {
    return this._AuthorAccountId;
  }
  
  const string get_AuthorWebServicesUserId() const {
    return this._AuthorWebServicesUserId;
  }
  
  const string get_SubmitterAccountId() const {
    return this._SubmitterAccountId;
  }
  
  const string get_SubmitterWebServicesUserId() const {
    return this._SubmitterWebServicesUserId;
  }
  
  const string get_Style() const {
    return this._Style;
  }
  
  const string get_TimeStamp() const {
    return this._TimeStamp;
  }
  
  const string get_Type() const {
    return this._Type;
  }
  
  const string get_FileUrl() const {
    return this._FileUrl;
  }
  
  const string get_ThumbnailUrl() const {
    return this._ThumbnailUrl;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'TmMap('
      + string::Join({Id, Uid, Name, FileName, AuthorScore, GoldScore, SilverScore, BronzeScore, AuthorDisplayName, AuthorAccountId, AuthorWebServicesUserId, SubmitterAccountId, SubmitterWebServicesUserId, Style, TimeStamp, Type, FileUrl, ThumbnailUrl}, ', ')
      + ')';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const TmMap@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    return true
      && _Id == other.Id
      && _Uid == other.Uid
      && _Name == other.Name
      && _FileName == other.FileName
      && _AuthorScore == other.AuthorScore
      && _GoldScore == other.GoldScore
      && _SilverScore == other.SilverScore
      && _BronzeScore == other.BronzeScore
      && _AuthorDisplayName == other.AuthorDisplayName
      && _AuthorAccountId == other.AuthorAccountId
      && _AuthorWebServicesUserId == other.AuthorWebServicesUserId
      && _SubmitterAccountId == other.SubmitterAccountId
      && _SubmitterWebServicesUserId == other.SubmitterWebServicesUserId
      && _Style == other.Style
      && _TimeStamp == other.TimeStamp
      && _Type == other.Type
      && _FileUrl == other.FileUrl
      && _ThumbnailUrl == other.ThumbnailUrl
      ;
  }
  
  /* Methods // Mixin: Row Serialization */
  const string ToRowString() {
    string ret = "";
    ret += TRS_WrapString(_Id) + ",";
    ret += TRS_WrapString(_Uid) + ",";
    ret += TRS_WrapString(_Name) + ",";
    ret += TRS_WrapString(_FileName) + ",";
    ret += TRS_WrapString(_AuthorScore) + ",";
    ret += TRS_WrapString(_GoldScore) + ",";
    ret += TRS_WrapString(_SilverScore) + ",";
    ret += TRS_WrapString(_BronzeScore) + ",";
    ret += TRS_WrapString(_AuthorDisplayName) + ",";
    ret += TRS_WrapString(_AuthorAccountId) + ",";
    ret += TRS_WrapString(_AuthorWebServicesUserId) + ",";
    ret += TRS_WrapString(_SubmitterAccountId) + ",";
    ret += TRS_WrapString(_SubmitterWebServicesUserId) + ",";
    ret += TRS_WrapString(_Style) + ",";
    ret += TRS_WrapString(_TimeStamp) + ",";
    ret += TRS_WrapString(_Type) + ",";
    ret += TRS_WrapString(_FileUrl) + ",";
    ret += TRS_WrapString(_ThumbnailUrl) + ",";
    return ret;
  }
  
  private const string TRS_WrapString(const string &in s) {
    return '(' + s.Length + ':' + s + ')';
  }
}

namespace _TmMap {
  /* Namespace // Mixin: Row Serialization */
  shared TmMap FromRowString(const string &in str) {
    string chunk = '', remainder = str;
    array<string> tmp = array<string>(2);
    uint chunkLen;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string Id = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string Uid = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string Name = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string FileName = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string AuthorScore = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string GoldScore = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string SilverScore = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string BronzeScore = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string AuthorDisplayName = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string AuthorAccountId = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string AuthorWebServicesUserId = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string SubmitterAccountId = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string SubmitterWebServicesUserId = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string Style = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string TimeStamp = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string Type = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string FileUrl = chunk;
    FRS_Assert_String_Eq(remainder.SubStr(0, 1), '(');
    tmp = remainder.SubStr(1).Split(':', 2);
    chunkLen = Text::ParseInt(tmp[0]);
    chunk = tmp[1].SubStr(0, chunkLen);
    FRS_Assert_String_Eq(tmp[1].SubStr(chunkLen, 2), '),');
    remainder = tmp[1].SubStr(chunkLen + 2);
    string ThumbnailUrl = chunk;
    return TmMap(Id, Uid, Name, FileName, AuthorScore, GoldScore, SilverScore, BronzeScore, AuthorDisplayName, AuthorAccountId, AuthorWebServicesUserId, SubmitterAccountId, SubmitterWebServicesUserId, Style, TimeStamp, Type, FileUrl, ThumbnailUrl);
  }
  
  shared void FRS_Assert_String_Eq(const string &in sample, const string &in expected) {
    if (sample != expected) {
      throw('[FRS_Assert_String_Eq] expected sample string to equal: "' + expected + '" but it was "' + sample + '" instead.');
    }
  }
}