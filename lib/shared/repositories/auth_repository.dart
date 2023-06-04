import 'local_storage.dart';

abstract class AuthRepository {
  static Future<bool> get isLoggedIn async => LocalStorage.getBool(LocalStorageKeys.isLoggedIn) ?? false;

  static Future<void> login() async => LocalStorage.setBool(LocalStorageKeys.isLoggedIn, true);

  static Future<void> logout() async => LocalStorage.delete(LocalStorageKeys.isLoggedIn);
}
