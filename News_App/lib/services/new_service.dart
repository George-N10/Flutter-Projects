import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

// Service class responsible for fetching news from the API
class NewsService {
  final Dio dio;

  // Constructor to initialize the Dio instance
  NewsService(this.dio);

  // Async method that fetches news and returns a list of ArticleModel
  // because method is async => return dataType of Future<....>
  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      var response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=85755b6906274498aee56ee3a590417f');

      // 1-Extract the response body (already parsed JSON) as a Map
      Map<String, dynamic> jsonData = response.data;

      // 2-Get the list of articles (List of Maps) from the respons
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];

      // store every artical map in jsonData into this object (articleModel)
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel(
          image: article['urlToImage'],
          title: article['title'],
          subTitle: article['description'],
        );
        // add the object (articleModel) into List (articalList)
        articlesList.add(articleModel);
      }
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
