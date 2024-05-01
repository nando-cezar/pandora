import 'package:flutter/material.dart';
import 'package:pandora_front/constants.dart';

class MySquareTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const MySquareTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: myFifthColor),
          borderRadius: BorderRadius.circular(16),
          color: mySeventhColor,
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}