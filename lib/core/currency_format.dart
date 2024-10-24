import 'package:intl/intl.dart';

class CurrencyFormat {
  static final oCcy = NumberFormat("#,##0", "id_ID");

  static String format(num? amount) {
    return oCcy.format(amount ?? 0);
  }
}
