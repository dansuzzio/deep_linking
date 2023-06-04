import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/top_level_routes.dart';
import '../repositories/user_repository.dart';
import '../states/app_navigation_state.dart';
import '../states/login_page_state.dart';
import '../states/user_state.dart';

class LoginPageGetxController extends GetxController implements LoginPageState {
  final AppNavigationState navigation;
  final UserState userState;

  LoginPageGetxController({required this.navigation, required this.userState});

  @override
  Future<void> login(BuildContext context) async {
    await UserRepository.login();
    userState.isLoggedIn = true;
    // navigation.setPath('/topics');
    if (context.mounted) navigation.setRoute(TopLevelRoutes.topics(), context);
  }
}
