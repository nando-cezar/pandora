import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/extreme_event_model.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/base_expansion_panel.dart';
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
          title: Text(model.description!),
          leading: CircleAvatar(
            backgroundColor: model.color,
            child: Text(
              model.codeFormatted.toString(),
              style: TextStyle(color: myFifthColor),
            ),
          ),
        );
      },
      bodyBuilder: (ExtremeEventModel model) {
        return ListTile(
          subtitle: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Data source:',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                            Text(
                              model.dataSource!.first.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Medium Duration:',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        Text(
                          '${model.mediumDuration?.round().toString()} day(s)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Probability Occurrence:',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        Text(
                          'Ind: ${model.probabilityOccurrence?[0].roundToDouble().toString()}% - '
                          'Rel: ${model.probabilityOccurrence?[1].roundToDouble().toString()}%',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Total Location Records:',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        Text(
                          model.totalLocationRecords.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Region Greatest Recurrence:',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        Text(
                          model.regionGreatestRecurrences![0].region.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Total Recurrence:',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        Text(
                          model.totalRecurrence.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
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
}
