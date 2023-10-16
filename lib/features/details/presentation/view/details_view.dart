import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/details/presentation/view/widgets/bottom_nav_bar_details_view.dart';
import 'package:new_shope/features/details/presentation/view/widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TitleTextAppCustom(
          label: 'Details Product',
          fontSize: 20.sp,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(
            IconlyLight.arrow_left_2,
            color: Colors.black,
          ),
        ),
        elevation: 5,
      ),
      bottomNavigationBar: const BottomNavBarDetailsView(),
      body: const DetailsViewBody(),
    );
  }
}
