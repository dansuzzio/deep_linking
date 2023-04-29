import 'package:get/get.dart';

import '../repositories/user_repository.dart';
import '../states/login_page_state.dart';

class LoginPageGetxController extends GetxController implements LoginPageState {
  @override
  Future<void> login() async {
    try {
      UserRepository.login();
      Get.offAllNamed('/home');
    } catch (error) {
      print(error);
    }
  }
}
