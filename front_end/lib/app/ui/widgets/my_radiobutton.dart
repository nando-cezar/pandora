import 'package:flutter/material.dart';
import 'package:pandora_front/constants.dart';

class MyRadioButton extends StatefulWidget {
  final TextEditingController controller;
  final List<String> options;
  final String initialValue;

  const MyRadioButton({
    super.key,
    required this.controller,
    required this.options,
    required this.initialValue,
  });

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: SingleChildScrollView(
        child: Column(
          children: widget.options.map((option) {
            return ListTile(
              title: Text(option),
              leading: Radio<String>(
                value: option,
                groupValue: widget.controller.text,
                onChanged: (String? value) {
                  setState(() {
                    widget.controller.text = value!;
                  });
                },
                activeColor: myThirdColor,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
