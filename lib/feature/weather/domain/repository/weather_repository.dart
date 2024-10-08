import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/entity/weather_response_entity.dart';

abstract class WeatherRepository {
  Future<DataState<WeatherResponseEntity?>> getCurrentWeather({
    required String place,
  });

  Future<DataState<WeatherResponseEntity?>> getWeatherForecast({
    required String place,
    required int days,
  });
}
