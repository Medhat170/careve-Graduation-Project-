import 'package:careve/app/modules/doctor_appoinment/components/AppointmentItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/doctor_appoinment_controller.dart';

class DoctorAppointmentView extends GetView<DoctorAppointmentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: controller.appointments
              .map(
                (appointment) => AppointmentItem(
                  doctorName: appointment.doctorName,
                  address: appointment.address,
                  image: appointment.image,
                  telephoneNumber: appointment.telephoneNumber,
                  date: appointment.date,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
