import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/routes.dart';
import '../shared/states/app_navigation_state.dart';

class BeamerAppNavigationController implements AppNavigationState {
  final observer = NavigatorObserver();

  BuildContext? get _context => observer.navigator?.context;

  String? get _path => _context?.currentBeamLocation.state.routeInformation.location;

  @override
  AppRoute get currentRoute => getRouteForPath(_path);

  @override
  List<String> get pathSegments => Uri.parse(_path ?? '').pathSegments;

  @override
  void goTo(AppRoute route, {List<String>? segments}) {
    if (_context case final context?) return context.beamToNamed(route.path);
    throw Exception('No context');
  }

  @override
  AppRoute getRouteForPath(String? path) {
    if (path == Routes.settings().path) return Routes.home(showSettings: true);
    if (path == Routes.home().path) return Routes.home();
    return Routes.notFound();
  }

  @override
  AppRoute? get savedRoute => throw UnimplementedError();
}
