import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/app_image.dart';
import 'package:new_shope/core/utils/widgets/alert_dialog.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/wishlist/presentation/view_model/provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

import '../../../../cart/presentation/manger/provider/cart_provider.dart';
import '../../../../search/presentation/manger/provider/product_provider.dart';

class BottomNavBarDetailsView extends StatelessWidget {
  const BottomNavBarDetailsView({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrProduct = productProvider.findByProductId(productId);
    final cartProvider = Provider.of<CartProvider>(context);

    // add wishlist
    final wishlistProvider = Provider.of<WishlistProvider>(context);

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
                onPressed: () async {
                  if (cartProvider.isProductInCart(
                      productId: getCurrProduct.productId)) {
                    return;
                  }
                  try {
                    await cartProvider.addToCartFirebase(
                        productId: getCurrProduct.productId,
                        qty: 1,
                        context: context);
                  } catch (e) {
                    AlertDialogMethods.showError(
                      context: context,
                      titleBottom: "Ok",
                      lottileAnimation: MangerImage.kError,
                      subtitle: e.toString(),
                      function: () {
                        Navigator.pop(context);
                      },
                    );
                  }
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
                  onPressed: () async {
                    // wishlistProvider.addProductToCartAndRemoveWishlist(
                    //   productID: productId,
                    // );
                    try {
                      if (wishlistProvider.getWishlistItem
                          .containsKey(productId)) {
                        wishlistProvider.removeWishlistItemFromFirebase(
                            wishlistId:
                                wishlistProvider.getWishlistItem[productId]!.id,
                            productId: productId);
                      } else {
                        wishlistProvider.addToWishlistFirebase(
                            productId: productId, context: context);
                      }
                      await wishlistProvider.fetchWishlist();
                    } catch (e) {
                      AlertDialogMethods.showError(
                        context: context,
                        titleBottom: "Ok",
                        lottileAnimation: MangerImage.kError,
                        subtitle: e.toString(),
                        function: () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  },
                  icon:
                      wishlistProvider.isProductInWishlist(productId: productId)
                          ? const Icon(
                              IconlyBold.heart,
                              color: Colors.red,
                            )
                          : const Icon(
                              IconlyLight.heart,
                              color: Color.fromARGB(255, 255, 255, 255),
                            )),
            ),
          ],
        ),
      ),
    );
  }
}
