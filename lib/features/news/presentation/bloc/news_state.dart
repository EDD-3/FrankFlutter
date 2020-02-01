import 'package:equatable/equatable.dart';
import 'package:news_app/features/news/data/models/news_article_model.dart';
import 'package:meta/meta.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitialNewsState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsState {
  final List<NewsArticleModel> newsList;
  NewsLoadedState({@required this.newsList});

  @override
  List<Object> get props => [newsList];
}

class NewsErrorState extends NewsState {
  final String errorMessage;

  NewsErrorState({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
