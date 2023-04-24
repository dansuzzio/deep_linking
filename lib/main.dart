import 'package:flutter/material.dart';

import 'apps/get_app.dart';
import 'apps/regular_app.dart';
import 'repositories/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage.init();

  // runApp(const RegularApp());
  runApp(const GetApp());
}
