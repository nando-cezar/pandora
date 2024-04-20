import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/pages_controller.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final _controller = Get.put(PagesController());
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Column(
        children: [
          DrawerHeader(
            child:
                Image.asset('assets/images/pandora.png', width: 50, height: 50),
          ),
          GestureDetector(
            onTap: () {
              _navigatorConfig(0);
            },
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text('D A S H B O A R D'),
            ),
          ),
          GestureDetector(
            onTap: () {
              _navigatorConfig(1);
            },
            child: const ListTile(
              leading: Icon(Icons.map),
              title: Text('M A P'),
            ),
          ),
          GestureDetector(
            onTap: () {
              _navigatorConfig(3);
            },
            child: const ListTile(
              leading: Icon(Icons.sunny),
              title: Text('W E A T H E R'),
            ),
          ),
          GestureDetector(
            onTap: () {
              _navigatorConfig(4);
            },
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text('S E T T I N G S'),
            ),
          ),
          GestureDetector(
            onTap: _signUserOut,
            child: const ListTile(
              leading: Icon(Icons.logout),
              title: Text('L O G O U T'),
            ),
          )
        ],
      ),
    );
  }

  void _signUserOut() {
    FirebaseAuth.instance.signOut();
    Get.toNamed('/auth');
  }

  void _navigatorConfig(int index) {
    _controller.updateIndex(index);
    Get.back();
  }
}
