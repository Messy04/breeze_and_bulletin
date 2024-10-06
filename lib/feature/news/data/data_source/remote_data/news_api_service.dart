import 'package:breeze_and_bulletin/core/constants/constants.dart';
import 'package:breeze_and_bulletin/feature/news/data/model/article_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('top-headlines')
  Future<HttpResponse<ArticleResponse>> getTopHeadlines({
    @Query('country') String? country = 'in',
    @Query('category') String? category,
    @Query('sources') String? sources,
    @Query('pageSize') int? pageSize = 7,
    @Query('page') int? page,
    @Query('apiKey') String apiKey = newsApiKey,
  });

  @GET('everything')
  Future<HttpResponse<ArticleResponse>> searchNews({
    @Query('q') String? query,
    @Query('sortBy') String? sortBy = 'publishedAt', // popularity
    @Query('pageSize') int? pageSize = 15,
    @Query('page') int? page,
    @Query('apiKey') String apiKey = newsApiKey,
  });
}
