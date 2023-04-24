import 'package:flutter/material.dart';

import '../pages/add_item_page.dart';
import '../pages/article_details_page.dart';
import '../pages/article_list_page.dart';
import '../pages/login_page.dart';
import '../pages/navigation_bar_page.dart';
import '../pages/settings_page.dart';
import '../pages/topics_page.dart';
import '../repositories/user_repository.dart';

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
        // '/home': (context) => const NavigationBarPage(),
        '/settings': (context) => const SettingsPage(),
        '/topics': (context) => const TopicsPage(),
        '/topics/articles': (context) {
          final topic = ModalRoute.of(context)?.settings.arguments as String;
          return ArticleListPage(topic: topic);
        },
        '/topics/articles/details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
          return ArticleDetailsPage(
            topic: arguments['topic']!,
            title: arguments['title']!,
          );
        },
        '/new': (context) {
          final title = ModalRoute.of(context)?.settings.arguments as String? ?? 'Item';
          return AddItemPage(title: title);
        },
      },
    );
  }
}
