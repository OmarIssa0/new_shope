import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/features/home/presentation/view/widgets/swiper_image.dart';

import 'grid_view_category.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.r),
      child: Column(
        children: [
          const SwiperImage(),
          SizedBox(
            height: 25.h,
          ),
          const GridViewCategory(),
        ],
      ),
    );
  }
}
