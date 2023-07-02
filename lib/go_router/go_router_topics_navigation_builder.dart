import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../shared/models/routes.dart';
import '../shared/pages/bottom_bar_page.dart';
import '../shared/states/app_navigation_state.dart';
import 'go_router_topics_navigation_controller.dart';

AppNavigationState get _appNavigation => GetIt.I.get<AppNavigationState>(instanceName: 'app');
GoRouterTopicsNavigationController get _navigation => GetIt.I.get<AppNavigationState>(instanceName: 'topics') as GoRouterTopicsNavigationController;

final goRouterTopicsNavigationBuilder = ShellRoute(
  builder: (context, state, child) {
    Future.delayed(Duration.zero, () => _navigation.listenForLocationChanges());
    return BottomBarPage(
      key: _navigation.key,
      selectedTabBody: child,
      selectedTabIndex: state.location == Routes.settings().path ? 1 : 0,
      onTabSelected: (index) {
        if (index == 0 && _navigation.savedRoute != null) return _navigation.goTo(_navigation.savedRoute!);
        final route = index == 1 ? Routes.settings() : Routes.topics();
        _appNavigation.goTo(route);
      },
    );
  },
  routes: [
    GoRoute(
      path: Routes.settings().path,
      builder: (context, state) => Routes.settings().builder,
    ),
    GoRoute(
      path: Routes.topics().path,
      builder: (context, state) => Routes.topics().builder,
      routes: [
        GoRoute(
          path: Routes.articles().path.split('/').last,
          builder: (context, state) {
            final parameter = Routes.articles().path.split('/').last.replaceFirst(':', '');
            final topic = state.pathParameters[parameter] ?? '';
            return Routes.articles(topic: topic).builder;
          },
        ),
      ],
    ),
  ],
);
