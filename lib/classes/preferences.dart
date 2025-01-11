import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  late final SharedPreferences _preferences;

  Preferences() {
    _preferencesInitialize();
  }

  Future<void> _preferencesInitialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> _checkPreferences(String key) async {
    return _preferences.containsKey(key);
  }

  Future<double> getData(String key) async {
    if (await _checkPreferences(key)) {
      return _preferences.getDouble(key)!;
    }
    return 0.0;
  }

  Future<void> setData(String key, double value) async {
    await _preferences.setDouble(key, value);
  }
}
