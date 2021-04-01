import 'package:flutter/material.dart';

class Section {
  final String name;
  final String image;

  Section({
    @required this.name,
    @required this.image,
  }) : assert(
          name != null,
          image != null,
        );
}
