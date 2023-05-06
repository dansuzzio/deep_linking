import '../entities/app_route.dart';

// abstract class AppNavigationState {
//   String get path;
//   void setPath(String newPath);
//   bool get isLoggedIn;
//   bool get isUnknonwnRoute;
//   List<Page> get pages;
// }
abstract class AppNavigationState {
  bool get isLoggedIn;
  AppRoute get currentRoute;
  void setRoute(AppRoute route);
  AppRoute getRouteForPath(String path);
}
