/// Bookmark
class Bookmark {
  String locationName;
  int windSpeed;
  double windDegree;
  int humidity;
  int temperature;
  String iconUrl;

  Bookmark(
      {this.locationName,
      this.windSpeed,
      this.windDegree,
      this.humidity,
      this.temperature,
      this.iconUrl});

  factory Bookmark.fromJson(Map<String, dynamic> data) {
    String locationName = data['locationName'] as String;
    int windSpeed = data['windSpeed'] as int;
    double windDegree = data['windDegree'] as double;
    int humidity = data['cloudinessPercentage'] as int;
    int temperature = data['temperature'] as int;
    String iconUrl = data['iconUrl'] as String;

    return Bookmark(
        locationName: locationName,
        windSpeed: windSpeed,
        windDegree: windDegree,
        humidity: humidity,
        temperature: temperature,
        iconUrl: iconUrl);
  }
}
