import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/errors/exceptions.dart';
import 'package:news_app/features/news/data/models/news_article_model.dart';
import 'package:meta/meta.dart';

abstract class NewsArticleRemoteDatasource{
  Future<List<NewsArticleModel>> getNewsList();
}

class NewsArticleRemoteDatasourceImp implements NewsArticleRemoteDatasource {
  final http.Client client;

  NewsArticleRemoteDatasourceImp({@required this.client});
  
  @override
  Future<List<NewsArticleModel>> getNewsList() async {
    final url = 'https://nogalessonora.gob.mx/webservice/get_posts/?post_type=post&qv[posts_per_page]=10&qv[orderby]=date&qv[order]=DESC';

    final response = await client.get(url);
    switch(response.statusCode){
      case 200:
      final result = jsonDecode(response.body);
      final Iterable list = result;
      return list.map((model) => NewsArticleModel.fromJson(model)).toList();

      default:
      throw ServerException(code: response.statusCode, message: response.reasonPhrase);

    }
  }

}