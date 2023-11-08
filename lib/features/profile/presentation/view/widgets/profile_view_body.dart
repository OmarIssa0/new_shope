import 'package:firebase_auth/firebase_auth.dart';
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

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  User? user = FirebaseAuth.instance.currentUser;
  // UserModel? userModel;

  // bool _isLoading = true;

  // Future<void> fetchUserInfo() async {
  //   if (user == null) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //     return;
  //   }
  //   final userProvider = Provider.of<UserProvider>(context, listen: false);
  //   try {
  //     UserModel? userModel = await userProvider.fatchUserInfo();
  //   } catch (error) {
  //     AlertDialogMethods.showError(
  //       context: context,
  //       subtitle: "An error has been occured $error",
  //       titleBottom: "Ok",
  //       lottileAnimation: MangerImage.kError,
  //       function: () {
  //         Navigator.of(context).pop();
  //       },
  //     );
  //   } finally {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   fetchUserInfo();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                user == null ? const SizedBox.shrink() : const GeneralList(),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: Colors.red.shade100,
                  ),
                  child: CustomListTile(
                    iconLeading:
                        user == null ? IconlyBold.login : IconlyBold.logout,
                    iconTrailing: IconlyLight.arrow_right_2,
                    title: user == null ? "Login" : 'Logout',
                    function: () async {
                      if (user == null) {
                        await Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginView.kLogin, (route) => false);
                      } else {
                        await AlertDialogMethods.showDialogWaring(
                          context: context,
                          titleBottom: user == null ? "Login" : 'Logout',
                          lottileAnimation: MangerImage.kLogout,
                          function: () async {
                            await FirebaseAuth.instance.signOut();
                            if (!mounted) return;
                            await Navigator.of(context).pushNamedAndRemoveUntil(
                                LoginView.kLogin, (route) => false);
                          },
                          isError: false,
                        );
                      }
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
