import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:provider/provider.dart';

import '../../../../cart/presentation/manger/provider/cart_provider.dart';
import '../../../../search/presentation/manger/provider/product_provider.dart';

class BottomNavBarDetailsView extends StatelessWidget {
  const BottomNavBarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrProduct = productProvider.findByProductId(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 8.r),
        child: Row(
          children: [
            Expanded(
              child: MaterialButton(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                height: 50.h,
                color: Colors.black54,
                onPressed: () {
                  if (cartProvider.isProductInCart(
                      productId: getCurrProduct.productId)) {
                    return;
                  }
                  cartProvider.addProductToCart(
                      productID: getCurrProduct.productId);
                },
                child: cartProvider.isProductInCart(
                        productId: getCurrProduct!.productId)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleTextAppCustom(
                            label: 'In Cart',
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                          )
                        ],
                      )
                    : TitleTextAppCustom(
                        label: 'Add To Cart',
                        fontSize: 18.sp,
                        color: Colors.white,
                      ),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(100.r),
                color: Colors.black54,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  IconlyBold.heart,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
