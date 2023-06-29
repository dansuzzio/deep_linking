import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/top_routes.dart';
import '../pages/login_page.dart';
import '../states/app_navigation_state.dart';
import '../states/login_page_state.dart';
import '../states/auth_state.dart';

class LoginPageBuilder extends StatefulWidget {
  const LoginPageBuilder({super.key});

  @override
  State<LoginPageBuilder> createState() => _LoginPageBuilderState();
}

class _LoginPageBuilderState extends State<LoginPageBuilder> implements LoginPageState {
  final _navigation = GetIt.I.get<AppNavigationState>(instanceName: 'app');
  final _auth = GetIt.I.get<AuthState>();

  @override
  Future<void> login() async {
    await _auth.login();
    // _navigation.goTo(TopRoutes.topics);
    // _navigation.goTo(Routes.topics());
    _navigation.goTo(Routes.home());
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage(login: login);
  }
}
