import 'package:equatable/equatable.dart';

class ArticleRequestEntity extends Equatable {
  final String? country;
  final String? category;
  final String? sources;
  final String? query;
  final String? sortBy;
  final int? pageSize;
  final int? page;

  const ArticleRequestEntity({
    this.country = 'in',
    this.category,
    this.sources,
    this.query,
    this.sortBy = 'publishedAt',
    this.pageSize = 10,
    this.page,
  });

  @override
  List<Object?> get props => [
        country,
        category,
        sources,
        query,
        sortBy,
        pageSize,
        page,
      ];
}
