import 'package:flutter/material.dart';

abstract interface class AppRoute {
  String get path;
  Widget get builder;
}
