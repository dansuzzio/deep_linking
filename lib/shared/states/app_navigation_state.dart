import '../entities/app_route.dart';

abstract interface class AppNavigationState {
  // GlobalKey<NavigatorState> get key;
  // bool get isLoggedIn;
  AppRoute get currentRoute;
  // String? get savedLocation;
  AppRoute? get savedRoute;
  List<String> get pathSegments;
  void goTo(AppRoute route, {List<String>? segments});
  AppRoute getRouteForPath(String? path);
}
