import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/app_image.dart';
import 'package:new_shope/core/utils/widgets/alert_dialog.dart';

import '../../../../../core/constant/my_validators.dart';
import '../../../../../core/utils/widgets/title_text.dart';

class TextFiledForgotPasswordAndBottom extends StatefulWidget {
  const TextFiledForgotPasswordAndBottom({super.key});

  @override
  State<TextFiledForgotPasswordAndBottom> createState() =>
      _TextFiledForgotPasswordAndBottomState();
}

class _TextFiledForgotPasswordAndBottomState
    extends State<TextFiledForgotPasswordAndBottom> {
  // controller
  late final TextEditingController _emailTextEditingController;
  // form key
  late final _formKey = GlobalKey<FormState>();

  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    _emailTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailTextEditingController.dispose();
    }
    super.dispose();
  }

  Future<void> _forgotPassword() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      // Navigator.of(context).push(AnimationNav.createRouteHomeView());
      try {
        FirebaseAuth.instance.setLanguageCode("ar");
        await auth.sendPasswordResetEmail(
          email: _emailTextEditingController.text.trim(),
        );
        if (!mounted) return;
        AlertDialogMethods.showDialogForgotPassword(
          context: context,
          subtitle: 'Password reset link sent! Check your email!',
          // isError: false,
          titleBottom: 'Cancel',
          lottileAnimation: MangerImage.kSendEmail,
          function: () {
            Navigator.of(context).pop();
          },
        );
        // Fluttertoast.showToast(
        //   msg: "An account has been created",
        //   toastLength: Toast.LENGTH_SHORT,
        //   textColor: Colors.white,
        // );
        // if (!mounted) return;
        // await Navigator.of(context)
        //     .pushNamedAndRemoveUntil(RootView.kRoot, (route) => false);
      } on FirebaseAuthException catch (error) {
        AlertDialogMethods.showError(
          context: context,
          subtitle: "${error.message}",
          titleBottom: "Ok",
          lottileAnimation: MangerImage.kError,
          function: () {
            Navigator.of(context).pop();
          },
        );
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
      }
      // AlertDialogMethods.showDialogForgotPassword(
      //   context: context,
      //   subtitle: 'Check the message box',
      //   // isError: false,
      //   titleBottom: 'Cancel',
      //   lottileAnimation: MangerImage.kSendEmail,
      //   function: () {
      //     Navigator.of(context).pop();
      //   },
      // );
      // Navigator.of(context).pop(AnimationNav.createRouteHomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailTextEditingController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'youremail@hmail.com',
              prefixIcon: Icon(
                IconlyLight.message,
              ),
            ),
            onFieldSubmitted: (value) {
              _forgotPassword();
            },
            validator: (value) {
              return MyValidators.emailValidator(value);
            },
          ),
          SizedBox(
            height: 45.h,
          ),
          SizedBox(
            width: 225.w,
            height: 50.h,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black38),
                  iconColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)))),
              onPressed: () {
                _forgotPassword();
              },
              icon: const Icon(IconlyBold.send),
              label: TitleTextAppCustom(
                label: 'send email',
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
