import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/core/messages/messages.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/news_article.dart';
import '../../domain/repositories/news_article_repository.dart';
import '../datasources/news_article_remote_datasource.dart';

class NewsArticleRepositoryImpl implements NewsArticleRepository {
  final NewsArticleRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  NewsArticleRepositoryImpl({
    @required this.remoteDatasource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<NewsArticle>>> getNewsList() async {
    if (await networkInfo.isConnected) {
      try {
        final newsList = await remoteDatasource.getNewsList();
        return Right(newsList);
      } on ServerException catch (e) {
        return Left(NetworkFailure(message: e.message));
      }
    }

    return Left(NetworkFailure(message: Messages.NO_NETWORK));
  }
}
