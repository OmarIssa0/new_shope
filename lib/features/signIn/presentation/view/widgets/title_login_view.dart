import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/widgets/title_text.dart';

class TitleLoginView extends StatelessWidget {
  const TitleLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 65.h,
          ),
          TitleTextAppCustom(
            label: 'Smart Shop',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          TitleTextAppCustom(
            label: "Let's get you logged in so you can start exploring.",
            fontSize: 12.sp,
            maxLine: 2,
          ),
        ],
      ),
    );
  }
}
