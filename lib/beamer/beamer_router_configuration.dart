import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../shared/models/top_routes.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';
import 'beamer_app_navigation_controller.dart';

final beamerRouterDelegate = BeamerDelegate(
  navigatorObservers: [(GetIt.I.get<AppNavigationState>(instanceName: 'app') as BeamerAppNavigationController).observer],
  initialPath: TopRoutes.topics.path,
  locationBuilder: RoutesLocationBuilder(
    routes: {
      TopRoutes.login.path: (context, state, data) {
        return BeamPage(
          key: ValueKey(TopRoutes.login.path),
          child: TopRoutes.login.builder,
        );
      },
      TopRoutes.settings.path: (context, state, data) {
        return BeamPage(
          key: ValueKey(TopRoutes.settings.path),
          child: TopRoutes.settings.builder,
        );
      },
      TopRoutes.topics.path: (context, state, data) {
        return BeamPage(
          key: ValueKey(TopRoutes.topics.path),
          child: TopRoutes.topics.builder,
        );
      },
    },
  ),
  guards: [
    BeamGuard(
      pathPatterns: [TopRoutes.login.path],
      guardNonMatching: true,
      check: (_, __) => GetIt.I.get<AuthState>().isLoggedIn,
      beamToNamed: (_, __) => TopRoutes.login.path,
    )
  ],
);
