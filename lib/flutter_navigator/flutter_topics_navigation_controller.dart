import 'package:flutter/material.dart';

import '../shared/entities/app_route.dart';
import '../shared/models/top_routes.dart';
import '../shared/models/topics_routes.dart';
import '../shared/states/app_navigation_state.dart';

class FlutterTopicsNavigationController with ChangeNotifier implements AppNavigationState {
  final key = GlobalKey<NavigatorState>(debugLabel: 'topics');

  AppRoute _currentRoute = TopicsRoutes.topics;
  @override
  AppRoute get currentRoute => _currentRoute;

  @override
  void goTo(AppRoute route) {
    _currentRoute = route;
    notifyListeners();
  }

  @override
  AppRoute getRouteForPath(String? path) {
    return TopRoutes.values.firstWhere(
      (route) => route.path == path,
      orElse: () => TopRoutes.notFound,
    );
  }

  List<Page> get routePages {
    return [
      MaterialPage(
        key: ValueKey(currentRoute.path),
        name: currentRoute.path,
        child: currentRoute.builder,
      )
    ];
  }
}
