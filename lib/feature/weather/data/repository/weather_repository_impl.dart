import 'dart:io';

import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/feature/weather/data/data_source/weather_api_service.dart';
import 'package:breeze_and_bulletin/feature/weather/data/model/current_weather_model.dart';
import 'package:breeze_and_bulletin/feature/weather/data/model/weather_forecast_model.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/entity/weather_response_entity.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/repository/weather_repository.dart';
import 'package:dio/dio.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService weatherApiService;

  const WeatherRepositoryImpl({required this.weatherApiService});

  @override
  Future<DataState<WeatherResponseEntity?>> getCurrentWeather({
    required String place,
  }) async {
    final httpResponse = await weatherApiService.getCurrentWeather(
      query: place,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      final response = httpResponse.data;
      return DataSuccess(response);
    } else {
      return DataFailed(
        DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    }
  }

  @override
  Future<DataState<WeatherResponseEntity?>> getWeatherForecast({
    required String place,
    required int days,
  }) async {
    final httpResponse = await weatherApiService.getWeatherForecast(
      query: place,
      numberOfDays: days.toString(),
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      final response = httpResponse.data;
      return DataSuccess(response);
    } else {
      return DataFailed(
        DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ),
      );
    }
  }
}
