import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../shared/models/routes.dart';
import '../shared/states/app_navigation_state.dart';
import 'flutter_topics_navigation_controller.dart';

class FlutterTopicsNavigationBuilder extends StatelessWidget {
  const FlutterTopicsNavigationBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final navigation = GetIt.I.get<AppNavigationState>(instanceName: 'topics') as FlutterTopicsNavigationController;
    return ListenableBuilder(
      listenable: navigation,
      builder: (_, __) {
        return Navigator(
          key: navigation.key,
          onPopPage: (route, result) {
            final didPop = route.didPop(result);
            if (didPop) {
              final path = route.settings.name;
              final segments = Uri.parse(path ?? '').pathSegments.length;
              if (segments == 2) navigation.currentRoute = Routes.topics();
            }
            return didPop;
          },
          reportsRouteUpdateToEngine: true,
          pages: navigation.routePages,
        );
      },
    );
  }
}
