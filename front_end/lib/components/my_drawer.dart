import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../pages/home_page.dart';
import '../pages/map_page.dart';
import '../pages/weather_page.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

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
    return Drawer(
      backgroundColor: myFifthColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/images/pandora.png',
              width: 50,
              height: 50
            ),
          ),
          GestureDetector(
            onTap: () {
              navigatorConfig(context, const HomePage());
            },
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text('D A S H B O A R D'),
            ),
          ),
          GestureDetector(
            onTap: () {
              navigatorConfig(context, const MapPage());
            },
            child: const ListTile(
              leading: Icon(Icons.map),
              title: Text('M A P'),
            ),
          ),
          GestureDetector(
            onTap: () {
              navigatorConfig(context, const WeatherPage());
            },
            child: const ListTile(
              leading: Icon(Icons.sunny),
              title: Text('W E A T H E R'),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text('S E T T I N G S'),
            ),
          ),
          GestureDetector(
            onTap: signUserOut,
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text('L O G O U T'),
            ),
          )
        ],
      ),
    );
  }
}
