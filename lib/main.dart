import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/utils/theme_data.dart';
import 'package:new_shope/features/cart/presentation/manger/provider/cart_provider.dart';
import 'package:new_shope/features/cart/presentation/view/cart_view.dart';
import 'package:new_shope/features/details/presentation/view/details_view.dart';
import 'package:new_shope/features/forgot_password/presentation/view/forgot_password_view.dart';
import 'package:new_shope/features/home/presentation/view/home_view.dart';
import 'package:new_shope/features/profile/presentation/view/profile_view.dart';
import 'package:new_shope/features/search/presentation/manger/provider/product_provider.dart';
import 'package:new_shope/features/search/presentation/view/search_view.dart';
import 'package:new_shope/features/sign_up/presentation/view/signup_view.dart';
import 'package:new_shope/features/signIn/presentation/view/login_in_view.dart';
import 'package:new_shope/features/wishlist/presentation/view/wishlist_view.dart';
import 'package:new_shope/features/wishlist/presentation/view_model/provider/wishlist_provider.dart';
import 'package:new_shope/root_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          // اذا بعمل تحميل
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            Scaffold(
              body: Center(
                  child: SelectableText(
                      "An error has been occured ${snapshot.error}")),
            );
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                  child: SelectableText(
                      "An error has been occured ${snapshot.error}")),
            );
          }
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => ProductProvider(),
              ),
              ChangeNotifierProvider(
                create: (context) => CartProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => WishlistProvider(),
              ),
            ],
            child: ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return AnnotatedRegion<SystemUiOverlayStyle>(
                  value: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                  ),
                  // child: MaterialApp.router(
                  child: MaterialApp(
                    initialRoute: LoginView.kLogin,
                    routes: {
                      LoginView.kLogin: (context) => const LoginView(),
                      RootView.kRoot: (context) => const RootView(),
                      HomeView.kHome: (context) => const HomeView(),
                      SearchView.kSearch: (context) => const SearchView(),
                      CartView.kCart: (context) => const CartView(),
                      ProfileView.kProfile: (context) => const ProfileView(),
                      DetailsView.kDetails: (context) => const DetailsView(),
                      WishlistView.kWishlist: (context) => const WishlistView(),
                      SignUpView.kSignUp: (context) => const SignUpView(),
                      ForgotPasswordView.kForgotPassword: (context) =>
                          const ForgotPasswordView()
                    },
                    debugShowCheckedModeBanner: false,
                    // routerConfig: AppRouter.router,
                    theme: Styles.themeData(context: context),
                  ),
                );
              },
            ),
          );
        });
  }
}
