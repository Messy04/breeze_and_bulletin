part of 'weather_home_bloc.dart';

@immutable
sealed class WeatherHomeEvent {}

class GetCurrentWeatherEvent extends WeatherHomeEvent {}

class GetWeatherForecastEvent extends WeatherHomeEvent {}
