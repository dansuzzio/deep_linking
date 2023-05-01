import 'package:get/get.dart';

import '../states/app_navigation_state.dart';
import 'user_getx_controller.dart';

class AppNavigationGetxController extends GetxController implements AppNavigationState {
  final _userController = Get.find<UserGetxController>();

  @override
  bool get isLoggedIn => _userController.isLoggedIn;

  final _routePath = '/'.obs;
  @override
  String get routePath => _routePath.value;
  @override
  void setPath(String path) {
    _routePath.value = path;
    update();
  }

  @override
  bool get isUnknonwnRoute => !['/', '/login', '/home'].contains(routePath);
}
