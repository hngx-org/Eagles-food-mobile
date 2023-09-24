import 'package:intl/intl.dart';

extension DateXtension on DateTime {

  String get  formatToDate => DateFormat('MMM d, yyyy').format(this);
  String get  formatToTime => DateFormat.jm().format(this);
}