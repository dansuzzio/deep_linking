import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../entities/app_route.dart';
import '../states/app_navigation_state.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute> with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppNavigationState state;

  AppRouterDelegate({required this.state}) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppRoute get currentConfiguration {
    return state.currentRoute;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) => route.didPop(result),
      pages: state.currentRoute.pages,
      reportsRouteUpdateToEngine: true,
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    state.setRoute(configuration);
    SynchronousFuture(null);
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {
  final AppNavigationState state;

  AppRouteInformationParser({required this.state});

  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) async {
    return state.getRouteForPath(routeInformation.location ?? '');
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoute configuration) {
    return RouteInformation(location: configuration.path);
  }
}
