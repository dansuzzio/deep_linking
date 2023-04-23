import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/add_item_page.dart';
import '../pages/article_details_page.dart';
import '../pages/article_list_page.dart';
import '../pages/login_page.dart';
import '../pages/navigation_bar_page.dart';
import '../pages/settings_page.dart';
import '../pages/topics_page.dart';
import '../repositories/user_repository.dart';

class GetApp extends StatelessWidget {
  const GetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Linking',
      initialRoute: UserRepository.isLoggedIn ? '/home' : '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const NavigationBarPage()),
        GetPage(name: '/settings', page: () => const LoginPage()),
        GetPage(name: '/login', page: () => const SettingsPage()),
        GetPage(name: '/topics', page: () => const TopicsPage()),
        // GetPage(
        //   name: '/topics',
        //   page: () => const TopicsPage(),
        //   children: [
        //     GetPage(
        //       name: '/:topic',
        //       page: () {
        //         final topic = Get.parameters['topic'];
        //         return ArticleListPage(topic: topic ?? 'Articles');
        //       },
        //     ),
        //   ],
        // ),
        GetPage(
          name: '/topics/:topic',
          page: () => ArticleListPage(topic: Get.parameters['topic'] ?? 'Articles'),
        ),
        GetPage(
          name: '/topics/:topic/:article',
          page: () {
            return ArticleDetailsPage(
              topic: Get.parameters['topic']!,
              title: Get.parameters['article']!,
            );
          },
        ),
        GetPage(name: '/new', page: () => AddItemPage(title: Get.arguments!)),
      ],
    );
  }
}
