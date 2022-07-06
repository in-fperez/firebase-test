import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences _instance;

  static Future<SharedPreferences> init() async => _instance = await SharedPreferences.getInstance();

  static bool? getBool(String key) => _instance.getBool(key);

  static Future<bool> setBool(String key, bool value) => _instance.setBool(key, value);
}
