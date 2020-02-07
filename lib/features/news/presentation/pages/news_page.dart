import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/bloc.dart';
import '../../../../injection_container.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsBloc _bloc;

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
            return Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is NewsLoadedState) {
            return ListView.builder(
                itemCount: state.newsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(state.newsList[index].thumbnailUrl),),
                    title: Text(state.newsList[index].title),
                    subtitle: Text(state.newsList[index].author),

                  );
                });
          } else if (state is NewsErrorState) {
            return MessageDisplay(
              message: state.errorMessage,
            );
          }
        },
      ),
    );
  }
}

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
