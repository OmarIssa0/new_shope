
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class CategoriesRoundedWidgets extends StatelessWidget {
  const CategoriesRoundedWidgets({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          label: title,
          fontSize: 14.sp,
        ),
      ],
    );
  }
}
