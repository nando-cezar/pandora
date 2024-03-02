import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants.dart';


class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GNav(
      backgroundColor: myFirstColor,
      color: myFifthColor,
      activeColor: myFifthColor,
      tabBackgroundColor: mySecondColor,
      gap: 8,
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
    );
  }
}
