import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../apps/getx_app.dart';
import '../states/navigation_bar_state.dart';

class NavigationBarGetxController extends GetxController implements NavigationBarState {
  var _selectedTabIndex = 0;
  @override
  int get selectedTabIndex => _selectedTabIndex;

  @override
  void onTabSelected(int index) {
    _selectedTabIndex = index;
    update();
  }

  @override
  Widget get selectedTabBody => _selectedTabIndex == 0 ? topicsNavigator : settingsNavigator;
}
