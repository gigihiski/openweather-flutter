/// Main Info
class MainInfo {
  double temperature;
  double humidity;

  MainInfo({this.temperature, this.humidity});

  factory MainInfo.fromJson(Map<String, dynamic> data) {
    double temperature = data['temperature'] as double;
    double humidity = data['humidity'] as double;

    return MainInfo(temperature: temperature, humidity: humidity);
  }
}
