import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/shimmer_color_text.dart';
import 'package:new_shope/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShimmerTextWidget(label: 'Smart Shope', fontSize: 20.sp),
      ),
      body: const HomeViewBody(),
    );
  }
}
