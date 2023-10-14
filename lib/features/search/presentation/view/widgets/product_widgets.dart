import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';

class ProductWidgets extends StatefulWidget {
  const ProductWidgets({super.key});

  @override
  State<ProductWidgets> createState() => _ProductWidgetsState();
}

class _ProductWidgetsState extends State<ProductWidgets> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(14.r),
        onTap: () {
          log('TODO Nav screen');
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: FancyShimmerImage(
                imageUrl:
                    'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg',
                height: size.height * 0.22,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: TitleTextAppCustom(
                    label: 'Title' * 10,
                    fontSize: 18.sp,
                    maxLine: 2,
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
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: TitleTextAppCustom(
                      label: '166.5\$',
                      fontSize: 18.sp,
                      color: Colors.blue.shade900,
                    ),
                  ),
                  Flexible(
                    child: Material(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey.shade200,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            IconlyLight.buy,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
