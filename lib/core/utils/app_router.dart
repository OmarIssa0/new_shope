import 'package:go_router/go_router.dart';
import 'package:new_shope/features/cart/presentation/view/cart_view.dart';
import 'package:new_shope/features/home/presentation/view/home_view.dart';
import 'package:new_shope/features/profile/presentation/view/profile_view.dart';
import 'package:new_shope/features/search/presentation/view/search_view.dart';
import 'package:new_shope/root_view.dart';

class AppRouter {
  static const kRoot = '/kRootView';
  static const kHome = '/kHomeView';
  static const kSearch = '/kSearchView';
  static const kCart = '/kCartView';
  static const kProfile = '/kProfileView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RootView(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kCart,
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        path: kProfile,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}
