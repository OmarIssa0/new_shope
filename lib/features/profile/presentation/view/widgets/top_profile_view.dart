import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class TopProfileView extends StatelessWidget {
  const TopProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: false,
          child: Padding(
            padding: EdgeInsets.all(24.0.r),
            child: TitleTextAppCustom(
              label: 'Please login to have ultimate access',
              fontSize: 18.sp,
            ),
          ),
        ),
        Visibility(
          visible: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Row(
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // color: Colors.grey.shade500,
                    border: Border.all(
                      width: 3,
                      color: Colors.grey.shade500,
                    ),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextAppCustom(
                        label: 'Omar Issa',
                        fontSize: 20.sp,
                      ),
                      TitleTextAppCustom(
                        label: 'Omar.issa.Slwade@gmail.com',
                        fontSize: 15.sp,
                        // fontWeight: FontWeight.w100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
