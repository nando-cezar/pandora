import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pandora_front/app/data/model/extreme_event_model.dart';
import 'package:pandora_front/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:pandora_front/constants.dart';


class MyBarGraph extends StatelessWidget {
  final DashboardController controller;

  const MyBarGraph({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 100,
                minY: 0,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: buildTitlesData(controller.dataController.getItems()),
                barGroups: buildBarGroups(
                    context, controller.dataController.getItems()),
                barTouchData: buildBarTouchData(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

FlTitlesData buildTitlesData(List<ExtremeEventModel> items) {
  final bottomTitles = AxisTitles(
    sideTitles: SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) => getBottomTitles(
        items.map((e) => e.codeFormatted!.tr).toList(),
        value,
        meta,
      ),
    ),
  );

  return FlTitlesData(
    show: true,
    topTitles: const AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
    leftTitles: const AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
    rightTitles: const AxisTitles(
      sideTitles: SideTitles(
        showTitles: false,
      ),
    ),
    bottomTitles: bottomTitles,
  );
}

Widget getBottomTitles(List<String> titles, double value, TitleMeta meta) {
  var style = TextStyle(
    color: myActiveColor,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  Widget text;

  if (value.toInt() >= 0 && value.toInt() < titles.length) {
    text = Text(titles[value.toInt()], style: style);
  } else {
    text = Text('', style: style);
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}

List<BarChartGroupData>? buildBarGroups(
        context, List<ExtremeEventModel> items) =>
    items.map((data) {
      final probabilityLength = data.probabilityOccurrence?.length;
      final showingTooltipIndicators =
          List<int>.generate(probabilityLength!, (index) => index);

      return BarChartGroupData(
        barsSpace: 4,
        x: data.code!,
        barRods: data.probabilityOccurrence
            ?.map(
              (e) => BarChartRodData(
                toY: e.roundToDouble(),
                color: data.color,
                width: 15,
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
      color: Theme.of(context).colorScheme.primary,
    );

BarTouchData buildBarTouchData(context) => BarTouchData(
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
              fontSize: 10,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          );
        },
      ),
    );
