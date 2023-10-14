import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: 156.w,
      // height: height,
      // width: width,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.r),
        child: Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 120.h,
                // width: 123.w,
                width: double.infinity,
                child: Image.asset('assets/images/categories/shoes.png'),
              ),
              SizedBox(height: 10.h),
              FittedBox(
                child: TitleTextAppCustom(
                  label: 'Test Title',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 5.h),
              FittedBox(
                child: TitleTextAppCustom(
                  label: '1500\$',
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue.shade900,
                  // color: AppColor.kRedColorPrice,
                ),
              ),
              SizedBox(height: 10.h),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconlyLight.buy,
                        ),
                      ),
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          IconlyLight.heart,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
