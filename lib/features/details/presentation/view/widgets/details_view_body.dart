import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/details/presentation/view/widgets/title_and_price_product_detalis.dart';

import 'image_product_details_view.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ImageProductDetailsView(),
          const TitleAndPriceDetailsProduct(),
          const Divider(
            indent: 25,
            endIndent: 25,
            color: Colors.grey,
            thickness: .25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleTextAppCustom(
                    label: 'Description Product', fontSize: 18.sp),
                TitleTextAppCustom(label: 'In Phone', fontSize: 14.sp),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Text(
                  'The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. The speaker unit contains a diaphragm that is precision-grown from NAC Audio bio-cellulose, making it stiffer, lighter and stronger than regular PET speaker units, and allowing the sound-producing diaphragm to vibrate without the levels of distortion found in other speakers. ',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            indent: 25,
            endIndent: 25,
            color: Colors.grey,
            thickness: .25,
          ),
          SizedBox(
            height: 200.h,
          ),
        ],
      ),
    );
  }
}
