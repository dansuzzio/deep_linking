import '../entities/app_route.dart';

abstract interface class AppNavigationState {
  // GlobalKey<NavigatorState> get key;
  // bool get isLoggedIn;
  AppRoute get currentRoute;
  void goTo(AppRoute route);
  AppRoute getRouteForPath(String? path);
}
