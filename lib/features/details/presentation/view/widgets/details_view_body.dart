import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/details/presentation/view/widgets/title_and_price_product_detalis.dart';
import 'package:provider/provider.dart';

import '../../../../search/presentation/manger/provider/product_provider.dart';
import 'image_product_details_view.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // product provider
    final productProviderDetails =
        Provider.of<ProductProvider>(context, listen: false);

    // Navigator
    String productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProviderDetails.findByProductId(productId);

    // Ui
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
                TitleTextAppCustom(
                    label: getCurrentProduct!.productCategory, fontSize: 14.sp),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                Text(
                  getCurrentProduct.productDescription,
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
