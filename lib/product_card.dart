import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    this.backgroundColor = const .fromRGBO(235, 245, 250, 1),
  });

  final String title;
  final int price;
  final String image;
  Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 10),

      // If "decoration" is used, we must put the "color" inside.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
      ),

      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Text("\$$price", style: Theme.of(context).textTheme.bodySmall),
          Image.asset(image, height: 160),
          // Image(image: AssetImage(image), height: 160),
        ],
      ),
    );
  }
}
