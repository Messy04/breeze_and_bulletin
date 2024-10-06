import 'package:breeze_and_bulletin/core/resources/app_exceptions.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/entity/weather_response_entity.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/usecases/get_weather_forecast_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_home_event.dart';

part 'weather_home_state.dart';

class WeatherHomeBloc extends Bloc<WeatherHomeEvent, WeatherHomeState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  final GetWeatherForecastUsecase getWeatherForecastUsecase;

  WeatherHomeBloc({
    required this.getCurrentWeatherUsecase,
    required this.getWeatherForecastUsecase,
  }) : super(WeatherLoadingState()) {
    on<GetCurrentWeatherEvent>(_onGetCurrentWeatherEvent);
    on<GetWeatherForecastEvent>(_onGetWeatherForecastEvent);
  }

  Future<void> _onGetCurrentWeatherEvent(
    GetCurrentWeatherEvent event,
    Emitter<WeatherHomeState> emit,
  ) async {
    emit(WeatherLoadingState());
    final response = await getCurrentWeatherUsecase.execute(data: 'Dehri');

    if (response.error != null) {
      final message = AppException().getExceptionMessage(
        response.error?.type ?? DioExceptionType.unknown,
      );
      emit(DataErrorState(message));
    } else {
      emit(ShowWeatherDetails(response.data));
    }
  }

  Future<void> _onGetWeatherForecastEvent(
    GetWeatherForecastEvent event,
    Emitter<WeatherHomeState> emit,
  ) async {
    final response = await getWeatherForecastUsecase.execute(data: {
      'place': 'Dehri',
      'days': 7,
    });

    if (response.error != null) {
      final message = AppException().getExceptionMessage(
        response.error?.type ?? DioExceptionType.unknown,
      );
      emit(DataErrorState(message));
    } else {
      emit(ShowWeatherDetails(response.data));
    }
  }
}
