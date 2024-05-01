import 'package:flutter/material.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/base_graph.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_expansion_panel.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_dashboard_map.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 500,
                  child: BaseGraph(
                    title: 'EXTREME EVENTS',
                    subtitle: 'Prediction chart based on current location',
                  ),
                ),
                MyExpansionPanel(),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: MyDashboardMap(),
        ),
      ],
    );
  }
}
