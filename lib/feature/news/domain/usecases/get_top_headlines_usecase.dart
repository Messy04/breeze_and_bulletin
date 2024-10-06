import 'dart:async';
import 'dart:io';

import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/core/resources/usecase.dart';
import 'package:breeze_and_bulletin/core/utils/app_typedefs.dart';
import 'package:breeze_and_bulletin/feature/news/domain/entity/article_request_entity.dart';
import 'package:breeze_and_bulletin/feature/news/domain/repository/news_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetTopHeadlineUsecase extends UseCase<
    Future<DataState<ArticleEntityList>>, ArticleRequestEntity?> {
  final NewsRepository newsRepository;

  GetTopHeadlineUsecase({required this.newsRepository});

  @override
  Future<DataState<ArticleEntityList>> execute({data}) async {
    try {
      final response = await newsRepository.getTopHeadLines(
        country: data?.country,
        category: data?.category,
        pageSize: data?.pageSize,
      );
      return DataSuccess(response.data ?? []);
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
      debugPrint('Stack Trace: getTopHeadLines \n$st');
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
