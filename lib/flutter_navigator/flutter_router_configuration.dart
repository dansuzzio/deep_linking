import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../shared/entities/app_route.dart';
import '../shared/states/app_navigation_state.dart';

class FlutterRouterDelegate extends RouterDelegate<AppRoute> with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppNavigationState state;

  FlutterRouterDelegate({required this.state}) : navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppRoute get currentConfiguration {
    return state.currentRoute;
  }

  List<Page> get _routePages {
    return [
      MaterialPage(
        key: ValueKey(currentConfiguration.path),
        name: currentConfiguration.path,
        child: currentConfiguration.builder,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) => route.didPop(result),
      pages: _routePages,
      reportsRouteUpdateToEngine: true,
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    state.goTo(configuration);
    SynchronousFuture(null);
  }
}

class FlutterRouteInformationParser extends RouteInformationParser<AppRoute> {
  final AppNavigationState state;

  FlutterRouteInformationParser({required this.state});

  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) async {
    return state.getRouteForPath(routeInformation.location ?? '');
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoute configuration) {
    return RouteInformation(location: configuration.path);
  }
}
