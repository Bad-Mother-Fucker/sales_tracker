import 'package:flutter/cupertino.dart';
import 'package:sales_tracker/model/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _prodotti = [
    Product(nome: "Pack 1", descrizione: "descrizione"),
    Product(nome: "Pack 2", descrizione: "descrizione"),
    Product(nome: "Pack 3", descrizione: "descrizione")
  ];

  List<Product> get prodotti => _prodotti;

  void setProdotti(List<Product> prodotti) {
    _prodotti = prodotti;
    notifyListeners();
  }

  void addProdotto(Product prodotto) {
    _prodotti.add(prodotto);
    notifyListeners();
  }

  void removeProdotto(Product prodotto) {
    _prodotti.remove(prodotto);
    notifyListeners();
  }

}

