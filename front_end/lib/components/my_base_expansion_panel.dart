import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/extreme_event_controller.dart';
import '../model/extreme_event _model.dart';
import 'my_expansion_panel.dart';

class MyBaseExpansionPanel extends StatelessWidget {
  MyBaseExpansionPanel({super.key});

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
                      child: Text(
                        'Data source\n${model.dataSource.first}',
                        style: TextStyle(
                          color: myTenthColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Medium Duration\n${model.mediumDuration.floorToDouble().toString()} dia(s)',
                        style: TextStyle(
                          color: myTenthColor,
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
                      child: Text(
                        'Probability Occurrence\n${model.probabilityOccurrence.floorToDouble().toString()} %',
                        style: TextStyle(
                            color: myTenthColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        'Total Location Records\n${model.totalLocationRecords.toString()}',
                        style: TextStyle(
                            color: myTenthColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        'Total Recurrence\n${model.totalRecurrence.toString()}',
                        style: TextStyle(
                            color: myTenthColor, fontWeight: FontWeight.bold),
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
        _controllerExtremeEvent.items[index].isExpanded = isExpanded;
      },
    );
  }
}
