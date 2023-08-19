import 'package:flutter/cupertino.dart';

import '../model/chat.dart';

class ChatProvider with ChangeNotifier {
  List<Chat> chats = []; // I dati originali delle chat
  List<Chat> filteredChats = []; // Chat filtrate in base alle selezioni dell'utente

  // Filtri e ordinamento
  String filterOutcome = "all";
  String filterType = "all";
  String filterPlatform = "all";
  DateTime? filterStartDate;
  DateTime? filterEndDate;
  String sortOrder = "date"; // Ordinamento predefinito per data


  void updateFilters({
    String? outcome,
    String? type,
    String? platform,
    DateTime? startDate,
    DateTime? endDate,
    String? order,
  }) {
    if (outcome != null) filterOutcome = outcome;
    if (type != null) filterType = type;
    if (platform != null) filterPlatform = platform;
    if (startDate != null) filterStartDate = startDate;
    if (endDate != null) filterEndDate = endDate;
    if (order != null) sortOrder = order;

    filteredChats = chats.where((chat) {
      bool outcomeCondition = filterOutcome == "all" || chat.esito == filterOutcome;
      bool typeCondition = filterType == "all"; // Aggiungi la logica per il tipo
      bool platformCondition = filterPlatform == "all" || chat.piattaforma == filterPlatform;
      bool startDateCondition = filterStartDate == null || chat.data!.isAfter(filterStartDate!);
      bool endDateCondition = filterEndDate == null || chat.data!.isBefore(filterEndDate!);

      return outcomeCondition &&
          typeCondition &&
          platformCondition &&
          startDateCondition &&
          endDateCondition;
    }).toList();

    applySort();
    notifyListeners();
  }

  void addChat(Chat chat) {
    chats.add(chat);
    updateFilters();
  }

  void updateSortOrder(String newSortOrder) {
    sortOrder = newSortOrder;
    applySort();
    notifyListeners();
  }

  void applySort() {
    switch (sortOrder) {
      case "date":
        filteredChats.sort((a, b) => a.data!.compareTo(b.data!));
        break;
      case "nomeLead":
        filteredChats.sort((a, b) => a.nomeLead!.compareTo(b.nomeLead!));
        break;
      default:
      // Gestisci altri casi di ordinamento o lascia invariato
        break;
    }
  }

}
