import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/settings/controllers/settings_controller.dart';

class MyDropdown extends GetView<SettingsController> {
  const MyDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: 250,
      onSelected: (String? value) {
        controller.changeLocale(value!);
      },
      dropdownMenuEntries: controller.list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
      hintText: 'select'.tr,
    );
  }
}
