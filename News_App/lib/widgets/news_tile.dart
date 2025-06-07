import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/Config/Theme.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  static const String fallbackImageUrl = 'assets/no_image.jpg';

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Shadow depth
      margin: const EdgeInsets.symmetric(vertical: 3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/loading.gif',
                image: articleModel.image ?? fallbackImageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) => Image.asset(
                  fallbackImageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              articleModel.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              articleModel.subTitle ?? '',
              maxLines: 2,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
