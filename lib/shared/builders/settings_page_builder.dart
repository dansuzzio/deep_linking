import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/top_routes.dart';
import '../pages/settings_page.dart';
import '../states/app_navigation_state.dart';
import '../states/settings_page_state.dart';
import '../states/auth_state.dart';

class SettingsPageBuilder extends StatefulWidget {
  const SettingsPageBuilder({super.key});

  @override
  State<SettingsPageBuilder> createState() => _SettingsPageBuilderState();
}

class _SettingsPageBuilderState extends State<SettingsPageBuilder> implements SettingsPageState {
  final _navigation = GetIt.I.get<AppNavigationState>(instanceName: 'app');
  final _auth = GetIt.I.get<AuthState>();

  @override
  Future<void> logout() async {
    await _auth.logout();
    // _navigation.goTo(TopRoutes.login);
    _navigation.goTo(Routes.login());
  }

  @override
  Widget build(BuildContext context) {
    return SettingsPage(logout: logout);
  }
}
