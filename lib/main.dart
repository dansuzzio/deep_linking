import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'apps/beamer_app.dart';
import 'repositories/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.init();

  usePathUrlStrategy();

  // Regular Navigator 2.0
  // await initializeDependencies();
  // runApp(const RegularApp());

  // GetX navigation
  // runApp(const GetxApp());

  // GoRouter navigation
  // runApp(const GoRouterApp());

  // Beamer navigation
  await initializeDependencies();
  runApp(const BeamerApp());
}
