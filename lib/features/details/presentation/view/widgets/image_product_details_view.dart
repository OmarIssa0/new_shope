import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../search/presentation/manger/provider/product_provider.dart';

class ImageProductDetailsView extends StatelessWidget {
  const ImageProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // product provider
    final productProviderDetails =
        Provider.of<ProductProvider>(context, listen: false);

    // Navigator
    final productId = ModalRoute.of(context)!.settings.arguments;
    final getCurrentProduct =
        productProviderDetails.findByProductId(productId.toString());

    // Ui
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Hero(
                tag: getCurrentProduct.productId,
                child: FancyShimmerImage(
                  imageUrl: getCurrentProduct.productImage,
                  width: double.infinity,
                  height: 325.h,
                  boxFit: BoxFit.cover,
                  errorWidget: const Icon(
                    Icons.error,
                  ),
                ),
              ),
            ),
          );
  }
}
