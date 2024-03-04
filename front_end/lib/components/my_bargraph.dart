import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'bar_graph/bar_data.dart';

class MyBarGraph extends StatefulWidget {
  const MyBarGraph({super.key});

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: 4.40,
      monAmount: 2.50,
      tueAmount: 42.00,
      wedAmount: 10.50,
      thurAmount: 100.20,
      friAmount: 80.90,
      satAmount: 90.10,
      sunAmount0: 4.40,
      monAmount1: 2.50,
      tueAmount2: 42.00,
      wedAmount3: 10.50,
      thurAmount4: 100.20,
      friAmount5: 80.90,
      satAmount6: 90.10,
    );

    myBarData.initializeBarData();

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Extreme events',
            style: TextStyle(
              color: myActiveColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Prediction chart based on current location',
            style: TextStyle(
              color: myPassiveColor,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 40),
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
                barGroups: myBarData.barData
                    .map(
                      (data) => BarChartGroupData(
                        x: data.x,
                        barRods: [
                          BarChartRodData(
                            toY: data.y,
                            color: myNinthColor,
                            width: 15,
                            borderRadius: BorderRadius.circular(4),
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              toY: 100,
                              color: mySeventhColor,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: mySeventhColor,
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
      text = Text('RF', style: style);
      break;
    case 1:
      text = Text('CW', style: style);
      break;
    case 2:
      text = Text('FF', style: style);
      break;
    case 3:
      text = Text('MS', style: style);
      break;
    case 4:
      text = Text('TC', style: style);
      break;
    case 5:
      text = Text('TD', style: style);
      break;
    case 6:
      text = Text('DG', style: style);
      break;
    case 7:
      text = Text('HW', style: style);
      break;
    case 8:
      text = Text('SG', style: style);
      break;
    case 9:
      text = Text('LT', style: style);
      break;
    case 10:
      text = Text('LW', style: style);
      break;
    case 11:
      text = Text('FG', style: style);
      break;
    case 12:
      text = Text('SW', style: style);
      break;
    default:
      text = Text('', style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

BarTooltipItem getTooltipBottomItem(group, groupIndex, rod, rodIndex) {
  String weekDay;
  switch (group.x) {
    case 0:
      weekDay = 'Riverine flood';
      break;
    case 1:
      weekDay = 'Cold wave';
      break;
    case 2:
      weekDay = 'Flash flood';
      break;
    case 3:
      weekDay = 'Mudslide';
      break;
    case 4:
      weekDay = 'Tropical cyclone';
      break;
    case 5:
      weekDay = 'Tornado';
      break;
    case 6:
      weekDay = 'Drought';
      break;
    case 7:
      weekDay = 'Heat wave';
      break;
    case 8:
      weekDay = 'Storm, General';
      break;
    case 9:
      weekDay = 'Lightning/Thunderstorms';
      break;
    case 10:
      weekDay = 'Landslide, wet';
      break;
    case 11:
      weekDay = 'Flood, General';
      break;
    case 12:
      weekDay = 'Severe weather';
      break;
    default:
      throw Error();
  }
  return BarTooltipItem(
    '$weekDay\n',
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
