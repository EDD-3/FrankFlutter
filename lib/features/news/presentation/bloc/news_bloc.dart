import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import './bloc.dart';
import '../../../../core/usecases/no_params.dart';
import '../../domain/usecases/get_news_list.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsList getNewsList;

  NewsBloc({
    @required this.getNewsList,
  });

  @override
  NewsState get initialState => NewsInitialNewsState();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is GetNewsEvent) {
      yield NewsLoadingState();
      final result = await getNewsList.call(NoParams());

      yield result.fold(
          (failure) => NewsErrorState(errorMessage: failure.getMessage()),
          (newsList) => NewsLoadedState(newsList: newsList));
    }
  }
}
