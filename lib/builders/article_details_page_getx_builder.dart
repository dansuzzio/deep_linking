import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/article_details_page_getx_controller.dart';
import '../pages/article_details_page.dart';

class ArticleDetailsPageGetxBuilder extends StatelessWidget {
  final String topic;
  final String title;

  const ArticleDetailsPageGetxBuilder({super.key, required this.topic, required this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ArticleDetailsPageGetxController(
        topic: topic,
        title: title,
      ),
      builder: (controller) => ArticleDetailsPage(state: controller),
    );
  }
}
