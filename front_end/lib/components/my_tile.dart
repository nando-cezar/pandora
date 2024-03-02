import 'package:flutter/material.dart';

import '../constants.dart';

class MyTile extends StatelessWidget {
  const MyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: myEighthColor,
        height: 80,
      ),
    );
  }
}
