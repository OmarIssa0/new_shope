import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/animation_nav.dart';

import '../../../../../core/utils/widgets/title_text.dart';

class ForGotPasswordLoginView extends StatelessWidget {
  const ForGotPasswordLoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(25.r),
        onTap: () {
          Navigator.of(context).push(AnimationNav.createRouteForgotPassword());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
          child: TitleTextAppCustom(
            label: 'Forgot Password ?',
            fontSize: 12.sp,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
