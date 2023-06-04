import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/topics_navigation_getx_controller.dart';
import '../models/topics_routes.dart';

class TopicsNavigatonGetxBuilder extends StatelessWidget {
  const TopicsNavigatonGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopicsNavigationGetxController>(
      init: TopicsNavigationGetxController(),
      builder: (controller) {
        // return Navigator(
        //   key: GlobalKey<NavigatorState>(debugLabel: 'topics'),
        //   onPopPage: (route, result) => route.didPop(result),
        //   reportsRouteUpdateToEngine: true,
        // );
        return Beamer(
          key: controller.beamerKey,
          routerDelegate: BeamerDelegate(
            initialPath: TopicsRoutes.topics().path,
            locationBuilder: RoutesLocationBuilder(
              routes: {
                TopicsRoutes.topics().path: (context, state, data) => TopicsRoutes.topics().builder,
                TopicsRoutes.articles().path: (context, state, data) => TopicsRoutes.articles().builder,
                TopicsRoutes.article().path: (context, state, data) => TopicsRoutes.article().builder,
              },
            ),
          ),
        );
      },
    );
  }
}
