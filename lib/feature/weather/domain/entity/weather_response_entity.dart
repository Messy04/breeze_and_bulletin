import 'package:breeze_and_bulletin/feature/weather/domain/entity/current_weather_entity.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/entity/location_entity.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/entity/weather_forecast_entity.dart';
import 'package:equatable/equatable.dart';

class WeatherResponseEntity extends Equatable {
  final LocationEntity? location;
  final CurrentWeatherEntity? currentWeather;
  final WeatherForecastEntity? forecast;

  const WeatherResponseEntity({
    this.location,
    this.currentWeather,
    this.forecast,
  });

  @override
  List<Object?> get props => [
        location,
        currentWeather,
        forecast,
      ];
}
