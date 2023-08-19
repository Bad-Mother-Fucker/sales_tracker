import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import 'package:sales_tracker/Utilities/Extensions.dart';
import 'package:sales_tracker/providers/product_provider.dart';
import 'package:sales_tracker/providers/sales_call_provider.dart';

import '../model/product.dart';
import '../model/sales_call.dart';

class NewSalesCallDialog extends StatefulWidget {
  @override
  _NewSalesCallDialogState createState() => _NewSalesCallDialogState();
}

class _NewSalesCallDialogState extends State<NewSalesCallDialog> {
  final TextEditingController nomeLeadController = TextEditingController();
  final TextEditingController revenueController = TextEditingController();
  final TextEditingController cashController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController callUrlController = TextEditingController();
  String? outcome = SalesCallOutcome.FullPay;
  DateTime selectedDate = DateTime.now();
  List<Product> prodotti = List<Product>.empty(growable: true); // Puoi gestire la selezione dei prodotti come preferisci

  _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Sales Call'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: nomeLeadController,
              decoration: InputDecoration(hintText: 'Nome Lead'),
            ),
            DropdownButton<String>(
              value: outcome,
              hint: Text('Scegli un esito'),
              onChanged: (String? value) {
                setState(() {
                  outcome = value;
                });
              },
              items: SalesCallOutcome.values.map((String outcome) {
                return DropdownMenuItem<String>(
                  value: outcome,
                  child: Text(outcome),
                );
              }).toList(),
            ),
            MultiSelectDialogField(
              items: Provider.of<ProductProvider>(context).prodotti.map((product) => MultiSelectItem(product, product.nome??"")).toList(),
              listType: MultiSelectListType.CHIP,
              chipDisplay: MultiSelectChipDisplay(
                onTap: (value) {
                  setState(() {
                    prodotti.remove(value);
                  });
                },
              ),
              onConfirm: (values) {
                setState(() {
                  prodotti = values.cast<Product>();
                });
              },
            ),
            TextField(
              controller: revenueController,
              decoration: InputDecoration(hintText: 'Revenue'),
              keyboardType: TextInputType.number, // Numeric input for revenue
            ),
            TextField(
              controller: cashController,
              decoration: InputDecoration(hintText: 'Cash'),
              keyboardType: TextInputType.number, // Numeric input for cash
            ),
            // You can add more input fields or dropdowns for other attributes like products, call URL, etc.

            ListTile(
              title: Text("Data: ${selectedDate.toDayMonthString()}"),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            TextField(
              controller: noteController,
              decoration: InputDecoration(hintText: 'Note'),
            ),
            TextField(
              controller: callUrlController,
              decoration: InputDecoration(hintText: 'url registrazione'),
            ),
            // Other fields as required
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            SalesCall newSalesCall = SalesCall(
              nomeLead: nomeLeadController.text,
              data: selectedDate,
              outcome: outcome,
              revenue: double.parse(revenueController.text),
              cash: double.parse(cashController.text),
              prodotti: prodotti,
            );
            Provider.of<SalesCallProvider>(context,listen: false).addSalesCall(newSalesCall);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
