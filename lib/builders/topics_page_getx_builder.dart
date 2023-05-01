import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/app_navigation_bar.dart';
import '../controllers/app_navigation_getx_controller.dart';
import '../controllers/topics_page_getx_controller.dart';
import '../pages/topics_page.dart';

class TopicsPageGetxBuilder extends StatelessWidget {
  const TopicsPageGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<AppNavigationGetxController>();

    return AppNavigationBar(
      onTabSelected: (value) => value == 1 ? navigationController.setPath('/settings') : null,
      selectedTabIndex: 0,
      selectedTabBody: GetBuilder(
        init: TopicsPageGetxController(navigation: navigationController),
        builder: (controller) => TopicsPage(state: controller),
      ),
    );
  }
}
