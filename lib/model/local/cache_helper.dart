import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required bool isLogged}) async {
    return await sharedPreferences.setBool(key, isLogged);
  }

  static bool? getData({required String key}) {
    return sharedPreferences.getBool(key);
  }

  static Future<bool?> clear() async {
    return await sharedPreferences.clear();
  }
}
