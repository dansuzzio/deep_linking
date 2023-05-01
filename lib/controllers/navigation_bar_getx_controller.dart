import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apps/getx_app.dart';
import '../states/app_navigation_state.dart';
import '../states/navigation_bar_state.dart';

class NavigationBarGetxController extends GetxController implements NavigationBarState {
  final AppNavigationState navigation;

  NavigationBarGetxController({
    required this.navigation,
  });

  bool get isSettings => navigation.path == '/settings';

  @override
  int get selectedTabIndex => isSettings ? 1 : 0;

  @override
  void onTabSelected(int index) {
    navigation.setPath(index == 1 ? '/settings' : '/topics');
  }

  @override
  Widget get selectedTabBody => isSettings ? settingsNavigator : topicsNavigator;
}
