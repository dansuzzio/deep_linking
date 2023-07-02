import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../shared/models/routes.dart';
import '../shared/repositories/topics_repository.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';
import 'go_router_app_navigation_controller.dart';
import 'go_router_topics_navigation_builder.dart';

final goRouterConfiguration = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: (GetIt.I.get<AppNavigationState>(instanceName: 'app') as GoRouterAppNavigationController).key,
  redirect: (context, state) async {
    // If route is login, continues
    if (state.location == Routes.login().path) return null;

    // If user is not logged in, shows login page
    final authState = GetIt.I.get<AuthState>();
    await authState.fetchAuthState();
    if (!authState.isLoggedIn) return Routes.login().path;

    // If route is unknown, shows not found page
    var doesRouteExist = true;
    final segments = Uri.parse(state.location).pathSegments;
    if (segments.length == 2) doesRouteExist = TopicsRepository.topics.contains(segments.last);
    if (!doesRouteExist) return '/unknown';

    // Continues to specified route
    return null;
  },
  initialLocation: Routes.home().path,
  routes: [
    GoRoute(
      path: Routes.login().path,
      builder: (context, state) => Routes.login().builder,
    ),
    goRouterTopicsNavigationBuilder,
  ],
);
