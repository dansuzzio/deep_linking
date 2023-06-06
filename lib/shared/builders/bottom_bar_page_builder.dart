import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../beamer/beamer_topics_navigation_builder.dart';
import '../models/top_routes.dart';
import '../pages/bottom_bar_page.dart';
import '../states/app_navigation_state.dart';
import '../states/bottom_bar_state.dart';
import 'settings_page_builder.dart';

class BottomBarPageBuilder extends StatefulWidget {
  const BottomBarPageBuilder({super.key});

  @override
  State<BottomBarPageBuilder> createState() => _BottomBarPageBuilderState();
}

class _BottomBarPageBuilderState extends State<BottomBarPageBuilder> implements BottomBarState {
  final _navigation = GetIt.I.get<AppNavigationState>();

  bool get _isSettings => _navigation.currentRoute == TopRoutes.settings;

  @override
  int get selectedTabIndex => _isSettings ? 1 : 0;

  @override
  Widget get selectedTabBody => _isSettings ? const SettingsPageBuilder() : const BeamerTopicsNavigationBuilder();

  @override
  void onTabSelected(int index) {
    if (index == selectedTabIndex) return;
    _navigation.goTo(index == 1 ? TopRoutes.settings : TopRoutes.topics);
  }

  @override
  Widget build(BuildContext context) {
    return BottomBarPage(
      selectedTabIndex: selectedTabIndex,
      selectedTabBody: selectedTabBody,
      onTabSelected: onTabSelected,
    );
  }
}
