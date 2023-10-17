import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/constant/my_validators.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/text_filed_login.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/title_login_view.dart';

class LoginInViewBody extends StatelessWidget {
  const LoginInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TitleLoginView(),
          SizedBox(
            height: 50.h,
          ),
          const LoginTextFiled(),
        ],
      ),
    );
  }
}
