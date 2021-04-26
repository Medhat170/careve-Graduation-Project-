import 'dart:convert' as convert;

import 'clinic_model.dart';

class AllAppointments {
  List<Appointment> data;

  AllAppointments({this.data});

  AllAppointments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Appointment>[];
      json['data'].forEach((v) {
        data.add(Appointment.fromJson(v));
      });
    }
  }
}

class Appointment {
  int id;
  int docId;
  int clinicId;
  int patientId;
  String docName;
  DateTime date;
  String docImage;
  String cost;
  Address address;
  String phone;

  Appointment({
    this.id,
    this.clinicId,
    this.docId,
    this.patientId,
    this.docName,
    this.cost,
    this.date,
    this.docImage,
    this.address,
    this.phone,
  });

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinicid'];
    docId = json['docid'];
    patientId = json['patientid'];
    docName = json['docname'];
    cost = json['cost'].toString();
    docImage = json['docimage'];
    if (json['date'] != null) {
      final DateTime dateTime = DateTime.parse(
        json['date'].toString(),
      );
      date = dateTime;
    }
    if (json['clinicadress'] != null) {
      final Map<String, dynamic> addressData = convert.json.decode(
        json['clinicadress'].toString(),
      );
      address = Address.fromJson(addressData);
    }
    phone = json['clinicphone'];
  }
}
