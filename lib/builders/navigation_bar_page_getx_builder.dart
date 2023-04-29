import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/navigation_bar_getx_controller.dart';
import '../pages/navigation_bar_page.dart';

class NavigationBarPageGetxBuilder extends StatelessWidget {
  const NavigationBarPageGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NavigationBarGetxController(),
      builder: (controller) => NavigationBarPage(state: controller),
    );
  }
}
