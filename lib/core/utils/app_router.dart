import 'package:go_router/go_router.dart';
import 'package:new_shope/features/root_view/presentation/view/root_view.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RootView(),
      )
    ],
  );
}
