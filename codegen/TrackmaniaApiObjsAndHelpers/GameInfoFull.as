shared class GameInfoFull {
  /* Properties // Mixin: Default Properties */
  private array<User@> _players;
  private uint _n_game_msgs;
  private array<string> _teams;
  private array<int> _map_list;
  private string _room;
  private string _lobby;
  
  /* Methods // Mixin: Default Constructor */
  GameInfoFull(const User@[] &in players, uint n_game_msgs, const string[] &in teams, const int[] &in map_list, const string &in room, const string &in lobby) {
    this._players = players;
    this._n_game_msgs = n_game_msgs;
    this._teams = teams;
    this._map_list = map_list;
    this._room = room;
    this._lobby = lobby;
  }
  
  /* Methods // Mixin: ToFrom JSON Object */
  GameInfoFull(const Json::Value@ j) {
    this._players = array<User@>(j["players"].Length);
    for (uint i = 0; i < j["players"].Length; i++) {
      @this._players[i] = User(j["players"][i]);
    }
    this._n_game_msgs = uint(j["n_game_msgs"]);
    this._teams = array<string>(j["teams"].Length);
    for (uint i = 0; i < j["teams"].Length; i++) {
      this._teams[i] = string(j["teams"][i]);
    }
    this._map_list = array<int>(j["map_list"].Length);
    for (uint i = 0; i < j["map_list"].Length; i++) {
      this._map_list[i] = int(j["map_list"][i]);
    }
    this._room = string(j["room"]);
    this._lobby = string(j["lobby"]);
  }
  
  Json::Value@ ToJson() {
    Json::Value@ j = Json::Object();
    Json::Value@ _tmp_players = Json::Array();
    for (uint i = 0; i < _players.Length; i++) {
      auto v = _players[i];
      _tmp_players.Add(v.ToJson());
    }
    j["players"] = _tmp_players;
    j["n_game_msgs"] = _n_game_msgs;
    Json::Value@ _tmp_teams = Json::Array();
    for (uint i = 0; i < _teams.Length; i++) {
      auto v = _teams[i];
      _tmp_teams.Add(Json::Value(v));
    }
    j["teams"] = _tmp_teams;
    Json::Value@ _tmp_map_list = Json::Array();
    for (uint i = 0; i < _map_list.Length; i++) {
      auto v = _map_list[i];
      _tmp_map_list.Add(Json::Value(v));
    }
    j["map_list"] = _tmp_map_list;
    j["room"] = _room;
    j["lobby"] = _lobby;
    return j;
  }
  
  void OnFromJsonError(const Json::Value@ j) const {
    warn('Parsing json failed: ' + Json::Write(j));
    throw('Failed to parse JSON: ' + getExceptionInfo());
  }
  
  /* Methods // Mixin: Getters */
  const User@[]@ get_players() const {
    return this._players;
  }
  
  uint get_n_game_msgs() const {
    return this._n_game_msgs;
  }
  
  const string[]@ get_teams() const {
    return this._teams;
  }
  
  const int[]@ get_map_list() const {
    return this._map_list;
  }
  
  const string get_room() const {
    return this._room;
  }
  
  const string get_lobby() const {
    return this._lobby;
  }
  
  /* Methods // Mixin: ToString */
  const string ToString() {
    return 'GameInfoFull('
      + string::Join({'players=' + TS_Array_User(players), 'n_game_msgs=' + tostring(n_game_msgs), 'teams=' + TS_Array_string(teams), 'map_list=' + TS_Array_int(map_list), 'room=' + room, 'lobby=' + lobby}, ', ')
      + ')';
  }
  
  private const string TS_Array_User(const array<User@> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += arr[i].ToString();
    }
    return ret + '}';
  }
  
  private const string TS_Array_string(const array<const string &in> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += arr[i];
    }
    return ret + '}';
  }
  
  private const string TS_Array_int(const array<int> &in arr) {
    string ret = '{';
    for (uint i = 0; i < arr.Length; i++) {
      if (i > 0) ret += ', ';
      ret += tostring(arr[i]);
    }
    return ret + '}';
  }
  
  /* Methods // Mixin: Op Eq */
  bool opEquals(const GameInfoFull@ &in other) {
    if (other is null) {
      return false; // this obj can never be null.
    }
    bool _tmp_arrEq_players = _players.Length == other.players.Length;
    for (uint i = 0; i < _players.Length; i++) {
      if (!_tmp_arrEq_players) {
        break;
      }
      _tmp_arrEq_players = _tmp_arrEq_players && (_players[i] == other.players[i]);
    }
    bool _tmp_arrEq_teams = _teams.Length == other.teams.Length;
    for (uint i = 0; i < _teams.Length; i++) {
      if (!_tmp_arrEq_teams) {
        break;
      }
      _tmp_arrEq_teams = _tmp_arrEq_teams && (_teams[i] == other.teams[i]);
    }
    bool _tmp_arrEq_map_list = _map_list.Length == other.map_list.Length;
    for (uint i = 0; i < _map_list.Length; i++) {
      if (!_tmp_arrEq_map_list) {
        break;
      }
      _tmp_arrEq_map_list = _tmp_arrEq_map_list && (_map_list[i] == other.map_list[i]);
    }
    return true
      && _tmp_arrEq_players
      && _n_game_msgs == other.n_game_msgs
      && _tmp_arrEq_teams
      && _tmp_arrEq_map_list
      && _room == other.room
      && _lobby == other.lobby
      ;
  }
}
