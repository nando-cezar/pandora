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
      child: GetPlatform.isMobile
          ? _buildMobileProfile(context)
          : _buildDesktopProfile(context),
    );
  }

  Widget _buildDesktopProfile(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(
                controller.user.displayName!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
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
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    controller.user.email!,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 20),
                  Text(
                    'ID:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    controller.user.uid!,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    'Account creation date:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm:ss')
                        .format(controller.user.creationTime),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 20),
                  Text(
                    'Last login date:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm:ss')
                        .format(controller.user.lastSignInTime),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    'Current location:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Salvador - BA, Brazil',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    'Number of alerts issued:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '100',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(width: 20),
                  Text(
                    'Date of last alert issuance:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '25/05/1997 - 3:00 PM',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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

  Widget _buildMobileProfile(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(
                controller.user.displayName!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
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
                    'ID:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    controller.user.uid!,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    'E-mail:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    controller.user.email!,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    'Account creation date:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm:ss')
                        .format(controller.user.creationTime),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    'Last login date:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('dd/MM/yyyy HH:mm:ss')
                        .format(controller.user.lastSignInTime),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    'Current location:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Salvador - BA, Brazil',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    'Number of alerts issued:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '100',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
                    'Date of last alert issuance:',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '25/05/1997 - 3:00 PM',
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
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
