part of 'aqi_home_bloc.dart';

@immutable
sealed class AqiHomeEvent {}

final class GetAirQualityEvent extends AqiHomeEvent {}
