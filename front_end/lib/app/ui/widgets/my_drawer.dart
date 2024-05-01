import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';
import 'package:pandora_front/app/routes/app_pages.dart';

class MyDrawer extends GetView<AuthController> {
  const MyDrawer({super.key});

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
            onTap: () => Get.offAllNamed(Routes.dashboard),
            child: const ListTile(
              leading: Icon(Icons.home),
              title: Text('D A S H B O A R D'),
            ),
          ),
          GestureDetector(
            onTap: () => Get.offAllNamed(Routes.worldMap),
            child: const ListTile(
              leading: Icon(Icons.map),
              title: Text('M A P'),
            ),
          ),
          GestureDetector(
            onTap: () => Get.offAllNamed(Routes.forecastWeather),
            child: const ListTile(
              leading: Icon(Icons.sunny),
              title: Text('W E A T H E R'),
            ),
          ),
          GestureDetector(
            onTap: () => Get.offAllNamed(Routes.settings),
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
    controller.signOut();
    Get.offAllNamed(Routes.initial);
  }
}
