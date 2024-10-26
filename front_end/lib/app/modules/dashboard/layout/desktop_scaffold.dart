import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/base_graph.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_expansion_panel.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_dashboard_map.dart';

class DesktopScaffold extends StatelessWidget {
  const DesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 700,
                  child: BaseGraph(
                    title: 'title'.tr,
                    subtitle: 'subtitle'.tr,
                  ),
                ),
                const MyExpansionPanel(),
              ],
            ),
          ),
        ),
        const Expanded(
          flex: 2,
          child: MyDashboardMap(),
        ),
      ],
    );
  }
}
