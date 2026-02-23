import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 47,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.grey.withOpacity(0.15),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_rounded, size: 35, color: Colors.white),
        ),
      ),
    );
  }
}
