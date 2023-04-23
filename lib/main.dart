import 'package:deep_linking/article_details_page.dart';
import 'package:deep_linking/article_list_page.dart';
import 'package:deep_linking/settings_page.dart';
import 'package:deep_linking/user_controller.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'navigation_bar_page.dart';
import 'topics_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deep Linking',
      initialRoute: User.isLoggedIn ? '/' : '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const NavigationBarPage(),
        '/settings': (context) => const SettingsPage(),
        '/topics': (context) => const TopicsPage(),
        '/articles': (context) => const ArticleListPage(),
        '/article': (context) => const ArticleDetailsPage(),
      },
    );
  }
}
