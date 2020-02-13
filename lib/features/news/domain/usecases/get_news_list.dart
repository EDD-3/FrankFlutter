import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/usecases/no_params.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/news/domain/entities/news_article.dart';
import 'package:news_app/features/news/domain/repositories/news_article_repository.dart';
import 'package:meta/meta.dart';

class GetNewsList implements UseCase<List<NewsArticle>,NoParams>{
  final NewsArticleRepository repository;

  GetNewsList({@required this.repository});


  @override
  Future<Either<Failure, List<NewsArticle>>> call(NoParams params) async {
    return await repository.getNewsList();
  }

}

