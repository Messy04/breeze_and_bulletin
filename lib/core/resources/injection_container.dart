import 'package:breeze_and_bulletin/feature/news/data/data_source/remote_data/news_api_service.dart';
import 'package:breeze_and_bulletin/feature/news/data/repository/news_repository_impl.dart';
import 'package:breeze_and_bulletin/feature/news/domain/repository/news_repository.dart';
import 'package:breeze_and_bulletin/feature/news/domain/usecases/get_top_headlines_usecase.dart';
import 'package:breeze_and_bulletin/feature/news/domain/usecases/search_news_use_case.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/top_news_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

void initializeDependencies() {
  // Adapters
  injector.registerSingleton<Dio>(Dio());

  // Services
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));

  // Repositories
  injector.registerSingleton<NewsRepository>(
    NewsRepositoryImpl(newsApiService: injector()),
  );

  // Usecases
  injector.registerSingleton<GetTopHeadlineUsecase>(
    GetTopHeadlineUsecase(newsRepository: injector()),
  );

  injector.registerSingleton<SearchNewsUseCase>(
    SearchNewsUseCase(newsRepository: injector()),
  );

  // Blocs
  injector.registerFactory<TopNewsBloc>(
        () => TopNewsBloc(topHeadlineUsecase: injector()),
  );
}