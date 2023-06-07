import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';

import '../shared/app_info.dart';
import '../shared/controllers/auth_controller.dart';
import '../shared/repositories/local_storage.dart';
import '../shared/states/app_navigation_state.dart';
import '../shared/states/auth_state.dart';
import 'flutter_app_navigation_controller.dart';
import 'flutter_router_configuration.dart';
import 'flutter_topics_navigation_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  usePathUrlStrategy();
  currentNavigationSolution = NavigationSolution.flutter;
  runApp(const FlutterApp());
}

class FlutterApp extends StatefulWidget {
  const FlutterApp({super.key});

  @override
  State<FlutterApp> createState() => _FlutterAppState();
}

class _FlutterAppState extends State<FlutterApp> {
  final _authController = GetIt.I.registerSingleton<AuthState>(AuthController());
  late final AppNavigationState _navigation;
  late final RouterDelegate<Object> _routerDelegate;
  late final RouteInformationParser<Object> _routeInformationParser;

  @override
  void initState() {
    super.initState();
    _navigation = GetIt.I.registerSingleton<AppNavigationState>(
      FlutterAppNavigationController(authState: _authController),
      instanceName: 'app',
    );
    _routerDelegate = FlutterRouterDelegate(state: _navigation);
    _routeInformationParser = FlutterRouteInformationParser(state: _navigation);
    GetIt.I.registerSingleton<AppNavigationState>(
      FlutterTopicsNavigationController(),
      instanceName: 'topics',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _navigation as FlutterAppNavigationController,
      builder: (_, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Navigator',
          routerDelegate: _routerDelegate,
          routeInformationParser: _routeInformationParser,
        );
      },
    );
  }
}
