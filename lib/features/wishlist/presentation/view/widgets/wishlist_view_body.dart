import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../search/presentation/view/widgets/product_widgets.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.r),
      child: Column(
        children: [
          Expanded(
            child: DynamicHeightGridView(
              itemCount: 100,
              crossAxisCount: 2,
              builder: (context, index) {
                return const ProductWidgets();
              },
            ),
          ),
        ],
      ),
    );
  }
}
