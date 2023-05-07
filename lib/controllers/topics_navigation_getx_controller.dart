// class TopicsNavigationGetxController extends GetxController implements AppNavigationState {
//   @override
//   bool get isLoggedIn => throw UnimplementedError();

//   @override
//   bool get isUnknonwnRoute => throw UnimplementedError();

//   var _path = '/topics';
//   @override
//   String get path => _path;
//   @override
//   void setPath(String newPath) {
//     _path = newPath;
//     update();
//   }

//   List<String> get pathSegments => Uri.parse(path).pathSegments;

//   @override
//   List<Page> get pages {
//     final stack = <Page>[const MaterialPage(name: '/topics', child: TopicsPageGetxBuilder())];
//     if (pathSegments.length > 1) {
//       if (pathSegments[1] == 'create') {
//         stack.add(const MaterialPage(
//           name: '/create',
//           child: CreateItemPageGetxBuilder(title: 'Topic'),
//         ));
//       } else {
//         stack.add(MaterialPage(
//           name: path,
//           child: ArticleListPageGetxBuilder(topic: pathSegments[1]),
//         ));
//       }
//     }
//     if (pathSegments.length > 2) {
//       if (pathSegments[2] == 'create') {
//         stack.add(const MaterialPage(
//           name: '/create',
//           child: CreateItemPageGetxBuilder(title: 'Article'),
//         ));
//       } else {
//         stack.add(MaterialPage(
//           name: path,
//           child: ArticleDetailsPageGetxBuilder(
//             topic: pathSegments[1],
//             title: pathSegments[2],
//           ),
//         ));
//       }
//     }
//     return stack;
//   }
// }

import 'package:deep_linking/entities/app_route.dart';
import 'package:get/get.dart';

import '../models/topics_routes.dart';
import '../states/app_navigation_state.dart';
import 'user_getx_controller.dart';

class TopicsNavigationGetxController extends GetxController implements AppNavigationState {
  final _userController = Get.find<UserGetxController>();
  @override
  bool get isLoggedIn => _userController.isLoggedIn;

  AppRoute _currentRoute = TopicsRoutes.topics();
  @override
  AppRoute get currentRoute => _currentRoute;
  @override
  void setRoute(AppRoute route) {
    _currentRoute = route;
    update();
  }

  @override
  AppRoute getRouteForPath(String path) {
    // if (!isLoggedIn) return TopLevelRoutes.login();

    final pathSegments = Uri.parse(path).pathSegments;

    if (pathSegments.length == 1) {
      if (pathSegments[0] == 'topics') return TopicsRoutes.topics();
    }

    if (pathSegments.length == 2) {
      return TopicsRoutes.articles(pathSegments[1]);
    }

    if (pathSegments.length == 3) {
      return TopicsRoutes.article(pathSegments[1], pathSegments[2]);
    }

    return TopicsRoutes.notFound(path);
  }
}
