import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  SharedPreferences? _sharedPreferences;

  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _sharedPreferences?.setString(key, value);
  }

  String? getString(String key, {String? defaultValue}) {
    return _sharedPreferences?.getString(key) ?? defaultValue;
  }

  Future<void> saveBool(String key, bool value) async {
    await _sharedPreferences?.setBool(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _sharedPreferences?.getBool(key) ?? defaultValue;
  }

  Future<void> saveInt(String key, int value) async {
    await _sharedPreferences?.setInt(key, value);
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _sharedPreferences?.getInt(key) ?? defaultValue;
  }

  Future<void> saveDouble(String key, double value) async {
    await _sharedPreferences?.setDouble(key, value);
  }

  double getDouble(String key, {double defaultValue = 0.0}) {
    return _sharedPreferences?.getDouble(key) ?? defaultValue;
  }

  Future<void> saveList(String key, List<String> value) async {
    await _sharedPreferences?.setStringList(key, value);
  }

  List<String> getList(String key, {List<String> defaultValue = const []}) {
    return _sharedPreferences?.getStringList(key) ?? defaultValue;
  }

  Future<void> remove(String key) async {
    await _sharedPreferences?.remove(key);
  }
}
