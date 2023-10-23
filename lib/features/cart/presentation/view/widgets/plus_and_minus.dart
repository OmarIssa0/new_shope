import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/features/cart/presentation/manger/provider/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/widgets/title_text.dart';
import '../../../../search/presentation/manger/provider/product_provider.dart';
import '../../manger/model/cart_model.dart';

class PlusAndMinusCount extends StatefulWidget {
  const PlusAndMinusCount({super.key, required this.cartModel});

  final CartModel cartModel;

  @override
  State<PlusAndMinusCount> createState() => _PlusAndMinusCountState();
}

class _PlusAndMinusCountState extends State<PlusAndMinusCount> {
  int numberCount = 1;
  @override
  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    //
    final productProviderSearch = Provider.of<ProductProvider>(context);
    final getCurrentProduct = productProviderSearch
        .findByProductId(widget.cartModel.quantity.toString());
    return Container(
      // height: 30,
      // width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        // color: Colors.black,
        border: const Border(
          top: BorderSide(width: 1),
          bottom: BorderSide(width: 1),
          left: BorderSide(width: 1),
          right: BorderSide(width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 1),
              ),
            ),
            child: InkWell(
              onTap: () {
                cartProvider.updateQuantity(
                  productId: widget.cartModel.productID,
                  quantity: numberCount = 1,
                );
                setState(() {});
                // // numberCount--;
                // if (numberCount == 1) {
                // } else if (numberCount >= 2) {
                //   setState(() {
                //     numberCount--;
                //   });
                // }
              },
              child: Icon(
                IconlyBold.arrow_left_2,
                size: 32,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          SizedBox(
            width: 13.w,
          ),
          TitleTextAppCustom(
              label: '${cartModelProvider.quantity}', fontSize: 18.sp),
          // TitleTextAppCustom(label: '$numberCount', fontSize: 18.sp),
          SizedBox(
            width: 13.w,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(width: 1),
              ),
            ),
            child: InkWell(
              onTap: () {
                cartProvider.updateQuantity(
                  productId: widget.cartModel.productID,
                  quantity: numberCount + 1,
                );
                // setState(() {});
                // if (productProviderSearch.getProducts.toString() ) {
                // } else if (numberCount >= 1) {
                //   numberCount--;
                //   setState(() {});
                // }
                numberCount++;
                // setState(() {});
              },
              child: Icon(
                IconlyBold.arrow_right_2,
                size: 32,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
