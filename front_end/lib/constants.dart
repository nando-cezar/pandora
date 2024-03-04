import 'package:flutter/material.dart';

Color myFirstColor = const Color.fromRGBO(38, 103, 255, 1);

Color mySecondColor = const Color.fromRGBO(63, 142, 252, 1);

Color myThirdColor = const Color.fromRGBO(135, 191, 255, 1);

Color myFourthColor = const Color.fromRGBO(173, 215, 246, 1);

Color myFifthColor = Colors.white;

Color mySixthColor = Colors.grey.shade400;

Color mySeventhColor = Colors.grey.shade200;

Color? myEighthColor = Colors.grey[500];

Color? myNinthColor = Colors.grey[700];

Color? myTenthColor = Colors.grey[900];

Color myActiveColor = Colors.pink;

Color myPassiveColor = Colors.amber;

var myAppBar = AppBar(
  iconTheme: IconThemeData(color: myFifthColor),
  backgroundColor: myFirstColor,
  title: Text(
    'P A N D O R A®',
    style: TextStyle(
      color: myFifthColor,
      fontSize: 20,
    ),
  ),
  centerTitle: true,
);
