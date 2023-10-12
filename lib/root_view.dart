import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconly/iconly.dart';
import 'package:new_shope/features/cart/presentation/view/cart_view.dart';
import 'package:new_shope/features/home/presentation/view/home_view.dart';
import 'package:new_shope/features/profile/presentation/view/profile_view.dart';
import 'package:new_shope/features/search/presentation/view/search_view.dart';

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  late PageController controller;
  int currentScreen = 0;
  List<Widget> screen = [
    const HomeView(),
    const SearchView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(
      initialPage: currentScreen,
    );
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
          padding: EdgeInsets.all(25.0.r),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: GNav(
              selectedIndex: currentScreen,
              iconSize: 24.w,
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
