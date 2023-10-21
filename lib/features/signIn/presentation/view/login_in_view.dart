import 'package:flutter/material.dart';
import 'package:new_shope/features/signIn/presentation/view/widgets/login_in_view_body.dart';

class LoginView extends StatelessWidget {
  static String kLogin = '/kLogin';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginInViewBody(),
    );
  }
}
