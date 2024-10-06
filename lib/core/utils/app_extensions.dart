import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String ddMMMyyyy() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formatted = formatter.format(now);
    return formatted;
  }
}