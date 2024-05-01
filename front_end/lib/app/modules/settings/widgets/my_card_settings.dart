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
              "Change Language",
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
              "Change Parameters",
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
      title: 'Change Language',
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Language',
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
            "Cancel",
            style: TextStyle(color: myFirstColor),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        TextButton(
          child: Text(
            "Confirm",
            style: TextStyle(color: myFirstColor),
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
