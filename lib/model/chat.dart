class Chat {
  String? nomeLead;
  String? piattaforma;
  DateTime? data;
  String? numeroTelefono;
  String? email;
  String? esito;
  String? note;
  Chat({this.nomeLead, this.piattaforma, this.data, this.numeroTelefono, this.email, this.esito, this.note});


}

class ChatOutcome {
  static const String CallBooked = "Call booked";
  static const String AnswerAndDidntSet = "Answer & didn't set";
  static const String BadFitAndNoOffer =  "Bad fit & no offer ";
  static const String Recall = "Recall/Reschedule";
  static const String NumeroInesistente = "Fake Number";
  static const values = [CallBooked, AnswerAndDidntSet, BadFitAndNoOffer, Recall, NumeroInesistente];
}

class ChatPlatform {
  static const Instagram= "Instagram";
  static const LinkedIn= "LinkedIn";
  static const Facebook= "Facebook";
  static const Whatsapp= "Whatsapp";
  static const TikTok= "TikTok";
  static const values = [Instagram, LinkedIn, Facebook, Whatsapp, TikTok];
}