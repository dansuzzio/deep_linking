import 'package:flutter/material.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/top_routes.dart';
import '../shared/states/app_navigation_state.dart';

class FlutterTopicsNavigationController with ChangeNotifier implements AppNavigationState {
  final key = GlobalKey<NavigatorState>(debugLabel: 'topics');

  AppRoute _currentRoute = Routes.topics();
  @override
  AppRoute get currentRoute => _currentRoute;

  String? get _path => currentRoute.path;

  @override
  List<String> get pathSegments => Uri.parse(_path ?? '').pathSegments;

  @override
  void goTo(AppRoute route, {List<String>? segments}) {
    _currentRoute = route;
    notifyListeners();
  }

  // @override
  // AppRoute getRouteForPath(String? path) {
  //   var route = Routes.notFound();
  //   if (pathSegments.length == 2) route = Routes.articles(topic: pathSegments[1]);
  //   if (path == Routes.topics().path) route = Routes.topics();
  //   _currentRoute = route;
  //   return route;
  // }
  @override
  AppRoute getRouteForPath(String? path) => throw UnimplementedError();

  List<Page> get routePages {
    final pages = [
      MaterialPage(
        key: ValueKey(currentRoute.path),
        name: currentRoute.path,
        child: currentRoute.builder,
      )
    ];
    if (pathSegments.length == 2) {
      pages.insert(
        0,
        MaterialPage(
          key: ValueKey(Routes.topics().path),
          name: Routes.topics().path,
          child: Routes.topics().builder,
        ),
      );
    }
    return pages;
  }

  @override
  AppRoute? get savedRoute => throw UnimplementedError();
}
