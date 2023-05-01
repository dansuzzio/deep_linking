import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_navigation_getx_controller.dart';
import '../controllers/article_list_page_getx_controller.dart';
import '../pages/article_list_page.dart';

class ArticleListPageGetxBuilder extends StatelessWidget {
  final String topic;

  const ArticleListPageGetxBuilder({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<AppNavigationGetxController>();

    return GetBuilder(
      // init: ArticleListPageGetxController(topic: topic),
      init: ArticleListPageGetxController(
        navigation: navigationController,
      ),
      builder: (controller) => ArticleListPage(state: controller),
    );
  }
}
