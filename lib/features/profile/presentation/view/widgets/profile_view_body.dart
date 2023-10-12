import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0.r),
      child: Column(
        children: [
          TitleTextAppCustom(label: 'Profile', fontSize: 24.sp),
        ],
      ),
    );
  }
}
