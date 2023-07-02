import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/routes.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';
import 'flutter_topics_navigation_controller.dart';

class FlutterAppNavigationController with ChangeNotifier implements AppNavigationState {
  final AuthState authState;

  FlutterAppNavigationController({required this.authState});

  AppRoute _currentRoute = Routes.splash();
  @override
  AppRoute get currentRoute => _currentRoute;

  String? _path = Routes.splash().path;

  @override
  List<String> get pathSegments => Uri.parse(_path ?? '').pathSegments;

  @override
  void goTo(AppRoute route, {List<String>? segments}) {
    // Resets topics route when loggin out
    if (route.path == Routes.login().path && GetIt.I.isRegistered<AppNavigationState>(instanceName: 'topics')) {
      final topicsNavigation = GetIt.I.get<AppNavigationState>(instanceName: 'topics') as FlutterTopicsNavigationController;
      topicsNavigation.currentRoute = Routes.topics();
    }

    // Updates current route
    _currentRoute = route;
    notifyListeners();
  }

  @override
  AppRoute getRouteForPath(String? path) {
    _path = path;
    var route = Routes.notFound();
    if (!authState.isLoggedIn) {
      route = Routes.login();
    } else if (_path == Routes.home(showSettings: true).path) {
      route = Routes.home(showSettings: true);
    } else if ([Routes.splash().path, Routes.home().path, Routes.login().path].contains(_path)) {
      route = Routes.home();
    }
    return _currentRoute = route;
  }

  @override
  AppRoute? get savedRoute => throw UnimplementedError();
}
