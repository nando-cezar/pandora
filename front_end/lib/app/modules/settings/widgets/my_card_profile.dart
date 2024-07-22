import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pandora_front/app/modules/settings/controllers/settings_controller.dart';

class MyCardProfile extends StatelessWidget {
  const MyCardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: Theme.of(context).colorScheme.primary,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (GetPlatform.isMobile) {
              return _buildMobileProfile();
            } else if (constraints.maxWidth < 800) {
              return _buildMobileProfile();
            } else {
              return _buildDesktopProfile();
            }
          },
        ));
  }

  Widget _buildDesktopProfile() {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(
                controller.user.displayName!,
                style: TextStyle(
                  color: Theme.of(Get.context!).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(controller.user.photoURL!),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    'E-mail:',
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    controller.user.email!,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    'account_creation_date:'.tr,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm:ss')
                        .format(controller.user.creationTime),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 20),
                  Text(
                    'last_login_date:'.tr,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm:ss')
                        .format(controller.user.lastSignInTime),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text(
                    'current_location:'.tr,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Salvador - BA, Brazil',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMobileProfile() {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(
                controller.user.displayName!,
                style: TextStyle(
                  color: Theme.of(Get.context!).colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(controller.user.photoURL!),
              ),
            ),
            ListTile(
              title: Column(
                children: [
                  Text(
                    'E-mail:',
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    controller.user.email!,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Column(
                children: [
                  Text(
                    'account_creation_date:'.tr,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm:ss')
                        .format(controller.user.creationTime),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Column(
                children: [
                  Text(
                    'last_login_date:'.tr,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm:ss')
                        .format(controller.user.lastSignInTime),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Column(
                children: [
                  Text(
                    'current_location:'.tr,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Salvador - BA, Brazil',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(Get.context!).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
