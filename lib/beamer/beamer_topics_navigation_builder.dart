import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../shared/models/topics_routes.dart';
import '../shared/states/app_navigation_state.dart';
import 'beamer_topics_navigation_controller.dart';

class BeamerTopicsNavigationBuilder extends StatelessWidget {
  const BeamerTopicsNavigationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = GetIt.I.get<AppNavigationState>(instanceName: 'topics') as BeamerTopicsNavigationController;
    return Beamer(
      key: navigation.key,
      routerDelegate: BeamerDelegate(
        initialPath: TopicsRoutes.topics.path,
        locationBuilder: RoutesLocationBuilder(
          routes: {
            TopicsRoutes.topics.path: (context, state, data) => TopicsRoutes.topics.builder,
          },
        ),
      ),
    );
  }
}
