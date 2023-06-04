import 'package:flutter/material.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/top_routes.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';

class FlutterAppNavigationController with ChangeNotifier implements AppNavigationState {
  final AuthState authState;

  FlutterAppNavigationController({required this.authState});

  AppRoute _currentRoute = TopRoutes.splash;
  @override
  AppRoute get currentRoute => _currentRoute;

  @override
  void goTo(AppRoute route) {
    _currentRoute = route;
    notifyListeners();
  }

  @override
  AppRoute getRouteForPath(String? path) {
    // Returns login route when user is not logged in
    if (!authState.isLoggedIn) return TopRoutes.login;

    // Returns topics route when app is starting and user is logged in
    if (path == '/') return TopRoutes.topics;

    // Returns corresponding route, or not found if unknown
    return TopRoutes.values.firstWhere(
      (route) => route.path == path,
      orElse: () => TopRoutes.notFound,
    );
  }
}
