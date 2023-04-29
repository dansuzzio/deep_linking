import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_page_getx_controller.dart';
import '../pages/settings_page.dart';

class SettingsPageGetxBuilder extends StatelessWidget {
  const SettingsPageGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingsPageGetxController(),
      builder: (controller) => SettingsPage(state: controller),
    );
  }
}
