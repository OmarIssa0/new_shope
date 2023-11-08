import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/alert_dialog.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/wishlist/presentation/view/widgets/wishlist_view_body.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_image.dart';
import '../view_model/provider/wishlist_provider.dart';

class WishlistView extends StatelessWidget {
  static const kWishlist = '/kWishlistView';
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Scaffold(
      appBar: wishlistProvider.getWishlistItem.isNotEmpty
          ? AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    AlertDialogMethods.showDialogWaring(
                      isError: false,
                      context: context,
                      titleBottom: "Delete Wishlist",
                      lottileAnimation: MangerImage.kDeleteCartAndWishlist,
                      function: () async {
                        await wishlistProvider.clearCartFromFirebase();
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                    );
                  },
                  icon: const Icon(
                    IconlyLight.delete,
                    color: Colors.red,
                  ),
                ),
              ],
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  IconlyLight.arrow_left_2,
                  color: Colors.black,
                ),
              ),
              title: TitleTextAppCustom(
                label: 'Wishlist (${wishlistProvider.getWishlistItem.length})',
                fontSize: 20.sp,
              ),
            )
          : null,
      body: const WishlistViewBody(),
    );
  }
}
