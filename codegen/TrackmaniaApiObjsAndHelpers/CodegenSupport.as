void WTB_LP_String(MemoryBuffer@ buf, const string &in s) {
  buf.Write(uint(s.Length));
  buf.Write(s);
}

shared const string RFB_LP_String(MemoryBuffer@ buf) {
  uint len = buf.ReadUInt32();
  return buf.ReadString(len);
}

shared enum SItemType {
  CarSport,
  CharacterPilot,
  CustomMesh
}

shared Json::Value Vec3ToJsonObj(vec3 &in v) {
  auto j = Json::Object();
  j['x'] = v.x;
  j['y'] = v.y;
  j['z'] = v.z;
  return j;
}