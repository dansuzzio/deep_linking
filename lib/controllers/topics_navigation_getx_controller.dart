import 'package:beamer/beamer.dart';
import 'package:deep_linking/entities/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/topics_routes.dart';
import '../states/app_navigation_state.dart';
import 'user_getx_controller.dart';

class TopicsNavigationGetxController extends GetxController implements AppNavigationState {
  final _userController = Get.find<UserGetxController>();
  @override
  bool get isLoggedIn => _userController.isLoggedIn;

  AppRoute _currentRoute = TopicsRoutes.topics();
  @override
  AppRoute get currentRoute => _currentRoute;
  @override
  void setRoute(AppRoute route, [BuildContext? context]) {
    _currentRoute = route;
    // update();
    beamerKey.currentContext?.beamToNamed(route.path);
    // context?.beamToNamed(route.path);
  }

  final beamerKey = GlobalKey<BeamerState>();

  @override
  AppRoute getRouteForPath(String path) {
    // if (!isLoggedIn) return TopLevelRoutes.login();

    final pathSegments = Uri.parse(path).pathSegments;

    if (pathSegments.length == 1) {
      if (pathSegments[0] == 'topics') return TopicsRoutes.topics();
    }

    if (pathSegments.length == 2) {
      return TopicsRoutes.articles(pathSegments[1]);
    }

    if (pathSegments.length == 3) {
      return TopicsRoutes.article(pathSegments[1], pathSegments[2]);
    }

    return TopicsRoutes.notFound(path);
  }
}
