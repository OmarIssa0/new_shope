import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:new_shope/core/utils/app_router.dart';

import '../../../../../core/utils/widgets/empty_widgets.dart';
import '../../../../search/presentation/view/widgets/product_widgets.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});
  final bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Column(
            children: [
              EmptyWidgets(
                title: 'Whoops!',
                subTitle: 'Your Wishlist is empty',
                titleBottom: 'Shope Now',
                function: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kRoot);
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
                    itemCount: 100,
                    crossAxisCount: 2,
                    builder: (context, index) {
                      return const ProductWidgets(
                        productId: "",
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
