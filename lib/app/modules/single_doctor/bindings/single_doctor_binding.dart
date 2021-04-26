import 'package:careve/app/models/all_doctors.dart';
import 'package:get/get.dart';

import '../controllers/single_doctor_controller.dart';

class SingleDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SingleDoctorController>(
      SingleDoctorController(Get.arguments as Doctor),
    );
  }
}
