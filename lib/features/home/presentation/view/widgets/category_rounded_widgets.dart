import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/home/presentation/view_model/provider/category_provider.dart';
import 'package:new_shope/features/search/presentation/view/search_view.dart';
import 'package:provider/provider.dart';

class CategoriesRoundedWidgets extends StatelessWidget {
  const CategoriesRoundedWidgets({
    super.key,
    required this.image,
    required this.name,
    required this.id,
  });

  final String image;
  final String name;
  final String id;

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final getCurrentProduct = categoryProvider.findByCategoryId(id);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          SearchView.kSearch,
          arguments: name,
        );
        // Navigator.pushNamed(context, SubCategoryView.routeName);
      },
      child: Column(
        children: [
          Image.network(
            // AppConstants.categories[0],
            image,
            height: 50.h,
            width: 50.w,
          ),
          SizedBox(
            height: 8.h,
          ),
          TitleTextAppCustom(
            label: name,
            fontSize: 14.sp,
          ),
        ],
      ),
    );
  }
}
