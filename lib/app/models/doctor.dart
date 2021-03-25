import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String id;
  final String specialty;
  final String image;
  final double rate;

  Doctor({
    @required this.name,
    @required this.id,
    @required this.specialty,
    this.image,
    this.rate,
  });
}
