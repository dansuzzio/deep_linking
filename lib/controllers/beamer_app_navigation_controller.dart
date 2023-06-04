import 'package:beamer/beamer.dart';
import 'package:deep_linking/entities/app_route.dart';
import 'package:flutter/material.dart';

import '../states/app_navigation_state.dart';

class BeamerAppNavigationController implements AppNavigationState {
  final beamerKey = GlobalKey<BeamerState>();

  BuildContext? get context => beamerKey.currentContext;

  @override
  AppRoute get currentRoute => throw UnimplementedError();

  @override
  AppRoute getRouteForPath(String path) {
    throw UnimplementedError();
  }

  @override
  bool get isLoggedIn => throw UnimplementedError();

  @override
  void setRoute(AppRoute route, [BuildContext? context]) {
    context?.beamToNamed(route.path);
  }
}
