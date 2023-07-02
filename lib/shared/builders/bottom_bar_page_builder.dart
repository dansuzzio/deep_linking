import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/routes.dart';
import '../pages/bottom_bar_page.dart';
import '../states/app_navigation_state.dart';
import '../states/bottom_bar_state.dart';
import 'settings_page_builder.dart';
import 'topics_navigation_builder.dart';

class BottomBarPageBuilder extends StatefulWidget {
  final int initialTabIndex;
  const BottomBarPageBuilder({super.key, required this.initialTabIndex});

  @override
  State<BottomBarPageBuilder> createState() => _BottomBarPageBuilderState();
}

class _BottomBarPageBuilderState extends State<BottomBarPageBuilder> implements BottomBarState {
  final _navigation = GetIt.I.get<AppNavigationState>(instanceName: 'app');

  bool get _isSettings => _selectedTabIndex == 1;

  late int _selectedTabIndex;
  @override
  int get selectedTabIndex => _selectedTabIndex;

  @override
  Widget get selectedTabBody => _isSettings ? const SettingsPageBuilder() : topicsNavigationBuilder;

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.initialTabIndex;
  }

  @override
  void onTabSelected(int index) {
    if (index == selectedTabIndex) return;
    _navigation.goTo(Routes.home(showSettings: index == 1));
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
