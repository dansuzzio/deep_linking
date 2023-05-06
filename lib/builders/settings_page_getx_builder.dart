import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/app_navigation_bar.dart';
import '../controllers/app_navigation_getx_controller.dart';
import '../controllers/settings_page_getx_controller.dart';
import '../controllers/user_getx_controller.dart';
import '../pages/settings_page.dart';

class SettingsPageGetxBuilder extends StatelessWidget {
  const SettingsPageGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<AppNavigationGetxController>();
    final userController = Get.find<UserGetxController>();

    // return AppNavigationBar(
    //   onTabSelected: (value) => value == 0 ? navigationController.setPath('/topics') : null,
    //   selectedTabIndex: 1,
    //   selectedTabBody: GetBuilder(
    //     init: SettingsPageGetxController(
    //       navigation: navigationController,
    //       userState: userController,
    //     ),
    //     builder: (controller) => SettingsPage(state: controller),
    //   ),
    // );
    return GetBuilder(
      init: SettingsPageGetxController(
        navigation: navigationController,
        userState: userController,
      ),
      builder: (controller) => SettingsPage(state: controller),
    );
  }
}
