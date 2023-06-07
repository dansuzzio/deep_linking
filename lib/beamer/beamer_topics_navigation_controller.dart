import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/topics_routes.dart';
import '../shared/states/app_navigation_state.dart';

class BeamerTopicsNavigationController implements AppNavigationState {
  final key = GlobalKey<BeamerState>();

  BuildContext? get _context => key.currentContext;

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
    return TopicsRoutes.values.firstWhere(
      (route) => route.path == path,
      orElse: () => TopicsRoutes.notFound,
    );
  }
}
