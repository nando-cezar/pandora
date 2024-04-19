import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants.dart';
import '../controller/pages_controller.dart';

class MyNavBar extends StatelessWidget {
  MyNavBar({super.key, required this.value});

  final int value;
  final _controller = Get.put(PagesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myFirstColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 5.0,
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
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
            ),
            GButton(
              icon: Icons.map,
              text: 'Map',
              active: verifyActive(1),
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
            ),
            GButton(
              icon: Icons.emergency,
              text: 'Alert',
              active: verifyActive(2),
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
            ),
            GButton(
              icon: Icons.sunny,
              text: 'Weather',
              active: verifyActive(3),
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 5.0,
                vertical: 10.0,
              ),
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
              active: verifyActive(4),
              padding: const EdgeInsetsDirectional.all(10),
            ),
          ],
        ),
      ),
    );
  }

  bool verifyActive(int target) {
    return value == target;
  }
}
