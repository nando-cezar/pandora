import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  State<MyDropdown> createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: 250,
      initialSelection: list.first,
      onSelected: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
