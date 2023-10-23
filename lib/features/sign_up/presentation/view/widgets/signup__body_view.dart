import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/sign_up/presentation/view/widgets/text_filed_signup.dart';

class SignUpBodyView extends StatelessWidget {
  const SignUpBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            TitleTextAppCustom(
                label: 'Welcome', fontSize: 20.sp, fontWeight: FontWeight.w600),
            TitleTextAppCustom(
              label:
                  'Sign up to receive special offers and updates form our app',
              fontSize: 12.sp,
              maxLine: 3,
            ),
            SizedBox(height: 25.h),
            const TextFiledSignUp()
          ],
        ),
      ),
    );
  }
}
