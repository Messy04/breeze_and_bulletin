import 'package:breeze_and_bulletin/feature/news/domain/entity/article_request_entity.dart';

class ArticleRequestModel extends ArticleRequestEntity {
  final String? country;
  final String? category;
  final String? sources;
  final String? query;
  final String? sortBy;
  final int? pageSize;
  final int? page;

  const ArticleRequestModel({
    this.country,
    this.category,
    this.sources,
    this.query,
    this.sortBy,
    this.pageSize,
    this.page,
  });

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'category': category,
      'sources': sources,
      'query': query,
      'sortBy': sortBy,
      'pageSize': pageSize,
      'page': page,
    };
  }

  // Create model from JSON
  factory ArticleRequestModel.fromJson(Map<String, dynamic> json) {
    return ArticleRequestModel(
      country: json['country'] as String?,
      category: json['category'] as String?,
      sources: json['sources'] as String?,
      query: json['query'] as String?,
      sortBy: json['sortBy'] as String?,
      pageSize: json['pageSize'] as int?,
      page: json['page'] as int?,
    );
  }
}
