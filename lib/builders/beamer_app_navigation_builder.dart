import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/beamer_app_navigation_controller.dart';
import '../controllers/user_getx_controller.dart';
import '../models/top_level_routes.dart';

class BeamerAppNavigationBuilder extends StatelessWidget {
  BeamerAppNavigationBuilder({super.key});

  final _navigation = BeamerAppNavigationController();

  @override
  Widget build(BuildContext context) {
    return Beamer(
      key: _navigation.beamerKey,
      routerDelegate: BeamerDelegate(
        initialPath: TopLevelRoutes.topics().path,
        locationBuilder: RoutesLocationBuilder(
          routes: {
            TopLevelRoutes.login().path: (context, state, data) {
              return BeamPage(
                key: ValueKey(TopLevelRoutes.login().path),
                child: TopLevelRoutes.login().builder,
              );
            },
            TopLevelRoutes.settings().path: (context, state, data) {
              return BeamPage(
                key: ValueKey(TopLevelRoutes.settings().path),
                child: TopLevelRoutes.settings().builder,
              );
            },
            TopLevelRoutes.topics().path: (context, state, data) {
              return BeamPage(
                key: ValueKey(TopLevelRoutes.topics().path),
                child: TopLevelRoutes.topics().builder,
              );
            },
          },
        ),
        guards: [
          BeamGuard(
            pathPatterns: [TopLevelRoutes.login().path],
            guardNonMatching: true,
            check: (context, location) {
              final userController = Get.find<UserGetxController>();
              return userController.isLoggedIn;
            },
            beamToNamed: (origin, target) => TopLevelRoutes.login().path,
          )
        ],
      ),
    );
  }
}
