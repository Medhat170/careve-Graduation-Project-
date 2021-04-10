import 'package:flutter/material.dart';

class Section {
  final String name;
  final String image;
  final Function onPressed;
  final int notification;

  Section({
    @required this.name,
    @required this.image,
    @required this.onPressed,
    this.notification,
  }) : assert(
          name != null,
          image != null,
        );
}
