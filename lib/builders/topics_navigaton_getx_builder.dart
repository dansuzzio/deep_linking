import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/topics_navigation_getx_controller.dart';

class TopicsNavigatonGetxBuilder extends StatelessWidget {
  const TopicsNavigatonGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopicsNavigationGetxController>(
      init: TopicsNavigationGetxController(),
      builder: (controller) {
        return Navigator(
          key: GlobalKey<NavigatorState>(debugLabel: 'topics'),
          onPopPage: (route, result) => route.didPop(result),
          reportsRouteUpdateToEngine: true,
          pages: controller.currentRoute.pages,
        );
      },
    );
  }
}
