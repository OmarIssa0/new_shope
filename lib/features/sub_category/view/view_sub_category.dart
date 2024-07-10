import 'package:flutter/material.dart';
import 'package:new_shope/features/sub_category/view/widgets/sub_category_view_body.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key});
  static const String routeName = 'SubCategoryView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          'Sub Category',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const SubCategoryViewBody(),
    );
  }
}
