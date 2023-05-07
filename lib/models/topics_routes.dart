import 'package:flutter/material.dart';

import '../builders/article_details_page_getx_builder.dart';
import '../builders/article_list_page_getx_builder.dart';
import '../builders/topics_page_getx_builder.dart';
import '../entities/app_route.dart';

class TopicsRoutes implements AppRoute {
  @override
  final String path;
  @override
  final List<Page> pages;

  @override
  operator ==(Object other) => other is TopicsRoutes && other.path == path;

  @override
  int get hashCode => path.hashCode;

  TopicsRoutes.notFound(String unknownPath)
      : path = unknownPath,
        pages = [MaterialPage(name: unknownPath, child: const Center(child: Text('404')))];
  TopicsRoutes.topics()
      : path = '/topics',
        pages = [const MaterialPage(name: '/topics', child: TopicsPageGetxBuilder())];
  TopicsRoutes.articles(String topic)
      : path = '/topics/$topic',
        pages = [
          const MaterialPage(name: '/topics', child: TopicsPageGetxBuilder()),
          MaterialPage(name: '/topics/$topic', child: ArticleListPageGetxBuilder(topic: topic)),
        ];
  TopicsRoutes.article(String topic, String title)
      : path = '/topics/$topic/$title',
        pages = [
          const MaterialPage(name: '/topics', child: TopicsPageGetxBuilder()),
          MaterialPage(name: '/topics/$topic', child: ArticleListPageGetxBuilder(topic: topic)),
          MaterialPage(name: '/topics/$topic/$title', child: ArticleDetailsPageGetxBuilder(topic: topic, title: title)),
        ];
}
