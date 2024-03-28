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
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Data source:',
                              style: TextStyle(
                                color: myTenthColor,
                              ),
                            ),
                            Text(
                              model.dataSource.first.toString(),
                              style: TextStyle(
                                  color: myTenthColor,
                                  fontWeight: FontWeight.bold),
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
                              color: myTenthColor,
                            ),
                          ),
                          Text(
                            '${model.mediumDuration.floorToDouble().toString()} dia(s)',
                            style: TextStyle(
                                color: myTenthColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
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
                              color: myTenthColor,
                            ),
                          ),
                          Text(
                            '${model.probabilityOccurrence.floorToDouble().toString()} %',
                            style: TextStyle(
                                color: myTenthColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Total Location Records:',
                            style: TextStyle(
                              color: myTenthColor,
                            ),
                          ),
                          Text(
                            model.totalLocationRecords.toString(),
                            style: TextStyle(
                                color: myTenthColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
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
                              color: myTenthColor,
                            ),
                          ),
                          Text(
                            model.regionGreatestRecurrence.toString(),
                            style: TextStyle(
                                color: myTenthColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Total Recurrence:',
                            style: TextStyle(
                              color: myTenthColor,
                            ),
                          ),
                          Text(
                            model.totalRecurrence.toString(),
                            style: TextStyle(
                                color: myTenthColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
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
