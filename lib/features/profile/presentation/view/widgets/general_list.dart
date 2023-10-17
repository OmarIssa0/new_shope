import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/app_router.dart';
import 'package:new_shope/features/profile/presentation/view/widgets/custom_list_tile.dart';

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
                function: () {},
              ),
              CustomListTile(
                iconLeading: IconlyBold.heart,
                iconTrailing: IconlyLight.arrow_right_2,
                title: 'Wishlist',
                function: () {
                  GoRouter.of(context).push(AppRouter.kWishlist);
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
