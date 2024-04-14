import 'package:flutter/material.dart';

class MySelectionCard extends StatelessWidget {
  final Function()? onTapLeft;
  final Function()? onTapRight;
  final String text;

  const MySelectionCard(
      {super.key,
      required this.onTapLeft,
      required this.onTapRight,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: onTapLeft,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          Center(
            child: Card(
              elevation: 4,
              shadowColor: Colors.black,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: onTapRight,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
            ),
            child: Icon(
              Icons.arrow_forward_rounded,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
