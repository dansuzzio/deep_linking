abstract class AppNavigationState {
  String get routePath;
  void setPath(String path);
  bool get isLoggedIn;
  bool get isUnknonwnRoute;
}
