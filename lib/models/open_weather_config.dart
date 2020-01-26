/// OpenWeatherConfig
/// @description Open Weather Configuration of openweathermap.org

class OpenWeatherConfig {
  /// openweathermap.org API URL
  String baseURL;

  /// current API Version
  String version;

  /// openweathermap.org APP ID
  String appId;

  OpenWeatherConfig({this.baseURL, this.version, this.appId});
}
