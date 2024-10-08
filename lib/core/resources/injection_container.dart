import 'package:breeze_and_bulletin/feature/aqi/data/repository/aqi_repository_impl.dart';
import 'package:breeze_and_bulletin/feature/aqi/domain/repository/aqi_repository.dart';
import 'package:breeze_and_bulletin/feature/aqi/domain/usecases/get_aqi_usecase.dart';
import 'package:breeze_and_bulletin/feature/aqi/presentation/bloc/aqi_home_bloc.dart';
import 'package:breeze_and_bulletin/feature/news/data/data_source/remote_data/news_api_service.dart';
import 'package:breeze_and_bulletin/feature/news/data/repository/news_repository_impl.dart';
import 'package:breeze_and_bulletin/feature/news/domain/repository/news_repository.dart';
import 'package:breeze_and_bulletin/feature/news/domain/usecases/get_top_headlines_usecase.dart';
import 'package:breeze_and_bulletin/feature/news/domain/usecases/search_news_use_case.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/top_news_bloc.dart';
import 'package:breeze_and_bulletin/feature/weather/data/data_source/weather_api_service.dart';
import 'package:breeze_and_bulletin/feature/weather/data/repository/weather_repository_impl.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/repository/weather_repository.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:breeze_and_bulletin/feature/weather/domain/usecases/get_weather_forecast_usecase.dart';
import 'package:breeze_and_bulletin/feature/weather/presentation/bloc/weather_home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void initializeDependencies() {
  // Adapters
  injector.registerSingleton<Dio>(Dio());

  // Services
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));
  injector.registerSingleton<WeatherApiService>(WeatherApiService(injector()));

  // Repositories
  injector.registerSingleton<NewsRepository>(
    NewsRepositoryImpl(newsApiService: injector()),
  );

  injector.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(weatherApiService: injector()),
  );

  injector.registerSingleton<AQIRepository>(
    AQIRepositoryImpl(weatherApiService: injector()),
  );

  // Usecases
  injector.registerSingleton<GetTopHeadlineUsecase>(
    GetTopHeadlineUsecase(newsRepository: injector()),
  );

  injector.registerSingleton<SearchNewsUseCase>(
    SearchNewsUseCase(newsRepository: injector()),
  );

  injector.registerSingleton<GetCurrentWeatherUsecase>(
    GetCurrentWeatherUsecase(weatherRepository: injector()),
  );

  injector.registerSingleton<GetWeatherForecastUsecase>(
    GetWeatherForecastUsecase(weatherRepository: injector()),
  );

  injector.registerSingleton<GetAQIUseCase>(
    GetAQIUseCase(aqiRepository: injector()),
  );

  // Blocs
  injector.registerFactory<TopNewsBloc>(
    () => TopNewsBloc(topHeadlineUsecase: injector()),
  );

  injector.registerFactory<WeatherHomeBloc>(
    () => WeatherHomeBloc(
      getWeatherForecastUsecase: injector(),
      getCurrentWeatherUsecase: injector(),
    ),
  );

  injector.registerFactory<AqiHomeBloc>(
    () => AqiHomeBloc(
      getAQIUseCase: injector(),
    ),
  );
}
