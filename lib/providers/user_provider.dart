import 'package:flutter/cupertino.dart';
import 'package:sales_tracker/model/Users/salesperson.dart';

import '../model/Users/user.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser = Salesperson(id: "id", nome: "nome", cognome: "cognome", percentualeProvvigione: 10, fissi: 0, bonus: 0);

  User? get currentUser => _currentUser;

  void setUser(User user) {
    _currentUser = user;
    notifyListeners();
  }
}
