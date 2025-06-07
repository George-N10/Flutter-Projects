import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/catecory_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(
        image:
            'https://images.pexels.com/photos/262524/pexels-photo-262524.jpeg?cs=srgb&dl=pexels-pixabay-262524.jpg&fm=jpg',
        categoryName: 'Sports'),
    CategoryModel(
        image:
            'https://smallbizclub.com/wp-content/uploads/2020/06/bigstock-Group-Of-Professional-Business-349068817.jpg',
        categoryName: 'Business'),
    CategoryModel(
        image:
            'https://tse2.mm.bing.net/th/id/OIP.XenbpiWtkIADyTn4r44gMQHaEK?r=0&rs=1&pid=ImgDetMain',
        categoryName: 'Technology'),
    CategoryModel(
        image:
            'https://tse1.mm.bing.net/th/id/OIP.bjda2IPGn7tvWEXpnKJWIwHaE8?r=0&rs=1&pid=ImgDetMain',
        categoryName: 'Health'),
    CategoryModel(
        image:
            'https://tse1.mm.bing.net/th/id/OIP.8hVZGeGjxTLodY4kPGVBdgHaE8?r=0&rs=1&pid=ImgDetMain',
        categoryName: 'Entertainment'),
    CategoryModel(
        image:
            'https://thumbs.dreamstime.com/b/chemistry-dark-science-lab-chemistry-dark-science-lab-illustration-biology-technology-discovery-analysis-specimen-microscope-319509817.jpg',
        categoryName: 'Science'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          //physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CatecoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
