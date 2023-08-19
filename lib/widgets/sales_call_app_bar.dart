import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_tracker/widgets/new_sales_dialog.dart';
import 'package:sales_tracker/widgets/sales_filter_dialog.dart';

import '../providers/sales_call_provider.dart';

class SalesCallAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100.0); // Altezza più alta per l'app bar

  @override
  Widget build(BuildContext context) {
    return Consumer<SalesCallProvider>(
      builder: (context, salesCallProvider, child) {
        return AppBar(
          iconTheme: const IconThemeData(color: Colors.black), // Icona del drawer nera
          backgroundColor: Colors.white, // Rende l'app bar bianca
          title: const Center(
            child: Text(
              "Sales Calls",
              style: TextStyle(
                color: Colors.black, // Colore del testo nero per contrastare lo sfondo bianco
                fontSize: 34.0, // Dimensione del carattere molto grande
                fontWeight: FontWeight.bold, // Font in grassetto
              ),
            ),
          ),
          toolbarHeight: 100.0, // Rende l'app bar più alta
          elevation: 0.0, // Rimuove l'ombra sotto l'app bar
          actions: [
            IconButton(
              onPressed: () {
                showDialog(context: context, builder: (context){
                  return NewSalesCallDialog();
                });
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                showDialog(context: context, builder: (context){
                  return SalesCallFilterDialog();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
