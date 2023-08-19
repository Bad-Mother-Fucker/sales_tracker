import 'package:flutter/material.dart';

class FilterDashboardDialog extends StatefulWidget {
  @override
  _FilterDashboardDialogState createState() => _FilterDashboardDialogState();
}

class _FilterDashboardDialogState extends State<FilterDashboardDialog> {
  DateTimeRange? selectedDateRange;
  String? selectedSeller;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Seleziona i filtri'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            // Selezione della data
            ElevatedButton(
              onPressed: () async {
                final range = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now().subtract(Duration(days: 365)),
                  lastDate: DateTime.now(),
                );
                if (range != null) {
                  setState(() {
                    selectedDateRange = range;
                  });
                }
              },
              child: Text('Seleziona range di date'),
            ),
            // Selezione del venditore
            DropdownButton<String>(
              value: selectedSeller,
              items: <String>['Tutti i venditori','Venditore 1', 'Venditore 2']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              hint: Text('Seleziona un venditore'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSeller = newValue;
                });
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Annulla'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text('Applica'),
          onPressed: () => Navigator.of(context).pop({
            'date': selectedDateRange,
            'seller': selectedSeller,
          }),
        ),
      ],
    );
  }
}
