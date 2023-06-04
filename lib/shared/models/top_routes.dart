import 'package:flutter/material.dart';

import '../builders/login_page_builder.dart';
import '../builders/settings_page_builder.dart';
import '../builders/splash_page_builder.dart';
import '../entities/app_route.dart';

enum TopRoutes implements AppRoute {
  splash('/', SplashPageBuilder()),
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
