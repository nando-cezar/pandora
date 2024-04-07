import 'package:flutter/material.dart';

import '../constants.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: myFifthColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: mySixthColor),
            ),
            fillColor: mySeventhColor,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: myEighthColor)),
      ),
    );
  }
}