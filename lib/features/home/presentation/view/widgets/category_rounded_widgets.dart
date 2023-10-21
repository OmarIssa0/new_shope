import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/search/presentation/view/search_view.dart';

class CategoriesRoundedWidgets extends StatelessWidget {
  const CategoriesRoundedWidgets({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          SearchView.kSearch,
          arguments: name,
        );
      },
      child: Column(
        children: [
          Image.asset(
            // AppConstants.categories[0],
            image,
            height: 50.h,
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
