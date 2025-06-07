import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_list_view_builder.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key, required this.category});

  final String category;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 30, 12, 3),
        child: Column(
          children: [
            //Search bar input
            TextField(
              onChanged: (value) {
                // Update the search query on each keystroke
                setState(() {
                  searchQuery = value.toLowerCase().trim();  // Normalize input (lowercase and trimmed)
                });
              },
              decoration: InputDecoration(
                hintText: 'Search by title...',  //placeholder text
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  NewsListViewBuilder(
                    categoty: widget.category,
                    searchQuery: searchQuery,  // Search input to filter article titles
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
