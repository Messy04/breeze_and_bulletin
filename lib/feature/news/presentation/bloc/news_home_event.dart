part of 'news_home_bloc.dart';

@immutable
sealed class NewsHomeEvent {}

final class GetHomeNewsEvent extends NewsHomeEvent {
  final String? category;

  GetHomeNewsEvent({this.category});
}

// final class NewsPageChangedEvent extends NewsHomeEvent {
//   final int pageNumber;
//
//   NewsPageChangedEvent(this.pageNumber);
// }

final class GetNewsCategories extends NewsHomeEvent {}

final class SelectCategoryEvent extends NewsHomeEvent {
  final String category;

  SelectCategoryEvent({required this.category});
}

final class GetTopHeadlinesEvent extends NewsHomeEvent {
  final String? category;
  final String country;

  GetTopHeadlinesEvent({this.category, this.country = 'us'});
}

final class SearchNewsEvent extends NewsHomeEvent {
  final String? query;
  final String? category;
  final String? country;

  SearchNewsEvent({this.query, this.category, this.country});
}
