import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class EmptyWidgets extends StatelessWidget {
  const EmptyWidgets(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.titleBottom});

  final String title, subTitle, titleBottom;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 70.h,
          ),
          LottieBuilder.asset(
            'assets/lottile/animation_lnlrqieq.json',
            height: 275.h,
            width: double.infinity,
          ),
          TitleTextAppCustom(
            label: title,
            fontSize: 32.sp,
            color: Colors.red.shade300,
          ),
          TitleTextAppCustom(
            label: subTitle,
            fontSize: 18.sp,
          ),
          SizedBox(
            height: 40.h,
          ),
          MaterialButton(
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(25.r),
            ),
            height: 55.h,
            color: Colors.red.shade300,
            onPressed: () {},
            child: TitleTextAppCustom(
              label: titleBottom,
              fontSize: 18.sp,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
