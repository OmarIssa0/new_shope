import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ionicons/ionicons.dart';
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
          final authResults = await FirebaseAuth.instance
              .signInWithCredential(GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          ));
          // WidgetsBinding.instance.addPersistentFrameCallback((_) async {
          if (!mounted) return;
          Navigator.pushReplacementNamed(context, RootView.kRoot);
          // });
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
          child: const Icon(
            Ionicons.logo_google,
            color: Colors.red,
            size: 40,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        const Icon(
          Ionicons.logo_facebook,
          color: Colors.blue,
          size: 40,
        ),
        // Icon(
        //   Ionicons.logo_apple,
        //   color: Colors.black,
        //   size: 40,
        // ),
      ],
    );
  }
}
