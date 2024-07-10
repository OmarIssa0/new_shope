import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    // required this.categoryModel,
    // required this.name,
    // required this.image,
  });

  // final String name; //, image;
  // final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: .10)
            // color: Colors.grey.shade300,
            ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sub Category",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
