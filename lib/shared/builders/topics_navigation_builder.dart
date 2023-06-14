import 'package:flutter/material.dart';

import '../../beamer/beamer_topics_navigation_builder.dart';
import '../../flutter_navigator/flutter_topics_navigation_builder.dart';
import '../app_info.dart';

Widget get topicsNavigationBuilder {
  return switch (currentNavigationSolution) {
    NavigationSolution.beamer => const BeamerTopicsNavigationBuilder(),
    NavigationSolution.flutter => const FlutterTopicsNavigationBuilder(),
    _ => throw UnimplementedError(),
  };
}
