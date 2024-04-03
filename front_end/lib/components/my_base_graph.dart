import 'package:flutter/material.dart';

import '../constants.dart';
import 'my_bargraph.dart';
import 'my_piegraph.dart';

class MyBaseGraph extends StatelessWidget {
  const MyBaseGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),
              Text(
                'EXTREME EVENTS',
                style: TextStyle(
                  color: myActiveColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Prediction chart based on current location',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        body: Column(

          mainAxisSize: MainAxisSize.max,
          children: [
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.graphic_eq,
                    color: myFirstColor,
                    size: 20.0,
                  ),
                  child: Text(
                    'Chance of Occurrence',
                    style: TextStyle(
                      color: myFirstColor,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.auto_graph,
                    color: myFirstColor,
                    size: 20.0,
                  ),
                  child: Text(
                    'Highest Recurrence',
                    style: TextStyle(
                      color: myFirstColor,
                      fontSize: 14.0,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: TabBarView(
                children: [
                  MyBarGraph(),
                  MyPieGraph(),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
