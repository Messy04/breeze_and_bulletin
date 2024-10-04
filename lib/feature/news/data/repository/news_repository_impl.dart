import 'dart:io';

import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/core/utils/app_typedefs.dart';
import 'package:breeze_and_bulletin/feature/news/data/data_source/remote_data/news_api_service.dart';
import 'package:breeze_and_bulletin/feature/news/domain/repository/news_repository.dart';
import 'package:dio/dio.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService newsApiService;

  const NewsRepositoryImpl({required this.newsApiService});

  @override
  Future<DataState<ArticleModelList>> getTopHeadLines({
    String? country,
    String? category,
    String? sources,
    String? query,
    String? sortBy,
    int? pageSize,
    int? page,
  }) async {
    try {
      final httpResponse = await newsApiService.getTopHeadlines(
        category: category,
        country: country,
        pageSize: pageSize,
        sources: sources,
        page: page,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final articles = httpResponse.data.articles ?? [];
        return DataSuccess(articles);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(
        DioException(
          error: e,
          message: e.message,
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions(),
          response: Response(requestOptions: RequestOptions()),
        ),
      );
    }
  }

  @override
  Future<DataState<ArticleModelList>> searchNews({
    String? country,
    String? category,
    String? sources,
    String? query,
    String? sortBy,
    int? pageSize,
    int? page,
  }) async {
    try {
      final httpResponse = await newsApiService.searchNews(
        query: query ?? '',
        page: page,
        pageSize: pageSize,
        sortBy: sortBy,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final articles = httpResponse.data.articles ?? [];
        return DataSuccess(articles);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(
        DioException(
          error: e,
          message: e.message,
          type: DioExceptionType.unknown,
          requestOptions: RequestOptions(),
          response: Response(requestOptions: RequestOptions()),
        ),
      );
    }
  }
}
