import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(LocalStorageKeys key, bool value) async {
    return _sharedPreferences.setBool(key.name, value);
  }

  static bool? getBool(LocalStorageKeys key) {
    return _sharedPreferences.getBool(key.name);
  }

  static Future<bool> delete(LocalStorageKeys key) {
    return _sharedPreferences.remove(key.name);
  }
}

enum LocalStorageKeys { isLoggedIn }
