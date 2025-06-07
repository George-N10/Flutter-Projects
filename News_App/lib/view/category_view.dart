import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 30, 12, 3),
        child: CustomScrollView(
          slivers: [
            NewsListViewBuilder(
              categoty: category,
            ),
          ],
        ),
      ),
    );
  }
}
