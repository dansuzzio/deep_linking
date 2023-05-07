import 'package:deep_linking/pages/navigation_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../builders/article_details_page_getx_builder.dart';
import '../builders/article_list_page_getx_builder.dart';
import '../builders/login_page_getx_builder.dart';
import '../builders/navigation_bar_page_getx_builder.dart';
import '../builders/settings_page_getx_builder.dart';
import '../builders/topics_page_getx_builder.dart';
import '../entities/app_route.dart';
import '../models/top_level_routes.dart';
import '../states/app_navigation_state.dart';
import 'user_getx_controller.dart';

// class AppNavigationGetxController extends GetxController implements AppNavigationState {
//   final _userController = Get.find<UserGetxController>();

//   @override
//   bool get isLoggedIn => _userController.isLoggedIn;

//   @override
//   bool get isUnknonwnRoute => !['/', '/login', '/settings', '/topics'].contains(path);

//   var _path = '/';
//   @override
//   String get path => _path;
//   @override
//   void setPath(String newPath) {
//     _path = newPath;
//     update();
//   }

//   List<String> get pathSegments => Uri.parse(path).pathSegments;

//   @override
//   List<Page> get pages {
//     final stack = <Page>[];
//     if (isUnknonwnRoute) {
//       stack.add(const MaterialPage(name: '/not-found', child: Center(child: Text('404'))));
//     } else if (!isLoggedIn) {
//       stack.add(const MaterialPage(name: '/login', child: LoginPageGetxBuilder()));
//     } else if (path == '/settings') {
//       stack.add(const MaterialPage(
//         name: '/settings',
//         // child: SettingsPageGetxBuilder(),
//         child: NavigationBarPageGetxBuilder(),
//       ));
//     } else {
//       stack.add(const MaterialPage(
//         name: '/topics',
//         // child: TopicsPageGetxBuilder(),
//         child: NavigationBarPageGetxBuilder(),
//       ));
//     }
//     return stack;
//   }
// }

class AppNavigationGetxController extends GetxController implements AppNavigationState {
  final _userController = Get.find<UserGetxController>();
  @override
  bool get isLoggedIn => _userController.isLoggedIn;

  AppRoute _currentRoute = TopLevelRoutes.initial();
  @override
  AppRoute get currentRoute => _currentRoute;
  @override
  void setRoute(AppRoute route) {
    _currentRoute = route;
    update();
  }

  @override
  AppRoute getRouteForPath(String path) {
    if (!isLoggedIn) return TopLevelRoutes.login();

    final pathSegments = Uri.parse(path).pathSegments;

    if (pathSegments.isEmpty) return TopLevelRoutes.topics();

    if (pathSegments.length == 1) {
      final segment = pathSegments[0];
      if (segment == 'login') return TopLevelRoutes.login();
      if (segment == 'settings') return TopLevelRoutes.settings();
      if (segment == 'topics') return TopLevelRoutes.topics();
    }

    return TopLevelRoutes.notFound(path);
  }
}
