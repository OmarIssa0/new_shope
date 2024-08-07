import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/features/cart/presentation/manger/provider/cart_provider.dart';
import 'package:new_shope/features/cart/presentation/view/cart_view.dart';
import 'package:new_shope/features/home/presentation/view/home_view.dart';
import 'package:new_shope/features/home/presentation/view_model/provider/category_provider.dart';
import 'package:new_shope/features/profile/presentation/view/profile_view.dart';
import 'package:new_shope/features/search/presentation/manger/provider/product_provider.dart';
import 'package:new_shope/features/search/presentation/view/search_view.dart';
import 'package:new_shope/features/sign_up/presentation/view_model/provider/user_provider.dart';
import 'package:new_shope/features/wishlist/presentation/view_model/provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  static String kRoot = '/kRoot';

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late PageController controller;
  int currentScreen = 0;
  bool isLoading = true;
  List<Widget> screen = [
    const HomeView(),
    const SearchView(),
    // const CartView(),
    const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentScreen,
    );
  }

  Future<void> fetchFCT() async {
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final wishlistProvider =
        Provider.of<WishlistProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    try {
      Future.wait({
        categoryProvider.fetchCategory(),
        productsProvider.fetchProducts(),
        userProvider.fatchUserInfo(),
      });
      Future.wait({
        cartProvider.fetchCart(),
        wishlistProvider.fetchWishlist(),
      });
    } catch (error) {
      log(error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void didChangeDependencies() {
    if (isLoading) {
      fetchFCT();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.all(22.0.r),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: GNav(
              selectedIndex: currentScreen,
              iconSize: 24.spMin,
              onTabChange: (index) {
                setState(() {
                  currentScreen = index;
                });
                controller.jumpToPage(currentScreen);
              },
              activeColor: Colors.white,
              backgroundColor: const Color(0xff121212).withOpacity(.75),
              color: const Color(0xff888888).withOpacity(1),
              tabs: const [
                GButton(
                  icon: IconlyBold.home,
                ),
                GButton(
                  icon: IconlyBold.search,
                ),
                GButton(
                  icon: IconlyBold.bag_2,
                ),
                GButton(
                  icon: IconlyBold.profile,
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: screen,
      ),
    );
  }
}
