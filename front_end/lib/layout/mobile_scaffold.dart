import 'package:flutter/material.dart';
import '../components/my_expansion_panel.dart';
import '../components/my_base_graph.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 500,
              child: MyBaseGraph(
                title: 'EXTREME EVENTS',
                subtitle: 'Prediction chart based on current location',
              ),
            ),
            MyExpansionPanel(),
          ],
        ),
      ),
    );
  }
}
