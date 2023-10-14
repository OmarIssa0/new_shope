import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/constant/constant.dart';

class SwiperImage extends StatelessWidget {
  const SwiperImage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: SizedBox(
            height: size.height * 0.22,
            // width: size.width * 0.95,
            child: Swiper(
              itemCount: AppConstants.bannerImage.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  AppConstants.bannerImage[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: DotSwiperPaginationBuilder(
                  color: Colors.grey.shade300,
                  activeColor: Colors.grey.shade700,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
