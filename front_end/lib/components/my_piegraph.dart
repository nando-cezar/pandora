import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/components/pie_graph/indicator.dart';

import '../controller/device_controller.dart';
import '../controller/extreme_event_controller.dart';
import '../model/extreme_event _model.dart';
import '../state/device_state.dart';

class MyPieGraph extends StatefulWidget {
  const MyPieGraph({super.key});

  @override
  State<StatefulWidget> createState() => _MyPieGraph();
}

class _MyPieGraph extends State {
  int touchedIndex = -1;
  final _controllerDevice = Get.put(DeviceController());
  final _controllerExtremeEvent = Get.put(ExtremeEventController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius:
                    _controllerDevice.state.value == DeviceState.mobile
                        ? 40
                        : 60,
                sections: showingSections(_controllerExtremeEvent.items, touchedIndex),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var data in _controllerExtremeEvent.items)
                  Column(
                    children: <Widget>[
                      Indicator(
                        color: data.color,
                        text: data.description,
                        isSquare: true,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> showingSections(RxList<ExtremeEventModel> items, index) {
  return items.map((item) {
    final isTouched = items.indexOf(item) == index;
    final fontSize = isTouched ? 18.0 : 15.0;
    final radius = isTouched ? 65.0 : 60.0;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

    var numFormatted =
        item.regionGreatestRecurrences[0].recurrence;
    var title = isTouched
        ? item.regionGreatestRecurrences[0].region
        : numFormatted;

    return PieChartSectionData(
      color: item.color,
      title: title.toString(),
      radius: radius,
      titlePositionPercentageOffset: 0.5,
      titleStyle: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        shadows: shadows,
      ),
    );
  }).toList();
}
