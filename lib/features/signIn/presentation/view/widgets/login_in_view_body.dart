import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:new_shope/core/utils/animation_nav.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/text_filed_login.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/title_login_view.dart';
import 'package:new_shope/root_view.dart';

import 'goolge_sign_in.dart';

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
                await Navigator.of(context)
                    .pushReplacementNamed(RootView.kRoot);
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
          SizedBox(height: 40.h),
          const LoginTextFiled(),
          Divider(
            height: 70.h,
            endIndent: 30.r,
            indent: 30.r,
            color: Colors.grey.shade300,
          ),
          // const GoogleSignInBottom(),
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleTextAppCustom(
                  label: "Don't have an account?", fontSize: 16.sp),
              SizedBox(
                width: 8.w,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(AnimationNav.createRouteSignUp());
                },
                child: TitleTextAppCustom(
                  label: 'Sign up',
                  fontSize: 16.sp,
                  decoration: TextDecoration.underline,
                  color: const Color(0xff3669c9),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
