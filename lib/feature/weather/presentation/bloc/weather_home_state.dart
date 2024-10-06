part of 'weather_home_bloc.dart';

@immutable
sealed class WeatherHomeState {}

final class WeatherLoadingState extends WeatherHomeState {}

final class ShowWeatherDetails extends WeatherHomeState {
  final WeatherResponseEntity? response;

  ShowWeatherDetails(this.response);
}

final class DataErrorState extends WeatherHomeState {
  final String message;

  DataErrorState(this.message);
}

final class ShowCurrentWeatherState extends WeatherHomeState {}

final class ShowWeatherForecastState extends WeatherHomeState {}
