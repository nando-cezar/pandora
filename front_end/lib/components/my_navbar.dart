import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants.dart';
import '../controller/pages_controller.dart';

class MyNavBar extends StatelessWidget {
  final _controller = Get.put(PagesController());
  final int value;

  MyNavBar({super.key, required this.value});

  bool verifyActive(int target) {
    return value == target;
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
          haptic: true,
          backgroundColor: myFirstColor,
          color: myFifthColor,
          activeColor: myFifthColor,
          tabBackgroundColor: mySecondColor,
          gap: 10,
          padding: const EdgeInsets.all(15.0),
          selectedIndex: _controller.index.value,
          onTabChange: (index) {
            _controller.index.value = index;
          },
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Dashboard',
              active: verifyActive(0),
            ),
            GButton(
              icon: Icons.map,
              text: 'Map',
              active: verifyActive(1),
            ),
            GButton(
              icon: Icons.emergency,
              text: 'Alert',
              active: verifyActive(2),
            ),
            GButton(
              icon: Icons.sunny,
              text: 'Weather',
              active: verifyActive(3),
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
              active: verifyActive(4),
            ),
          ],
        ),
      ),
    );
  }
}
