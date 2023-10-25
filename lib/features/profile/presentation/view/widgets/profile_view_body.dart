import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/widgets/alert_dialog.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/features/profile/presentation/view/widgets/custom_list_tile.dart';
import 'package:new_shope/features/profile/presentation/view/widgets/general_list.dart';
import 'package:new_shope/features/profile/presentation/view/widgets/top_profile_view.dart';
import 'package:new_shope/features/signIn/presentation/view/login_in_view.dart';

import '../../../../../core/utils/app_image.dart';

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
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: Colors.red.shade100,
                  ),
                  child: CustomListTile(
                    iconLeading: IconlyBold.logout,
                    iconTrailing: IconlyLight.arrow_right_2,
                    title: 'Log out',
                    function: () async {
                      await AlertDialogMethods.showDialogWaring(
                        context: context,
                        titleBottom: 'Logout',
                        lottileAnimation: MangerImage.kLogout,
                        function: () async {
                          await Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginView.kLogin, (route) => false);
                        },
                        isError: false,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
