import 'package:get/get.dart';

import '../models/top_level_routes.dart';
import '../repositories/user_repository.dart';
import '../states/app_navigation_state.dart';
import '../states/settings_page_state.dart';
import '../states/user_state.dart';

class SettingsPageGetxController extends GetxController implements SettingsPageState {
  final AppNavigationState navigation;
  final UserState userState;

  SettingsPageGetxController({required this.navigation, required this.userState});

  @override
  Future<void> logout() async {
    await UserRepository.logout();
    userState.isLoggedIn = false;
    // navigation.setPath('/login');
    navigation.setRoute(TopLevelRoutes.login());
  }
}
