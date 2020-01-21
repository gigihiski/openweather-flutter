/// Place Info
class PlaceInfo {
  int identifier;
  String name;

  PlaceInfo({this.identifier, this.name});

  factory PlaceInfo.fromJson(Map<String, dynamic> data) {
    int identifier = data['identifier'] as int;
    String name = data['name'] as String;

    return PlaceInfo(identifier: identifier, name: name);
  }
}
