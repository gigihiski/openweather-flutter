import 'package:equatable/equatable.dart';

/// Wind
class Wind extends Equatable {
  double speed;
  double degree;

  @override
  List<Object> get props => [speed, degree];

  Wind({this.speed, this.degree});

  factory Wind.fromJson(Map<String, dynamic> data) {
    double speed = double.parse((data['speed'] ?? 0.0).toString());
    double degree = double.parse((data['deg'] ?? 0.0).toString());

    return Wind(speed: speed, degree: degree);
  }
}
