import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/loading_manger.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_image.dart';
import '../../../../../core/utils/widgets/alert_dialog.dart';
import '../../../../sign_up/presentation/view_model/model/user_model.dart';
import '../../../../sign_up/presentation/view_model/provider/user_provider.dart';

class TopProfileView extends StatefulWidget {
  const TopProfileView({super.key});

  @override
  State<TopProfileView> createState() => _TopProfileViewState();
}

class _TopProfileViewState extends State<TopProfileView> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;

  bool _isLoading = true;

  Future<void> fetchUserInfo() async {
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
    }
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      userModel = await userProvider.fatchUserInfo();
    } catch (error) {
      AlertDialogMethods.showError(
        context: context,
        subtitle: "An error has been occured $error",
        titleBottom: "Ok",
        lottileAnimation: MangerImage.kError,
        function: () {
          Navigator.of(context).pop();
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadingMangerView(
      isLoading: _isLoading,
      child: Column(
        children: [
          Visibility(
            visible: user == null ? true : false,
            child: Padding(
              padding: EdgeInsets.all(24.0.r),
              child: TitleTextAppCustom(
                label: 'Please login to have ultimate access',
                fontSize: 18.sp,
              ),
            ),
          ),
          Visibility(
            visible: user == null ? false : true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   height: 60.h,
                  //   width: 60.w,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     // color: Colors.grey.shade500,
                  //     border: Border.all(
                  //       width: 3,
                  //       color: Colors.grey.shade500,
                  //     ),
                  //     // image: const DecorationImage(
                  //     //   image: NetworkImage(
                  //     //     'http://www.shadowsphotography.co/wp-content/uploads/2017/12/photography-01-800x400.jpg',
                  //     //   ),
                  //     //   fit: BoxFit.fill,
                  //     // ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitleTextAppCustom(
                          label: userModel?.userName ?? '',
                          fontSize: 20.sp,
                        ),
                        TitleTextAppCustom(
                          label: userModel?.userEmail ?? '',
                          fontSize: 15.sp,
                          // fontWeight: FontWeight.w100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
