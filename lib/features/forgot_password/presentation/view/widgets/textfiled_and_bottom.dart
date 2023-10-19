import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/constant/my_validators.dart';
import '../../../../../core/utils/animation_nav.dart';
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
  @override
  void initState() {
    _emailTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    super.dispose();
  }

  Future<void> _forgotPassword() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      Navigator.of(context).push(AnimationNav.createRouteHomeView());
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