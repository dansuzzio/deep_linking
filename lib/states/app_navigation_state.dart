import 'package:flutter/material.dart';

import '../entities/app_route.dart';

abstract interface class AppNavigationState {
  // GlobalKey<State> get key;
  bool get isLoggedIn;
  AppRoute get currentRoute;
  void setRoute(AppRoute route, [BuildContext? context]);
  AppRoute getRouteForPath(String path);
}
