import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_shope/core/utils/widgets/title_text.dart';
import 'package:new_shope/root_view.dart';

import '../../../../../core/utils/app_image.dart';
import '../../../../../core/utils/widgets/alert_dialog.dart';

class GoogleSignInBottom extends StatefulWidget {
  const GoogleSignInBottom({super.key});

  @override
  State<GoogleSignInBottom> createState() => _GoogleSignInBottomState();
}

class _GoogleSignInBottomState extends State<GoogleSignInBottom> {
  Future<void> _googleSignIn({required BuildContext context}) async {
    final googleSign = GoogleSignIn();
    final googleAccount = await googleSign.signIn();

    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          // ignore: unused_local_variable
          final authResults = await FirebaseAuth.instance
              .signInWithCredential(GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          ));
          // if (authResults.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance
              .collection("users")
              .doc(authResults.user!.uid)
              .set({
            "userId": authResults.user!.uid,
            "userName": authResults.user!.displayName,
            "userImage": authResults.user!.photoURL,
            "userEmail": authResults.user!.email,
            "createdAt": Timestamp.now(),
            "userWishlist": [],
            "userCart": [],
          });
          // }

          if (!mounted) return;
          Navigator.pushReplacementNamed(context, RootView.kRoot);
        } on FirebaseException catch (error) {
          WidgetsBinding.instance.addPersistentFrameCallback((_) async {
            await AlertDialogMethods.showError(
              context: context,
              subtitle: "An error has been occured ${error.message}",
              titleBottom: "Ok",
              lottileAnimation: MangerImage.kError,
              function: () {
                Navigator.of(context).pop();
              },
            );
          });
        } catch (error) {
          WidgetsBinding.instance.addPersistentFrameCallback((_) async {
            await AlertDialogMethods.showError(
              context: context,
              subtitle: "An error has been occured $error",
              titleBottom: "Ok",
              lottileAnimation: MangerImage.kError,
              function: () {
                Navigator.of(context).pop();
              },
            );
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await _googleSignIn(context: context);
          },
          child: Container(
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.grey.shade100,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // const Icon(
                  //   Ionicons.logo_google,
                  //   color: Colors.red,
                  //   size: 40,
                  // ),
                  SvgPicture.asset("assets/image_svg/Google.svg"),
                  SizedBox(
                    width: 7.w,
                  ),
                  TitleTextAppCustom(
                    label: "Sign in with google",
                    fontSize: 12.sp,
                    color: Colors.grey.shade900,
                  ),
                ],
              ),
            ),
          ),
        ),

        // SizedBox(
        //   width: 20.w,
        // ),
        // // GestureDetector(
        // //   onTap: () {},
        //   child: const Icon(
        //     Ionicons.logo_facebook,
        //     color: Colors.blue,
        //     size: 40,
        //   ),
        // ),
        // Icon(
        //   Ionicons.logo_apple,
        //   color: Colors.black,
        //   size: 40,
        // ),
      ],
    );
  }
}
