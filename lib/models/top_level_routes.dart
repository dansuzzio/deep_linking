import 'package:flutter/material.dart';

import '../builders/login_page_getx_builder.dart';
import '../builders/navigation_bar_page_getx_builder.dart';
import '../entities/app_route.dart';

class TopLevelRoutes implements AppRoute {
  @override
  final String path;
  @override
  final List<Page> pages;

  @override
  operator ==(Object other) => other is TopLevelRoutes && other.path == path;

  @override
  int get hashCode => path.hashCode;

  TopLevelRoutes.initial()
      : path = '/',
        pages = [MaterialPage(name: '/', child: Container())];
  TopLevelRoutes.notFound(String unknownPath)
      : path = unknownPath,
        pages = [MaterialPage(name: unknownPath, child: const Center(child: Text('404')))];
  TopLevelRoutes.login()
      : path = '/login',
        pages = [const MaterialPage(name: '/login', child: LoginPageGetxBuilder())];
  TopLevelRoutes.settings()
      : path = '/settings',
        pages = [const MaterialPage(name: '/settings', child: NavigationBarPageGetxBuilder())];
  TopLevelRoutes.topics()
      : path = '/topics',
        pages = [const MaterialPage(name: '/topics', child: NavigationBarPageGetxBuilder())];
}
