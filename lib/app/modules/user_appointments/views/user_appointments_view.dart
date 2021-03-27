import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_appointments_controller.dart';

class UserAppointmentsView extends GetView<UserAppointmentsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserAppointmentsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UserAppointmentsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
