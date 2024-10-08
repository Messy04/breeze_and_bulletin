import 'dart:io';

import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/feature/aqi/data/model/air_quality_model.dart';
import 'package:breeze_and_bulletin/feature/aqi/domain/repository/aqi_repository.dart';
import 'package:breeze_and_bulletin/feature/weather/data/data_source/weather_api_service.dart';
import 'package:dio/dio.dart';

class AQIRepositoryImpl implements AQIRepository {
  final WeatherApiService weatherApiService;

  const AQIRepositoryImpl({required this.weatherApiService});

  @override
  Future<DataState<AirQualityModel?>> getAqi({
    required String place,
    required int days,
  }) async {
    final httpResponse = await weatherApiService.getWeatherForecast(
      query: place,
      numberOfDays: days.toString(),
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      final response = httpResponse.data;
      return DataSuccess(response.currentWeather?.airQuality);
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
