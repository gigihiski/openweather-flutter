import 'package:equatable/equatable.dart';

/// Place Info
class PlaceInfo extends Equatable {
  int identifier;
  String name;

  @override
  List<Object> get props => [identifier, name];

  PlaceInfo({this.identifier, this.name});

  factory PlaceInfo.fromJson(Map<String, dynamic> data) {
    int identifier = data['id'] as int;
    String name = data['name'] as String;

    return PlaceInfo(identifier: identifier, name: name);
  }
}
