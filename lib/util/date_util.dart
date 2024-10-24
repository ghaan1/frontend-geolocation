import 'package:intl/intl.dart';

class DateUtil {
  static String dateFormat({required DateTime date}) {
    try {
      final df = DateFormat('EEEE, dd MMMM yyyy');
      return df.format(date);
    } catch (err) {
      return 'Invalid date';
    }
  }

  static String dateAPI({required DateTime date}) {
    try {
      final df = DateFormat('yyyy-MM-dd');
      return df.format(date);
    } catch (err) {
      return 'Invalid date';
    }
  }
}
