extension DateTimeFormatting on DateTime {
  String toDayMonthString() {
    String getMonth(int month) {
      switch (month) {
        case 1:
          return 'gennaio';
        case 2:
          return 'febbraio';
        case 3:
          return 'marzo';
        case 4:
          return 'aprile';
        case 5:
          return 'maggio';
        case 6:
          return 'giugno';
        case 7:
          return 'luglio';
        case 8:
          return 'agosto';
        case 9:
          return 'settembre';
        case 10:
          return 'ottobre';
        case 11:
          return 'novembre';
        case 12:
          return 'dicembre';
        default:
          return '';
      }
    }

    return '${this.day} ${getMonth(this.month)}';
  }
}