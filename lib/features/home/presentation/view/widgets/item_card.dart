import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/search/presentation/manger/model/product.model.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final passedCategory = ModalRoute.of(context)!.settings.arguments;
    final productModel = Provider.of<ProductModel>(context);
    return SizedBox(
      // height: 420.h,s
      width: 156.w,
      // height: height,
      // width: width,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 135.h,
              // width: 123.w,
              width: double.infinity,
              child: Hero(
                tag: productModel.productId,
                child: FancyShimmerImage(
                  imageUrl: productModel.productImage,
                  // 'http/s://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT4Q3?wid=1000&hei=1000&fmt=jpeg&qlt=95&.v=1693594240142',
                  boxFit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Flexible(
              child: TitleTextAppCustom(
                label: productModel.productTitle,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5.h),
            Flexible(
              child: TitleTextAppCustom(
                label: '${productModel.productPrice}\$',
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Colors.blue.shade900,
                // color: AppColor.kRedColorPrice,
              ),
            ),
            SizedBox(height: 5.h),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Flexible(
            //       child: IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           IconlyLight.buy,
            //         ),
            //       ),
            //     ),
            //     Flexible(
            //       child: IconButton(
            //         onPressed: () {},
            //         icon: const Icon(
            //           IconlyLight.heart,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
