import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pandora_front/constants.dart';

class MyNavBar extends StatelessWidget {
  final int value;
  final Function(int)? onTap;

  const MyNavBar({super.key, required this.value, required this.onTap});

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
          selectedIndex: value,
          onTabChange: onTap,
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
