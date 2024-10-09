import 'package:breeze_and_bulletin/core/resources/app_exceptions.dart';
import 'package:breeze_and_bulletin/core/utils/app_typedefs.dart';
import 'package:breeze_and_bulletin/feature/news/domain/entity/article_request_entity.dart';
import 'package:breeze_and_bulletin/feature/news/domain/usecases/get_top_headlines_usecase.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/news_home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopNewsBloc extends Bloc<NewsHomeEvent, NewsHomeState> {
  final GetTopHeadlineUsecase topHeadlineUsecase;

  TopNewsBloc({required this.topHeadlineUsecase}) : super(NewsLoadingState()) {
    on<GetTopHeadlinesEvent>(_onGetTopHeadlinesEvent);
    // on<NewsPageChangedEvent>(_onNewsPageChangedEvent);
  }

   ArticleEntityList _articles = [];

  Future<void> _onGetTopHeadlinesEvent(
    GetTopHeadlinesEvent event,
    Emitter<NewsHomeState> emit,
  ) async {
    emit(NewsLoadingState());
    var requestModel = ArticleRequestEntity(
      category: event.category?.toLowerCase(),
      country: 'us',
      pageSize: 10,
    );
    final response = await topHeadlineUsecase.execute(
      data: requestModel,
    );

    if (response.error != null) {
      final message = AppException().getExceptionMessage(
        response.error?.type ?? DioExceptionType.unknown,
      );
      emit(DataErrorState(message));
    } else {
      _articles = response.data ?? [];
      emit(ShowArticlesState(articles: _articles));
    }
  }

  // void _onNewsPageChangedEvent(
  //   NewsPageChangedEvent event,
  //   Emitter<NewsHomeState> emit,
  // ) {
  //   emit(ShowArticlesState(articles: _articles, pageNumber: event.pageNumber));
  // }
}
