import 'package:flutter/material.dart';
import 'package:new_shope/features/sub_category/view/widgets/category_item.dart';

class SubCategoryViewBody extends StatelessWidget {
  const SubCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            children: List.generate(10, (index) => const CategoryItem())));
  }
}
