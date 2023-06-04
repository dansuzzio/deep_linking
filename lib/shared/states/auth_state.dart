abstract class AuthState {
  late bool isLoggedIn;
  Future<void> fetchAuthState();
  Future<void> login();
  Future<void> logout();
}
