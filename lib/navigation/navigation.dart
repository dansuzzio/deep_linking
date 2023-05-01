import 'package:flutter/material.dart';

import '../builders/article_list_page_getx_builder.dart';

abstract class Navigation {
  // String get currentRouteName;
  // String get previousRouteName;

  // Declarative
  Future<T?> goTo<T>(String routeName, {BuildContext? context});

  // Imperative
  Future<T?> push<T>(String routeName, {BuildContext? context, dynamic arguments, dynamic key});
  Future<void> pop<T>({BuildContext? context, T? result});
  Future<T?> replace<T>(String routeName, {BuildContext? context, dynamic arguments, dynamic key});
  Future<T?> replaceAll<T>(String routeName, {BuildContext? context, dynamic arguments, dynamic key});
  Future<T?> pushAndRemoveUntil<T>(String routeName, bool Function(Route<dynamic>) predicate, {BuildContext? context, dynamic arguments, dynamic key});
}

abstract class AppRoute {
  String get path;
  Widget Function(BuilderParams params) get builder;
}

abstract class BuilderParams {}

// /login
// /home
//   /topics
//     /topics/:topic
//       /topics/:topic/:article
//   /settings

class ArticleListPageParams extends BuilderParams {
  final String topic;
  ArticleListPageParams({required this.topic});
}

// enum Routes implements AppRoute {
//   articles(
//       '/topics/:topic',
//       (BuilderParams params) => ArticleListPageGetxBuilder(
//             topic: params.topic,
//           ));

//   @override
//   final String path;
//   @override
//   final Widget Function(BuilderParams params) builder;

//   const Routes(this.path, this.builder);
// }
