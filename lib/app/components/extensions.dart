import 'package:intl/intl.dart' as intl;

extension DateTimeExt on DateTime {
  String toShortUserString() {
    if (this == null) return '-';
    return intl.DateFormat.yMMMMd().format(this);
  }

  String toLongUserString() {
    if (this == null) return '-';
    var local = this.toLocal();
    return intl.DateFormat.yMMMMEEEEd().format(local) +
        ' @ ' +
        intl.DateFormat.jm().format(local);
  }

  String toTimeOnly() {
    if (this == null) return '-';
    var local = this.toLocal();
    return intl.DateFormat.jm().format(local);
  }
}
