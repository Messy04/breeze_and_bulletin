part of 'aqi_home_bloc.dart';

@immutable
sealed class AqiHomeState {}

final class AqiLoadingState extends AqiHomeState {}

final class ShowAirQualityState extends AqiHomeState {
  final AirQualityEntity? airQuality;

  ShowAirQualityState({this.airQuality});
}

final class DataErrorState extends AqiHomeState {
  final String message;

  DataErrorState(this.message);
}
