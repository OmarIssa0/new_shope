import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/core/utils/app_image.dart';
import 'package:new_shope/core/utils/widgets/alert_dialog.dart';
import 'package:new_shope/features/signIn/presentation/view/login_in_view.dart';
import 'package:new_shope/loading_manger.dart';

import '../../../../../core/constant/my_validators.dart';
import '../../../../signIn/presentation/view/widgets/bottom_signIn_and_signup.dart';

class TextFiledSignUp extends StatefulWidget {
  const TextFiledSignUp({super.key});

  @override
  State<TextFiledSignUp> createState() => _TextFiledSignUpState();
}

class _TextFiledSignUpState extends State<TextFiledSignUp> {
  // controller
  late TextEditingController _nameTextController,
      _emailTextController,
      _passwordTextController,
      _repeatPasswordTextController;
  // focus node
  late final FocusNode _nameFocusNode,
      _emailFocusNode,
      _passwordFocusNode,
      _repeatPasswordFocusNode;
  // key Form
  late final _formKey = GlobalKey<FormState>();
  // show icon Password
  bool obscureText = true;
  // loading in signUp
  bool _isLoading = false;
  // auth firebase
  final authFirebase = FirebaseAuth.instance;

  @override
  void initState() {
    // controller
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _repeatPasswordTextController = TextEditingController();
    // focus Node
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _repeatPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // controller
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _repeatPasswordTextController.dispose();
    // focus Node
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _repeatPasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _signUpFct() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      // Navigator.of(context).push(AnimationNav.createRouteHomeView());
      try {
        setState(() {
          _isLoading = true;
        });

        // ignore: unused_local_variable
        final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailTextController.text.trim(),
          password: _passwordTextController.text.trim(),
        );
        User? user = authFirebase.currentUser;
        final uid = user!.uid;
        await FirebaseFirestore.instance.collection("users").doc(uid).set({
          "userId": uid,
          "userName": _nameTextController.text,
          "userImage": "",
          "userEmail": _emailTextController.text.toLowerCase(),
          "createdAt": Timestamp.now(),
          "userWishlist": [],
          "userCart": [],
        });
        Fluttertoast.showToast(
          msg: "An account has been created",
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
        );
        // if (!mounted) return;
        // AlertDialogMethods.showDialogForgotPassword(
        //   context: context,
        //   subtitle: 'Please confirm your email! Check your email!',
        //   // isError: false,
        //   titleBottom: 'Cancel',
        //   lottileAnimation: MangerImage.kSendEmail,
        //   function: () {
        //     Navigator.of(context).pop();
        //   },
        // );
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        if (!mounted) return;
        await Navigator.of(context).pushNamed(LoginView.kLogin);
        // await Navigator.of(context).pushReplacement("/kLogin");
      } on FirebaseAuthException catch (error) {
        if (error.code == "weak-password") {
          AlertDialogMethods.showError(
            context: context,
            subtitle: "The password provided is too weak.",
            titleBottom: "Ok",
            lottileAnimation: MangerImage.kError,
            function: () {
              Navigator.of(context).pop();
            },
          );
        } else if (error.code == "email-already-in-use") {
          AlertDialogMethods.showError(
            context: context,
            subtitle: "The account already exists for that email.",
            titleBottom: "Ok",
            lottileAnimation: MangerImage.kError,
            function: () {
              Navigator.of(context).pop();
            },
          );
        }
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _formKey,
        child: LoadingMangerView(
          isLoading: _isLoading,
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
              ),
              TextFormField(
                focusNode: _nameFocusNode,
                controller: _nameTextController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  prefixIcon: Icon(
                    IconlyLight.profile,
                    color: Colors.grey.shade700,
                  ),
                ),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_emailFocusNode);
                },
                validator: (value) {
                  return MyValidators.displayNameValidator(value);
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                controller: _emailTextController,
                focusNode: _emailFocusNode,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  prefixIcon: Icon(
                    IconlyLight.message,
                    color: Colors.grey.shade700,
                  ),
                ),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_passwordFocusNode);
                },
                validator: (value) {
                  return MyValidators.emailValidator(value);
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                obscureText: obscureText,
                controller: _passwordTextController,
                focusNode: _passwordFocusNode,
                textInputAction: TextInputAction.next,
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
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_repeatPasswordFocusNode);
                  _signUpFct();
                },
                validator: (value) {
                  return MyValidators.passwordValidator(value);
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFormField(
                obscureText: obscureText,
                controller: _repeatPasswordTextController,
                focusNode: _repeatPasswordFocusNode,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Reset Password',
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
                onFieldSubmitted: (value) {
                  _signUpFct();
                },
                validator: (value) {
                  return MyValidators.repeatPasswordValidator(
                      value: value, password: _passwordTextController.text);
                },
              ),
              SizedBox(
                height: 44.h,
              ),
              BottomSignInAndSignUp(
                function: () {
                  _signUpFct();
                },
                name: 'Sign Up',
              )
            ],
          ),
        ),
      ),
    );
  }
}
