import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/extreme_event_model.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pandora_front/app/modules/dashboard/widgets/pie_graph/indicator.dart';


class MyPieGraph extends StatefulWidget {
  final DashboardController controller;

  const MyPieGraph({super.key, required this.controller});

  @override
  State<StatefulWidget> createState() => _MyPieGraph();
}

class _MyPieGraph extends State<MyPieGraph> {
  int touchedIndex = -1;

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
                pieTouchData: buildPieTouchData(),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: GetPlatform.isMobile ? 40 : 60,
                sections: showingSections(
                   widget.controller.dataController.getItems(), touchedIndex),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                for (var data in widget.controller.dataController.getItems())
                  Column(
                    children: <Widget>[
                      Indicator(
                        color: data.color!,
                        text: data.codeFormatted!.tr,
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

  PieTouchData buildPieTouchData() {
    return PieTouchData(
      touchCallback: (FlTouchEvent event, pieTouchResponse) {
        setState(
          () {
            if (!event.isInterestedForInteractions ||
                pieTouchResponse == null ||
                pieTouchResponse.touchedSection == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
          },
        );
      },
    );
  }
}

List<PieChartSectionData> showingSections(
    List<ExtremeEventModel> items, index) {
  return items.map((item) {
    final isTouched = items.indexOf(item) == index;
    final fontSize = isTouched ? 18.0 : 15.0;
    final radius = isTouched ? 65.0 : 60.0;
    const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

    var numFormatted = item.regionGreatestRecurrences?[0].recurrence;
    var region = item.regionGreatestRecurrences?[0].region!.tr;
    var title = isTouched ? region : numFormatted;

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
