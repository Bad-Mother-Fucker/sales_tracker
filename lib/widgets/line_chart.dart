import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {
  final List<double> yAxisData;

  LineChartWidget({required this.yAxisData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
        minX: 0,
        maxX: yAxisData.length.toDouble() - 1,
        minY: 0,
        maxY: yAxisData.reduce((a, b) => a > b ? a : b),
        lineBarsData: [
          LineChartBarData(
            spots: yAxisData
                .asMap()
                .map((index, count) => MapEntry(index, FlSpot(index.toDouble(), count)))
                .values
                .toList(),
            isCurved: true,
            colors: [Colors.blue],
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
