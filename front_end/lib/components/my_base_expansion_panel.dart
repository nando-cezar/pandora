import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../controller/extreme_event_controller.dart';
import '../../model/extreme_event _model.dart';


class MyBaseExpansionPanel extends StatelessWidget {
  const MyBaseExpansionPanel({super.key});

  final ExtremeEventController _controllerExtremeEvent =
  Get.put(ExtremeEventController());

  @override
  Widget build(BuildContext context) {
    return MyExpansionPanel<ExtremeEventModel>(
      items: _controllerExtremeEvent.items,
      headerBuilder: (ExtremeEventModel model) {
        return ListTile(
          contentPadding: const EdgeInsets.all(5.0),
          title: Text(model.description),
          leading: CircleAvatar(
            backgroundColor: myActiveColor,
            child: Text(
              model.code_formatted.toString(),
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
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          'Data source: ${model.data_source.first}',
                          style: TextStyle(
                            color: myTenthColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          'Medium Duration: ${model.medium_duration.floorToDouble().toString()} dia(s)',
                          style: TextStyle(
                            color: myTenthColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Probability Occurrence: ${model.probability_occurrence.floorToDouble().toString()} %',
                          style: TextStyle(
                              color: myTenthColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Total Location Records: ${model.total_location_records.toString()}',
                          style: TextStyle(
                              color: myTenthColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          'Total Recurrence: ${model.total_recurrence.toString()}',
                          style: TextStyle(
                              color: myTenthColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      expansionCallback: (int index, bool isExpanded) {
        _controllerExtremeEvent.items[index].isExpanded =
            isExpanded;
      },
    );
  }
}
