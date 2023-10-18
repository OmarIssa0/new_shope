import 'package:flutter/cupertino.dart';
import 'package:new_shope/features/sgin_up/presentation/view/signup_view.dart';
import 'package:new_shope/root_view.dart';

class AnimationNav {
  // static Route createRouteSigIn() {
  //   return PageRouteBuilder(
  //     transitionDuration: const Duration(seconds: 1),
  //     reverseTransitionDuration: const Duration(seconds: 1),
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         const LoginView(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(5.0, 0.0);
  //       const end = Offset.zero;
  //       const curve = Curves.ease;

  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: const LoginView(),
  //       );
  //     },
  //   );
  // }

  static Route createRouteSignUp() {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) =>
          const SignUpView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(5.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        // Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          textDirection: TextDirection.rtl,
          position: animation.drive(tween),
          // position: animation.drive(tween),
          child: const SignUpView(),
        );
      },
    );
  }

  static Route createRouteHomeView() {
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(seconds: 1),
      pageBuilder: (context, animation, secondaryAnimation) => const RootView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(5.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        // Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          textDirection: TextDirection.rtl,
          position: animation.drive(tween),
          // position: animation.drive(tween),
          child: const RootView(),
        );
      },
    );
  }
}
