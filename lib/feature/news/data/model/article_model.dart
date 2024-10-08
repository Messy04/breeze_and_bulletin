import 'package:breeze_and_bulletin/feature/news/data/model/source_model.dart';
import 'package:breeze_and_bulletin/feature/news/domain/entity/article_entity.dart';

class ArticleModel extends ArticleEntity {
  
  // SourceModel? source;
  // String? author;
  // String? title;
  // String? description;
  // String? url;
  // String? urlToImage;
  // String? publishedAt;
  // String? content;

  ArticleModel({
    SourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  });

  ArticleModel.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? SourceModel.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}
