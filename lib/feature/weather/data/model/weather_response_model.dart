import 'dart:convert';

import 'package:breeze_and_bulletin/feature/weather/data/model/current_weather_model.dart';
import 'package:breeze_and_bulletin/feature/weather/data/model/weather_forecast_model.dart';
import 'package:breeze_and_bulletin/feature/weather/data/model/location_model.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/entity/weather_response_entity.dart';

class WeatherResponseModel extends WeatherResponseEntity {
  final LocationModel? location;
  final CurrentWeatherModel? currentWeather;
  final WeatherForecastModel? forecast;

  const WeatherResponseModel({
    this.location,
    this.currentWeather,
    this.forecast,
  });

  factory WeatherResponseModel.fromRawJson(String str) =>
      WeatherResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) =>
      WeatherResponseModel(
        location: json["location"] == null
            ? null
            : LocationModel.fromJson(json["location"]),
        currentWeather: json["current"] == null
            ? null
            : CurrentWeatherModel.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : WeatherForecastModel.fromJson(json["forecast"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "current": currentWeather?.toJson(),
        "forecast": forecast?.toJson(),
      };
}
