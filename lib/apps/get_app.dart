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
      // navigatorKey: GlobalKey<NavigatorState>(),
      debugShowCheckedModeBanner: false,
      title: 'Deep Linking',
      initialRoute: UserRepository.isLoggedIn ? '/home' : '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const NavigationBarPage()),
        // GetPage(name: '/settings', page: () => const SettingsPage()),
        // GetPage(name: '/topics', page: () => const TopicsPage()),
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
        //       children: [
        //         GetPage(
        //           name: '/:article',
        //           page: () {
        //             return ArticleDetailsPage(
        //               topic: Get.parameters['topic']!,
        //               title: Get.parameters['article']!,
        //             );
        //           },
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        GetPage(
          name: '/topics/:topic',
          page: () => ArticleListPage(topic: Get.parameters['topic']!),
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
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => Scaffold(appBar: AppBar(title: const Text('Unknown route'))),
      ),
    );
  }
}

final topicsNavigator = Navigator(
  key: Get.nestedKey('topics')!.navigatorKey,
  initialRoute: '/topics',
  pages: [
    GetPage(name: '/topics', page: () => const TopicsPage()),
    GetPage(
      name: '/topics/:topic',
      page: () => ArticleListPage(topic: Get.parameters['topic']!),
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
  ],
  // onGenerateRoute: (settings) {
  //   final totalSections = (settings.name ?? '').split('/').length;
  //   switch (totalSections) {
  //     case 2: // Article list
  //       return GetPageRoute(
  //         settings: settings,
  //         page: () => ArticleListPage(topic: Get.parameters['topic']!),
  //       );
  //     case 3: // Article details
  //       return GetPageRoute(
  //         settings: settings,
  //         page: () => ArticleDetailsPage(
  //           topic: Get.parameters['topic']!,
  //           title: Get.parameters['article']!,
  //         ),
  //       );
  //     default:
  //       return GetPageRoute(settings: settings, page: () => const TopicsPage());
  //   }
  // },
);

final settingsNavigator = GetNavigator(
  key: Get.nestedKey('settings')!.navigatorKey,
  initialRoute: '/settings',
  pages: [
    GetPage(name: '/settings', page: () => const LoginPage()),
  ],
  // onGenerateRoute: (settings) {
  //   return GetPageRoute(settings: settings, page: () => const SettingsPage());
  // },
);
