abstract class User {
  String? id;
  String? nome;
  String? cognome;
  double? percentualeProvvigione;
  double? fissi;
  double? bonus;
  UserRole? role;
  User({id, nome, cognome, percentualeProvvigione, fissi, bonus, role});
}

enum UserRole { Salesperson, AppointmentSetter, SalesManager }