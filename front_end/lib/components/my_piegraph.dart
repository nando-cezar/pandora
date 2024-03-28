import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/components/pie_graph/indicator.dart';

import '../controller/device_controller.dart';
import '../controller/extreme_event_controller.dart';

class MyPieGraph extends StatefulWidget {
  const MyPieGraph({super.key});

  @override
  State<StatefulWidget> createState() => _MyPieGraph();
}

class _MyPieGraph extends State {
  int touchedIndex = -1;
  final DeviceController _controllerDevice = Get.put(DeviceController());
  final ExtremeEventController _controllerExtremeEvent =
      Get.put(ExtremeEventController());

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
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
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: _controllerDevice.index.value == 1 ? 0 : 60,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return _controllerExtremeEvent.items.map((item) {
      final isTouched =
          _controllerExtremeEvent.items.indexOf(item) == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 55.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      var numFormatted = item.totalRecordsRegionGreatestRecurrence.floorToDouble().toDouble();
      var title = isTouched ? item.regionGreatestRecurrence : numFormatted;

      return PieChartSectionData(
        color: item.color,
        title: title.toString(),
        radius: radius,
        titlePositionPercentageOffset: _controllerDevice.index.value == 1 ? 1.2 : 1.5,
        //badgePositionPercentageOffset: 2.0,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
        ),
      );
    }).toList();
  }
}
