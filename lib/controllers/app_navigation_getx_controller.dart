import 'package:get/get.dart';

import '../entities/app_route.dart';
import '../models/top_level_routes.dart';
import '../states/app_navigation_state.dart';
import 'user_getx_controller.dart';

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
