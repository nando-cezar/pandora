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
                            const Text('Data source:'),
                            Text(
                              model.dataSource.first.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Medium Duration:'),
                          Text(
                            '${model.mediumDuration.floorToDouble().toString()} day(s)',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
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
                          const Text('Probability Occurrence:'),
                          Text(
                            '${model.probabilityOccurrence.floorToDouble().toString()} %',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Total Location Records:'),
                          Text(
                            model.totalLocationRecords.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
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
                          const Text('Region Greatest Recurrence:'),
                          Text(
                            model.regionGreatestRecurrence.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Total Recurrence:'),
                          Text(
                            model.totalRecurrence.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
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
