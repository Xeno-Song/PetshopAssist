import 'package:intl/intl.dart';

class DateTimeConverter {
  static final DateFormat _dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
  static final DateFormat _dateOnly = DateFormat('yyyy/MM/dd');

  static String? format(DateTime? time) {
    if (time == null) return null;
    return _dateFormat.format(time);
  }

  static DateTime? parse(String? time) {
    if (time == null || time == "null") return null;
    return _dateFormat.parse(time);
  }

  static String formatDate(DateTime time) {
    return _dateOnly.format(time);
  }
}

// 2023-10-01T12:30:30
