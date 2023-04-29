import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_item_page_getx_controller.dart';
import '../pages/create_item_page.dart';

class CreateItemPageGetxBuilder extends StatelessWidget {
  final String title;

  const CreateItemPageGetxBuilder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CreateItemPageGetxController(title: title),
      builder: (controller) => CreateItemPage(state: controller),
    );
  }
}
