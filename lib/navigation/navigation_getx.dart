import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'navigation.dart';

class GetxNavigation implements Navigation {
  // @override
  // String get currentRouteName => Get.currentRoute;

  // @override
  // String get previousRouteName => Get.previousRoute;

  @override
  Future<T?> goTo<T>(String routeName, {BuildContext? context}) => throw UnimplementedError();

  @override
  Future<T?> push<T>(String routeName, {BuildContext? context, dynamic arguments, dynamic key}) async {
    return Get.toNamed<T>(routeName, arguments: arguments, id: key);
  }

  @override
  Future<void> pop<T>({BuildContext? context, T? result}) async => Get.back<T>(result: result);

  @override
  Future<T?> replace<T>(String routeName, {BuildContext? context, dynamic arguments, dynamic key}) async {
    return Get.offNamed<T>(routeName, arguments: arguments, id: key);
  }

  @override
  Future<T?> replaceAll<T>(String routeName, {BuildContext? context, arguments, key}) async {
    return Get.offAll<T>(routeName, arguments: arguments, id: key);
  }

  @override
  Future<T?> pushAndRemoveUntil<T>(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    BuildContext? context,
    dynamic arguments,
    dynamic key,
  }) async {
    return Get.offNamedUntil<T>(routeName, predicate, arguments: arguments, id: key);
  }
}
