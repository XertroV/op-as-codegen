shared class Buffer {
  MemoryBuffer _buf = MemoryBuffer(0);
  
  Buffer() {
  }
  
  Buffer(const string &in str) {
    _buf.Write(str);
  }
  
  uint GetSize() {
    return _buf.GetSize();
  }
  
  bool AtEnd() {
    return _buf.AtEnd();
  }
  
  void Seek(uint64 pos, int dir = 0) {
    _buf.Seek(pos, dir);
  }
  
  void Resize(uint64 &in v) {
    _buf.Resize(v);
  }
  
  uint ReadUInt32() {
    return _buf.ReadUInt32();
  }
  
  uint8 ReadUInt8() {
    return _buf.ReadUInt8();
  }
  
  uint16 ReadUInt16() {
    return _buf.ReadUInt16();
  }
  
  uint64 ReadUInt64() {
    return _buf.ReadUInt64();
  }
  
  int ReadInt32() {
    return _buf.ReadInt32();
  }
  
  int8 ReadInt8() {
    return _buf.ReadInt8();
  }
  
  int16 ReadInt16() {
    return _buf.ReadInt16();
  }
  
  int64 ReadInt64() {
    return _buf.ReadInt64();
  }
  
  float ReadFloat() {
    return _buf.ReadFloat();
  }
  
  double ReadDouble() {
    return _buf.ReadDouble();
  }
  
  const string ReadString(uint l) {
    return _buf.ReadString(l);
  }
  
  void Write(uint &in v) {
    _buf.Write(v);
  }
  
  void Write(uint8 &in v) {
    _buf.Write(v);
  }
  
  void Write(uint16 &in v) {
    _buf.Write(v);
  }
  
  void Write(uint64 &in v) {
    _buf.Write(v);
  }
  
  void Write(int &in v) {
    _buf.Write(v);
  }
  
  void Write(int8 &in v) {
    _buf.Write(v);
  }
  
  void Write(int16 &in v) {
    _buf.Write(v);
  }
  
  void Write(int64 &in v) {
    _buf.Write(v);
  }
  
  void Write(float &in v) {
    _buf.Write(v);
  }
  
  void Write(double &in v) {
    _buf.Write(v);
  }
  
  void Write(const string &in v) {
    _buf.Write(v);
  }
}