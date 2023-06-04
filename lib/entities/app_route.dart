import 'package:flutter/material.dart';

// abstract class AppRoute {
//   String? get path;
//   List<Page> get pages;
// }

abstract interface class AppRoute {
  String get path;
  Widget get builder;
}
