import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/bottom_signIn_and_signup.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/forgot_password_login_view.dart';
import 'package:new_shope/loading_manger.dart';

import '../../../../../core/constant/my_validators.dart';
import '../../../../../core/utils/app_image.dart';
import '../../../../../core/utils/widgets/alert_dialog.dart';
import '../../../../../root_view.dart';

class LoginTextFiled extends StatefulWidget {
  const LoginTextFiled({super.key});

  @override
  State<LoginTextFiled> createState() => _LoginTextFiledState();
}

class _LoginTextFiledState extends State<LoginTextFiled> {
  // controller
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  // focus node
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  // key Form
  late final _formKey = GlobalKey<FormState>();
  // show icon Password
  bool obscureText = true;
  // loading in signUp
  bool _isLoading = false;

  // auth firebase
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // controller
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    // focus Node
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // controller
    _emailTextController.dispose();
    _passwordTextController.dispose();
    // focus Node
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginFun() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      try {
        setState(() {
          _isLoading = true;
        });
        // const CircularProgressIndicator();
        await _auth.signInWithEmailAndPassword(
          email: _emailTextController.text.trim(),
          password: _emailTextController.text.trim(),
        );
        Fluttertoast.showToast(
          msg: "Login Successful",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
        );

        if (!mounted) return;

        await Navigator.of(context)
            .pushNamedAndRemoveUntil(RootView.kRoot, (route) => false);

        // Navigator.of(context)
        //     .pushAndRemoveUntil(AnimationNav.createRouteHomeView());
      } on FirebaseAuthException catch (error) {
        AlertDialogMethods.showError(
          context: context,
          subtitle: "An error has been occured ${error.message}",
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
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LoadingMangerView(
      isLoading: _isLoading,
      child: Padding(
        padding: EdgeInsets.all(14.0.r),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  focusNode: _emailFocusNode,
                  controller: _emailTextController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email Address',
                    prefixIcon: Icon(
                      IconlyLight.profile,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  validator: (value) {
                    return MyValidators.emailValidator(value);
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  focusNode: _passwordFocusNode,
                  obscureText: obscureText,
                  controller: _passwordTextController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(
                      IconlyLight.unlock,
                      color: Colors.grey.shade700,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: obscureText
                          ? const Icon(IconlyLight.show)
                          : const Icon(IconlyLight.hide),
                    ),
                  ),
                  validator: (value) {
                    return MyValidators.passwordValidator(value);
                  },
                  onFieldSubmitted: (value) {
                    _loginFun();
                  },
                ),
                // تم اضافتهم هنا بسبب ال validator
                SizedBox(
                  height: 10.h,
                ),
                const ForGotPasswordLoginView(),
                SizedBox(
                  height: 15.h,
                ),
                BottomSignInAndSignUp(
                  name: 'Sign in',
                  function: () {
                    _loginFun();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
