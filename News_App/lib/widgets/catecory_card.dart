import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/view/category_view.dart';

class CatecoryCard extends StatelessWidget {
  const CatecoryCard({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(
                category: category.categoryName,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Container(
          height: 100,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              image: NetworkImage(category.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Text(
              category.categoryName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                shadows: [Shadow(color: Colors.black, blurRadius: 20)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
