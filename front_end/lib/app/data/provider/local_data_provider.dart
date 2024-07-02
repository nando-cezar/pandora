import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataProvider {
  static final _logger = Logger();
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _logger.i("LocalDataProvider: Initialized SharedPreferences.");
  }

  void saveString(String key, String value) {
    _prefs.setString(key, value);
    _logSaved(key);
  }

  String getString(String key) {
    _logRetrieved(key);
    return _prefs.getString(key) ?? "";
  }

  void saveInt(String key, int value) {
    _prefs.setInt(key, value);
    _logSaved(key);
  }

  int getInt(String key) {
    _logRetrieved(key);
    return _prefs.getInt(key) ?? 1;
  }

  void saveDouble(String key, double value) {
    _prefs.setDouble(key, value);
    _logSaved(key);
  }

  double getDouble(String key) {
    _logRetrieved(key);
    return _prefs.getDouble(key) ?? 1.0;
  }

  void _logSaved(String key) {
    _logger.i("LocalDataProvider: Saved $key successfully!");
  }

  void _logRetrieved(String key) {
    _logger.i("LocalDataProvider: Retrieved $key successfully!");
  }
}