import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_navigation_getx_controller.dart';
import '../controllers/user_getx_controller.dart';
import '../navigation/router_configuration.dart';

Future<void> initializeDependencies() async {
  await Get.putAsync(() async => UserGetxController());
  final navigationState = Get.put(AppNavigationGetxController());
  Get.put(AppRouterDelegate(state: navigationState));
  Get.put(AppRouteInformationParser(state: navigationState));
}

class RegularApp extends StatelessWidget {
  const RegularApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerDelegate = Get.find<AppRouterDelegate>();
    final routeInformationParser = Get.find<AppRouteInformationParser>();

    return GetBuilder<AppNavigationGetxController>(
      builder: (controller) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Deep Linking',
          routerDelegate: routerDelegate,
          routeInformationParser: routeInformationParser,
        );
      },
    );
  }
}
