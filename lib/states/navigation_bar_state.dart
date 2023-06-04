import 'package:flutter/material.dart';

abstract class NavigationBarState {
  int get selectedTabIndex;
  void onTabSelected(int index, [BuildContext? context]);
  Widget get selectedTabBody;
}
