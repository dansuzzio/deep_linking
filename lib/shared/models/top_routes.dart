import 'package:flutter/material.dart';

import '../builders/article_list_page_builder.dart';
import '../builders/bottom_bar_page_builder.dart';
import '../builders/login_page_builder.dart';
import '../builders/settings_page_builder.dart';
import '../builders/topics_page_builder.dart';
import '../entities/app_route.dart';
import '../pages/splash_page.dart';

enum TopRoutes with AppRoute {
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

class Routes implements AppRoute {
  @override
  String path;
  @override
  Widget builder;

  Routes.notFound()
      : path = '/not-found',
        builder = const Center(child: Text('404'));

  Routes.login()
      : path = '/login',
        builder = const LoginPageBuilder();

  Routes.home({bool showSettings = false})
      : path = showSettings ? Routes.settings().path : Routes.topics().path,
        builder = TestBottomBarPageBuilder(initialTabIndex: showSettings ? 1 : 0);

  Routes.settings()
      : path = '/settings',
        builder = const SettingsPageBuilder();

  Routes.topics()
      : path = '/topics',
        builder = const TopicsPageBuilder();

  Routes.articles({String topic = ':topic'})
      : path = '${Routes.topics().path}/$topic',
        builder = TestArticleListPageBuilder(topic: topic);

  @override
  String buildLocation(List<String> replacements) => throw UnimplementedError();
}
