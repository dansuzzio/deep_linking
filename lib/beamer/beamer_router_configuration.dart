import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../shared/models/routes.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';
import 'beamer_app_navigation_controller.dart';

final beamerRouterDelegate = BeamerDelegate(
  navigatorObservers: [(GetIt.I.get<AppNavigationState>(instanceName: 'app') as BeamerAppNavigationController).observer],
  initialPath: Routes.home().path,
  locationBuilder: BeamerLocationBuilder(
    beamLocations: [
      _AppLocation(),
    ],
  ),
  guards: [
    BeamGuard(
      pathPatterns: [Routes.login().path],
      guardNonMatching: true,
      check: (_, __) => GetIt.I.get<AuthState>().isLoggedIn,
      beamToNamed: (_, __) => Routes.login().path,
    )
  ],
);

class _AppLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        Routes.login().path,
        Routes.home(showSettings: true).path,
        Routes.articles().path,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    var page = BeamPage(
      key: ValueKey(Routes.home().path),
      child: Routes.home().builder,
    );
    if (state.uri.path == Routes.home(showSettings: true).path) {
      page = BeamPage(
        key: ValueKey(Routes.home(showSettings: true).path),
        child: Routes.home(showSettings: true).builder,
      );
    } else if (state.uri.path == Routes.login().path) {
      page = BeamPage(
        key: ValueKey(Routes.login().path),
        child: Routes.login().builder,
      );
    }
    return [page];
  }
}
