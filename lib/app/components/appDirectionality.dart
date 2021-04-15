import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class GlobalScaffold extends StatelessWidget {
  final Widget body;
  final Widget floatingActionButton;

  GlobalScaffold({
    @required this.body,
    this.floatingActionButton,
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
          floatingActionButton: floatingActionButton,
        ),
      ),
    );
  }
}
