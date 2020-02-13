import 'package:meta/meta.dart';
import 'package:news_app/features/news/domain/entities/news_article.dart';

class NewsArticleModel extends NewsArticle {
  NewsArticleModel({
    @required String author,
    @required String article,
    @required String thumbnailUrl,
    @required String articleUrl,
    @required String title,
    @required DateTime articleDate,
  }) : super(
          author: author,
          article: article,
          thumbnailUrl: thumbnailUrl,
          articleUrl: articleUrl,
          title: title,
          articleDate: articleDate,
        );

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      title: json['post_title'],
      article: json['post_stripped'],
      articleUrl: json['link'],
      author: json['author_name'],
      thumbnailUrl: json['thumbnail'],
      articleDate: DateTime.parse(json['post_date']),
    );
  }
}
