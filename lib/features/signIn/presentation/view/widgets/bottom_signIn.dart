
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class BottomSignIn extends StatelessWidget {
  const BottomSignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.r, vertical: 10.r),
      child: MaterialButton(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
        color: Colors.black38,
        minWidth: double.infinity,
        height: 50,
        onPressed: () {},
        child: TitleTextAppCustom(
          label: 'Sign in',
          fontSize: 16.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
