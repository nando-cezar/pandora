import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Roboto',
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.grey.shade100,
    secondary: Colors.grey.shade500,
    tertiary: Colors.grey.shade900,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Roboto',
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    tertiary: Colors.grey.shade200,
  ),
);
