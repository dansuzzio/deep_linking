import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../builders/login_page_getx_builder.dart';
import '../builders/navigation_bar_page_getx_builder.dart';
import '../controllers/app_navigation_getx_controller.dart';
import '../controllers/user_getx_controller.dart';
import '../states/app_navigation_state.dart';

Future<void> initializeDependencies() async {
  await Get.putAsync(() async => UserGetxController());
  final navigationState = Get.put(AppNavigationGetxController());
  Get.put(AppRouterDelegate(state: navigationState));
  Get.put(AppRouteInformationParser());
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

class RouteConfiguration {
  final String? routeName;

  RouteConfiguration.login() : routeName = '/login';
  RouteConfiguration.home() : routeName = '/home';
  RouteConfiguration.notFound() : routeName = '/not-found';
}

class AppRouterDelegate extends RouterDelegate<RouteConfiguration> with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfiguration> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppNavigationState state;

  AppRouterDelegate({required this.state}) : navigatorKey = GlobalKey<NavigatorState>();

  List<Page> get pages => state.isUnknonwnRoute
      ? [
          const MaterialPage(
            key: ValueKey('not-found'),
            name: '/not-found',
            child: Center(child: Text('404')),
          ),
        ]
      : state.isLoggedIn
          ? [
              const MaterialPage(
                key: ValueKey('home'),
                name: '/home',
                child: NavigationBarPageGetxBuilder(),
              ),
            ]
          : [
              const MaterialPage(
                key: ValueKey('login'),
                name: '/login',
                child: LoginPageGetxBuilder(),
              ),
            ];

  @override
  RouteConfiguration get currentConfiguration {
    if (state.isUnknonwnRoute) {
      return RouteConfiguration.notFound();
    } else if (!state.isLoggedIn) {
      return RouteConfiguration.login();
    } else {
      return RouteConfiguration.home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: (route, result) {
        return route.didPop(result);
      },
      pages: pages,
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfiguration configuration) async {
    state.setPath(configuration.routeName ?? '');
    SynchronousFuture(null);
  }
}

class AppRouteInformationParser extends RouteInformationParser<RouteConfiguration> {
  @override
  Future<RouteConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return RouteConfiguration.home();
    }

    // Handle '/login'
    // Handle '/home'
    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'login') {
        return RouteConfiguration.login();
      }
      if (uri.pathSegments[0] == 'home') {
        return RouteConfiguration.home();
      }
    }

    // Handle /404
    return RouteConfiguration.notFound();
  }

  @override
  RouteInformation? restoreRouteInformation(RouteConfiguration configuration) {
    return RouteInformation(location: configuration.routeName);
  }
}
