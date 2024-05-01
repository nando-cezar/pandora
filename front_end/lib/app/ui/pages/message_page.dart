import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  final String message;

  const MessagePage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.white],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'P A N D O R A',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
