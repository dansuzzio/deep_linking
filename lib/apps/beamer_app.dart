import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_navigation_getx_controller.dart';
import '../controllers/user_getx_controller.dart';
import '../models/top_level_routes.dart';

Future<void> initializeDependencies() async {
  await Get.putAsync(() async => UserGetxController());
  Get.put(AppNavigationGetxController());
}

class BeamerApp extends StatelessWidget {
  const BeamerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,
    );
  }
}

// final obs = NavigatorObserver();

// final _routerDelegate = BeamerDelegate(
//   navigatorObservers: [
//     obs,
//   ],
//   initialPath: '/',
//   locationBuilder: RoutesLocationBuilder(
//     routes: {
//       '/': (context, state, data) {
//         return BeamerAppNavigationBuilder();
//       },
//     },
//   ),
// );

final _routerDelegate = BeamerDelegate(
  navigatorObservers: [Get.find<AppNavigationGetxController>().observer],
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
);
