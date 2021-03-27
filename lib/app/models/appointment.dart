import 'package:flutter/material.dart';

class Appointment {
  final String doctorName;
  final String address;
  final String date;
  final String telephoneNumber;
  final String image;

  Appointment({
    @required this.doctorName,
    @required this.address,
    @required this.date,
    @required this.telephoneNumber,
    this.image,
  });
}
