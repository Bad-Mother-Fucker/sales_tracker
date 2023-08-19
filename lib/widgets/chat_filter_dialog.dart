import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_tracker/model/chat.dart';

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> selectedOutcomes = [];
  List<String> selectedPlatforms = [];
  DateTimeRange? selectedDateRange;
  // altri filtri...

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Seleziona i filtri'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              // Outcome
              Text('Outcome:'),
              ...ChatOutcome.values.map((outcome) => CheckboxListTile(
                title: Text(outcome),
                value: selectedOutcomes.contains(outcome),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedOutcomes.add(outcome);
                    } else {
                      selectedOutcomes.remove(outcome);
                    }
                  });
                },
              )),
              // Piattaforme
              Text('Piattaforme:'),
              ...ChatPlatform.values.map((platform) => CheckboxListTile(
                title: Text(platform),
                value: selectedPlatforms.contains(platform),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedPlatforms.add(platform);
                    } else {
                      selectedPlatforms.remove(platform);
                    }
                  });
                },
              )),
              // Selezione range di date
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
              // altri filtri...
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
            'outcomes': selectedOutcomes,
            'platforms': selectedPlatforms,
            'dateRange': selectedDateRange,
            // altri filtri...
          }),
        ),
      ],
    );
  }
}