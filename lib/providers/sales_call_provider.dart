import 'package:flutter/cupertino.dart';
import 'package:sales_tracker/model/product.dart';

import '../model/sales_call.dart';

class SalesCallProvider with ChangeNotifier {
  List<SalesCall> salesCalls = [];
  List<SalesCall> filteredSalesCalls = [];

  // Filtri
  String? filterOutcome;
  String filterPlatform = "all";
  DateTime? filterStartDate;
  DateTime? filterEndDate;
  String filterProduct = "all";

  // Metodi per aggiornare i filtri
  void updateFilters({
    SalesCallOutcome? outcome,
    String? platform,
    DateTime? startDate,
    DateTime? endDate,
    String? product,
  }) {
    filterOutcome = outcome.toString();
    filterPlatform = platform ?? filterPlatform;
    filterStartDate = startDate ?? filterStartDate;
    filterEndDate = endDate ?? filterEndDate;
    filterProduct = product ?? filterProduct;
    applyFilters();
    notifyListeners();
  }

  // Applica i filtri e l'ordinamento attuali
  void applyFilters() {
    filteredSalesCalls = salesCalls.where((call) {
      // Filtra per outcome
      if (filterOutcome != null && call.outcome != filterOutcome) return false;

      // Filtra per range di date
      if ((filterStartDate != null && call.data!.isBefore(filterStartDate!)) ||
          (filterEndDate != null && call.data!.isAfter(filterEndDate!))) return false;

      // Filtra per prodotto
      var prodotti = call.prodotti ?? [];
      if (filterProduct != "all" && !prodotti.contains(filterProduct)) return false;

      return true;
    }).toList();

    // Ordina i risultati se necessario (ad esempio, per data)
  }

  // Aggiungi una nuova sales call
  void addSalesCall(SalesCall call) {
    salesCalls.add(call);
    updateFilters();
  }

  String sortOrder = "date"; // Ordinamento predefinito per data

  void updateSortOrder(String newSortOrder) {
    sortOrder = newSortOrder;
    applySort();
    notifyListeners();
  }

  void applySort() {
    switch (sortOrder) {
      case "date":
        filteredSalesCalls.sort((a, b) => a.data!.compareTo(b.data!));
        break;
      case "name":
        filteredSalesCalls.sort((a, b) => a.nomeLead!.compareTo(b.nomeLead!));
        break;
      case "revenue":
        compare(SalesCall a,SalesCall b) {
          var revA = a.revenue ?? 0;
          var revB = b.revenue ?? 0;
          return revA.compareTo(revB);
        }

        filteredSalesCalls.sort(compare);
        break;
      case "cash":
        compare(SalesCall a,SalesCall b) {
          var revA = a.cash ?? 0;
          var revB = b.cash ?? 0;
          return revA.compareTo(revB);
        }
        filteredSalesCalls.sort(compare);
        break;
      default:
        break;
    }
  }

// Altri metodi necessari (ad esempio, per eliminare o modificare le sales call)
}
