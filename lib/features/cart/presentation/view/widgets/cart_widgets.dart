import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/cart/presentation/manger/model/cart_model.dart';
import 'package:new_shope/features/cart/presentation/view/widgets/plus_and_minus.dart';
import 'package:new_shope/features/details/presentation/view/details_view.dart';
import 'package:provider/provider.dart';

import '../../../../search/presentation/manger/provider/product_provider.dart';
import '../../../../wishlist/presentation/view_model/provider/wishlist_provider.dart';
import '../../manger/provider/cart_provider.dart';

class CartWidgets extends StatelessWidget {
  const CartWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    // cart provider
    final cartModelProvider = Provider.of<CartModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    //
    final productProviderCart = Provider.of<ProductProvider>(context);
    final getCurrentProduct =
        productProviderCart.findByProductId(cartModelProvider.productID);
    // add wishlist
    // ignore: unused_local_variable
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    // final cartProvider = Provider.of<CartProvider>(context);
    // media query
    Size size = MediaQuery.of(context).size;
    // ui
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () async {
              Navigator.of(context).pushNamed(DetailsView.kDetails,
                  arguments: getCurrentProduct.productId);
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
                          imageUrl: getCurrentProduct.productImage,
                          height: size.height * 0.2,
                          width: size.height * 0.2,
                          boxFit: BoxFit.fitHeight,
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
                                    label: getCurrentProduct.productTitle,
                                    fontSize: 18.sp,
                                    maxLine: 2,
                                  ),
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        // cartProvider.removeOneItem(
                                        //     productId:
                                        //         cartModelProvider.productID);
                                        await cartProvider
                                            .removeCartItemFromFirebase(
                                          cartId: cartModelProvider.cartID,
                                          productId:
                                              getCurrentProduct.productId,
                                          qty: cartModelProvider.quantity,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    )
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
                                  label: '${getCurrentProduct.productPrice}\$',
                                  fontSize: 18.sp,
                                  color: Colors.blue.shade900,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 10.r),
                                  child: PlusAndMinusCount(
                                    cartModel: cartModelProvider,
                                  ),
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
