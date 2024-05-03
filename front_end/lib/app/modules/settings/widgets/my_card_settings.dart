import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/routes/app_pages.dart';
import 'package:pandora_front/app/ui/widgets/my_dropdown.dart';
import 'package:pandora_front/constants.dart';

class MyCardSettings extends StatelessWidget {
  const MyCardSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              FontAwesomeIcons.language,
              color: myFirstColor,
            ),
            title: Text(
              'change_language'.tr,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => _buildDefaultDialog(context)
          ),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
          ListTile(
            leading: Icon(
              Icons.data_object,
              color: myFirstColor,
            ),
            title: Text(
              'change_parameters'.tr,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => Get.toNamed(Routes.settingsParameters),
          ),
        ],
      ),
    );
  }

  void _buildDefaultDialog(BuildContext context) {
    Get.defaultDialog(
      title: 'change_language'.tr,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'select_language'.tr,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const MyDropdown(),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'cancel'.tr,
            style: TextStyle(color: myFirstColor),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text(
            'confirm'.tr,
            style: TextStyle(color: myFirstColor),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}