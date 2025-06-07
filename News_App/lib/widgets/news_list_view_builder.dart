import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/new_service.dart';
import 'package:news_app/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String categoty;
  final String searchQuery;

  const NewsListViewBuilder({
    super.key,
    required this.categoty,
    this.searchQuery = '',
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<List<ArticleModel>> future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.categoty);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 10, 96, 244),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Center(child: Text('Oops, there was an error. Try later.')),
          );
        } else if (snapshot.hasData) {
          // Filter articles by search query
          final filteredArticles = snapshot.data!
              .where((article) => article.title  //Filters each article based on the condition provided.
                  .toLowerCase()
                  .contains(widget.searchQuery.toLowerCase()))
              .toList();

          return NewsListView(articles: filteredArticles);
        } else {
          return const SliverFillRemaining(
            child: Center(child: Text('No articles found.')),
          );
        }
      },
    );
  }
}
