import 'package:sales_tracker/model/product.dart';

class SalesCallOutcome {
  static const String FullPay = 'Full Pay';
  static const String SplitPay = 'Split Pay';
  static const String Acconto = 'Deposit';
  static const String NoDepositFollowUp = 'No Deposit & FollowUp';
  static const String OfferDidntBuy = 'Offer & Didnt Buy';
  static const String BadFitNoOffer = 'Bad Fit & No Offer';
  static const String Rescheduled = 'Rescheduled';
  static const String Cancelled = 'Cancelled';
  static const String NoShow = 'No Show';

  static const List<String> values = [
    FullPay,
    SplitPay,
    Acconto,
    NoDepositFollowUp,
    OfferDidntBuy,
    BadFitNoOffer,
    Rescheduled,
    Cancelled,
    NoShow,
  ];
}


class SalesCall {
  DateTime? data;
  String? nomeLead;
  String? outcome;
  double? revenue;
  double? cash;
  List<Product>? prodotti; // Potrebbe essere una lista se sono più prodotti
  String? note;
  String? callUrl;

  SalesCall({
    required this.nomeLead,
    required this.data,
    required this.outcome,
    required this.revenue,
    required this.cash,
    required this.prodotti
  });

}
