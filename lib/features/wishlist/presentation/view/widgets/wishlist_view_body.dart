import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/features/wishlist/presentation/view_model/provider/wishlist_provider.dart';

import 'package:new_shope/root_view.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/widgets/empty_widgets.dart';
import '../../../../search/presentation/view/widgets/product_widgets.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlistItem.isEmpty
        ? Column(
            children: [
              EmptyWidgets(
                title: 'Whoops!',
                subTitle: 'Your Wishlist is empty',
                titleBottom: 'Shope Now',
                function: () async {
                  await Navigator.of(context)
                      .pushReplacementNamed(RootView.kRoot);
                },
              ),
            ],
          )
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r),
            child: Column(
              children: [
                Expanded(
                  child: DynamicHeightGridView(
                    itemCount: wishlistProvider.getWishlistItem.length,
                    crossAxisCount: 2,
                    builder: (context, index) {
                      return ProductWidgets(
                        productId: wishlistProvider.getWishlistItem.values
                            .toList()[index]
                            .productId,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
