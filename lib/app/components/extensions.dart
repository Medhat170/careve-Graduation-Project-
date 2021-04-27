import 'package:careve/app/utilities/app_util.dart';
import 'package:intl/intl.dart' as intl;

extension DateTimeExt on DateTime {
  String toShortUserString() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat.yMMMMd(AppUtil.currentLocale.toString())
          .format(this);
    }
  }

  String toLongUserString() {
    if (this == null) {
      return '-';
    } else {
      return '${intl.DateFormat.yMMMMEEEEd(AppUtil.currentLocale.toString()).format(this)} @ ${intl.DateFormat.jm(AppUtil.currentLocale.toString()).format(this)}';
    }
  }

  String toNumbersFormat() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat('yyyy-MM-dd', AppUtil.currentLocale.toString())
          .format(this);
    }
  }

  String toTimeOnly() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat.Hm(AppUtil.currentLocale.toString()).format(this);
    }
  }

  String toTimeWithAmPmFormat() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat.jm(AppUtil.currentLocale.toString()).format(this);
    }
  }
}
