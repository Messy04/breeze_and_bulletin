import 'package:breeze_and_bulletin/core/constants/constants.dart';
import 'package:breeze_and_bulletin/feature/weather/data/model/weather_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_api_service.g.dart';

@RestApi(baseUrl: weatherApiBaseUrl)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) = _WeatherApiService;

  @GET('current.json')
  Future<HttpResponse<WeatherResponseModel>> getCurrentWeather({
    @Query('q') String? query = 'Dehri',
    @Query('key') String apiKey = weatherApiKey,
  });

  @GET('forecast.json')
  Future<HttpResponse<WeatherResponseModel>> getWeatherForecast({
    @Query('q') String? query,
    @Query('days') String? numberOfDays,
    @Query('key') String apiKey = weatherApiKey,
  });

  @GET('search.json')
  Future<HttpResponse<WeatherResponseModel>> searchWeather({
    @Query('q') String? query,
    @Query('key') String apiKey = weatherApiKey,
  });

  @GET('history.json')
  Future<HttpResponse<WeatherResponseModel>> getWeatherHistory({
    @Query('q') String? query,
    @Query('dt') String? dateTime, // yyyy-MM-dd format
    @Query('key') String apiKey = weatherApiKey,
  });
}
