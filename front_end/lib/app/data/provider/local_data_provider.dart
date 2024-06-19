import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataProvider {
  static final _logger = Logger();
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  saveString(String key, String value) {
    _prefs.setString(key, value);
    _logger.i("LocalDataProvider: Save string successfully!");
  }

  String getString(String key) {
    _logger.i("LocalDataProvider: Get string successfully!");
    return _prefs.getString(key) ?? "Empty";
  }

  saveInt(String key, int value) {
    _prefs.setInt(key, value);
    _logger.i("LocalDataProvider: Save int successfully!");
  }

  int getInt(String key) {
    _logger.i("LocalDataProvider: Get int successfully!");
    return _prefs.getInt(key) ?? 1;
  }

  saveDouble(String key, double value) {
    _prefs.setDouble(key, value);
    _logger.i("LocalDataProvider: Save double successfully!");
  }

  double getDouble(String key) {
    _logger.i("LocalDataProvider: Get double successfully!");
    return _prefs.getDouble(key) ?? 1.0;
  }
}