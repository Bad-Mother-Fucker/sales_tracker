
import 'package:flutter/material.dart';
import 'package:sales_tracker/Utilities/Extensions.dart';

import '../model/chat.dart';
import 'line_chart.dart';

class CardChart extends StatelessWidget {
  final String title;
  final DateTime startDate;
  final DateTime endDate;
  final double totalMetric;
  final List<double> yAxisData;

  CardChart({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.totalMetric,
    required this.yAxisData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(height: 4),
            SizedBox(
              height: 200, // You can set a specific height for the chart
              child: LineChartWidget(yAxisData: yAxisData),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      children: [
                        TextSpan(text: 'Periodo: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '${startDate.toDayMonthString()} - ${endDate.toDayMonthString()}'),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 20, color: Colors.black),
                      children: [
                        TextSpan(text: 'Total: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: '$totalMetric'),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

