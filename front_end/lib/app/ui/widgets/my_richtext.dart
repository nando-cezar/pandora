import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  final String title;
  final String content;

  const MyRichText({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(
            text: '$title\n',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: content,
          ),
        ],
      ),
    );
  }
}
