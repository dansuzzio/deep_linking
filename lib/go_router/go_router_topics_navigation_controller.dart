import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/top_routes.dart';
import '../shared/states/app_navigation_state.dart';

class GoRouterTopicsNavigationController implements AppNavigationState {
  final key = GlobalKey<NavigatorState>(debugLabel: 'topics');

  BuildContext? get context => key.currentContext;

  String? get _path => context != null ? GoRouter.of(context!).location : null;

  @override
  AppRoute get currentRoute => getRouteForPath(_path);

  @override
  List<String> get pathSegments => Uri.parse(_path ?? '').pathSegments;

  bool _hasListenerBeenAdded = false;

  void listenForLocationChanges() {
    if (_hasListenerBeenAdded) return;
    GoRouter.of(context!).addListener(onLocationChanged);
    _hasListenerBeenAdded = true;
  }

  void onLocationChanged() {
    if (context == null) return;
    if (_path == Routes.settings().path) return;
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
    if (context case final context?) return context.go(route.path);
    throw Exception('No context');
  }

  @override
  AppRoute getRouteForPath(String? path) {
    if (pathSegments.length == 2) return Routes.articles();
    if (path == Routes.topics().path) return Routes.topics();
    return Routes.notFound();
  }
}
