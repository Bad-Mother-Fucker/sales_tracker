import 'package:sales_tracker/model/Users/user.dart';

class Salesperson extends User {
  Salesperson({
    required String id,
    required String nome,
    required String cognome,
    required double percentualeProvvigione,
    required double fissi,
    required double bonus,
  }) : super(id: id, nome: nome, cognome: cognome, percentualeProvvigione: percentualeProvvigione, fissi: fissi, bonus: bonus, role: 'Salesperson');
}