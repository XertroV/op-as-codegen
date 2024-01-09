shared class TmMap {
  /* Properties // Mixin: Default Properties */
  private string _Id;
  private string _Uid;
  private string _Name;
  private string _FileName;
  private uint _AuthorScore;
  private uint _GoldScore;
  private uint _SilverScore;
  private uint _BronzeScore;
  private string _AuthorDisplayName;
  private string _AuthorAccountId;
  private string _AuthorWebServicesUserId;
  private string _SubmitterAccountId;
  private string _SubmitterWebServicesUserId;
  private string _Style;
  private uint _TimeStamp;
  private string _Type;
  private string _FileUrl;
  private string _ThumbnailUrl;
  
  /* Methods // Mixin: Default Constructor */
  TmMap(const string &in Id, const string &in Uid, const string &in Name, const string &in FileName, uint AuthorScore, uint GoldScore, uint SilverScore, uint BronzeScore, const string &in AuthorDisplayName, const string &in AuthorAccountId, const string &in AuthorWebServicesUserId, const string &in SubmitterAccountId, const string &in SubmitterWebServicesUserId, const string &in Style, uint TimeStamp, const string &in Type, const string &in FileUrl, const string &in ThumbnailUrl) {
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
  TmMap(const Json::Value@ j) {
    this._Id = string(j["Id"]);
    this._Uid = string(j["Uid"]);
    this._Name = string(j["Name"]);
    this._FileName = string(j["FileName"]);
    this._AuthorScore = uint(j["AuthorScore"]);
    this._GoldScore = uint(j["GoldScore"]);
    this._SilverScore = uint(j["SilverScore"]);
    this._BronzeScore = uint(j["BronzeScore"]);
    this._AuthorDisplayName = string(j["AuthorDisplayName"]);
    this._AuthorAccountId = string(j["AuthorAccountId"]);
    this._AuthorWebServicesUserId = string(j["AuthorWebServicesUserId"]);
    this._SubmitterAccountId = string(j["SubmitterAccountId"]);
    this._SubmitterWebServicesUserId = string(j["SubmitterWebServicesUserId"]);
    this._Style = string(j["Style"]);
    this._TimeStamp = uint(j["TimeStamp"]);
    this._Type = string(j["Type"]);
    this._FileUrl = string(j["FileUrl"]);
    this._ThumbnailUrl = string(j["ThumbnailUrl"]);
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
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
  
  void OnFromJsonError(const Json::Value@ j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
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
  
  uint get_AuthorScore() const {
    return this._AuthorScore;
  }
  
  uint get_GoldScore() const {
    return this._GoldScore;
  }
  
  uint get_SilverScore() const {
    return this._SilverScore;
  }
  
  uint get_BronzeScore() const {
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
  
  uint get_TimeStamp() const {
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
      + string::Join({'Id=' + Id, 'Uid=' + Uid, 'Name=' + Name, 'FileName=' + FileName, 'AuthorScore=' + tostring(AuthorScore), 'GoldScore=' + tostring(GoldScore), 'SilverScore=' + tostring(SilverScore), 'BronzeScore=' + tostring(BronzeScore), 'AuthorDisplayName=' + AuthorDisplayName, 'AuthorAccountId=' + AuthorAccountId, 'AuthorWebServicesUserId=' + AuthorWebServicesUserId, 'SubmitterAccountId=' + SubmitterAccountId, 'SubmitterWebServicesUserId=' + SubmitterWebServicesUserId, 'Style=' + Style, 'TimeStamp=' + tostring(TimeStamp), 'Type=' + Type, 'FileUrl=' + FileUrl, 'ThumbnailUrl=' + ThumbnailUrl}, ', ')
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
  
  /* Methods // Mixin: ToFromBuffer */
  void WriteToBuffer(MemoryBuffer@ buf) {
    WTB_LP_String(buf, _Id);
    WTB_LP_String(buf, _Uid);
    WTB_LP_String(buf, _Name);
    WTB_LP_String(buf, _FileName);
    buf.Write(_AuthorScore);
    buf.Write(_GoldScore);
    buf.Write(_SilverScore);
    buf.Write(_BronzeScore);
    WTB_LP_String(buf, _AuthorDisplayName);
    WTB_LP_String(buf, _AuthorAccountId);
    WTB_LP_String(buf, _AuthorWebServicesUserId);
    WTB_LP_String(buf, _SubmitterAccountId);
    WTB_LP_String(buf, _SubmitterWebServicesUserId);
    WTB_LP_String(buf, _Style);
    buf.Write(_TimeStamp);
    WTB_LP_String(buf, _Type);
    WTB_LP_String(buf, _FileUrl);
    WTB_LP_String(buf, _ThumbnailUrl);
  }
  
  uint CountBufBytes() {
    uint bytes = 0;
    bytes += 4 + _Id.Length;
    bytes += 4 + _Uid.Length;
    bytes += 4 + _Name.Length;
    bytes += 4 + _FileName.Length;
    bytes += 4;
    bytes += 4;
    bytes += 4;
    bytes += 4;
    bytes += 4 + _AuthorDisplayName.Length;
    bytes += 4 + _AuthorAccountId.Length;
    bytes += 4 + _AuthorWebServicesUserId.Length;
    bytes += 4 + _SubmitterAccountId.Length;
    bytes += 4 + _SubmitterWebServicesUserId.Length;
    bytes += 4 + _Style.Length;
    bytes += 4;
    bytes += 4 + _Type.Length;
    bytes += 4 + _FileUrl.Length;
    bytes += 4 + _ThumbnailUrl.Length;
    return bytes;
  }
  
  void WTB_LP_String(MemoryBuffer@ buf, const string &in s) {
    buf.Write(uint(s.Length));
    buf.Write(s);
  }
  
  /* Methods // Mixin: From Game Object: CNadeoServicesMap */
  TmMap(CNadeoServicesMap@ &in gameObj) {
    this._Id = gameObj.Id;
    this._Uid = gameObj.Uid;
    this._Name = gameObj.Name;
    this._FileName = gameObj.FileName;
    this._AuthorScore = gameObj.AuthorScore;
    this._GoldScore = gameObj.GoldScore;
    this._SilverScore = gameObj.SilverScore;
    this._BronzeScore = gameObj.BronzeScore;
    this._AuthorDisplayName = gameObj.AuthorDisplayName;
    this._AuthorAccountId = gameObj.AuthorAccountId;
    this._AuthorWebServicesUserId = gameObj.AuthorWebServicesUserId;
    this._SubmitterAccountId = gameObj.SubmitterAccountId;
    this._SubmitterWebServicesUserId = gameObj.SubmitterWebServicesUserId;
    this._Style = gameObj.Style;
    this._TimeStamp = gameObj.TimeStamp;
    this._Type = gameObj.Type;
    this._FileUrl = gameObj.FileUrl;
    this._ThumbnailUrl = gameObj.ThumbnailUrl;
  }
}

namespace _TmMap {
  /* Namespace // Mixin: ToFromBuffer */
  shared TmMap@ ReadFromBuffer(MemoryBuffer@ buf) {
    /* Parse field: Id of type: string */
    string Id = RFB_LP_String(buf);
    /* Parse field: Uid of type: string */
    string Uid = RFB_LP_String(buf);
    /* Parse field: Name of type: string */
    string Name = RFB_LP_String(buf);
    /* Parse field: FileName of type: string */
    string FileName = RFB_LP_String(buf);
    /* Parse field: AuthorScore of type: uint */
    uint AuthorScore = buf.ReadUInt32();
    /* Parse field: GoldScore of type: uint */
    uint GoldScore = buf.ReadUInt32();
    /* Parse field: SilverScore of type: uint */
    uint SilverScore = buf.ReadUInt32();
    /* Parse field: BronzeScore of type: uint */
    uint BronzeScore = buf.ReadUInt32();
    /* Parse field: AuthorDisplayName of type: string */
    string AuthorDisplayName = RFB_LP_String(buf);
    /* Parse field: AuthorAccountId of type: string */
    string AuthorAccountId = RFB_LP_String(buf);
    /* Parse field: AuthorWebServicesUserId of type: string */
    string AuthorWebServicesUserId = RFB_LP_String(buf);
    /* Parse field: SubmitterAccountId of type: string */
    string SubmitterAccountId = RFB_LP_String(buf);
    /* Parse field: SubmitterWebServicesUserId of type: string */
    string SubmitterWebServicesUserId = RFB_LP_String(buf);
    /* Parse field: Style of type: string */
    string Style = RFB_LP_String(buf);
    /* Parse field: TimeStamp of type: uint */
    uint TimeStamp = buf.ReadUInt32();
    /* Parse field: Type of type: string */
    string Type = RFB_LP_String(buf);
    /* Parse field: FileUrl of type: string */
    string FileUrl = RFB_LP_String(buf);
    /* Parse field: ThumbnailUrl of type: string */
    string ThumbnailUrl = RFB_LP_String(buf);
    return TmMap(Id, Uid, Name, FileName, AuthorScore, GoldScore, SilverScore, BronzeScore, AuthorDisplayName, AuthorAccountId, AuthorWebServicesUserId, SubmitterAccountId, SubmitterWebServicesUserId, Style, TimeStamp, Type, FileUrl, ThumbnailUrl);
  }
  
  shared const string RFB_LP_String(MemoryBuffer@ buf) {
    uint len = buf.ReadUInt32();
    return buf.ReadString(len);
  }
}