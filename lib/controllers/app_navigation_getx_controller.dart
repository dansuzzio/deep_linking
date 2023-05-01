import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../builders/article_details_page_getx_builder.dart';
import '../builders/article_list_page_getx_builder.dart';
import '../builders/login_page_getx_builder.dart';
import '../builders/navigation_bar_page_getx_builder.dart';
import '../builders/settings_page_getx_builder.dart';
import '../builders/topics_page_getx_builder.dart';
import '../states/app_navigation_state.dart';
import 'user_getx_controller.dart';

class AppNavigationGetxController extends GetxController implements AppNavigationState {
  final _userController = Get.find<UserGetxController>();

  @override
  bool get isLoggedIn => _userController.isLoggedIn;

  @override
  bool get isUnknonwnRoute => !['/', '/login', '/settings', '/topics', '/topics/Animals'].contains(path);

  var _path = '/';
  @override
  String get path => _path;
  @override
  void setPath(String newPath) {
    _path = newPath;
    update();
  }

  List<String> get pathSegments => Uri.parse(path).pathSegments;

  @override
  List<Page> get pages {
    final stack = <Page>[];
    if (isUnknonwnRoute) {
      stack.add(const MaterialPage(name: '/not-found', child: Center(child: Text('404'))));
    } else if (!isLoggedIn) {
      stack.add(const MaterialPage(name: '/login', child: LoginPageGetxBuilder()));
    } else if (path == '/settings') {
      stack.add(const MaterialPage(
        name: '/settings',
        child: SettingsPageGetxBuilder(),
      ));
    } else {
      stack.add(const MaterialPage(
        name: '/topics',
        child: TopicsPageGetxBuilder(),
      ));
      if (pathSegments.length > 1) {
        stack.add(MaterialPage(
          name: path,
          child: ArticleListPageGetxBuilder(topic: pathSegments[1]),
        ));
      }
      if (pathSegments.length > 2) {
        stack.add(MaterialPage(
          name: path,
          child: ArticleDetailsPageGetxBuilder(
            topic: pathSegments[1],
            title: pathSegments[2],
          ),
        ));
      }
    }
    return stack;
  }
}
