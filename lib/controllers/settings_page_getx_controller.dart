import 'package:get/get.dart';

import '../repositories/user_repository.dart';
import '../states/settings_page_state.dart';

class SettingsPageGetxController extends GetxController implements SettingsPageState {
  @override
  Future<void> logout() async {
    await UserRepository.logout();
    Get.offAllNamed('/login');
  }
}
