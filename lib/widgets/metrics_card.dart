import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MetricsCard extends StatelessWidget {
  String name;
  String value;
  bool percentage;
  MetricsCard({required this.value, required this.name, required this.percentage});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Arrotondamento dei bordi
      ),
      child: Container(
        padding: EdgeInsets.all(10), // Padding esterno
        width: 100, // Larghezza quadrata
        height: 100, // Altezza quadrata
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value, // Numero (puoi sostituire con una variabile)
                  style: TextStyle(fontSize: 40), // Testo molto grande
                ),
                if (percentage)
                const Text(
                  '%', // Simbolo percentuale
                  style: TextStyle(fontSize: 20), // Testo più piccolo
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10), // Padding di 10 sopra al testo
              child: Text(
                name, // Testo "Test"
                textAlign: TextAlign.center, // Centrato
              ),
            ),
          ],
        ),
      ),
    );
  }

}