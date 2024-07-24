import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/auth/controllers/auth_controller.dart';
import 'package:pandora_front/app/routes/app_pages.dart';

class MyDrawer extends GetView<AuthController> {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(Get.context!).colorScheme.primary,
      child: Column(
        children: [
          DrawerHeader(
            child:
                Image.asset('assets/images/pandora.png', width: 50, height: 50),
          ),
          GestureDetector(
            onTap: () => Get.offAllNamed(Routes.dashboard),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                'dashboard'.tr,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.offAllNamed(Routes.worldMap),
            child: ListTile(
              leading: const Icon(Icons.map),
              title: Text(
                'map'.tr,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.offAllNamed(Routes.forecastWeather),
            child: ListTile(
              leading: const Icon(Icons.sunny),
              title: Text(
                'weather'.tr,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {},
            child: const ListTile(
              leading: Icon(Icons.newspaper),
              title: Text(
                'N O T I C I A S',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Get.offAllNamed(Routes.settings),
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                'settings'.tr,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _signUserOut,
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: Text(
                'logout'.tr,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _signUserOut() async {
    await controller.signOut();
    Get.offAllNamed(Routes.initial);
  }
}
