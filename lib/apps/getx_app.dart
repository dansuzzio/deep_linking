import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../builders/article_details_page_getx_builder.dart';
import '../builders/article_list_page_getx_builder.dart';
import '../builders/create_item_page_getx_builder.dart';
import '../builders/login_page_getx_builder.dart';
import '../builders/settings_page_getx_builder.dart';
import '../builders/topics_page_getx_builder.dart';

class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Linking',
      getPages: [
        GetPage(name: '/login', page: () => const LoginPageGetxBuilder()),
      ],
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => Scaffold(appBar: AppBar(title: const Text('Unknown route'))),
      ),
    );
  }
}

final topicsNavigator = Navigator(
  key: Get.nestedKey(1),
  onPopPage: (route, result) => route.didPop(result),
  onGenerateRoute: (settings) {
    final routeName = settings.name;
    if (routeName == '/create') {
      return GetPageRoute(
        settings: settings,
        page: () => CreateItemPageGetxBuilder(title: settings.arguments as String),
      );
    }
    final sections = (routeName ?? '').split('/');
    switch (sections.length) {
      case 3: // Article list
        return GetPageRoute(
          settings: settings,
          page: () => ArticleListPageGetxBuilder(topic: sections.last),
        );
      case 4: // Article details
        return GetPageRoute(
          settings: settings,
          page: () => ArticleDetailsPageGetxBuilder(
            topic: sections[2],
            title: sections.last,
          ),
        );
      default:
        return GetPageRoute(settings: settings, page: () => const TopicsPageGetxBuilder());
    }
  },
);

final settingsNavigator = Navigator(
  key: Get.nestedKey(2),
  onPopPage: (route, result) => route.didPop(result),
  onGenerateRoute: (settings) {
    return GetPageRoute(settings: settings, page: () => const SettingsPageGetxBuilder());
  },
);
