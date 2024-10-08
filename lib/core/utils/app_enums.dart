enum WeatherIcon {
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_116_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_176_PNG,
  CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG
}

enum WeatherStatus {
  CLEAR,
  PARTLY_CLOUDY,
  PATCHY_RAIN_NEARBY,
  SUNNY,
  TEXT_PARTLY_CLOUDY
}

final weatherTextValues = EnumValues({
  "Clear ": WeatherStatus.CLEAR,
  "Partly Cloudy": WeatherStatus.PARTLY_CLOUDY,
  "Patchy rain nearby": WeatherStatus.PATCHY_RAIN_NEARBY,
  "Sunny": WeatherStatus.SUNNY,
  "Partly Cloudy ": WeatherStatus.TEXT_PARTLY_CLOUDY
});

final weatherIconValues = EnumValues({
  "https://cdn.weatherapi.com/weather/64x64/day/113.png":
  WeatherIcon.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_113_PNG,
  "https://cdn.weatherapi.com/weather/64x64/day/116.png":
  WeatherIcon.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_116_PNG,
  "https://cdn.weatherapi.com/weather/64x64/day/176.png":
  WeatherIcon.CDN_WEATHERAPI_COM_WEATHER_64_X64_DAY_176_PNG,
  "https://cdn.weatherapi.com/weather/64x64/night/113.png":
  WeatherIcon.CDN_WEATHERAPI_COM_WEATHER_64_X64_NIGHT_113_PNG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
