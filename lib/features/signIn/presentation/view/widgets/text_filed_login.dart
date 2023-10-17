import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/constant/my_validators.dart';

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
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14.0.r),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
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
                onFieldSubmitted: (value) {
                  _loginFun();
                },
                validator: (value) {
                  return MyValidators.passwordValidator(value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
