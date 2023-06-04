import 'package:flutter/material.dart';

import '../builders/login_page_builder.dart';
import '../builders/settings_page_builder.dart';
import '../entities/app_route.dart';
import '../pages/initial_page.dart';

enum TopRoutes implements AppRoute {
  initial('/', InitialPage()),
  login('/login', LoginPageBuilder()),
  settings('/settings', SettingsPageBuilder()),
  // topics('/topics'),
  notFound('/not-found', Center(child: Text('404')));

  @override
  final String path;
  @override
  final Widget builder;

  const TopRoutes(this.path, this.builder);
}
