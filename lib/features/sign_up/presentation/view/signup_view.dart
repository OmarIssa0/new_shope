import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/sign_up/presentation/view/widgets/signup__body_view.dart';

class SignUpView extends StatelessWidget {
  static const kSignUp = '/kSignUpView';
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: Colors.black,
          ),
        ),
        title: TitleTextAppCustom(
          label: 'Register',
          fontSize: 20.sp,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const SignUpBodyView(),
      ),
    );
  }
}
