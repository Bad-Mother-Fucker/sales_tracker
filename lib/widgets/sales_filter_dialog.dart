import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_tracker/model/sales_call.dart';
import 'package:sales_tracker/providers/product_provider.dart'; // Assicurati che questa sia la posizione corretta

class SalesCallFilterDialog extends StatefulWidget {
  @override
  _SalesCallFilterDialogState createState() => _SalesCallFilterDialogState();
}

class _SalesCallFilterDialogState extends State<SalesCallFilterDialog> {
  List<String> selectedOutcomes = [];
  List<String> selectedProducts = [];
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
            ...SalesCallOutcome.values.map((outcome) => CheckboxListTile(
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
            // Prodotti
            Text('Prodotti:'),
            ...Provider.of<ProductProvider>(context).prodotti.map((product) => CheckboxListTile( // Assicurati che 'products' sia definito nel tuo codice
              title: Text(product.nome??""),
              value: selectedProducts.contains(product.nome),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedProducts.add(product.nome??"");
                  } else {
                    selectedProducts.remove(product.nome??"");
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
            'products': selectedProducts,
            'dateRange': selectedDateRange,
            // altri filtri...
          }),
        ),
      ],
    );
  }
}
