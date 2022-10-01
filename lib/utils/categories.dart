import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String categoriesList;

  const Categories({
    Key? key,
    required this.categoriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(14),
      child: Image.asset(
        categoriesList,
        height: 40,
        width: 40,
      ),
    );
  }
}
