import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/details/presentation/view/details_view.dart';
import 'package:provider/provider.dart';

import '../../manger/provider/product_provider.dart';

class ProductWidgets extends StatefulWidget {
  const ProductWidgets({
    super.key,
    required this.productId,
  });

  final String productId;
  @override
  State<ProductWidgets> createState() => _ProductWidgetsState();
}

class _ProductWidgetsState extends State<ProductWidgets> {
  @override
  Widget build(BuildContext context) {
    // product provider
    final productProviderSearch = Provider.of<ProductProvider>(context);
    final getCurrentProduct =
        productProviderSearch.findByProductId(widget.productId);
    // mediaQuery
    Size size = MediaQuery.of(context).size;

    // Ui
    // اذا ال get null
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(3.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(14.r),
              onTap: () async {
                Navigator.of(context).pushNamed(DetailsView.kDetails,
                    arguments: getCurrentProduct.productId);
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: FancyShimmerImage(
                      imageUrl: getCurrentProduct.productImage,
                      height: size.height * 0.22,
                      boxFit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: TitleTextAppCustom(
                          label: getCurrentProduct.productTitle,
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
                            label: "${getCurrentProduct.productPrice}\$",
                            fontSize: 18.sp,
                            color: Colors.blue.shade900,
                            // color: AppColor.kRedColorPrice,
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
