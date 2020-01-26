class OpenWeatherEndpoint {

  OpenWeatherEndpoint();

  static String weatherForecastByGeographicCoordinate(
      double latitude, double longitude) {
    return APIConfiguration.BaseURL +
        "/" +
        APIConfiguration.Version +
        "/" +
        "weather" +
        "?lat=$latitude&lon=$longitude&appid=${APICredential.OpenWeatherAPIKey}&units=metric";
  }

  static String fiveDaysWeatherForecast(int cityId) {
    if (cityId == null) {
      return null;
    }

    return APIConfiguration.BaseURL +
        "/" +
        APIConfiguration.Version +
        "/" +
        "forecast" +
        "?id=$cityId&appid=${APICredential.OpenWeatherAPIKey}&units=metric";
  }

  static String weatherForecastByCityIds(List<int> cityIds) {
    String cityIdsAsString = cityIds.join(",");
    return APIConfiguration.BaseURL +
        "/" +
        APIConfiguration.Version +
        "/" +
        "group" +
        "?id=$cityIdsAsString&appid=${APICredential.OpenWeatherAPIKey}&units=metric";
  }
}

class APIConfiguration {
  static const BaseURL = "https://api.openweathermap.org/data";
  static const Version = "2.5";
}

class APICredential {
  static const OpenWeatherAPIKey = "c6e381d8c7ff98f0fee43775817cf6ad";
}
