// to create an object to can call it in several newstile
class ArticleModel {
  final String? image;           //final => Because it was not modified later.
  final String title;
  final String? subTitle;

  ArticleModel(                  
      {required this.image, required this.title, required this.subTitle});

  // factory constructor (named const.)
  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
    );
  }
}
