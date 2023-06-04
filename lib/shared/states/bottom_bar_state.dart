import 'package:flutter/material.dart';

abstract class BottomBarState {
  int get selectedTabIndex;
  void onTabSelected(int index);
  Widget get selectedTabBody;
}
