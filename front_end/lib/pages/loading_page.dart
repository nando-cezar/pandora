import 'package:flutter/material.dart';

import '../constants.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pandora.png',
              height: 100,
            ),

            const SizedBox(height: 20),

            Text(
              'PANDORA',
              style: TextStyle(
                color: myTenthColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Loading...',
              style: TextStyle(
                color: myNinthColor,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            CircularProgressIndicator(
              color: myFirstColor,
            ),
          ],
        ),
      ),
    );
  }
}
