import 'package:flutter/material.dart';

abstract class AppNavigationState {
  String get path;
  void setPath(String newPath);
  bool get isLoggedIn;
  bool get isUnknonwnRoute;
  List<Page> get pages;
}
