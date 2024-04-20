import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/dashboard/dashboard_view.dart';
import '../pages/map/map_view.dart';
import '../pages/settings/settings_view.dart';
import '../pages/weather/weather_view.dart';

class PagesController extends GetxController {
  final RxInt _index = 0.obs;
  final _pages = [
    const DashboardPage(),
    const MapPage(),
    const Scaffold(),
    Weather(),
    const SettingsPage(),
  ];

  void updateIndex(int data){
    _index.value = data;
  }

  int getIndex() => _index.value;

  Widget getPage(int i) => _pages[i];
}
