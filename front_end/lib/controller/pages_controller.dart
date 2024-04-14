import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/map_page_new.dart';
import '../pages/settings_page.dart';
import '../pages/home_page.dart';
import '../pages/weather_page.dart';

class PagesController extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const HomePage(),
    const MapPage(),
    const Scaffold(),
    WeatherPage(),
    const SettingsPage(),
  ];
}
