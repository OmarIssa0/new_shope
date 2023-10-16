import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class BottomNavBarDetailsView extends StatelessWidget {
  const BottomNavBarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 8.r),
        child: Row(
          children: [
            Expanded(
              child: MaterialButton(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                height: 50.h,
                color: Colors.black54,
                onPressed: () {},
                child: TitleTextAppCustom(
                  label: 'Add To Cart',
                  fontSize: 18.sp,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(100.r),
                color: Colors.black54,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.heart,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
