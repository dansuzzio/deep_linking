import 'package:flutter/material.dart';

import '../builders/settings_page_builder.dart';
import '../builders/topics_page_builder.dart';
import '../entities/app_route.dart';

enum TopicsRoutes implements AppRoute {
  settings('/settings', SettingsPageBuilder()),
  topics('/topics', TopicsPageBuilder()),
  notFound('/not-found', Center(child: Text('404')));

  @override
  final String path;
  @override
  final Widget builder;

  const TopicsRoutes(this.path, this.builder);
}
