import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/extreme_event_model.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pandora_front/app/ui/widgets/base_expansion_panel.dart';
import 'package:pandora_front/constants.dart';

class MyExpansionPanel extends GetView<DashboardController> {
  const MyExpansionPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseExpansionPanel<ExtremeEventModel>(
      items: controller.dataController.getItems(),
      headerBuilder: (ExtremeEventModel model) {
        return ListTile(
          contentPadding: const EdgeInsets.all(5.0),
          title: Text(
            model.description!.tr,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: CircleAvatar(
            backgroundColor: model.color,
            child: Text(
              model.codeFormatted!.toString().tr,
              style: TextStyle(color: myFifthColor),
            ),
          ),
        );
      },
      bodyBuilder: (ExtremeEventModel model) {
        return ListTile(
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildInfoRow(
                      context,
                      'data_source:'.tr,
                      model.dataSource!.first.toString(),
                    ),
                  ),
                  Expanded(
                    child: _buildInfoRow(
                      context,
                      'medium_duration:'.tr,
                      '${model.mediumDuration?.round().toString()} ${'day_s'.tr}',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoRow(
                      context,
                      'probability_occurrence:'.tr,
                      'Ind: ${model.probabilityOccurrence![0].roundToDouble()}% - Rel: ${model.probabilityOccurrence![1].roundToDouble()}%',
                    ),
                  ),
                  Expanded(
                    child: _buildInfoRow(
                      context,
                      'total_location_records:'.tr,
                      model.totalLocationRecords.toString(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildInfoRow(
                      context,
                      'region_greatest_recurrence:'.tr,
                      model.regionGreatestRecurrences![0].region.toString().tr,
                    ),
                  ),
                  Expanded(
                    child: _buildInfoRow(
                      context,
                      'total_recurrence:'.tr,
                      model.totalRecurrence.toString(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      expansionCallback: (int index, bool isExpanded) {
        controller.dataController.getItem(index).isExpanded = isExpanded;
      },
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
