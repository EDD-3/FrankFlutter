import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/features/news/domain/entities/news_article.dart';

abstract class NewsArticleRepository {
  Future<Either<Failure, List<NewsArticle>>> getNewsList();
}
