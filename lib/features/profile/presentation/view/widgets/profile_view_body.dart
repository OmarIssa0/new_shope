import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/profile/presentation/view/widgets/general_list.dart';
import 'package:new_shope/features/profile/presentation/view/widgets/top_profile_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const TopProfileView(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextAppCustom(label: 'General', fontSize: 18.sp),
                const GeneralList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
