import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../builders/login_page_getx_builder.dart';
import '../builders/navigation_bar_page_getx_builder.dart';
import '../controllers/app_navigation_getx_controller.dart';
import '../controllers/user_getx_controller.dart';
import '../navigation/router_configuration.dart';
import '../states/app_navigation_state.dart';

Future<void> initializeDependencies() async {
  await Get.putAsync(() async => UserGetxController());
  final navigationState = Get.put(AppNavigationGetxController());
  // Get.put(AppRouterDelegate(state: navigationState));
  // Get.put(AppRouteInformationParser());
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

// class RouteConfiguration {
//   final String? path;
//   final List<Page> pages;

//   RouteConfiguration.notFound()
//       : path = null,
//         pages = [const MaterialPage(child: Center(child: Text('404')))];
//   RouteConfiguration.login()
//       : path = '/login',
//         pages = [const MaterialPage(child: LoginPageGetxBuilder())];
//   RouteConfiguration.settings()
//       : path = '/settings',
//         pages = [const MaterialPage(child: NavigationBarPageGetxBuilder())];
//   RouteConfiguration.topics()
//       : path = '/topics',
//         pages = [const MaterialPage(child: NavigationBarPageGetxBuilder())];
//   // RouteConfiguration.articles() : routeName = '/topics/:topic';
//   // RouteConfiguration.article() : routeName = '/topics/:topic/:article';
// }

// class AppRouterDelegate extends RouterDelegate<RouteConfiguration> with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfiguration> {
//   @override
//   final GlobalKey<NavigatorState> navigatorKey;

//   final AppNavigationState state;

//   AppRouterDelegate({required this.state}) : navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   RouteConfiguration get currentConfiguration {
//     final totalSegments = Uri.parse(state.path).pathSegments.length;
//     if (state.isUnknonwnRoute) return RouteConfiguration.notFound();
//     if (!state.isLoggedIn) return RouteConfiguration.login();
//     if (state.path == '/settings') return RouteConfiguration.settings();
//     // if (totalSegments == 2) return RouteConfiguration.articles();
//     // if (totalSegments == 3) return RouteConfiguration.article();
//     return RouteConfiguration.topics();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       onPopPage: (route, result) {
//         return route.didPop(result);
//       },
//       reportsRouteUpdateToEngine: true,
//       pages: state.pages,
//     );
//   }

//   @override
//   Future<void> setNewRoutePath(RouteConfiguration configuration) async {
//     state.setPath(configuration.path ?? '');
//     SynchronousFuture(null);
//   }
// }

// class AppRouteInformationParser extends RouteInformationParser<RouteConfiguration> {
//   @override
//   Future<RouteConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
//     // print('parseRouteInformation location: ${routeInformation.location}');
//     final pathSegments = Uri.parse(routeInformation.location!).pathSegments;

//     if (pathSegments.isEmpty) return RouteConfiguration.topics();

//     if (pathSegments.length == 1) {
//       if (pathSegments[0] == 'login') return RouteConfiguration.login();
//       if (pathSegments[0] == 'settings') return RouteConfiguration.settings();
//       return RouteConfiguration.topics();
//     }

//     // if (pathSegments.length == 2) return RouteConfiguration.articles();
//     // if (pathSegments.length == 3) return RouteConfiguration.article();

//     return RouteConfiguration.notFound();
//   }

//   @override
//   RouteInformation? restoreRouteInformation(RouteConfiguration configuration) {
//     return RouteInformation(location: configuration.path);
//   }
// }
