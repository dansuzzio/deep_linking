import 'package:get/get.dart';

import '../repositories/user_repository.dart';
import '../states/user_state.dart';

class UserGetxController extends GetxController implements UserState {
  final _isLoggedIn = false.obs;
  @override
  bool get isLoggedIn => _isLoggedIn.value;
  @override
  set isLoggedIn(bool value) {
    _isLoggedIn.value = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    _isLoggedIn.value = await UserRepository.isLoggedIn;
  }
}
