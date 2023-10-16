import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/home/presentation/view/widgets/box_item_card.dart';
import 'package:new_shope/features/home/presentation/view/widgets/swiper_image.dart';
import 'grid_view_category.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SwiperImage(),
          SizedBox(
            height: 25.h,
          ),
          const GridViewCategory(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTextAppCustom(
                  label: 'Featured Product',
                  fontSize: 16.sp,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(25.r),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleTextAppCustom(
                      label: 'See All',
                      fontSize: 12.sp,
                      color: const Color(0xff3669C9),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 270.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.5),
                  child: BoxItemCard(),
                );
              },
            ),
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
