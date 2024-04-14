import 'package:flutter/material.dart';
import 'package:pandora_front/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if(_themeData == lightMode){
      themeData = darkMode;
    }else{
      themeData = lightMode;
    }
  }

  String getMapStyle() {
    return _themeData == lightMode
        ? 'assets/images/map/map_light.json'
        : 'assets/images/map/map_dark.json';
  }
}