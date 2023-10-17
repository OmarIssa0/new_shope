import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:new_shope/core/utils/app_router.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/bottom_signIn.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/text_filed_login.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/title_login_view.dart';

import 'forgot_pawword_login_view.dart';

class LoginInViewBody extends StatelessWidget {
  const LoginInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32.r, right: 32.r),
            child: GestureDetector(
              onTap: () async {
                await GoRouter.of(context).pushReplacement(AppRouter.kRoot);
              },
              child: TitleTextAppCustom(
                label: 'Skip',
                fontSize: 17.sp,
                // color: Colors.blue.shade800,
                color: const Color(0xff3669c9),
              ),
            ),
          ),
          const TitleLoginView(),
          SizedBox(
            height: 40.h,
          ),
          const LoginTextFiled(),
          SizedBox(
            height: 10.h,
          ),
          const ForGotPasswordLoginView(),
          SizedBox(
            height: 15.h,
          ),
          const BottomSignIn(),
          Divider(
            height: 70.h,
            endIndent: 30.r,
            indent: 30.r,
            color: Colors.grey.shade300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Ionicons.logo_google,
                color: Colors.red,
                size: 40,
              ),
              SizedBox(
                width: 20.w,
              ),
              const Icon(
                Ionicons.logo_facebook,
                color: Colors.blue,
                size: 40,
              ),
              // Icon(
              //   Ionicons.logo_apple,
              //   color: Colors.black,
              //   size: 40,
              // ),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleTextAppCustom(
                  label: "Don't have an account?", fontSize: 16.sp),
              SizedBox(
                width: 8.w,
              ),
              GestureDetector(
                onTap: () {},
                child: TitleTextAppCustom(
                  label: 'Sign up',
                  fontSize: 16.sp,
                  decoration: TextDecoration.underline,
                  color: const Color(0xff3669c9),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
