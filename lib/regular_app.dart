import 'package:flutter/material.dart';

import 'pages/add_item_page.dart';
import 'pages/article_details_page.dart';
import 'pages/article_list_page.dart';
import 'pages/login_page.dart';
import 'pages/navigation_bar_page.dart';
import 'pages/settings_page.dart';
import 'pages/topics_page.dart';
import 'repositories/user_repository.dart';

class RegularApp extends StatelessWidget {
  const RegularApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Linking',
      initialRoute: UserRepository.isLoggedIn ? '/home' : '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => _checkUserAndReturnWidget(const NavigationBarPage()),
        '/settings': (context) => _checkUserAndReturnWidget(const SettingsPage()),
        '/topics': (context) => _checkUserAndReturnWidget(const TopicsPage()),
        '/articles': (context) {
          final topic = ModalRoute.of(context)?.settings.arguments as String;
          return _checkUserAndReturnWidget(ArticleListPage(topic: topic));
        },
        '/article': (context) => _checkUserAndReturnWidget(const ArticleDetailsPage()),
        '/new': (context) {
          final title = ModalRoute.of(context)?.settings.arguments as String? ?? 'Item';
          return _checkUserAndReturnWidget(AddItemPage(title: title));
        },
      },
    );
  }
}

Widget _checkUserAndReturnWidget(Widget widget) {
  if (UserRepository.isLoggedIn) return widget;
  return const LoginPage();
}
