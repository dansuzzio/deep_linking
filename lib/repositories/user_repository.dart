import 'local_storage.dart';

abstract class UserRepository {
  static bool get isLoggedIn => LocalStorage.getBool(LocalStorageKeys.isLoggedIn) ?? false;

  static Future<void> login() => LocalStorage.setBool(LocalStorageKeys.isLoggedIn, true);

  static Future<void> logout() => LocalStorage.delete(LocalStorageKeys.isLoggedIn);
}
