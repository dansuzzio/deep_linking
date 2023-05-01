import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_navigation_getx_controller.dart';
import '../controllers/navigation_bar_getx_controller.dart';
import '../pages/navigation_bar_page.dart';

class NavigationBarPageGetxBuilder extends StatelessWidget {
  const NavigationBarPageGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<AppNavigationGetxController>();

    return GetBuilder(
      init: NavigationBarGetxController(
        navigation: navigationController,
      ),
      builder: (controller) => NavigationBarPage(state: controller),
    );
  }
}
