import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controller/device_controller.dart';
import '../controller/extreme_event_controller.dart';
import '../model/extreme_event _model.dart';
import '../state/device_state.dart';

class MyBarGraph extends StatefulWidget {
  const MyBarGraph({super.key});

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  final DeviceController _controllerDevice = Get.put(DeviceController());
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
                titlesData: titlesData,
                barGroups: barGroups(
                    context, _controllerDevice, _controllerExtremeEvent.items),
                barTouchData: barTouchData(context, _controllerDevice),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

FlTitlesData get titlesData => const FlTitlesData(
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
    );

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

List<BarChartGroupData>? barGroups(
        context, controllerDevice, RxList<ExtremeEventModel> items) =>
    items.map((data) {
      final probabilityLength = data.probabilityOccurrence.length;
      final showingTooltipIndicators =
          List<int>.generate(probabilityLength, (index) => index);

      return BarChartGroupData(
        barsSpace: 4,
        x: data.code,
        barRods: data.probabilityOccurrence
            .map(
              (e) => BarChartRodData(
                toY: e.roundToDouble(),
                color: data.color,
                width: controllerDevice.state.value == DeviceState.mobile
                    ? 15
                    : 30,
                borderRadius: BorderRadius.circular(4),
                backDrawRodData: backgroundBarChartRodData(context),
              ),
            )
            .toList(),
        showingTooltipIndicators: showingTooltipIndicators,
      );
    }).toList();

BackgroundBarChartRodData backgroundBarChartRodData(context) =>
    BackgroundBarChartRodData(
      show: true,
      toY: 100,
      color: Theme.of(context).colorScheme.secondary,
    );

BarTouchData barTouchData(context, controllerDevice) => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            TextStyle(
              fontSize:
                  controllerDevice.state.value == DeviceState.mobile ? 10 : 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          );
        },
      ),
    );
