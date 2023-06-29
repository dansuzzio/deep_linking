import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/top_routes.dart';
import '../shared/states/app_navigation_state.dart';

class BeamerTopicsNavigationController implements AppNavigationState {
  final key = GlobalKey<BeamerState>();

  BuildContext? get _context => key.currentContext;

  String? get _path => _context?.currentBeamLocation.state.routeInformation.location;

  @override
  AppRoute get currentRoute => getRouteForPath(_path);

  @override
  List<String> get pathSegments => Uri.parse(_path ?? '').pathSegments;

  void onLocationChanged() {
    if (_context == null) return;
    if (_path == Routes.topics().path) return;
    if (pathSegments.length == 2) {
      savedRoute = Routes.articles(topic: pathSegments[1]);
      return;
    }
    savedRoute = null;
  }

  @override
  AppRoute? savedRoute;

  @override
  void goTo(AppRoute route, {List<String>? segments}) {
    if (_context case final context?) return context.beamToNamed(route.path);
    throw Exception('No context');
  }

  @override
  AppRoute getRouteForPath(String? path) {
    if (pathSegments.length == 2) return Routes.articles();
    if (path == Routes.topics().path) return Routes.topics();
    return Routes.notFound();
  }
}
