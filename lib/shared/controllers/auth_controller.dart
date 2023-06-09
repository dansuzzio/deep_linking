import '../repositories/auth_repository.dart';
import '../states/auth_state.dart';

class AuthController implements AuthState {
  bool _isLoggedIn = false;
  @override
  bool get isLoggedIn => _isLoggedIn;
  @override
  set isLoggedIn(bool value) {
    _isLoggedIn = value;
  }

  @override
  Future<void> fetchAuthState() async {
    // await Future<void>.delayed(const Duration(seconds: 1));
    isLoggedIn = await AuthRepository.isLoggedIn;
  }

  @override
  Future<void> login() async {
    AuthRepository.login();
    isLoggedIn = true;
  }

  @override
  Future<void> logout() async {
    AuthRepository.logout();
    isLoggedIn = false;
  }
}
