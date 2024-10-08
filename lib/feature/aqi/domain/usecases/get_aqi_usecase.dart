import 'dart:async';
import 'dart:io';

import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/core/resources/usecase.dart';
import 'package:breeze_and_bulletin/feature/aqi/domain/entity/air_quality_entity.dart';
import 'package:breeze_and_bulletin/feature/aqi/domain/repository/aqi_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetAQIUseCase extends UseCase<Future<DataState<AirQualityEntity?>>,
    Map<String, dynamic>?> {
  final AQIRepository aqiRepository;

  GetAQIUseCase({required this.aqiRepository});

  @override
  Future<DataState<AirQualityEntity?>> execute({Map<String, dynamic>? data}) async {
    try {
      final response = await aqiRepository.getAqi(
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
      debugPrint('Stack Trace: GetAirQuality \n$st');
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
