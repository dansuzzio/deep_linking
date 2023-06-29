import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../shared/models/top_routes.dart';
import '../shared/states/app_navigation_state.dart';
import 'beamer_topics_navigation_controller.dart';

class BeamerTopicsNavigationBuilder extends StatelessWidget {
  const BeamerTopicsNavigationBuilder({super.key});

  BeamerTopicsNavigationController get _navigation => GetIt.I.get<AppNavigationState>(instanceName: 'topics') as BeamerTopicsNavigationController;

  @override
  Widget build(BuildContext context) {
    return Beamer(
      key: _navigation.key,
      routerDelegate: BeamerDelegate(
        initialPath: Routes.topics().path,
        locationBuilder: RoutesLocationBuilder(
          routes: {
            Routes.topics().path: (context, state, data) {
              return BeamPage(
                key: ValueKey(Routes.topics().path),
                child: Routes.topics().builder,
              );
            },
            Routes.articles().path: (context, state, data) {
              final parameter = Routes.articles().path.split('/').last.replaceFirst(':', '');
              final topic = state.pathParameters[parameter] ?? '';
              return BeamPage(
                key: ValueKey(Routes.articles().path),
                child: Routes.articles(topic: topic).builder,
              );
            },
          },
        ),
        routeListener: (RouteInformation info, BeamerDelegate delegate) {
          _navigation.onLocationChanged();
        },
        guards: [
          BeamGuard(
            pathPatterns: [Routes.topics().path],
            guardNonMatching: false,
            check: (_, __) {
              return _navigation.savedRoute == null;
            },
            beamToNamed: (origin, target) {
              final originLocation = origin?.state.routeInformation.location ?? '/';
              if (originLocation == '/' || originLocation == _navigation.savedRoute!.path) {
                return target.state.routeInformation.location ?? '';
              }
              return _navigation.savedRoute!.path;
            },
          )
        ],
      ),
    );
  }
}

class TopicsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [Routes.articles().path];

  String get topicParameter => Routes.articles().path.split('/').last.replaceFirst(':', '');

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: ValueKey(Routes.topics().path),
          type: BeamPageType.noTransition,
          child: Routes.topics().builder,
        ),
        if (state.pathParameters.containsKey(topicParameter))
          BeamPage(
            key: ValueKey(Routes.articles().path),
            name: Routes.articles(topic: state.pathParameters[topicParameter]!).path,
            child: Routes.articles(topic: state.pathParameters[topicParameter]!).builder,
          ),
      ];
}
