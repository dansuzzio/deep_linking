import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../shared/models/top_routes.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';
import 'go_router_app_navigation_controller.dart';

final goRouterConfiguration = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: (GetIt.I.get<AppNavigationState>() as GoRouterAppNavigationController).key,
  redirect: (context, state) async {
    // if ([TopRoutes.splash.path, TopRoutes.login.path].contains(state.location)) return null;
    if (state.location == TopRoutes.login.path) return null;
    final authState = GetIt.I.get<AuthState>();
    await authState.fetchAuthState();
    if (!authState.isLoggedIn) return TopRoutes.login.path;
    return null;
  },
  // initialLocation: TopRoutes.splash.path,
  initialLocation: TopRoutes.settings.path,
  routes: [
    // GoRoute(
    //   path: TopRoutes.splash.path,
    //   builder: (context, state) => TopRoutes.splash.builder,
    // ),
    GoRoute(
      path: TopRoutes.login.path,
      builder: (context, state) => TopRoutes.login.builder,
    ),
    GoRoute(
      path: TopRoutes.settings.path,
      builder: (context, state) => TopRoutes.settings.builder,
    ),
  ],
);
