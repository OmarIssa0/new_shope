import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:provider/provider.dart';

import '../../../../search/presentation/manger/provider/product_provider.dart';

class TitleAndPriceDetailsProduct extends StatelessWidget {
  const TitleAndPriceDetailsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    // product provider
    final productProviderDetails =
        Provider.of<ProductProvider>(context, listen: false);

    // Navigator
    final productId = ModalRoute.of(context)!.settings.arguments;
    final getCurrentProduct =
        productProviderDetails.findByProductId(productId.toString());

    // ui
    return Padding(
      padding: EdgeInsets.all(14.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleTextAppCustom(
            label: getCurrentProduct!.productTitle,
            fontSize: 18.sp,
            maxLine: 30,
          ),
          SizedBox(
            height: 5.h,
          ),
          TitleTextAppCustom(
            label: '${getCurrentProduct.productPrice}\$',
            fontSize: 18.sp,
            maxLine: 2,
            color: Colors.blue.shade300,
          ),
        ],
      ),
    );
  }
}
