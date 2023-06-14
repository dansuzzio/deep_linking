import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';

import '../shared/app_info.dart';
import '../shared/controllers/auth_controller.dart';
import '../shared/repositories/local_storage.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';
import 'go_router_app_navigation_controller.dart';
import 'go_router_configuration.dart';
import 'go_router_topics_navigation_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  usePathUrlStrategy();
  currentNavigationSolution = NavigationSolution.goRouter;
  GetIt.I.registerSingleton<AuthState>(AuthController());
  GetIt.I.registerSingleton<AppNavigationState>(GoRouterAppNavigationController(), instanceName: 'app');
  GetIt.I.registerSingleton<AppNavigationState>(GoRouterTopicsNavigationController(), instanceName: 'topics');
  runApp(const GoRouterApp());
}

class GoRouterApp extends StatelessWidget {
  const GoRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GoRouter Navigator',
      routerConfig: goRouterConfiguration,
    );
  }
}
