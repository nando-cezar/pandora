import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/extreme_event_controller.dart';

class MyBarGraph extends StatefulWidget {
  const MyBarGraph({super.key});

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  final ExtremeEventController _controllerExtremeEvent =
      Get.put(ExtremeEventController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 100,
                minY: 0,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: const FlTitlesData(
                  show: true,
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getBottomTitles,
                    ),
                  ),
                ),
                barGroups: _controllerExtremeEvent.items
                    .map(
                      (data) => BarChartGroupData(
                        x: data.code,
                        barRods: [
                          BarChartRodData(
                            toY: data.probabilityOccurrence,
                            color: data.color,
                            width: 30,
                            borderRadius: BorderRadius.circular(4),
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              toY: 100,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: Theme.of(context).colorScheme.primary,
                    tooltipPadding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 0,
                    ),
                    getTooltipItem: getTooltipBottomItem,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  var style = TextStyle(
    color: myActiveColor,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  Widget text;

  switch (value.toInt()) {
    case 0:
      text = Text('CW', style: style);
      break;
    case 1:
      text = Text('FF', style: style);
      break;
    case 2:
      text = Text('FG', style: style);
      break;
    case 3:
      text = Text('HW', style: style);
      break;
    case 4:
      text = Text('RF', style: style);
      break;
    case 5:
      text = Text('SG', style: style);
      break;
    case 6:
      text = Text('TC', style: style);
      break;
    default:
      text = Text('', style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

BarTooltipItem getTooltipBottomItem(group, groupIndex, rod, rodIndex) {
  String event;
  switch (group.x) {
    case 0:
      event = 'Cold wave';
      break;
    case 1:
      event = 'Flash flood';
      break;
    case 2:
      event = 'Flood, General';
      break;
    case 3:
      event = 'Heat wave';
      break;
    case 4:
      event = 'Riverine flood';
      break;
    case 5:
      event = 'Storm, General';
      break;
    case 6:
      event = 'Tropical cyclone';
      break;
    default:
      throw Error();
  }

  return BarTooltipItem(
    '$event\n',
    TextStyle(
      color: myNinthColor,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
    children: <TextSpan>[
      TextSpan(
        text: (rod.toY - 1).round().toString(),
        style: TextStyle(
          color: myActiveColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
