import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_navigation_getx_controller.dart';
import '../controllers/login_page_getx_controller.dart';
import '../controllers/user_getx_controller.dart';
import '../pages/login_page.dart';

class LoginPageGetxBuilder extends StatelessWidget {
  const LoginPageGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<AppNavigationGetxController>();
    final userController = Get.find<UserGetxController>();

    return GetBuilder(
      init: LoginPageGetxController(
        navigation: navigationController,
        userState: userController,
      ),
      builder: (controller) => LoginPage(state: controller),
    );
  }
}
