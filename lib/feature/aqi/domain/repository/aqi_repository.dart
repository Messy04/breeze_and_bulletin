import 'package:breeze_and_bulletin/feature/aqi/domain/entity/air_quality_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class AQIRepository {
  Future<DataState<AirQualityEntity?>> getAqi({
    required String place,
    required int days,
  });
}