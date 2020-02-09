import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ArticlePage extends StatelessWidget {
  final String newsListArticle;
  final String newsTitle;
  final String newsThumbnail;

  const ArticlePage({
    Key key,
    @required this.newsListArticle,
    @required this.newsTitle,
    @required this.newsThumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ver noticia"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              color: Colors.black,
              child: Container(
                child: Text(
                  newsTitle,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
                margin: EdgeInsets.all(10),
                color: Colors.blueGrey[200],
                padding: EdgeInsets.all(5),
              ),
            ),
          ),
          Container(
            child: Image(image: NetworkImage(newsThumbnail)),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black87,
            )),
          ),
          Container(
            child: Text(newsListArticle),
            padding: EdgeInsets.all(15),
          ),
        ],
      ),
    );
  }
}
