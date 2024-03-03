import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

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
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.settings,
              text: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
