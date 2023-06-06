import 'package:flutter/material.dart';

import '../builders/bottom_bar_page_builder.dart';
import '../builders/login_page_builder.dart';
import '../entities/app_route.dart';
import '../pages/splash_page.dart';

enum TopRoutes implements AppRoute {
  splash('/', SplashPage()),
  login('/login', LoginPageBuilder()),
  settings('/settings', BottomBarPageBuilder()),
  topics('/topics', BottomBarPageBuilder()),
  notFound('/not-found', Center(child: Text('404')));

  @override
  final String path;
  @override
  final Widget builder;

  const TopRoutes(this.path, this.builder);
}
