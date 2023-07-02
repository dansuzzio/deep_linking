import 'package:flutter/material.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/routes.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';

class FlutterAppNavigationController with ChangeNotifier implements AppNavigationState {
  final AuthState authState;

  FlutterAppNavigationController({required this.authState});

  AppRoute _currentRoute = Routes.splash();
  @override
  AppRoute get currentRoute => _currentRoute;

  String? _path = Routes.splash().path;

  @override
  List<String> get pathSegments => Uri.parse(_path ?? '').pathSegments;
  // @override
  // List<String> get pathSegments => throw UnimplementedError();

  @override
  void goTo(AppRoute route, {List<String>? segments}) {
    _currentRoute = route;
    notifyListeners();
  }

  @override
  AppRoute getRouteForPath(String? path) {
    _path = path;
    var route = Routes.notFound();
    print('path: $_path');
    if (!authState.isLoggedIn) {
      route = Routes.login();
    } else if (_path == Routes.splash().path) {
      route = Routes.splash();
    } else if (_path == Routes.home().path) {
      route = Routes.home();
    } else if (_path == Routes.home(showSettings: true).path) {
      route = Routes.home(showSettings: true);
    }
    return _currentRoute = route;
  }
  // @override
  // AppRoute getRouteForPath(String? path) => throw UnimplementedError();

  @override
  AppRoute? get savedRoute => throw UnimplementedError();
}
