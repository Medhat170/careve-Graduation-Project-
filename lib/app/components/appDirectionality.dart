import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class GlobalScaffold extends StatelessWidget {
  final Widget body;

  GlobalScaffold({
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: intl.Intl.getCurrentLocale() == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: body,
        ),
      ),
    );
  }
}
