import 'package:flutter/material.dart';

import '../builders/article_list_page_builder.dart';
import '../builders/settings_page_builder.dart';
import '../builders/topics_page_builder.dart';
import '../entities/app_route.dart';

enum TopicsRoutes with AppRoute {
  settings('/settings', SettingsPageBuilder()),
  topics('/topics', TopicsPageBuilder()),
  articles('/topics/:topic', ArticleListPageBuilder()),
  notFound('/not-found', Center(child: Text('404')));

  @override
  final String path;
  @override
  final Widget builder;
  const TopicsRoutes(this.path, this.builder);
}

class TestTopicsRoutes implements AppRoute {
  @override
  String path;
  @override
  Widget builder;

  TestTopicsRoutes.settings()
      : path = '/settings',
        builder = const SettingsPageBuilder();

  TestTopicsRoutes.topics()
      : path = '/topics',
        builder = const TopicsPageBuilder();

  TestTopicsRoutes.articles({String topic = ':topic'})
      : path = '${TestTopicsRoutes.topics().path}/$topic',
        builder = TestArticleListPageBuilder(topic: topic);

  @override
  String buildLocation(List<String> replacements) => throw UnimplementedError();
}
