import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/my_expansion_panel.dart';
import '../components/my_base_graph.dart';
import '../pages/map_page.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: GetPlatform.isMobile
                        ? 500
                        : 700,
                    child: const MyBaseGraph(
                      title: 'EXTREME EVENTS',
                      subtitle: 'Prediction chart based on current location',
                    ),
                  ),
                  MyExpansionPanel(),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Column(
              children: [
                Expanded(
                  child: MapPage(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
