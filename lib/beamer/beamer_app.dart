import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';

import '../shared/controllers/auth_controller.dart';
import '../shared/repositories/local_storage.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';
import 'beamer_app_navigation_controller.dart';
import 'beamer_router_configuration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  usePathUrlStrategy();
  GetIt.I.registerSingleton<AuthState>(AuthController());
  GetIt.I.registerSingleton<AppNavigationState>(BeamerAppNavigationController());
  runApp(const BeamerApp());
}

class BeamerApp extends StatelessWidget {
  const BeamerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetIt.I.get<AuthState>().initialize(),
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) return const CircularProgressIndicator();
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Beamer Navigator',
            routeInformationParser: BeamerParser(),
            routerDelegate: beamerRouterDelegate,
          );
        });
  }
}
