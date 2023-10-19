import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        onTap: () {},
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
