// import 'package:flutter/material.dart';

// abstract class Navigation {
//   // Declarative
//   Future<T?> goTo<T>(String routeName, {BuildContext? context});

//   // Imperative
//   Future<T?> push<T>(String routeName, {BuildContext? context, dynamic arguments, dynamic key});
//   Future<void> pop<T>({BuildContext? context, T? result});
//   Future<T?> replace<T>(String routeName, {BuildContext? context, dynamic arguments, dynamic key});
//   Future<T?> replaceAll<T>(String routeName, {BuildContext? context, dynamic arguments, dynamic key});
//   Future<T?> pushAndRemoveUntil<T>(String routeName, bool Function(Route<dynamic>) predicate, {BuildContext? context, dynamic arguments, dynamic key});
// }

// abstract class AppRoute {
//   String get path;
//   Widget Function(BuilderParams params) get builder;
// }

// abstract class BuilderParams {}

// class ArticleListPageParams extends BuilderParams {
//   final String topic;
//   ArticleListPageParams({required this.topic});
// }
