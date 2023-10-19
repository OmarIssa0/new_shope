import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/constant/my_validators.dart';
import '../../../../../core/utils/animation_nav.dart';
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
      Navigator.of(context).push(AnimationNav.createRouteHomeView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: _formKey,
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
    );
  }
}
