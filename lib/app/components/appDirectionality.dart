import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class AppDirectionality extends StatelessWidget {
  final Widget child;

  AppDirectionality({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: intl.Intl.getCurrentLocale() == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: child,
    );
  }
}
