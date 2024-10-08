import 'dart:async';
import 'dart:io';

import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/core/resources/usecase.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/entity/weather_response_entity.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/repository/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class GetWeatherForecastUsecase extends UseCase<
    Future<DataState<WeatherResponseEntity?>>, Map<String, dynamic>?> {
  final WeatherRepository weatherRepository;

  GetWeatherForecastUsecase({required this.weatherRepository});

  @override
  Future<DataState<WeatherResponseEntity?>> execute({data}) async {
    try {
      final response = await weatherRepository.getWeatherForecast(
        place: data?['place'] as String,
        days: data?['days'] as int,
      );
      return DataSuccess(response.data);
    } on SocketException catch (e) {
      return DataFailed(
        DioException(
          message: e.message,
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionError,
        ),
      );
    } on TimeoutException catch (e) {
      return DataFailed(
        DioException(
          message: e.message,
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionTimeout,
        ),
      );
    } catch (e, st) {
      debugPrint('Stack Trace: GetWeatherForecast \n$st');
      return DataFailed(
        DioException(
          message: e.toString(),
          requestOptions: RequestOptions(),
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
}
