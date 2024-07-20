import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pandora_front/constants.dart';

class MessagePage extends StatelessWidget {
  final String message;

  const MessagePage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg/bg_pandora.jpg'),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'P A N D O R A',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                shadows: [
                  Shadow(
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: myTenthColor!,
                  ),
                ],
              ),
            ).animate()
            .fadeIn(duration: 600.ms)
            .slide(),

            const SizedBox(height: 10),

            Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                shadows: [
                  Shadow(
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: myTenthColor!,
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
