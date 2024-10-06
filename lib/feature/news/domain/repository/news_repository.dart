import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/core/utils/app_typedefs.dart';

abstract class NewsRepository {
  Future<DataState<ArticleEntityList>> getTopHeadLines({
    String? country,
    String? category,
    String? sources,
    String? query,
    String? sortBy,
    int? pageSize,
    int? page,
  });

  Future<DataState<ArticleEntityList>> searchNews({
    required String query,
    String? country,
    String? category,
    String? sources,
    String? sortBy,
    int? pageSize,
    int? page,
  });
}
