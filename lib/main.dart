import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_shope/core/api/firebase_api.dart';
import 'package:new_shope/core/utils/theme_data.dart';
import 'package:new_shope/features/all_order/presentation/view/all_order_view.dart';
import 'package:new_shope/features/all_order/presentation/view_model/provider/order_provider.dart';
import 'package:new_shope/features/cart/presentation/manger/provider/cart_provider.dart';
import 'package:new_shope/features/cart/presentation/view/cart_view.dart';
import 'package:new_shope/features/details/presentation/view/details_view.dart';
import 'package:new_shope/features/forgot_password/presentation/view/forgot_password_view.dart';
import 'package:new_shope/features/home/presentation/view/home_view.dart';
import 'package:new_shope/features/home/presentation/view_model/provider/category_provider.dart';
import 'package:new_shope/features/profile/presentation/view/profile_view.dart';
import 'package:new_shope/features/search/presentation/manger/provider/product_provider.dart';
import 'package:new_shope/features/search/presentation/view/search_view.dart';
import 'package:new_shope/features/sign_up/presentation/view/signup_view.dart';
import 'package:new_shope/features/signIn/presentation/view/login_in_view.dart';
import 'package:new_shope/features/sub_category/view/view_sub_category.dart';
import 'package:new_shope/features/wishlist/presentation/view/wishlist_view.dart';
import 'package:new_shope/features/wishlist/presentation/view_model/provider/wishlist_provider.dart';
import 'package:new_shope/firebase_options.dart';
// import 'package:new_shope/firebase_options.dart';
import 'package:new_shope/root_view.dart';
import 'package:provider/provider.dart';

import 'features/sign_up/presentation/view_model/provider/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown,
  ]);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '========================================User is currently signed out!');
      } else {
        print('========================================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
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
              initialRoute: (FirebaseAuth.instance.currentUser != null &&
                      FirebaseAuth.instance.currentUser!.emailVerified)
                  ? RootView.kRoot
                  : LoginView.kLogin,
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
                    const ForgotPasswordView(),
                AllOrderView.kAllOrder: (context) => const AllOrderView(),
                SubCategoryView.routeName: (context) => const SubCategoryView(),
              },
              debugShowCheckedModeBanner: false,
              // routerConfig: AppRouter.router,
              theme: Styles.themeData(context: context),
            ),
          );
        },
      ),
    );
  }
}
