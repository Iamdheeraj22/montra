import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  String get time {
    //Convert in  HH:MM AM/PM format
    return DateFormat.jm().format(this);
  }
}
