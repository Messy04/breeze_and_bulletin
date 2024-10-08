part of 'weather_home_bloc.dart';

@immutable
sealed class WeatherHomeState {}

final class WeatherLoadingState extends WeatherHomeState {}

final class ShowWeatherDetails extends WeatherHomeState {
  final LocationEntity? location;
  final CurrentWeatherEntity? currentWeather;
  final WeatherForecastEntity? forecast;

  ShowWeatherDetails({this.location, this.currentWeather, this.forecast});
}

final class DataErrorState extends WeatherHomeState {
  final String message;

  DataErrorState(this.message);
}

final class ShowCurrentWeatherState extends WeatherHomeState {}

final class ShowWeatherForecastState extends WeatherHomeState {}
