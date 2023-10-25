import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/forgot_password/presentation/view/widgets/textfiled_and_bottom.dart';

import '../../../../../core/utils/app_image.dart';

class ForgotPasswordBodyView extends StatelessWidget {
  const ForgotPasswordBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18.r,
          vertical: 24.r,
        ),
        child: Column(
          children: [
            Lottie.asset(
              MangerImage.kForgotPassword,
              height: MediaQuery.of(context).size.height * .25,
            ),
            SizedBox(
              height: 45.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextAppCustom(
                  label: "Forgot Password",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                TitleTextAppCustom(
                  label:
                      "Please enter the email address you'd like your password reset information sent to",
                  fontSize: 11.sp,
                  maxLine: 3,
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            const TextFiledForgotPasswordAndBottom()
          ],
        ),
      ),
    );
  }
}
