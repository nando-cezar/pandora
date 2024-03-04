import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pandora_front/pages/home_page.dart';

import '../constants.dart';
import '../pages/map_page.dart';
import '../pages/weather_page.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  void navigatorConfig(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return widget;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myFirstColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10,
        ),
        child: GNav(
          backgroundColor: myFirstColor,
          color: myFifthColor,
          activeColor: myFifthColor,
          tabBackgroundColor: mySecondColor,
          gap: 10,
          padding: const EdgeInsets.all(15.0),
          onTabChange: (index) {
            print(index);
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Dashboard',
              onPressed: () {
              navigatorConfig(context, const HomePage());
              },
            ),
            GButton(
              icon: Icons.map,
              text: 'Map',
              onPressed: () {
                navigatorConfig(context, const MapPage());
              },
            ),
            const GButton(
              icon: Icons.emergency,
              text: 'Alert',
            ),
            GButton(
              icon: Icons.sunny,
              text: 'Weather',
              onPressed: () {
                navigatorConfig(context, const WeatherPage());
              },
            ),
            const GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
