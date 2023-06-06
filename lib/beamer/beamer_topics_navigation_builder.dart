import 'package:beamer/beamer.dart';
import 'package:deep_linking/shared/entities/app_route.dart';
import 'package:flutter/material.dart';

import '../shared/models/topics_routes.dart';
import '../shared/states/app_navigation_state.dart';

class BeamerTopicsNavigationBuilder extends StatefulWidget {
  const BeamerTopicsNavigationBuilder({super.key});

  @override
  State<BeamerTopicsNavigationBuilder> createState() => _BeamerTopicsNavigationBuilderState();
}

class _BeamerTopicsNavigationBuilderState extends State<BeamerTopicsNavigationBuilder> implements AppNavigationState {
  final _beamerKey = GlobalKey<BeamerState>();

  BuildContext? get _context => _beamerKey.currentContext;

  @override
  AppRoute get currentRoute {
    final path = _context?.currentBeamLocation.state.routeInformation.location;
    return getRouteForPath(path);
  }

  @override
  void goTo(AppRoute route) {
    if (_context case final context?) return context.beamToNamed(route.path);
    throw Exception('No context');
  }

  @override
  AppRoute getRouteForPath(String? path) {
    return TopicsRoutes.values.firstWhere(
      (route) => route.path == path,
      orElse: () => TopicsRoutes.notFound,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Beamer(
      key: _beamerKey,
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
