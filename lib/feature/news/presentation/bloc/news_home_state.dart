part of 'news_home_bloc.dart';

@immutable
sealed class NewsHomeState {}

final class NewsHomeInitial extends NewsHomeState {
  final String? category;

  NewsHomeInitial({this.category});
}

final class NewsLoadingState extends NewsHomeState {}

final class ShowArticlesState extends NewsHomeState {
  final ArticleEntityList articles;
  final int pageNumber;

  ShowArticlesState({required this.articles, this.pageNumber = 0});
}

final class ShowNewsCategories extends NewsHomeState {
  final Map<int, String?> categories;

  ShowNewsCategories({required this.categories});
}

final class DataErrorState extends NewsHomeState {
  final String message;

  DataErrorState(this.message);
}
