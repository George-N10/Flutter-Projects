import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  // empty list so we need rebuild UI in getGeneralNews()
  final List<ArticleModel> articles;
  NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: NewsTile(articleModel: articles[index]),
          );
        },
      ),
    );
  }
}
