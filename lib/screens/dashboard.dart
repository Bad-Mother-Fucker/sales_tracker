import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/dashboard_grid.dart';
import '../widgets/date_range_picker.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          DashboardGrid()
        ],
    );
  }
}
