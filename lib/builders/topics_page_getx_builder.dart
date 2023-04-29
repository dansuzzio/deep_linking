import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/topics_page_getx_controller.dart';
import '../pages/topics_page.dart';

class TopicsPageGetxBuilder extends StatelessWidget {
  const TopicsPageGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TopicsPageGetxController(),
      builder: (controller) => TopicsPage(state: controller),
    );
  }
}
