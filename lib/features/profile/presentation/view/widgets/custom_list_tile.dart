import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.iconLeading,
      required this.iconTrailing,
      required this.title,
      required this.function});

  final IconData iconLeading;
  final IconData iconTrailing;
  final String title;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.r),
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: ListTile(
          leading: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade200,
            ),
            child: Icon(
              //
              iconLeading,
              size: 28,
            ),
          ),
          title: TitleTextAppCustom(label: title, fontSize: 16.sp),
          trailing: Icon(
            iconTrailing,
            //
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
