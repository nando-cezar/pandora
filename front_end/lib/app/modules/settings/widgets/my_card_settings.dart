import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/settings/controllers/settings_controller.dart';
import 'package:pandora_front/app/routes/app_pages.dart';
import 'package:pandora_front/app/ui/widgets/my_dropdown.dart';
import 'package:pandora_front/constants.dart';

class MyCardSettings extends GetView<SettingsController> {
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
                color: myThirdColor,
              ),
              title: Text(
                'change_language'.tr,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () => _buildDefaultDialog()),
          Divider(
            color: Theme.of(Get.context!).colorScheme.secondary,
          ),
          ListTile(
            leading: Icon(
              Icons.data_object,
              color: myThirdColor,
            ),
            title: Text(
              'change_parameters'.tr,
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.normal,
              ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => Get.toNamed(Routes.settingsParameters),
          ),
        ],
      ),
    );
  }

  void _buildDefaultDialog() {
    Get.defaultDialog(
      title: 'change_language'.tr,
      titleStyle: const TextStyle(
        fontSize: 20,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'select_language'.tr,
            style: TextStyle(
              color: Theme.of(Get.context!).colorScheme.tertiary,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.normal,
            ),
          ),
          MyDropdown(
            controller: controller.localeController,
            options: const ['Portuguese - BR', 'English'],
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            'confirm'.tr,
            style: TextStyle(
              color: myThirdColor,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Get.updateLocale(controller.getLocale());
            Get.back(closeOverlays: true);
          },
        )
      ],
    );
  }
}
