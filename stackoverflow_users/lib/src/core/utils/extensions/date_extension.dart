import 'package:intl/intl.dart';
import 'package:stackoverflow_users/src/core/constants/constants.dart';

extension DateServerFormates on DateTime {
  String format(String format) {
    return DateFormat(format, Constants.locale.en).format(this);
  }
}
