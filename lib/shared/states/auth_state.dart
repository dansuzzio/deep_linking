abstract class AuthState {
  late bool isLoggedIn;
  Future<void> initialize();
  Future<void> login();
  Future<void> logout();
}
