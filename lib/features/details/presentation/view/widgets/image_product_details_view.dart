import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageProductDetailsView extends StatelessWidget {
  const ImageProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: FancyShimmerImage(
          imageUrl:
              "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT4Q3?wid=1000&hei=1000&fmt=jpeg&qlt=95&.v=1693594240142",
          width: double.infinity,
          height: 325.h,
          boxFit: BoxFit.fill,
          errorWidget: const Icon(
            Icons.error,
          ),
        ),
      ),
    );
  }
}
