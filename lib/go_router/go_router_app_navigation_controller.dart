import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/top_routes.dart';
import '../shared/states/app_navigation_state.dart';

class GoRouterAppNavigationController implements AppNavigationState {
  final key = GlobalKey<NavigatorState>();

  BuildContext? get _context => key.currentContext;

  @override
  AppRoute get currentRoute {
    String? path;
    if (_context case final context?) path = GoRouter.of(context).location;
    return getRouteForPath(path);
  }

  @override
  void goTo(AppRoute route) {
    if (_context case final context?) return context.go(route.path);
    throw Exception('No context');
  }

  @override
  AppRoute getRouteForPath(String? path) {
    return TopRoutes.values.firstWhere(
      (route) => route.path == path,
      orElse: () => TopRoutes.notFound,
    );
  }
}
