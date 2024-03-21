import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants.dart';
import '../model/extreme_event_statistical_correlation_model.dart';
import '../services/extreme_event_statistical_correlation_service.dart';
import 'bar_graph/bar_data.dart';

class MyBarGraph extends StatefulWidget {
  const MyBarGraph({super.key});

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  static String API_PANDORA_KEY = dotenv.env['API_PANDORA_KEY']!;
  final _extremeEventStatisticalCorrelationService =
      ExtremeEventStatisticalCorrelationService(API_PANDORA_KEY);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _extremeEventStatisticalCorrelationService
            .getStatisticalCorrelation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: myPassiveColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final barData = snapshot.data;

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
                        barGroups: barData
                            ?.toList()
                            .map(
                              (data) => BarChartGroupData(
                                x: data.x,
                                barRods: [
                                  BarChartRodData(
                                    toY: data.y,
                                    color: myNinthColor,
                                    width: 30,
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
        });
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
  String weekDay;
  switch (group.x) {
    case 0:
      weekDay = 'Cold wave';
      break;
    case 1:
      weekDay = 'Flash flood';
      break;
    case 2:
      weekDay = 'Flood, General';
      break;
    case 3:
      weekDay = 'Heat wave';
      break;
    case 4:
      weekDay = 'Riverine flood';
      break;
    case 5:
      weekDay = 'Storm, General';
      break;
    case 6:
      weekDay = 'Tropical cyclone';
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
