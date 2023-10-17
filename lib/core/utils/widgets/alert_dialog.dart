import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

import '../../constant/app_color.dart';

class AlertDialogMethods {
  static Future<void> showDialogWaring({
    required BuildContext context,
    required String titleBottom,
    String? subtitle,
    required String lottileAnimation,
    required Function function,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900.withOpacity(.75),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LottieBuilder.asset(
                lottileAnimation,
              ),
              TitleTextAppCustom(
                label: subtitle ?? '',
                fontSize: 18.sp,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        function();
                        GoRouter.of(context).pop();
                      },
                      child: TitleTextAppCustom(
                        label: titleBottom,
                        fontSize: 16.sp,
                        color: AppColor.kRedColorPrice,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Visibility(
                      visible: !isError,
                      child: TextButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child: TitleTextAppCustom(
                          label: 'Cancel',
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
