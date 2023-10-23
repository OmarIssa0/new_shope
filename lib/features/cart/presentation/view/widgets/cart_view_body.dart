import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/alert_dialog.dart';
import 'package:new_shope/core/utils/widgets/empty_widgets.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/home/presentation/view/home_view.dart';
import 'package:new_shope/features/search/presentation/manger/provider/product_provider.dart';
import 'package:provider/provider.dart';

import '../../manger/provider/cart_provider.dart';
import 'cart_widgets.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return cartProvider.getCartItem.isEmpty
        ? Column(
            children: [
              EmptyWidgets(
                title: 'Whoops!',
                subTitle: 'Your cart is empty',
                titleBottom: 'Shope Now',
                function: () {
                  Navigator.of(context).pushNamed(HomeView.kHome);
                },
              ),
            ],
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: TitleTextAppCustom(
                label: 'Cart (${cartProvider.getCartItem.length})',
                fontSize: 20.sp,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    AlertDialogMethods.showDialogWaring(
                      context: context,
                      titleBottom: 'Delete My Cart',
                      lottileAnimation: 'assets/lottile/delete_cart.json',
                      function: () {
                        cartProvider.clearLocal();
                        Navigator.of(context).pop();
                      },
                      isError: false,
                    );
                  },
                  icon: Icon(
                    Icons.delete_forever_outlined,
                    color: Colors.red.shade400,
                    size: 28,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50.h,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTextAppCustom(
                              label:
                                  'Total (${cartProvider.getCartItem.length} products / ${cartProvider.getQty()} Item)',
                              fontSize: 14.sp,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            TitleTextAppCustom(
                              label:
                                  '${cartProvider.getTotal(productProvider: productProvider).toStringAsFixed(2)}\$',
                              fontSize: 14.sp,
                              color: Colors.blue.shade900,
                            ),
                          ],
                        ),
                        MaterialButton(
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          color: Colors.grey.shade200,
                          onPressed: () {},
                          child: TitleTextAppCustom(
                            label: 'Checkout',
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black26,
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.getCartItem.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: cartProvider.getCartItem.values
                            .toList()
                            .reversed
                            .toList()[index],
                        child: const CartWidgets(),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
