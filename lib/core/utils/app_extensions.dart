import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String ddMMMyyyy() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd MMM yyyy');
    final String formatted = formatter.format(now);
    return formatted;
  }

  String yyyyMMdd() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);
    return formatted;
  }
}

extension SizeByInt on int {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension SizeByDouble on double {
  SizedBox get height => SizedBox(height: this);
  SizedBox get width => SizedBox(width: this);
}