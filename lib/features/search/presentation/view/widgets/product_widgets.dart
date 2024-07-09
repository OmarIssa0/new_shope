import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/app_image.dart';
import 'package:new_shope/core/utils/widgets/alert_dialog.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/cart/presentation/manger/provider/cart_provider.dart';
import 'package:new_shope/features/details/presentation/view/details_view.dart';
import 'package:provider/provider.dart';

import '../../../../wishlist/presentation/view_model/provider/wishlist_provider.dart';
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

    // cart provider => add item cart
    final cartProvider = Provider.of<CartProvider>(context);

    // add wishlist
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    // mediaQuery
    Size size = MediaQuery.of(context).size;
    // loading
    // bool isLoading = false;

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
                    child: Hero(
                      tag: getCurrentProduct.productId,
                      child: FancyShimmerImage(
                        imageUrl: getCurrentProduct.productImage,
                        height: size.height * 0.22,
                        boxFit: BoxFit.fitHeight,
                      ),
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
                          onPressed: () async {
                            // wishlistProvider.addProductToCartAndRemoveWishlist(
                            //     productID: widget.productId);
                            // setState(() {
                            //   isLoading = true;
                            // });
                            try {
                              if (wishlistProvider.getWishlistItem
                                  .containsKey(widget.productId)) {
                                wishlistProvider.removeWishlistItemFromFirebase(
                                    wishlistId: wishlistProvider
                                        .getWishlistItem[widget.productId]!.id,
                                    productId: widget.productId);
                              } else {
                                wishlistProvider.addToWishlistFirebase(
                                    productId: widget.productId,
                                    context: context);
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
                            // finally {
                            //   setState(() {
                            //     isLoading = false;
                            //   });
                            // }
                          },
                          icon: wishlistProvider.isProductInWishlist(
                                  productId: widget.productId)
                              ? const Icon(
                                  IconlyBold.heart,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  IconlyLight.heart,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                        ),
                      ),
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
                              onTap: () async {
                                if (cartProvider.isProductInCart(
                                    productId: getCurrentProduct.productId)) {
                                  return;
                                }
                                try {
                                  await cartProvider.addToCartFirebase(
                                      productId: getCurrentProduct.productId,
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
                                // cartProvider.addProductToCart(
                                //     productID: getCurrentProduct.productId);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  cartProvider.isProductInCart(
                                          productId:
                                              getCurrentProduct.productId)
                                      ? Icons.check
                                      : IconlyLight.buy,
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
