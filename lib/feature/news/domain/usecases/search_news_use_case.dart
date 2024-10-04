import 'package:breeze_and_bulletin/core/resources/data_state.dart';
import 'package:breeze_and_bulletin/core/resources/usecase.dart';
import 'package:breeze_and_bulletin/core/utils/app_typedefs.dart';
import 'package:breeze_and_bulletin/feature/news/domain/entity/article_request_entity.dart';
import 'package:breeze_and_bulletin/feature/news/domain/repository/news_repository.dart';

class SearchNewsUseCase extends UseCase<Future<DataState<ArticleEntityList>>,
    ArticleRequestEntity?> {
  final NewsRepository newsRepository;

  SearchNewsUseCase({required this.newsRepository});

  @override
  Future<DataState<ArticleEntityList>> execute({data}) {
    // TODO: implement execute
    throw UnimplementedError();
  }
}
