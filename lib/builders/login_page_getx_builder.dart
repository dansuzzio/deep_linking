import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_page_getx_controller.dart';
import '../pages/login_page.dart';

class LoginPageGetxBuilder extends StatelessWidget {
  const LoginPageGetxBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginPageGetxController(),
      builder: (controller) => LoginPage(state: controller),
    );
  }
}
