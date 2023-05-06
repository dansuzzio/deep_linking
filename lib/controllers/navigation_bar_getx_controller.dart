import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apps/getx_app.dart';
import '../builders/article_details_page_getx_builder.dart';
import '../builders/article_list_page_getx_builder.dart';
import '../builders/create_item_page_getx_builder.dart';
import '../builders/navigation_bar_page_getx_builder.dart';
import '../builders/settings_page_getx_builder.dart';
import '../builders/topics_page_getx_builder.dart';
import '../models/top_level_routes.dart';
import '../states/app_navigation_state.dart';
import '../states/navigation_bar_state.dart';

class NavigationBarGetxController extends GetxController implements NavigationBarState {
  final AppNavigationState navigation;

  NavigationBarGetxController({
    required this.navigation,
  });

  // bool get isSettings => navigation.path == '/settings';
  bool get isSettings => navigation.currentRoute == TopLevelRoutes.settings();

  @override
  int get selectedTabIndex => isSettings ? 1 : 0;

  @override
  void onTabSelected(int index) {
    // navigation.setRoute(index == 1 ? '/settings' : '/topics');
    navigation.setRoute(index == 1 ? TopLevelRoutes.settings() : TopLevelRoutes.topics());
  }

  @override
  // Widget get selectedTabBody => isSettings ? settingsNavigator : topicsNavigator;
  Widget get selectedTabBody => isSettings ? SettingsPageGetxBuilder() : TopicsNavigatorGetxBuilder();
}

// class TopicsNavigationGetxController extends GetxController implements AppNavigationState {
//   @override
//   bool get isLoggedIn => throw UnimplementedError();

//   @override
//   bool get isUnknonwnRoute => throw UnimplementedError();

//   var _path = '/topics';
//   @override
//   String get path => _path;
//   @override
//   void setPath(String newPath) {
//     _path = newPath;
//     update();
//   }

//   List<String> get pathSegments => Uri.parse(path).pathSegments;

//   @override
//   List<Page> get pages {
//     final stack = <Page>[const MaterialPage(name: '/topics', child: TopicsPageGetxBuilder())];
//     if (pathSegments.length > 1) {
//       if (pathSegments[1] == 'create') {
//         stack.add(const MaterialPage(
//           name: '/create',
//           child: CreateItemPageGetxBuilder(title: 'Topic'),
//         ));
//       } else {
//         stack.add(MaterialPage(
//           name: path,
//           child: ArticleListPageGetxBuilder(topic: pathSegments[1]),
//         ));
//       }
//     }
//     if (pathSegments.length > 2) {
//       if (pathSegments[2] == 'create') {
//         stack.add(const MaterialPage(
//           name: '/create',
//           child: CreateItemPageGetxBuilder(title: 'Article'),
//         ));
//       } else {
//         stack.add(MaterialPage(
//           name: path,
//           child: ArticleDetailsPageGetxBuilder(
//             topic: pathSegments[1],
//             title: pathSegments[2],
//           ),
//         ));
//       }
//     }
//     return stack;
//   }
// }

class TopicsNavigatorGetxBuilder extends StatelessWidget {
  const TopicsNavigatorGetxBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Topics'));
    // return GetBuilder<TopicsNavigationGetxController>(
    //   init: TopicsNavigationGetxController(),
    //   builder: (controller) {
    //     return Navigator(
    //       key: Get.nestedKey(1),
    //       pages: controller.pages,
    //       onPopPage: (route, result) => route.didPop(result),
    //       reportsRouteUpdateToEngine: true,
    //     );
    //   },
    // );
  }
}
