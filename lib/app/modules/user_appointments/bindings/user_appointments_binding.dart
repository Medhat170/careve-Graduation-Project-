import 'package:get/get.dart';

import '../controllers/user_appointments_controller.dart';

class UserAppointmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAppointmentsController>(
      () => UserAppointmentsController(),
    );
  }
}
