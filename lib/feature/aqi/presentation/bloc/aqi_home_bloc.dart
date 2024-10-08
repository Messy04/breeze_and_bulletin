import 'package:breeze_and_bulletin/core/resources/app_exceptions.dart';
import 'package:breeze_and_bulletin/feature/aqi/domain/entity/air_quality_entity.dart';
import 'package:breeze_and_bulletin/feature/aqi/domain/usecases/get_aqi_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'aqi_home_event.dart';

part 'aqi_home_state.dart';

class AqiHomeBloc extends Bloc<AqiHomeEvent, AqiHomeState> {
  final GetAQIUseCase getAQIUseCase;

  AqiHomeBloc({required this.getAQIUseCase}) : super(AqiLoadingState()) {
    on<GetAirQualityEvent>(_onGetAirQualityEvent);
  }

  Future<void> _onGetAirQualityEvent(
    GetAirQualityEvent event,
    Emitter<AqiHomeState> emit,
  ) async {
    emit(AqiLoadingState());
    final response = await getAQIUseCase.execute(
      data: {
        'place': 'dehri',
        'days': 7,
      },
    );
    if (response.error != null) {
      final message = AppException().getExceptionMessage(
        response.error?.type ?? DioExceptionType.unknown,
      );
      emit(DataErrorState(message));
    } else {
      emit(ShowAirQualityState(airQuality: response.data));
    }
  }
}
