import 'dart:convert' as convert;

import 'package:careve/app/models/clinic_model.dart';

class DoctorClinicsAppointments {
  List<Clinic> clinics;

  DoctorClinicsAppointments({this.clinics});

  DoctorClinicsAppointments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      clinics = <Clinic>[];
      json['data'].forEach((v) {
        clinics.add(Clinic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (data != null) {
      data['clinics'] = clinics.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clinic {
  int id;
  List<Day> days;
  int docId;
  String mobile;
  Address address;

  Clinic({
    this.id,
    this.days,
    this.docId,
    this.mobile,
    this.address,
  });

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['day'] != null) {
      days = <Day>[];
      final List<dynamic> dayData = convert.json.decode(
        json['day'].toString(),
      );
      for (final day in dayData) {
        days.add(Day.fromJson(day));
      }
    }
    docId = json['docid'];
    mobile = json['mobile'];
    if (json['address'] != null) {
      final Map<String, dynamic> addressData = convert.json.decode(
        json['address'].toString(),
      );
      address = Address.fromJson(addressData);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['docid'] = id;
    data['mobile'] = id;
    if (address != null) {
      data['address'] = address.toJson();
    }
    if (days != null) {
      data['days'] = days.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
