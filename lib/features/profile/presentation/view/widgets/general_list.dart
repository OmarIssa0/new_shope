import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/features/all_order/presentation/view/all_order_view.dart';
import 'package:new_shope/features/profile/presentation/view/widgets/custom_list_tile.dart';
import 'package:new_shope/features/wishlist/presentation/view/wishlist_view.dart';

class GeneralList extends StatelessWidget {
  const GeneralList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: Column(
            children: [
              CustomListTile(
                iconLeading: IconlyBold.folder,
                iconTrailing: IconlyLight.arrow_right_2,
                title: 'All Order',
                function: () async {
                  await Navigator.of(context).pushNamed(AllOrderView.kAllOrder);
                },
              ),
              CustomListTile(
                iconLeading: IconlyBold.heart,
                iconTrailing: IconlyLight.arrow_right_2,
                title: 'Wishlist',
                function: () async {
                  await Navigator.of(context).pushNamed(WishlistView.kWishlist);
                },
              ),
              CustomListTile(
                iconLeading: IconlyBold.time_circle,
                iconTrailing: IconlyLight.arrow_right_2,
                title: 'Viewed Recently',
                function: () {},
              ),
              CustomListTile(
                iconLeading: IconlyBold.location,
                iconTrailing: IconlyLight.arrow_right_2,
                title: 'Address',
                function: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
