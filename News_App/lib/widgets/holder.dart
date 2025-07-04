// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:news_app/models/article_model.dart';
// import 'package:news_app/services/new_service.dart';
// import 'news_tile.dart';

// class NewsListView extends StatefulWidget {
//   const NewsListView({super.key});

//   @override
//   State<NewsListView> createState() => _NewsListViewState();
// }

// class _NewsListViewState extends State<NewsListView> {
//   List<ArticleModel> articles =
//       []; // empty list so we need rebuild UI in getGeneralNews()

//   bool isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     getGeneralNews(); //request
//   }

//   Future<void> getGeneralNews() async {
//     articles = await NewsService(Dio()).getNews();
//     isLoading = false;
//     setState(() {}); // rebuild after request data to show on screen
//   }

//   // indicator
//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? SliverFillRemaining(
//             hasScrollBody: false,
//             child: Center(
//               child: const CircularProgressIndicator(
//                 color: Color.fromARGB(255, 10, 96, 244),
//               ),
//             ))
//         : SliverList(
//             delegate: SliverChildBuilderDelegate(
//               childCount: articles.length,
//               (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 22),
//                   child: NewsTile(articleModel: articles[index]),
//                 );
//               },
//             ),
//           );
//   }
// }
