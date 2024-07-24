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
          return _buildProfileContent(context);
        },
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                controller.user.displayName!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(controller.user.photoURL!),
              ),
            ),
            _buildInfoRow(
              context,
              'E-mail:',
              controller.user.email!,
            ),
            _buildInfoRow(
              context,
              'account_creation_date:'.tr,
              DateFormat('dd/MM/yyyy HH:mm:ss').format(controller.user.creationTime),
            ),
            _buildInfoRow(
              context,
              'last_login_date:'.tr,
              DateFormat('dd/MM/yyyy HH:mm:ss').format(controller.user.lastSignInTime),
            ),
            _buildInfoRow(
              context,
              'current_location:'.tr,
              'Salvador - BA, Brazil',
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return ListTile(
      title: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              value,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}