import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/routes.dart';
import '../pages/splash_page.dart';
import '../states/app_navigation_state.dart';
import '../states/auth_state.dart';

class SplashPageBuilder extends StatefulWidget {
  const SplashPageBuilder({super.key});

  @override
  State<SplashPageBuilder> createState() => _SplashPageBuilderState();
}

class _SplashPageBuilderState extends State<SplashPageBuilder> {
  final _auth = GetIt.I.get<AuthState>();
  final _navigation = GetIt.I.get<AppNavigationState>(instanceName: 'app');

  @override
  void initState() {
    super.initState();
    _checkAuthAndGoToInitialPage();
  }

  Future<void> _checkAuthAndGoToInitialPage() async {
    await _auth.fetchAuthState();
    if (_auth.isLoggedIn) {
      _navigation.goTo(Routes.home());
    } else {
      _navigation.goTo(Routes.login());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}
