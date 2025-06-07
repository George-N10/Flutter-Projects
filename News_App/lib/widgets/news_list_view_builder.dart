import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/new_service.dart';
import 'package:news_app/widgets/news_list_view.dart';

//To build newsListView and logic to get news by API
class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key,required this.categoty});
  final String categoty;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
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
        if (snapshot.hasData) {
          return NewsListView(
            articles: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverFillRemaining(
            child: Text('Ooops There was an error, Try Later'),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 10, 96, 244),
              ),
            ),
          );
        }
      },
    );

    // return isLoading
    //     ? SliverFillRemaining(
    //         hasScrollBody: false,
    //         child: Center(
    //           child: const CircularProgressIndicator(
    //             color: Color.fromARGB(255, 10, 96, 244),
    //           ),
    //         ))
    //     : articles.isNotEmpty
    //         ? NewsListView(articles: articles)
    //         : SliverFillRemaining(
    //             child: Text('Ooops There was an error, Try Later'),
    //           );
  }
}
