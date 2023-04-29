import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/article_list_page_getx_controller.dart';
import '../pages/article_list_page.dart';

class ArticleListPageGetxBuilder extends StatelessWidget {
  final String topic;

  const ArticleListPageGetxBuilder({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ArticleListPageGetxController(topic: topic),
      builder: (controller) => ArticleListPage(state: controller),
    );
  }
}
