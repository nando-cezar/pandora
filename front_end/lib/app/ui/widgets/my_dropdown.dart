import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDropdown extends StatelessWidget {
  final TextEditingController controller;
  final List<String> options;

  const MyDropdown({
    super.key,
    required this.controller,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      controller: controller,
      width: 250,
      dropdownMenuEntries:
          options.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
      hintText: 'select'.tr,
    );
  }
}
