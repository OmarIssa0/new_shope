import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/cart/presentation/view/widgets/plus_and_minus.dart';
import 'package:new_shope/features/details/presentation/view/details_view.dart';

class CartWidgets extends StatelessWidget {
  const CartWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DetailsView.kDetails);
      },
      child: FittedBox(
        child: IntrinsicWidth(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: FancyShimmerImage(
                    imageUrl:
                        "http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg",
                    height: size.height * 0.2,
                    width: size.height * 0.2,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                IntrinsicWidth(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.6,
                            child: TitleTextAppCustom(
                              label: 'Title' * 30,
                              fontSize: 18.sp,
                              maxLine: 2,
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  IconlyLight.heart,
                                  // color: Colors.red,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TitleTextAppCustom(
                            label: '1500\$',
                            fontSize: 18.sp,
                            color: Colors.blue.shade900,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.r),
                            child: const PlusAndMinusCount(),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
