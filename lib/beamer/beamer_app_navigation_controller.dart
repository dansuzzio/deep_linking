import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/top_routes.dart';
import '../shared/states/app_navigation_state.dart';

class BeamerAppNavigationController implements AppNavigationState {
  final observer = NavigatorObserver();

  BuildContext? get _context => observer.navigator?.context;

  @override
  AppRoute get currentRoute {
    final path = _context?.currentBeamLocation.state.routeInformation.location;
    return getRouteForPath(path);
  }

  @override
  void goTo(AppRoute route) {
    if (_context case final context?) return context.beamToNamed(route.path);
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
