import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateRangeSelector extends StatelessWidget {
  final ValueChanged<DateTimeRange?> onChanged;

  DateRangeSelector({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now().subtract(Duration(days: 365 * 5)), // 5 years ago
          lastDate: DateTime.now(),
        );
        onChanged(picked);
      },
      child: Text("Select Date Range"),
    );
  }
}
