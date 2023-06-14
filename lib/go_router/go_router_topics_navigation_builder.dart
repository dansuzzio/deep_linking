import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../shared/models/topics_routes.dart';
import '../shared/pages/bottom_bar_page.dart';
import '../shared/states/app_navigation_state.dart';
import 'go_router_topics_navigation_controller.dart';

AppNavigationState get _navigation => GetIt.I.get(instanceName: 'topics');

final goRouterTopicsNavigationBuilder = ShellRoute(
  navigatorKey: (_navigation as GoRouterTopicsNavigationController).key,
  builder: (context, state, child) {
    return BottomBarPage(
      selectedTabBody: child,
      selectedTabIndex: state.location == TopicsRoutes.settings.path ? 1 : 0,
      onTabSelected: (index) {
        final route = index == 1 ? TopicsRoutes.settings : TopicsRoutes.topics;
        _navigation.goTo(route);
      },
    );
  },
  routes: [
    GoRoute(
      path: TopicsRoutes.settings.path,
      builder: (context, state) => TopicsRoutes.settings.builder,
    ),
    GoRoute(
      path: TopicsRoutes.topics.path,
      builder: (context, state) => TopicsRoutes.topics.builder,
    ),
  ],
);
