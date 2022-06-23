shared class StorageLocation {
  private string _path;
  
  StorageLocation(const string &in fileName, const string &in subDir = '') {
    string[] dirs = {'Storage', Meta::ExecutingPlugin()};
    if (subDir.Length > 0) {
      dirs.InsertLast(subDir);
    }
    dirs.InsertLast(fileName);
    _path = IO::FromDataFolder(string::Join(dirs, '/'));
  }
  
  const string get_Path() {
    return _path;
  }
}