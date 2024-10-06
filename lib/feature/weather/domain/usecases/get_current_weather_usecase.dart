import 'dart:async';
import 'dart:io';

import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/core/resources/usecase.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/entity/weather_response_entity.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/repository/weather_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetCurrentWeatherUsecase
    extends UseCase<Future<DataState<WeatherResponseEntity?>>, String?> {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUsecase({required this.weatherRepository});

  @override
  Future<DataState<WeatherResponseEntity?>> execute({data}) async {
    try {
      final response = await weatherRepository.getCurrentWeather(
        place: data!,
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
      debugPrint('Stack Trace: GetCurrentWeather \n$st');
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
