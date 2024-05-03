import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_bargraph.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/my_piegraph.dart';
import 'package:pandora_front/constants.dart';

class BaseGraph extends GetView<DashboardController> {
  final String title;
  final String subtitle;

  const BaseGraph({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              color: Theme.of(context).colorScheme.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: myActiveColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          TabBar(
            indicatorColor: Theme.of(context).colorScheme.secondary,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.graphic_eq,
                  color: myFirstColor,
                  size: 20.0,
                ),
                child: Text(
                  'chance_of_occurrence'.tr,
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
                  'highest_recurrence'.tr,
                  style: TextStyle(
                    color: myFirstColor,
                    fontSize: 14.0,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: TabBarView(
              children: [
                MyBarGraph(
                  controller: controller,
                ),
                MyPieGraph(
                  controller: controller,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
