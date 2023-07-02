import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/routes.dart';
import '../shared/states/app_navigation_state.dart';

class GoRouterAppNavigationController implements AppNavigationState {
  final key = GlobalKey<NavigatorState>(debugLabel: 'app');

  BuildContext? get _context => key.currentContext;

  String? get _path => _context != null ? GoRouter.of(_context!).location : null;

  @override
  AppRoute get currentRoute => getRouteForPath(_path);

  @override
  List<String> get pathSegments => Uri.parse(_path ?? '').pathSegments;

  @override
  AppRoute? savedRoute;

  @override
  void goTo(AppRoute route, {List<String>? segments}) {
    if (_context case final context?) return context.go(route.path);
    throw Exception('No context');
  }

  @override
  AppRoute getRouteForPath(String? path) {
    if (path == Routes.login().path) return Routes.login();
    if (path == Routes.settings().path) return Routes.home(showSettings: true);
    if (path == Routes.home().path) return Routes.home();
    return Routes.notFound();
  }
}
