import 'package:news_app/features/news/data/models/news_article_model.dart';
import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/pages/article_page.dart';

class NewsFeed extends StatelessWidget {
  final List<NewsArticleModel> newsList;

  const NewsFeed({
    Key key,
    @required this.newsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (BuildContext context, int index) {
        return NewsFeedList(
          newsList: newsList,
          index: index,
        );
      },
    );
  }
}

class NewsFeedList extends StatelessWidget {
  const NewsFeedList({
    Key key,
    @required this.newsList,
    @required this.index,
  }) : super(key: key);

  final List<NewsArticleModel> newsList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(newsList[index].thumbnailUrl),
      ),
      title: Text(newsList[index].title),
      subtitle: Text(newsList[index].author),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    newsListArticle: newsList[index].article,
                    newsTitle: newsList[index].title,
                    newsThumbnail: newsList[index].thumbnailUrl,
                  )),
        );
      },
    );
  }
}
