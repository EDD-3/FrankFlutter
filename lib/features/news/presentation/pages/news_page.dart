import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/data/models/news_article_model.dart';
import 'package:news_app/features/news/presentation/bloc/bloc.dart';
import 'package:news_app/features/news/presentation/widgets/widgets.dart';
import '../../../../injection_container.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsBloc _bloc;
  List<NewsArticleModel> newsList;

  @override
  void initState() {
    super.initState();
    _bloc = sl<NewsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Noticias'),
        ),
        body: Center(
          child: buildBody(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _bloc.add(GetNewsEvent());
          },
          child: Icon(Icons.add),
        ));
  }

  BlocProvider<NewsBloc> buildBody() {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsInitialNewsState) {
            return MessageDisplay(
              message: 'No hay noticias nuevas 😢',
            );
          } else if (state is NewsLoadingState) {
            return LoadingWidget();
          } else if (state is NewsLoadedState) {
            newsList = state.newsList;
            return NewsFeed(
              newsList: newsList,
            );
          } else if (state is NewsErrorState) {
            return MessageDisplay(
              message: state.errorMessage,
            );
          }
          return Container();
        },
      ),
    );
  }
}
