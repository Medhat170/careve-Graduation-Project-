import 'package:flutter/material.dart';

class Section {
  final String name;
  final String image;
  final Function onPressed;

  Section({
    @required this.name,
    @required this.image,
    @required this.onPressed,
  }) : assert(
          name != null,
          image != null,
        );
}
