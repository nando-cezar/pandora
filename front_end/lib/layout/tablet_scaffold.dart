import 'package:flutter/material.dart';
import '../components/my_expansion_panel.dart';
import '../components/my_base_graph.dart';

class TableScaffold extends StatefulWidget {
  const TableScaffold({super.key});

  @override
  State<TableScaffold> createState() => _TableScaffoldState();
}

class _TableScaffoldState extends State<TableScaffold> {
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
