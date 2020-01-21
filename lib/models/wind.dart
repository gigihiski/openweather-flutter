/// Wind
class Wind {
  double speed;
  double degree;

  Wind({this.speed, this.degree});

  factory Wind.fromJson(Map<String, dynamic> data) {
    double speed = data['speed'] as double;
    double degree = data['degree'] as double;

    return Wind(speed: speed, degree: degree);
  }
}
