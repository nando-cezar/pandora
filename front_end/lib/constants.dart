import 'package:flutter/material.dart';


Color myFirstColor = const Color.fromRGBO(29, 29, 29, 1);

Color mySecondColor = const Color.fromRGBO(54, 54, 54, 1);

Color myThirdColor = const Color.fromRGBO(30,144,255, 1);

Color myFifthColor = Colors.white;

Color mySixthColor = Colors.grey.shade400;

Color mySeventhColor = Colors.grey.shade200;

Color? myEighthColor = Colors.grey[500];

Color? myNinthColor = Colors.grey[700];

Color? myTenthColor = Colors.grey[900];

Color myActiveColor = Colors.pink;

var myAppBar = ({void Function()? onPressed, List<Widget>? actions}) => AppBar(
      iconTheme: IconThemeData(color: myFifthColor),
      backgroundColor: myFirstColor,
      title: TextButton(
        onPressed: onPressed,
        child: Text(
          'P A N D O R A®',
          style: TextStyle(
            color: myFifthColor,
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      centerTitle: true,
      actions: actions,
    );