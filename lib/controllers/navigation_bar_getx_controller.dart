import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../builders/settings_page_getx_builder.dart';
import '../models/top_level_routes.dart';
import '../states/app_navigation_state.dart';
import '../states/navigation_bar_state.dart';
import '../builders/topics_navigaton_getx_builder.dart';

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
  void onTabSelected(int index, [BuildContext? context]) {
    // navigation.setRoute(index == 1 ? '/settings' : '/topics');
    navigation.setRoute(index == 1 ? TopLevelRoutes.settings() : TopLevelRoutes.topics(), context);
  }

  @override
  // Widget get selectedTabBody => isSettings ? settingsNavigator : topicsNavigator;
  Widget get selectedTabBody => isSettings ? const SettingsPageGetxBuilder() : const TopicsNavigatonGetxBuilder();
  // Widget get selectedTabBody => isSettings ? const Center(child: Text('Settings')) : const Center(child: Text('Topics'));
}
