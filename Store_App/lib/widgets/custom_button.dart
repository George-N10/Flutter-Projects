import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.onTap,
    required this.title,
    super.key,
    required this.color,
  });

  String? title;
  VoidCallback? onTap;

  MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 70,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
