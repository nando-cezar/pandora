import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/base_graph.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_expansion_panel.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: context.height * 70 / 100,
            child: BaseGraph(
              title: 'title'.tr,
              subtitle: 'subtitle'.tr,
            ),
          ),
          const MyExpansionPanel(),
        ],
      ),
    );
  }
}
