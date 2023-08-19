import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_tracker/widgets/metrics_card.dart';
import '../model/chat.dart';
import 'chart_card.dart';

class DashboardGrid extends StatefulWidget {
  @override
  _DashboardGridState createState() => _DashboardGridState();
}

class _DashboardGridState extends State<DashboardGrid> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 30));
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Sezione 1
          buildSectionHeader("Traffic"),
          Container(
            height: 700,
            child: buildGrid([
              CardChart(title: "Requests", startDate: DateTime.parse("2020-08-10"), endDate: DateTime.now(), totalMetric: 230.0, yAxisData: const [1,2,3,5,12,15,23,34,45]),
              CardChart(title: "Booked Calls", startDate: DateTime.parse("2020-08-10"), endDate: DateTime.now(), totalMetric: 220.0, yAxisData: [1,2,3,5,12,15,23]),
              CardChart(title: "Cancellations", startDate: DateTime.parse("2020-08-10"), endDate: DateTime.now(), totalMetric: 15.0, yAxisData: [45, 40, 35, 30, 25, 20, 15, 10, 5]),
              CardChart(title: "No Shows", startDate: DateTime.parse("2020-08-10"), endDate: DateTime.now(), totalMetric: 12.0, yAxisData: [1, 2, 4, 8, 16, 32, 40, 42, 45]),
              CardChart(title: "Reschedules", startDate: DateTime.parse("2020-08-10"), endDate: DateTime.now(), totalMetric: 22.0, yAxisData: [45, 40, 35, 30, 25, 20, 15, 10, 5]),
            ]),
          ),

          // Sezione 2
          buildSectionHeader("Sales"),
          Container(
            height: 700,
            child: buildGrid([
              CardChart(title: "Deals", startDate: DateTime.parse("2020-08-10"), endDate: DateTime.now(), totalMetric: 189.0, yAxisData: const [1, 2, 4, 8, 16, 32, 40, 42, 45]),
              CardChart(title: "Cash", startDate: DateTime.parse("2020-08-10"), endDate: DateTime.now(), totalMetric: 123000.0, yAxisData: const [1, 2, 4, 8, 16, 32, 40, 42, 45]),
              CardChart(title: "Avg. Ticket", startDate: DateTime.parse("2020-08-10"), endDate: DateTime.now(), totalMetric: 800.0, yAxisData: const [1,2,3,5,12,15,23,34,45]),
              CardChart(title: "Revenue", startDate: DateTime.parse("2020-08-10"), endDate: DateTime.now(), totalMetric: 288000.0, yAxisData: const [5, 10, 15, 20, 25, 30, 35, 40, 45]),
            ]),
          ),

          buildSectionHeader("Metrics"),
          Container(
            height: 700,
            child: buildGrid([
              MetricsCard(value: "87", name: "Booking Rate", percentage: true),
              MetricsCard(value: "12", name: "Cancellation Rate", percentage: true),
              MetricsCard(value: "90", name: "Show-up Rate", percentage: true),
              MetricsCard(value: "90", name: "Conversion Rate", percentage: true),
              MetricsCard(value: "32.000", name: "Total commision", percentage: false),
              MetricsCard(value: "13.300", name: "Commission on cash", percentage: false),

            ]),
          )
        ],
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildGrid(List<Widget> children) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 3/2,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      padding: const EdgeInsets.all(4.0),
      children: children,
      physics: NeverScrollableScrollPhysics(), // disabilita lo scrolling
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: DateTimeRange(start: startDate, end: endDate),
    );
    if (picked != null && picked.start != startDate && picked.end != endDate) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });
    }
  }

}

