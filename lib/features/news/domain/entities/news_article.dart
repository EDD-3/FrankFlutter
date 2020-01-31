import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NewsArticle extends Equatable {
  //Atributos de la entidad
  final String author;
  final String article;
  final String thumbnailUrl;
  final String articleUrl;
  final String title;
  final DateTime articleDate;

  //Constructor
  NewsArticle({
    @required this.author,
    @required this.article,
    @required this.thumbnailUrl,
    @required this.articleUrl,
    @required this.title,
    @required this.articleDate,
  });
  // Lista de elementos para Equatable
  @override
  List<Object> get props =>
      [author, article, thumbnailUrl, articleUrl, title, articleDate];
}
