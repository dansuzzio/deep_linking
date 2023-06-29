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

  String? _path = Routes.home().path;

  @override
  List<String> get pathSegments => Uri.parse(_path ?? '').pathSegments;

  @override
  void goTo(AppRoute route, {List<String>? segments}) {
    _currentRoute = route;
    notifyListeners();
  }

  @override
  AppRoute getRouteForPath(String? path) {
    _path = path;
    var route = Routes.notFound();
    if (!authState.isLoggedIn) route = Routes.login();
    if (_path == '/' || _path == Routes.home().path) route = Routes.home();
    if (_path == Routes.settings().path) route = Routes.home(showSettings: true);
    _currentRoute = route;
    return route;
  }

  @override
  AppRoute? get savedRoute => throw UnimplementedError();
}
