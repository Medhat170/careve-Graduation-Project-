import 'package:careve/app/utilities/app_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

extension DateTimeExt on DateTime {
  Locale get currentLocale =>
      AppUtil.isLtr ? const Locale('en', 'US') : const Locale('en', 'US');

  String toShortUserString() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat.yMMMMd(currentLocale.toString()).format(this);
    }
  }

  String toLongUserString() {
    if (this == null) {
      return '-';
    } else {
      return '${intl.DateFormat.yMMMMEEEEd(currentLocale.toString()).format(this)} @ ${intl.DateFormat.jm(currentLocale.toString()).format(this)}';
    }
  }

  String toTimeOnly() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat.Hm(currentLocale.toString()).format(this);
    }
  }

  String toTimeWithAmPmFormat() {
    if (this == null) {
      return '-';
    } else {
      return intl.DateFormat.jm(currentLocale.toString()).format(this);
    }
  }
}
