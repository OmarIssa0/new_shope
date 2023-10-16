import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class TitleAndPriceDetailsProduct extends StatelessWidget {
  const TitleAndPriceDetailsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextAppCustom(
            label: 'Iphone 14 pro max 256gb',
            fontSize: 18.sp,
            maxLine: 3,
          ),
          SizedBox(
            height: 5.h,
          ),
          TitleTextAppCustom(
            label: '1500\$',
            fontSize: 18.sp,
            maxLine: 2,
            color: Colors.blue.shade300,
          ),
        ],
      ),
    );
  }
}
